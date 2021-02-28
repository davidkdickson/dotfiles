# Dotfiles

## Perquisites
Terminal theme and font:
* [one dark - terminal](https://github.com/denysdovhan/one-gnome-terminal)
* [one dark - iterm2](https://github.com/anunez/one-dark-iterm/blob/master/one-dark.itermcolors)
* [Fira code font](https://github.com/tonsky/FiraCode)

Run `./bin/prerequisites` which installs:
* [rbenv](https://github.com/rbenv/rbenv)
* [pyenv](https://github.com/pyenv/pyenv)

Shell and editor:
* [oh my zsh](https://github.com/robbyrussell/oh-my-zsh)
* tmux
* [neovim](https://github.com/neovim/neovim)
* [plug](https://github.com/junegunn/vim-plug)

Virtual environments:
* [conda](https://www.digitalocean.com/community/tutorials/how-to-install-anaconda-on-ubuntu-18-04-quickstart)
* [autoenv](https://github.com/inishchith/autoenv)

## Install Instructions
* `./bin/install`

## Configuration
Install latest ruby version with neovim gem:
```
rbenv install 3.0.0
rbenv global 3.0.0
gem install neovim
```

Install latest python with neovim package:
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

Launch `nvim` and run:
* `:PlugInstall`
* `:checkHealth` (resolving any issues)
