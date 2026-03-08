# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles repository managing development environment configuration via manual symlinks (no package manager like GNU Stow). Configs are symlinked from this repo to their expected locations (`~`, `~/.config/`, etc.).

## Setup Commands

```bash
brew bundle                              # Install dependencies from Brewfile
ln -s ~/.dotfiles/nvim ~/.config/nvim    # Example symlink (see README for full list)
```

No build, lint, or test commands exist — this is a configuration-only repo.

## Architecture

- **zsh/** — Shell config (`.zshrc`, `.zprofile`, `.zshenv`), aliases in `zsh/aliases/`, vi-mode keybindings in `zsh/vi-mode`
- **nvim/** — Neovim config using lazy.nvim plugin manager. Entry point: `init.lua` → loads `config/` (options, keymaps, autocmds) then `plugins/`
- **git/** — `.gitconfig` (delta pager, zdiff3 conflicts, custom aliases), `.gitmessage` template, `.gitignore_global`
- **tmux/** — `.tmux.conf` with TPM plugin manager, prefix `C-a`, vim-style pane navigation via `C-hjkl`
- **ghostty/** — Terminal emulator config
- **starship/** — Shell prompt config
- **pgcli/** — PostgreSQL client config
- **macos/** — launchd plist to remap Caps Lock to Control
- **agent/** — Shared workflow commands for Claude Code and Cursor IDE, symlinked to `~/.claude/commands` and `~/.cursor/commands`

## Conventions

- Consistent **Catppuccin Mocha** color theme across ghostty, nvim, and tmux
- Git aliases in `.gitconfig` are auto-wrapped as `g*` shell aliases via `zsh/aliases/git`
- Neovim plugins are individual files in `nvim/lua/plugins/` (lazy.nvim convention)
- LSP servers configured: pyright, ts_ls, bashls (managed via Mason)
