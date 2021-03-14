" Load config from ~/.vimrc
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

" Setup Pyright
lua << EOF
require'lspconfig'.pyright.setup{}
EOF
