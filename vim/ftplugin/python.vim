let mapleader=" "

" Python specific settings.
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal formatoptions=croql

" Specific key mappings
map <leader>r :w <cr> :!python %<cr>
map <leader>rf :w <cr> :!pytest %<cr>

map <leader>ct :!ctags -R --languages=python --exclude=.git --exclude=log . $(bundle list --paths)<cr>
map <leader>cs :!cscope -R . **/*.py<cr>

let python_highlight_all=1

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
