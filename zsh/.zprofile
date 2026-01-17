# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# rbenv
eval "$(rbenv init - --no-rehash zsh)"

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
fi