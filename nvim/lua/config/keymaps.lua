local map = vim.keymap.set

-- disable arrow keys
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")

-- escape
map("i", "jk", "<Esc>")

-- save and quit
map("n", "<Leader>w", ":w<CR>")
map("n", "<Leader>wa", ":wall<CR>")
map("n", "<Leader>wq", ":wq<CR>")
map("n", "<Leader>q", ":q<CR>")
map("n", "<Leader>qa", ":qa<CR>")
map("n", "<Leader>q!", ":q!<CR>")

-- quickfix navigation
map("n", "]q", ":cnext<CR>")
map("n", "[q", ":cprevious<CR>")
map("n", "[Q", ":cfirst<CR>")
map("n", "]Q", ":clast<CR>")

-- location list navigation
map("n", "]l", ":lnext<CR>")
map("n", "[l", ":lprevious<CR>")
map("n", "]L", ":lfirst<CR>")
map("n", "[L", ":llast<CR>")

-- buffer navigation
map("n", "]b", ":bnext<CR>")
map("n", "[b", ":bprevious<CR>")
map("n", "]B", ":bfirst<CR>")
map("n", "[B", ":blast<CR>")

-- select last pasted
map("n", "gb", "'`[' . strpart(getregtype(), 0, 1) . '`]'", { expr = true })

-- window navigation (fallback, vim-tmux-navigator overrides these)
map("n", "<C-J>", "<C-W><C-J>")
map("n", "<C-K>", "<C-W><C-K>")
map("n", "<C-L>", "<C-W><C-L>")
map("n", "<C-H>", "<C-W><C-H>")
