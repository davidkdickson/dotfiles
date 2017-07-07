# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="steeef"

COMPLETION_WAITING_DOTS="true"

plugins=(zsh-nvm vi-mode docker)

source $ZSH/oh-my-zsh.sh
source ~/.dot-files/zsh/env
source ~/.dot-files/aliases/aliases
source ~/.dot-files/aliases/projects
source ~/.dot-files/aliases/git

export PATH=~/.dot-files/scripts:$PATH

alias tmux="tmux -2"
alias vim="nvim"

export EDITOR=vim

function docker-login() {
 $(aws ecr get-login --no-include-email)
}

# vi mode
bindkey -v
export KEYTIMEOUT=40
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins '^k' kill-line
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

eval `keychain -q --agents ssh --eval id_rsa`

# restore search after vi plugin

# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi
