# Dotfiles

## Perquisites
* [oh my zsh](https://github.com/robbyrussell/oh-my-zsh)
* tmux
* [plug](https://github.com/junegunn/vim-plug)
* [conda](https://www.digitalocean.com/community/tutorials/how-to-install-anaconda-on-ubuntu-18-04-quickstart)
* [neovim](https://github.com/neovim/neovim)
* setup specific conda neovim [environment](https://gist.github.com/yeekeiji/8143b9174f87715f95aa14dd99679b5f)
* [autoenv](https://github.com/inishchith/autoenv)

## Install Instructions
* `ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc`
* `ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf`
* `ln -s ~/.dotfiles/vim/init.vim ~/.config/nvim/init.vim`
* `ln -s ~/.dotfiles/vim/ftplugin ~/.config/nvim/after/ftplugin`
* `ln -s ~/.dotfiles/conda/.condarc ~/.condarc`

Launch `nvim` and run:
* `:PlugInstall`
* `:checkHealth` (resolving any issues)
