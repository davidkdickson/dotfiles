# Dotfiles

## Perquisites
Terminal theme and font:

* [one dark  -  terminal](https://github.com/denysdovhan/one-gnome-terminal)
* [one dark  - iterm2](https://github.com/anunez/one-dark-iterm/blob/master/one-dark.itermcolors)
* [Fira code font](https://github.com/tonsky/FiraCode)

Shell and editor:

* [oh my zsh](https://github.com/robbyrussell/oh-my-zsh)
* tmux
* [neovim](https://github.com/neovim/neovim)
* [plug](https://github.com/junegunn/vim-plug)

Virtual environment:s

* [conda](https://www.digitalocean.com/community/tutorials/how-to-install-anaconda-on-ubuntu-18-04-quickstart)
* setup specific conda neovim [environment](https://gist.github.com/yeekeiji/8143b9174f87715f95aa14dd99679b5f)
* [autoenv](https://github.com/inishchith/autoenv)
* [rbenv](https://github.com/rbenv/rbenv)
* [pyenv](https://github.com/pyenv/pyenv)

## Install Instructions
* `ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc`
* `ln -s ~/.dotfiles/zsh/.zshenv ~/.zshenv`
* `ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf`
* `ln -s ~/.dotfiles/vim/init.vim ~/.config/nvim/init.vim`
* `ln -s ~/.dotfiles/vim/ftplugin ~/.config/nvim/after/ftplugin`
* `ln -s ~/.dotfiles/conda/.condarc ~/.condarc`

Launch `nvim` and run:
* `:PlugInstall`
* `:checkHealth` (resolving any issues)
