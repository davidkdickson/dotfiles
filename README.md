# Dotfiles

## Components
- **ghostty** - Terminal emulator config
- **git** - Git config, global gitignore, and commit template
- **nvim** - Neovim config with lazy.nvim, LSP, Telescope, Treesitter, and Catppuccin
- **tmux** - Tmux config with vim-style navigation and Catppuccin theme
- **zsh** - Shell config with aliases, Starship prompt, zoxide, eza, fzf, and bat
- **starship** - Starship prompt config
- **pgcli** - PostgreSQL client config (pgcli)
- **macos** - macOS system config (Caps Lock remap via launchd)
- **agent** - Claude Code and Codex settings, plus shared skills

## Prerequisites
```
brew trust hashicorp/tap   # third-party taps (terraform, bun) must be trusted
brew trust oven-sh/bun     # before Homebrew 5.1+ will load or update them
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
ln -s ~/.dotfiles/agent/skills ~/.claude/skills
mkdir -p ~/.agents
ln -s ~/.dotfiles/agent/skills ~/.agents/skills
ln -s ~/.dotfiles/agent/claude/settings.json ~/.claude/settings.json
ln -s ~/.dotfiles/agent/claude/keybindings.json ~/.claude/keybindings.json
ln -s ~/.dotfiles/agent/claude/statusline-command.sh ~/.claude/statusline-command.sh
ln -s ~/.dotfiles/agent/claude/statusline.toml ~/.claude/statusline.toml
ln -s ~/.dotfiles/agent/claude/known_marketplaces.json ~/.claude/plugins/known_marketplaces.json
ln -s ~/.dotfiles/agent/claude/installed_plugins.json ~/.claude/plugins/installed_plugins.json
ln -s ~/.dotfiles/agent/claude/.mcp.json ~/.mcp.json
```

Claude Code and Codex share the skills in `agent/skills` through the symlinks above. Codex discovers personal skills in `~/.agents/skills`. Restart Codex if the skills don't appear; in the CLI, use `/skills` to list them or `$skill-name` to invoke one. See the [Codex skills documentation](https://learn.chatgpt.com/docs/build-skills).

Codex defaults live in `agent/codex/config.toml`: high reasoning effort, concise output, automatic approval review within a workspace-write sandbox, live web search, fullscreen terminal UI, Vim mode, and a native status line. The model remains the Codex default or your current selection. Apple Notes uses the same locally installed Claude Desktop extension as the Claude config.

The Codex config also includes this machine’s desktop plugins, browser/computer-use runtime, notification hook, and trusted projects. To install it when no `~/.codex/config.toml` exists:

```bash
mkdir -p ~/.codex
ln -s ~/.dotfiles/agent/codex/config.toml ~/.codex/config.toml
```

For an existing installation, back up `~/.codex/config.toml` and preserve any additional local settings in the repo config before replacing the original with the symlink above. This machine’s existing settings have already been merged. Changes through the symlink update the repository file; review app-generated changes before committing. Runtime paths may need updating on another machine or after app upgrades.

The optional `notify` command plays the same R2-D2 sound as Claude; enable it only when no app-managed notification command needs to be preserved. Claude-specific plugins and permission allowlists are not copied into Codex. Terminal colors continue to come from the terminal configuration. See the [official Codex configuration reference](https://learn.chatgpt.com/docs/config-file/config-reference).

Launch `nvim` and plugins will install automatically via lazy.nvim. LSP servers (pyright, ts_ls, bashls) will be installed by Mason on first run. Run `:checkhealth` to verify.
