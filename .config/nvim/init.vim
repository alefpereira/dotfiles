" Load config from ~/.vimrc
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

" Setup Pyright
lua << EOF
local nvim_lsp = require('lspconfig')

local servers = {
    "pyright",
    "tsserver",
}

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup{}
end
EOF

lua << EOF
local actions = require('telescope.actions')
require('telescope').setup{
    defaults = {
        mappings = {
            i = {
                ["<C-j>"]= actions.select_default,
            },
            n = {
                ["<C-j>"]= actions.select_default,
            }
        }
    }
}
EOF
