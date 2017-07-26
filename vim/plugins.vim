call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'               " git integration
Plug 'scrooloose/nerdtree'              " tree view of files
Plug 'christoomey/vim-tmux-navigator'   " navigate tmux panes and vim
Plug 'ctrlpvim/ctrlp.vim'               " fuzzy search
Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline'          " airline status bar
Plug 'vim-airline/vim-airline-themes'   " airline themes
Plug 'craigemery/vim-autotag'           " automatically update ctags on saving
Plug 'vim-ruby/vim-ruby'
Plug 'scrooloose/syntastic'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'tpope/vim-endwise'                " automatically add end to functions
Plug 'ntpeters/vim-better-whitespace'   " highlight trailing whitespace
Plug 'ervandew/supertab'                " autocompletion with tab
Plug 'MarcWeber/vim-addon-mw-utils'     " snippet support
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'ngmy/vim-rubocop'
Plug 'tpope/vim-dispatch'               " allow tests to run in background efficiently
Plug 'majutsushi/tagbar'                " ctags toolbar
Plug 'mtscout6/syntastic-local-eslint.vim'
call plug#end()
