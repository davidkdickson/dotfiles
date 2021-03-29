call plug#begin('~/.vim/plugged')

" General
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'janko-m/vim-test'

" FILETYPE-SPECIFIC
" ruby
Plug 'tpope/vim-rbenv'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'ecomba/vim-ruby-refactoring'

" python
Plug 'vim-scripts/indentpython.vim'

" C languages
Plug 'rhysd/vim-clang-format'

Plug 'tpope/vim-fugitive'               " git integration
Plug 'scrooloose/nerdtree'              " tree view of files
Plug 'christoomey/vim-tmux-navigator'   " navigate tmux panes and vim
Plug 'ctrlpvim/ctrlp.vim'               " fuzzy search
Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline'          " airline status bar
Plug 'vim-airline/vim-airline-themes'   " airline themes
Plug 'craigemery/vim-autotag'           " automatically update ctags on saving
Plug 'ntpeters/vim-better-whitespace'   " highlight trailing whitespace
Plug 'tomtom/tlib_vim'
Plug 'ngmy/vim-rubocop'
Plug 'majutsushi/tagbar'                " ctags toolbar
Plug 'mtscout6/syntastic-local-eslint.vim'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()
