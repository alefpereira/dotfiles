" Load config from ~/.vimrc
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

" Setup Pyright
lua << EOF
local nvim_lsp = require('lspconfig')

local servers = {
    "pyright",
}

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup{}
end
EOF
