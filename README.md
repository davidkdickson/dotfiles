# Dotfiles

## Perquisites
* [one dark - terminal](https://github.com/denysdovhan/one-gnome-terminal)
* [one dark - iterm2](https://github.com/anunez/one-dark-iterm/blob/master/one-dark.itermcolors)
* [neovim](https://github.com/neovim/neovim)
* [plug](https://github.com/junegunn/vim-plug)

`./bin/prerequisites`

## Installation
`./bin/install`

Ruby and neovim provider:
```
rbenv install 3.4.3
rbenv global 3.4.3
gem install neovim
```

Python and neovim provider:
```
pyenv install 3.13.3
pyenv virtualenv 3.13.3 neovim3
pyenv activate neovim3
pip install neovim

pyenv global 3.13.3
```

Launch `nvim`:
```
:PlugInstall
:checkHealth
```
