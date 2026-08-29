#!/bin/bash
# Claude Code statusline: model name + the Starship prompt rendered for the
# current workspace (so it matches the shell prompt: icons, colors, git state)
# + usage: context window fill, the 5h / 7d rate-limit windows, and any
# model-scoped weekly windows (e.g. Fable) that /usage shows.

input=$(cat)

model=$(echo "$input" | jq -r '.model.display_name')
dir=$(echo "$input" | jq -r '.workspace.current_dir')

# STARSHIP_SHELL is unset on purpose: with it set, starship wraps every ANSI
# sequence in zsh/bash prompt escapes (%{ %} / \[ \]) that the status line
# would print literally.
prompt=$(cd "$dir" 2>/dev/null && STARSHIP_SHELL= STARSHIP_CONFIG="$HOME/.claude/statusline.toml" starship prompt)

# Model-scoped weekly windows only come from the OAuth usage API (what /usage
# calls), not the statusline payload. Cache it and refresh in the background
# so the status line never waits on the network.
cache="${XDG_CACHE_HOME:-$HOME/.cache}/claude-statusline-usage.json"
refresh_usage() {
  local tok
  tok=$(security find-generic-password -s "Claude Code-credentials" -w 2>/dev/null \
        | jq -r '.claudeAiOauth.accessToken // empty')
  [ -n "$tok" ] || return
  mkdir -p "$(dirname "$cache")"
  curl -sf --max-time 5 \
    -H "Authorization: Bearer $tok" \
    -H "anthropic-beta: oauth-2025-04-20" \
    https://api.anthropic.com/api/oauth/usage > "$cache.tmp" && mv "$cache.tmp" "$cache"
}
if [ ! -f "$cache" ] || [ "$(( $(date +%s) - $(stat -f %m "$cache") ))" -gt 60 ]; then
  refresh_usage >/dev/null 2>&1 &
fi

# Colour a percentage: green < 50, yellow < 80, red otherwise.
pct() {
  local label=$1 value=$2 color
  [ -z "$value" ] || [ "$value" = null ] && return
  value=${value%.*}
  if [ "$value" -ge 80 ]; then color='1;31'
  elif [ "$value" -ge 50 ]; then color='1;33'
  else color='1;32'; fi
  printf ' \033[2m%s\033[0m \033[%sm%s%%\033[0m' "$label" "$color" "$value"
}

usage=""
usage+=$(pct ctx "$(echo "$input" | jq -r '.context_window.used_percentage // empty')")
usage+=$(pct 5h  "$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')")
usage+=$(pct 7d  "$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')")
if [ -f "$cache" ]; then
  while IFS=$'\t' read -r name percent; do
    usage+=$(pct "$(echo "$name" | tr '[:upper:]' '[:lower:]')" "$percent")
  done < <(jq -r '.limits[]? | select(.kind == "weekly_scoped" and .scope.model.display_name) | [.scope.model.display_name, .percent] | @tsv' "$cache" 2>/dev/null)
fi
left=$(printf '\033[2m[%s]\033[0m %s' "$model" "$prompt")
right=${usage# }

# Right-align usage. Claude Code exports COLUMNS from its stdout width when it
# spawns the status line; fall back to the tty, then tmux. Width is measured on
# the ANSI-stripped text in a UTF-8 locale so Nerd Font glyphs count as 1.
visible() { LC_ALL=en_US.UTF-8 bash -c 'printf "%s" "$1" | sed $'"'"'s/\x1b\[[0-9;]*m//g'"'"' | wc -m' _ "$1" | tr -d ' '; }
width=${COLUMNS:-}
[ "${width:-0}" -gt 0 ] || width=$(tput cols 2>/dev/null)
[ "${width:-0}" -gt 0 ] || width=$(tmux display -p '#{pane_width}' 2>/dev/null)
[ "${width:-0}" -gt 0 ] || width=120
# The status line container is inset from the terminal edge (measured: 5
# columns in fullscreen mode); anything past it is truncated, not wrapped.
width=$(( width - 5 ))
lw=$(visible "$left"); rw=$(visible "$right")
if [ -z "$right" ]; then
  printf '%s\n' "$left"
elif [ $(( lw + 2 + rw )) -le "$width" ]; then
  printf '%s%*s%s\n' "$left" "$(( width - lw - rw ))" '' "$right"
else
  # Too narrow (e.g. a split tmux pane): usage goes on its own line, still
  # right-aligned, rather than being truncated off the end.
  printf '%s\n%*s%s\n' "$left" "$(( width - rw > 0 ? width - rw : 0 ))" '' "$right"
fi
