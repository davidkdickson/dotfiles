ZSH=$HOME/.oh-my-zsh
ZSH_THEME="steeef"
COMPLETION_WAITING_DOTS="true"
plugins=(docker docker-compose z)
source $ZSH/oh-my-zsh.sh

# loop and source aliases
for file in ~/.dotfiles/zsh/aliases/*; do
  source $file
done

source ~/.dotfiles/zsh/vi-mode
source ~/.dotfiles/docker/docker
source ~/.dotfiles/ruby/ruby

export PSQL_EDITOR="vim"
export EDITOR=nvim
export PATH=~/.dotfiles/scripts:$PATH

case `uname` in
  Darwin)
    # commands for OS X go here
  ;;
  Linux)
    # commands for Linux go here
    eval `keychain -q --agents ssh --eval id_rsa`
  ;;
esac

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/david/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/david/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/david/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/david/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"

# load rbenv automatically
eval "$(rbenv init -)"

# activate autoenv
source ~/.autoenv/activate.sh

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
