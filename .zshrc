# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="steeef"

COMPLETION_WAITING_DOTS="true"

plugins=(zsh-nvm vi-mode brew)

source $ZSH/oh-my-zsh.sh
source ~/.dot-files/zsh/env
source ~/.dot-files/aliases/aliases
source ~/.dot-files/aliases/projects
source ~/.dot-files/aliases/git

export PATH=~/.rbenv/shims:/usr/local/sbin:~/.dot-files/scripts:$PATH

eval "$(rbenv init -)"

alias tmux="tmux -2"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-default-dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

export EDITOR=vim
export RACK_ENV=local

function docker-login() {
 $(aws ecr get-login --region us-east0)
}

bindkey -v
export KEYTIMEOUT=40
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins '^k' kill-line
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

