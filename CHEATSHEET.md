# Dotfiles Cheat Sheet

## Shell (Zsh)

### Navigation & Basics

| Alias | Action |
|-------|--------|
| `c` | Clear terminal |
| `..` | `cd ..` |
| `...` | `cd ../..` |
| `reload` | Re-source `~/.zshrc` |
| `vim` | Opens Neovim |

### File Listing (eza)

| Alias | Action |
|-------|--------|
| `ls` | List with icons |
| `ll` | Long list + git status |
| `la` | Long list + hidden files |
| `lt` | Tree view (2 levels) |

### Vi-Mode (command line)

| Key | Action |
|-----|--------|
| `jk` | Exit insert → normal mode |
| `Ctrl+R` | Reverse history search |
| `Ctrl+W` | Delete word backward |
| `Ctrl+K` | Kill to end of line |
| `↑/↓` | Fuzzy history search (after typing) |

---

## Git (prefixed with `g` in shell)

### Everyday

| Alias | Action |
|-------|--------|
| `gs` | Status (short) |
| `ga` | Add all |
| `gc` | Commit |
| `gcm "msg"` | Commit with message |
| `gcam` | Amend last commit |
| `gd` | Diff unstaged |
| `gdc` | Diff staged |

### Branches & Remote

| Alias | Action |
|-------|--------|
| `gb` | List branches |
| `gbl` | All branches (local + remote) |
| `gcob name` | Create + checkout branch |
| `gco name` | Checkout branch |
| `gbd name` | Delete branch |
| `gps` | Push |
| `gpo` | Push new branch to origin |
| `gpl` | Pull |
| `gplr` | Pull with rebase |
| `gbpr` | Fetch + prune dead remotes |

### Log

| Alias | Action |
|-------|--------|
| `gl` | Pretty graph log (all branches) |
| `glna` | Graph log (current branch only) |
| `gll` | Log with file stats |

### Merging

| Alias | Action |
|-------|--------|
| `gm` | Merge (no-ff) |
| `gms` | Merge squash |

---

## Tmux (prefix: `Ctrl+A`)

| Key | Action |
|-----|--------|
| `Ctrl+h/j/k/l` | Navigate panes (no prefix needed, works in nvim too) |
| `prefix -` or `_` | Split horizontally |
| `prefix \|` | Split vertically |
| `prefix X` | Kill session |
| `v` (copy mode) | Begin selection |
| `y` (copy mode) | Yank selection |

`tm` — New tmux session named after current directory.

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

### Testing (vim-test)

| Key | Action |
|-----|--------|
| `<Leader>t` | Test nearest |
| `<Leader>T` | Test file |
| `<Leader>a` | Test suite |
| `<Leader>l` | Re-run last test |

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

## Utility Functions

| Command | Action |
|---------|--------|
| `listening_port 3000` | Find PID on port |
| `postgres start/stop` | Control PostgreSQL |
| `aws-ecr-login` | Login to AWS ECR |
