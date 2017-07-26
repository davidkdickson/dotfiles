set nocompatible

filetype plugin indent on

source ~/.dot-files/vim/plugins.vim
source ~/.dot-files/vim/keymap.vim
source ~/.dot-files/vim/colors.vim

syntax on
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set number
set mouse=a
set smarttab
set colorcolumn=121
set relativenumber
set incsearch
set cursorline
set clipboard=unnamed,unnamedplus

" packadd! matchit

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_ruby_checkers = ['rubocop', 'rubylint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" airline
let g:airline_theme='one'
set laststatus=2

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=50
let NERDTreeShowHidden=1
let NERDTreeIgnore=['.git$[[dir]]', '.pyc']


" strip whitespace on save
autocmd BufWritePre * StripWhitespace

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
