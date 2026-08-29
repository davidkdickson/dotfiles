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

# One usage segment: a Nerd Font icon (1 cell), optional label, and the
# percentage coloured green < 50, yellow < 80, red otherwise.
#   󰍛 nf-md-memory      context window
#   󰔟 nf-md-timer_sand  5-hour window
#   󰃭 nf-md-calendar    7-day window
#   󰚩 nf-md-robot       model-scoped weekly window (e.g. Fable)
pct() {
  local icon=$1 label=$2 value=$3 color
  [ -z "$value" ] || [ "$value" = null ] && return
  value=${value%.*}
  if [ "$value" -ge 80 ]; then color='1;31'
  elif [ "$value" -ge 50 ]; then color='1;33'
  else color='1;32'; fi
  printf '  \033[2m%s%s\033[0m \033[%sm%s%%\033[0m' "$icon" "${label:+ $label}" "$color" "$value"
}

usage=""
usage+=$(pct '󰍛' '' "$(echo "$input" | jq -r '.context_window.used_percentage // empty')")
usage+=$(pct '󰔟' '' "$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')")
usage+=$(pct '󰃭' '' "$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')")
if [ -f "$cache" ]; then
  while IFS=$'\t' read -r name percent; do
    usage+=$(pct '󰚩' '' "$percent")
  done < <(jq -r '.limits[]? | select(.kind == "weekly_scoped" and .scope.model.display_name) | [.scope.model.display_name, .percent] | @tsv' "$cache" 2>/dev/null)
fi
left=$(printf '\033[2m[%s]\033[0m %s' "$model" "$prompt")
right=${usage#  }

# Right-align usage. Claude Code exports COLUMNS from its stdout width when it
# spawns the status line; fall back to the tty, then tmux. Widths are measured
# in terminal cells: emoji (e.g. Starship's 🐍) are 2 cells, Nerd Font glyphs
# 1, combining marks / variation selectors 0 -- `wc -m` gets all of these wrong.
width=${COLUMNS:-}
[ "${width:-0}" -gt 0 ] || width=$(tput cols 2>/dev/null)
[ "${width:-0}" -gt 0 ] || width=$(tmux display -p '#{pane_width}' 2>/dev/null)
[ "${width:-0}" -gt 0 ] || width=120
# The status line container is inset from the terminal edge (measured: 5
# columns in fullscreen mode); anything past it is truncated, not wrapped.
width=$(( width - 5 ))
read -r lw rw < <(python3 -c '
import sys, re, unicodedata
ansi = re.compile(r"\x1b\[[0-9;]*m")
def cells(s):
    n = 0
    for ch in ansi.sub("", s):
        if unicodedata.combining(ch) or ch in "\u200b\u200d\ufe0e\ufe0f":
            continue
        n += 2 if unicodedata.east_asian_width(ch) in "WF" else 1
    return n
print(cells(sys.argv[1]), cells(sys.argv[2]))
' "$left" "$right")
if [ -z "$right" ]; then
  printf '%s\n' "$left"
elif [ $(( lw + 2 + rw )) -le "$width" ]; then
  printf '%s%*s%s\n' "$left" "$(( width - lw - rw ))" '' "$right"
else
  # Too narrow (e.g. a split tmux pane): usage goes on its own line, still
  # right-aligned, rather than being truncated off the end.
  printf '%s\n%*s%s\n' "$left" "$(( width - rw > 0 ? width - rw : 0 ))" '' "$right"
fi
