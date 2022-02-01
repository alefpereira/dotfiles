local cmd = vim.cmd
-- General Keymaps
-- Esc Remaps
-- inoremap jk <Esc>

-- Ctrl-P and Ctrl-N to behave like arrow (partial search in command mode)
cmd('cnoremap <C-p> <Up>')
cmd('cnoremap <C-n> <Down>')

-- Ctrl-J to brake line in Normal Mode
cmd('nnoremap <NL> i<CR><ESC>')

-- Possible abnt2 keyboard usability improvements for vim.
-- Map ç to behave like ":" (colon) to enter command mode.
--nnoremap ç :
--xnoremap ç :
--nnoremap <A-ç> :
--inoremap <A-ç> <Esc>:

-- Esc to clear search highlights
cmd('nnoremap <Esc> :noh<Esc>')

-- Y to behave like C and D
--vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })
cmd('nnoremap Y y$')

-- Auto close matching ([{<'"`
--inoremap <silent> ( ()<Esc>i
--inoremap <silent> [ []<Esc>i
--inoremap <silent> { {}<Esc>i
--inoremap <silent> " ""<Esc>i
--inoremap <silent> ' ''<Esc>i
--inoremap <silent> < <><Esc>i
--inoremap <silent> ` ``<Esc>i
--inoremap <silent> <C-e> <Esc>/[)}"'\]>]`<CR>:nohl<CR>a

-- Lots of great mapings. Thanks to ThePrimeagen for the inspiration
-- Prevent paste to replace register in visual mode
--vim.api.nvim_set_keymap('x', 'p', '_dP', { noremap = true })
cmd('xnoremap p _dP')

-- Select all text
--vim.api.nvim_set_keymap('n', '<Leader>a', 'ggVG', { noremap = true })
cmd('nnoremap <leader>a ggVG')
cmd('xnoremap <leader>a <Esc>ggVG')

-- Copy to system clipboard using leader key. Y to copy all file.
cmd('nnoremap <leader>y "+y')
cmd('xnoremap <leader>y "+y')
cmd('nnoremap <leader>Y gg"+yG')

-- Paste from system clipboard with leader key.
cmd('nnoremap <leader>p "+p')
cmd('xnoremap <leader>p "+p')
cmd('nnoremap <leader>P "+P')
cmd('xnoremap <leader>P "+P')

-- Delete to blackhole
cmd('nnoremap <leader>d "_d')
cmd('xnoremap <leader>d "_d')

-- Window navigation management
--nnoremap <leader>q <c-w>q
--nnoremap <leader>h <c-w>h
--nnoremap <leader>j <c-w>j
--nnoremap <leader>k <c-w>k
--nnoremap <leader>l <c-w>l

-- Jetpack buffer navigation
cmd('nnoremap <leader>l :ls<cr>:b<space>')

-- Vim Fugitive (vim-fugitive)
cmd('nnoremap <leader>g :G<CR>')

-- Undotree
cmd('nnoremap <leader>u :UndotreeToggle<CR>:UndotreeFocus<CR>')

-- Open netrw Lexplore
cmd('nnoremap <silent> <leader>e :Lexplore<CR>')

-- <cr> and <c-j> to behave like <c-y> in completion list
-- It seems it makes vim slow, also don't seems to change any behavior
--cmd('inoremap <expr> <cr> pumvisible() ? "\\<C-y>" : "\\<C-g>u\\<CR>"')
--cmd('inoremap <expr> <nl> pumvisible() ? "\\<C-y>" : "\\<C-g>u\\<NL>"')

-- quickfix list mappings
cmd('nnoremap <silent> <leader>qo :copen<CR>')
cmd('nnoremap <silent> <leader>qc :cclose<CR>')
cmd('nnoremap <silent> [q :cp<CR>')
cmd('nnoremap <silent> ]q :cn<CR>')

--LSP Mappings
--nnoremap <F12> :lua vim.lsp.buf.definition()<CR>
cmd('nnoremap gd :lua vim.lsp.buf.definition()<CR>')
cmd('nnoremap gD :lua vim.lsp.buf.declaraion()<CR>')
cmd('nnoremap gi :lua vim.lsp.buf.implementation()<CR>')
cmd('nnoremap gr :lua vim.lsp.buf.references()<CR>')
cmd('nnoremap <C-k> :lua vim.lsp.buf.signature_help()<CR>')
cmd('nnoremap <F2> :lua vim.lsp.buf.rename()<CR>')
cmd('nnoremap K :lua vim.lsp.buf.hover()<CR>')
-- nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
-- nnoremap <leader>vsd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
-- nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
-- nnoremap <leader>vll :call LspLocationList()<CR>

-- Telescope (telescope.nvim)
cmd "nnoremap <c-p> <cmd>lua require('alef.telescope').project_files()<cr>"
cmd[[nnoremap <silent> <leader>b <cmd>Telescope buffers<cr>]]
cmd[[nnoremap <leader>f <cmd>Telescope live_grep<cr>]]
cmd('nnoremap <leader>tr <cmd>Telescope resume<cr>')
cmd('nnoremap <leader>tp <cmd>Telescope pickers<cr>')
cmd('nnoremap <leader>th <cmd>Telescope help_tags<cr>')
