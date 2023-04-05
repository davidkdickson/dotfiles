ZSH=$HOME/.oh-my-zsh
ZSH_THEME="spaceship"
COMPLETION_WAITING_DOTS="true"
plugins=(docker colored-man-pages pip pyenv python sudo docker-compose z)

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
fi
source $ZSH/oh-my-zsh.sh

# loop and source aliases
for file in ~/.dotfiles/zsh/aliases/*; do
  source $file
done

source ~/.dotfiles/zsh/vi-mode

case `uname` in
  Darwin)
    # commands for OS X go here
  ;;
  Linux)
    # commands for Linux go here
    eval `keychain -q --agents ssh --eval id_rsa`
  ;;
esac

# load rbenv automatically
if command -v rbenv 1>/dev/null 2>&1; then
    eval "$(rbenv init -)"
fi

# activate autoenv
source ~/.autoenv/activate.sh

# Spaceship prompt
SPACESHIP_PROMPT_SEPARATE_LINE=false

# Turning off spaceship sections I won't use
SPACESHIP_HG_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_ELM_SHOW=false
SPACESHIP_ELIXIR_SHOW=false
SPACESHIP_PHP_SHOW=false
SPACESHIP_JULIA_SHOW=false
SPACESHIP_AWS_SHOW=false
SPACESHIP_DOTNET_SHOW=false
SPACESHIP_EMBER_SHOW=false
SPACESHIP_VI_MODE_SHOW=false

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/daviddickson/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/daviddickson/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/Users/daviddickson/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/Users/daviddickson/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

