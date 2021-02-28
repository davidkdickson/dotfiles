# Dotfiles

## Perquisites
* [one dark - terminal](https://github.com/denysdovhan/one-gnome-terminal)
* [one dark - iterm2](https://github.com/anunez/one-dark-iterm/blob/master/one-dark.itermcolors)
* [Fira code font](https://github.com/tonsky/FiraCode)
* [neovim](https://github.com/neovim/neovim)
* [plug](https://github.com/junegunn/vim-plug)
* [tmux](https://github.com/tmux/tmux)
* [conda](https://www.digitalocean.com/community/tutorials/how-to-install-anaconda-on-ubuntu-18-04-quickstart)

`./bin/prerequisites`

## Installation
`./bin/install`

Ruby and neovim provider:
```
rbenv install 3.0.0
rbenv global 3.0.0
gem install neovim
```

Python and neovim provider:
```
pyenv install 2.7.18
pyenv virtualenv 2.7.18 neovim2
python activate neovim2
pip install neovim

pyenv install 3.9.2
pyenv virtualenv 3.9.2 neovim3
pyenv activate neovim3
pip install neovim

```

Launch `nvim`:
```
:PlugInstall
:checkHealth
```
