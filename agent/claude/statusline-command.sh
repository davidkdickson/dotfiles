#!/bin/bash
# Claude Code statusline: model name + the Starship prompt rendered for the
# current workspace, so it matches the shell prompt (icons, colors, git state).

input=$(cat)

model=$(echo "$input" | jq -r '.model.display_name')
dir=$(echo "$input" | jq -r '.workspace.current_dir')

# STARSHIP_SHELL is unset on purpose: with it set, starship wraps every ANSI
# sequence in zsh/bash prompt escapes (%{ %} / \[ \]) that the status line
# would print literally.
prompt=$(cd "$dir" 2>/dev/null && STARSHIP_SHELL= STARSHIP_CONFIG="$HOME/.claude/statusline.toml" starship prompt)

printf '\033[2m[%s]\033[0m %s\n' "$model" "$prompt"
