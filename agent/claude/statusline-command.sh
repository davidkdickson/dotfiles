#!/bin/bash
# Claude Code statusline: model name + the Starship prompt rendered for the
# current workspace (so it matches the shell prompt: icons, colors, git state)
# + usage: context window fill and the 5h / 7d rate-limit windows.

input=$(cat)

model=$(echo "$input" | jq -r '.model.display_name')
dir=$(echo "$input" | jq -r '.workspace.current_dir')

# STARSHIP_SHELL is unset on purpose: with it set, starship wraps every ANSI
# sequence in zsh/bash prompt escapes (%{ %} / \[ \]) that the status line
# would print literally.
prompt=$(cd "$dir" 2>/dev/null && STARSHIP_SHELL= STARSHIP_CONFIG="$HOME/.claude/statusline.toml" starship prompt)

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

[ -n "$usage" ] && usage=$(printf '\033[2m·\033[0m%s' "$usage")

printf '\033[2m[%s]\033[0m %s%s\n' "$model" "$prompt" "$usage"
