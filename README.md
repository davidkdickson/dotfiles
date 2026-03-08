# Dotfiles

## Components
- **ghostty** - Terminal emulator config
- **git** - Git config, global gitignore, and commit template
- **nvim** - Neovim config with lazy.nvim, LSP, Telescope, Treesitter, and Catppuccin
- **tmux** - Tmux config with vim-style navigation and Catppuccin theme
- **zsh** - Shell config with aliases, Starship prompt, and zoxide
- **starship** - Starship prompt config
- **pgcli** - PostgreSQL client config (pgcli)
- **macos** - macOS system config (Caps Lock remap via launchd)
- **agent** - Shared commands for Claude Code and Cursor

## Prerequisites
```
brew bundle
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
mkdir -p ~/.config/pgcli
ln -s ~/.dotfiles/pgcli/config ~/.config/pgcli/config
ln -s ~/.dotfiles/ghostty/config ~/Library/Application\ Support/com.mitchellh.ghostty/config
ln -s ~/.dotfiles/starship/starship.toml ~/.config/starship.toml
ln -s ~/.dotfiles/macos/com.user.remapCapsLock.plist ~/Library/LaunchAgents/com.user.remapCapsLock.plist
ln -s ~/.dotfiles/agent/commands ~/.cursor/commands
ln -s ~/.dotfiles/agent/commands ~/.claude/commands
ln -s ~/.dotfiles/agent/claude/settings.json ~/.dotfiles/.claude/settings.json
```

Launch `nvim` and plugins will install automatically via lazy.nvim. LSP servers (pyright, ts_ls, bashls) will be installed by Mason on first run. Run `:checkhealth` to verify.
