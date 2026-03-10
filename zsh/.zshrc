autoload -Uz compinit && compinit

# loop and source aliases
for file in ~/.dotfiles/zsh/aliases/*; do
  source $file
done

source ~/.dotfiles/zsh/vi-mode


export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
fi

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source <(fzf --zsh)
