autoload -Uz compinit && compinit

# loop and source aliases
for file in ~/.dotfiles/zsh/aliases/*; do
  source $file
done

source ~/.dotfiles/zsh/vi-mode


export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source <(fzf --zsh)

export BAT_THEME="Catppuccin Mocha"
export PATH="$HOME/.local/bin:$PATH"
