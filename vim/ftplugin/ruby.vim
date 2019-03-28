let mapleader=" "

map <leader>r :w <cr> :!ruby %<cr>
map <leader>rf :w <cr> :!rspec %<cr>

map <leader>ct :!ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)<cr>
map <leader>cs :!cscope -R . **/*.rb<cr>
