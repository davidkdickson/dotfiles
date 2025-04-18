# Dotfiles

## Perquisites
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
pyenv virtualenv 3.13.3 py3nvim
pyenv activate py3nvim
pip install pynvim

pyenv global 3.13.3
```

Launch `nvim`:
```
:PlugInstall
:checkHealth
```
