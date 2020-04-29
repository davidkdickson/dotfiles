let mapleader=" "

" disable arrow keys in escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Quickfix navigation
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>

" location list navigation
nnoremap ]l :lnext<CR>
nnoremap [l :lprevious<CR>
nnoremap ]L :lfirst<CR>
nnoremap [L :llast<CR>

" buffers navigation
nnoremap ]b :bnext<CR>
nnoremap [b :bprevious<CR>
nnoremap ]B :bfirst<CR>
nnoremap [B :blast<CR>

" better mappings
nnoremap <Leader>w :w<CR>
nnoremap <Leader>wa :wall<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>qa :qa<CR>
nnoremap <Leader>q! :q!<CR>
nnoremap <Leader>y :SyntasticToggleMode<CR>
imap jk <Esc>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" select last
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

" vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
