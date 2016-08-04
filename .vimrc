set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Plugin 'VundleVim/Vundle.vim'             " plugin manager
Plugin 'scrooloose/nerdtree'              " tree view of files
Plugin 'christoomey/vim-tmux-navigator'   " navigate tmux panes and vim
Plugin 'ctrlpvim/ctrlp.vim'               " fuzzy search
Plugin 'chriskempson/base16-vim'          " color scheme
Plugin 'vim-airline/vim-airline'          " airline status bar
Plugin 'vim-airline/vim-airline-themes'   " airline themes
Plugin 'craigemery/vim-autotag'           " automatically update ctags on saving
Plugin 'vim-ruby/vim-ruby'
Plugin 'elixir-lang/vim-elixir'
Plugin 'scrooloose/syntastic'
Plugin 'ecomba/vim-ruby-refactoring'

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
set clipboard^=unnamed      " allow copy to mac keyboard

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
