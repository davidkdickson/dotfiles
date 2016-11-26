set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Plugin 'VundleVim/Vundle.vim'             " plugin manager
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'              " tree view of files
Plugin 'christoomey/vim-tmux-navigator'   " navigate tmux panes and vim
Plugin 'ctrlpvim/ctrlp.vim'               " fuzzy search
Plugin 'chriskempson/base16-vim'          " color scheme
Plugin 'vim-airline/vim-airline'          " airline status bar
Plugin 'vim-airline/vim-airline-themes'   " airline themes
Plugin 'craigemery/vim-autotag'           " automatically update ctags on saving
Plugin 'vim-ruby/vim-ruby'
Plugin 'scrooloose/syntastic'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'tpope/vim-endwise'                " automatically add end to functions
Plugin 'ntpeters/vim-better-whitespace'   " highlight trailing whitespace
Plugin 'ervandew/supertab'                " autocompletion with tab
Plugin 'MarcWeber/vim-addon-mw-utils'     " snippet support
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'ngmy/vim-rubocop'
Plugin 'tpope/vim-dispatch'

filetype plugin indent on
set background=dark
let base16colorspace=256
colorscheme base16-flat
syntax on

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set number
set mouse=a
set clipboard^=unnamed                    " allow copy to mac keyboard
set backspace=indent,eol,start            " backspace works as you would expect
set smarttab
set colorcolumn=121

packadd! matchit

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

let NERDTreeShowHidden=1

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" airline
set laststatus=2

" NERDTree
map <C-n> :NERDTreeToggle<CR>   " shortcut key
let g:NERDTreeWinSize = 50      " set width

" disable arrow keys in escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
map <leader>r :!ruby %<cr>

" strip whitespace on save
autocmd BufWritePre * StripWhitespace
autocmd BufWritePre *.rb RuboCop


" snipmate remapping to play better with supertab
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

" Quickfix navigation.
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>

" better mappings
let mapleader=" "
nnoremap <Leader>w :w<CR>
nnoremap <Leader>wa :wall<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>q :q<CR>
imap jk <Esc>
" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

set relativenumber
" vim-rspec
nnoremap <leader>rt :Dispatch rspec %<cr>
nnoremap <leader>rs: execute "Dispatch rspec %:" . line(".")<cr>
