ZSH=$HOME/.oh-my-zsh
ZSH_THEME="steeef"
COMPLETION_WAITING_DOTS="true"
plugins=(zsh-nvm vi-mode docker docker-compose)
source $ZSH/oh-my-zsh.sh

source ~/.dot-files/aliases/aliases
source ~/.dot-files/aliases/projects
source ~/.dot-files/aliases/git

source ~/.dot-files/zsh/docker
source ~/.dot-files/zsh/vi-mode
source ~/.dot-files/zsh/ruby

export PSQL_EDITOR="vim"
export EDITOR=nvim
export PATH=~/.dot-files/scripts:$PATH

eval `keychain -q --agents ssh --eval id_rsa`
