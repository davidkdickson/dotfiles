# Dotfiles

## Prerequisites
```
brew install --cask ghostty
brew install --cask font-monaspace-nerd-font
brew install starship
brew install neovim
brew install node
brew install pyenv
brew install zoxide
brew install git-delta
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Installation
```
ln -s ~/.dotfiles/zsh/.zprofile ~/.zprofile
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/zsh/.zshenv ~/.zshenv
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/git/.gitignore_global ~/.gitignore_global
ln -s ~/.dotfiles/git/.gitmessage ~/.gitmessage
ln -s ~/.dotfiles/psql/.psqlrc ~/.psqlrc
ln -s ~/.dotfiles/ghostty/config ~/Library/Application\ Support/com.mitchellh.ghostty/config
ln -s ~/.dotfiles/starship/starship.toml ~/.config/starship.toml
ln -s ~/.dotfiles/com.user.remapCapsLock.plist ~/Library/LaunchAgents/com.user.remapCapsLock.plist
ln -s ~/.dotfiles/agent/commands ~/.cursor/commands
ln -s ~/.dotfiles/agent/commands ~/.claude/commands
```

Launch `nvim` and plugins will install automatically via lazy.nvim. LSP servers (pyright, ts_ls, bashls) will be installed by Mason on first run. Run `:checkhealth` to verify.
