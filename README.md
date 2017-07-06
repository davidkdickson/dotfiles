# Prequisites
* Oh My Zsh
* vim or neovim
* tmux
* Vundle

# Install Instructions
1. `ln ~/.dot-files/.zshrc ~/.zshrc`
1. `ln ~/.dot-files/.vimrc ~/.vimrc`
1. `ln ~/.dot-files/.tmux.conf ~/.tmux.conf`
1. `ln ~/.dot-files/.psqlrc ~/.psqlrc`
1. Install Vundle `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
1. `git clone https://github.com/rbenv/rbenv.git ~/.rbenv`
1. `echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshenv`
1. `echo 'eval "$(rbenv init - zsh)"' >> ~/.zshenv`
1. `exec $SHELL`
1. Launch `vim` and run the vim command `:PluginInstall`
