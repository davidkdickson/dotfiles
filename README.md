# Prequisites
* [oh my zsh](https://github.com/robbyrussell/oh-my-zsh)
* tmux
* [plug](https://github.com/junegunn/vim-plug)
* [conda](https://www.digitalocean.com/community/tutorials/how-to-install-anaconda-on-ubuntu-18-04-quickstart)
* [neovim](https://github.com/neovim/neovim)
* setup specific conda neovim [environment](https://gist.github.com/yeekeiji/8143b9174f87715f95aa14dd99679b5f)

# Install Instructions
* `ln -s ~/.dot-files/zsh/.zshrc ~/.zshrc`
* `ln -s ~/.dot-files/tmux/.tmux.conf ~/.tmux.conf`
* `ln -s ~/.dot-files/vim/init.vim ~/.config/nvim/init.vim`

Launch `nvim` and run:
* `:PlugInstall`
* `:checkHealth` (resolving any issues)
