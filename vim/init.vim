set nocompatible

filetype plugin indent on

source ~/.dotfiles/vim/plugins.vim
source ~/.dotfiles/vim/keymap.vim
source ~/.dotfiles/vim/colors.vim

syntax on
set encoding=utf-8
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

" specific environment for neovim
" disable unused providers
let g:loaded_node_provider = 0
let g:python_host_prog = '$HOME/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '$HOME/.pyenv/versions/py3nvim/bin/python'

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

" Utisnips
" inoremap <C-x><C-k> <NOP>
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

" YCM
let g:ycm_auto_trigger = 1
let g:ycm_max_num_candidates = 15
let g:ycm_autoclose_preview_window_after_insertion = 1

" g:ycm_global_ycm_extra_conf global file
let g:ycm_extra_conf_globlist = ['~/Workspace/*'] " whitelist config files in this or below
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

" spell check git commit messages
autocmd FileType gitcommit setlocal spell
