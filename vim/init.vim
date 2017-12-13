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
let NERDTreeIgnore=['.git$[[dir]]', '.pyc', '.whl']
let NERDTreeQuitOnOpen=1


" strip whitespace on save
autocmd BufWritePre * StripWhitespace

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

au VimLeave * call nvim_cursor_set_shape("vertical-bar")

" Deoplete
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_refresh_always=0
let g:deoplete#enable_smart_case=1
let g:deoplete#file#enable_buffer_path=1

let g:deoplete#sources={}
let g:deoplete#sources._    = ['around', 'buffer', 'file', 'ultisnips']
let g:deoplete#sources.ruby = ['around', 'buffer', 'member', 'file', 'ultisnips']
let g:deoplete#sources.vim  = ['around', 'buffer', 'member', 'file', 'ultisnips']
let g:deoplete#sources['javascript.jsx'] = ['around', 'buffer', 'file', 'ultisnips', 'ternjs']
let g:deoplete#sources.css  = ['around', 'buffer', 'member', 'file', 'omni', 'ultisnips']
let g:deoplete#sources.scss = ['around', 'buffer', 'member', 'file', 'omni', 'ultisnips']
let g:deoplete#sources.html = ['around', 'buffer', 'member', 'file', 'omni', 'ultisnips']

" Utisnips
inoremap <C-x><C-k> <NOP>
let g:UltiSnipsExpandTrigger='<C-j>'
let g:UltiSnipsListSnippets='<C-s>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'

" persistent undo
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile
