# Dotfiles

## Prerequisites
```
brew install --cask ghostty
brew install --cask font-monaspace-nerd-font
brew install starship
brew install neovim
brew install rbenv
brew install pyenv
brew install zoxide
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Installation
```
ln -s ~/.dotfiles/zsh/.zprofile ~/.zprofile
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/zsh/.zshenv ~/.zshenv
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/vim/init.vim ~/.config/nvim/init.vim
ln -s ~/.dotfiles/vim/ftplugin ~/.config/nvim/after/ftplugin
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/git/.gitignore_global ~/.gitignore_global
ln -s ~/.dotfiles/git/.gitmessage ~/.gitmessage
ln -s ~/.dotfiles/psql/.psqlrc ~/.psqlrc
ln -s ~/.dotfiles/ghostty/config ~/.config/ghostty/config
ln -s ~/.dotfiles/starship/starship.toml ~/.config/starship.toml
ln -s ~/.dotfiles/com.user.remapCapsLock.plist ~/Library/LaunchAgents/com.user.remapCapsLock.plist
ln -s ~/.dotfiles/agent/commands ~/.cursor/commands
ln -s ~/.dotfiles/agent/commands ~/.claude/commands
```

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
