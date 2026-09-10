# Dotfiles

## Components
- **ghostty** - Terminal emulator config
- **git** - Git config, global gitignore, and commit template
- **nvim** - Neovim config with lazy.nvim, LSP, Telescope, Treesitter, and Catppuccin
- **tmux** - Tmux config with vim-style navigation and Catppuccin theme
- **zsh** - Shell config with aliases, Starship prompt, zoxide, eza, fzf, and bat
- **starship** - Starship prompt config
- **pgcli** - PostgreSQL client config (pgcli)
- **macos** - Caps Lock to Return remap via launchd

## Prerequisites
```
brew trust hashicorp/tap   # third-party taps (terraform, bun) must be trusted
brew trust oven-sh/bun     # before Homebrew 5.1+ will load or update them
brew bundle
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Installation
```bash
# Shell and terminal
ln -s ~/.dotfiles/zsh/.zprofile ~/.zprofile
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/zsh/.zshenv ~/.zshenv
ln -s ~/.dotfiles/starship/starship.toml ~/.config/starship.toml
ln -s ~/.dotfiles/ghostty/config ~/Library/Application\ Support/com.mitchellh.ghostty/config
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf

# Development tools
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/git/.gitignore_global ~/.gitignore_global
ln -s ~/.dotfiles/git/.gitmessage ~/.gitmessage
mkdir -p ~/.config/pgcli
ln -s ~/.dotfiles/pgcli/config ~/.config/pgcli/config

# Caps Lock to Return (macOS)
ln -s ~/.dotfiles/macos/com.user.remapCapsLock.plist ~/Library/LaunchAgents/com.user.remapCapsLock.plist

# Shared agent skills
ln -s ~/.dotfiles/agent/skills ~/.claude/skills
mkdir -p ~/.agents
ln -s ~/.dotfiles/agent/skills ~/.agents/skills

# Claude Code
ln -s ~/.dotfiles/agent/claude/settings.json ~/.claude/settings.json
ln -s ~/.dotfiles/agent/claude/keybindings.json ~/.claude/keybindings.json
ln -s ~/.dotfiles/agent/claude/statusline-command.sh ~/.claude/statusline-command.sh
ln -s ~/.dotfiles/agent/claude/statusline.toml ~/.claude/statusline.toml
ln -s ~/.dotfiles/agent/claude/known_marketplaces.json ~/.claude/plugins/known_marketplaces.json
ln -s ~/.dotfiles/agent/claude/installed_plugins.json ~/.claude/plugins/installed_plugins.json
ln -s ~/.dotfiles/agent/claude/.mcp.json ~/.mcp.json

# Codex
mkdir -p ~/.codex
ln -s ~/.dotfiles/agent/codex/config.toml ~/.codex/config.toml
```

Launch `nvim` and plugins will install automatically via lazy.nvim. LSP servers (pyright, ts_ls, bashls) will be installed by Mason on first run. Run `:checkhealth` to verify.
