# Dotfiles Cheat Sheet

## Shell (Zsh)

### File Listing (eza)

| Alias | Action |
|-------|--------|
| `ls` | List with icons |
| `ll` | Long list + git status |
| `la` | Long list + hidden files |
| `lt` | Tree view (2 levels) |

### Fuzzy Finder (fzf)

| Key | Action |
|-----|--------|
| `Ctrl+T` | Fuzzy find files and paste to command line |
| `Ctrl+R` | Fuzzy search command history |
| `Alt+C` | Fuzzy find and cd into directory |
| `**<Tab>` | Trigger fzf completion (e.g. `cd **<Tab>`) |

### Directory Navigation (zoxide)

| Command | Action |
|---------|--------|
| `z <query>` | Jump to most visited matching directory |
| `zi <query>` | Interactive selection with fzf |

### File Viewer (bat)

| Command | Action |
|---------|--------|
| `bat <file>` | View file with syntax highlighting |
| `bat -d <file>` | Show only diffs (no line numbers/header) |
| `bat -l <lang> <file>` | Force specific language highlighting |
| `bat --show-all <file>` | Show non-printable characters |

Theme: Catppuccin Mocha

### Vi-Mode (command line)

| Key | Action |
|-----|--------|
| `jk` | Exit insert → normal mode |
| `Ctrl+R` | Reverse history search |
| `Ctrl+W` | Delete word backward |
| `Ctrl+K` | Kill to end of line |
| `↑/↓` | Fuzzy history search (after typing) |

---

## Neovim (Leader = `Space`)

### Files & Search (Telescope)

| Key | Action |
|-----|--------|
| `<Leader>ff` | Find files |
| `<Leader>fg` | Live grep |
| `<Leader>fb` | List buffers |
| `<Leader>fh` | Help tags |
| `<Leader>fs` | Document symbols |
| `<Leader>fa` | Find all files (hidden + ignored) |
| `-` | Open file explorer (Oil) |

### LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | References |
| `gi` | Go to implementation |
| `K` | Hover docs |
| `<Leader>rn` | Rename symbol |
| `<Leader>ca` | Code action |
| `[d` / `]d` | Prev/next diagnostic |

### Navigation

| Key | Action |
|-----|--------|
| `jk` | Escape (insert mode) |
| `Ctrl+h/j/k/l` | Window/tmux pane navigation |
| `]b` / `[b` | Next/prev buffer |
| `]q` / `[q` | Next/prev quickfix |
| `<Leader>w` | Save |
| `<Leader>q` | Quit |

### Completion (insert mode)

| Key | Action |
|-----|--------|
| `Ctrl+Space` | Trigger completion |
| `Ctrl+e` | Dismiss completion |
| `Enter` | Confirm selection |

---
