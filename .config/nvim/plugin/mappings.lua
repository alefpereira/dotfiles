-- General Keymaps
-- Esc Remaps
-- inoremap jk <Esc>

-- Ctrl-P and Ctrl-N to behave like arrow (partial search in command mode)
vim.cmd('cnoremap <C-p> <Up>')
vim.cmd('cnoremap <C-n> <Down>')

-- Ctrl-J to brake line in Normal Mode
vim.cmd('nnoremap <NL> i<CR><ESC>')

-- Possible abnt2 keyboard usability improvements for vim.
-- Map ç to behave like ":" (colon) to enter command mode.
--nnoremap ç :
--xnoremap ç :
--nnoremap <A-ç> :
--inoremap <A-ç> <Esc>:

-- Esc to clear search highlights
vim.cmd('nnoremap <Esc> :noh<Esc>')

-- Y to behave like C and D
--vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })
vim.cmd('nnoremap Y y$')

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
vim.cmd('xnoremap p _dP')

-- Select all text
--vim.api.nvim_set_keymap('n', '<Leader>a', 'ggVG', { noremap = true })
vim.cmd('nnoremap <leader>a ggVG')
vim.cmd('xnoremap <leader>a <Esc>ggVG')

-- Copy to system clipboard using leader key. Y to copy all file.
vim.cmd('nnoremap <leader>y "+y')
vim.cmd('xnoremap <leader>y "+y')
vim.cmd('nnoremap <leader>Y gg"+yG')

-- Paste from system clipboard with leader key.
vim.cmd('nnoremap <leader>p "+p')
vim.cmd('xnoremap <leader>p "+p')
vim.cmd('nnoremap <leader>P "+P')
vim.cmd('xnoremap <leader>P "+P')

-- Delete to blackhole
vim.cmd('nnoremap <leader>d "_d')
vim.cmd('xnoremap <leader>d "_d')

-- Window navigation management
--nnoremap <leader>q <c-w>q
--nnoremap <leader>h <c-w>h
--nnoremap <leader>j <c-w>j
--nnoremap <leader>k <c-w>k
--nnoremap <leader>l <c-w>l

-- Vim Fugitive (vim-fugitive)
vim.cmd('nnoremap <leader>g :G<CR>')

-- Undotree
vim.cmd('nnoremap <leader>u :UndotreeToggle<CR>:UndotreeFocus<CR>')

-- Open netrw Lexplore
vim.cmd('nnoremap <silent> <leader>e :Lexplore<CR>')

-- <cr> and <c-j> to behave like <c-y> in completion list
-- It seems it makes vim slow, also don't seems to change any behavior
--vim.cmd('inoremap <expr> <cr> pumvisible() ? "\\<C-y>" : "\\<C-g>u\\<CR>"')
--vim.cmd('inoremap <expr> <nl> pumvisible() ? "\\<C-y>" : "\\<C-g>u\\<NL>"')

-- quickfix list mappings
vim.cmd('nnoremap <silent> <leader>qo :copen<CR>')
vim.cmd('nnoremap <silent> <leader>qc :cclose<CR>')
vim.cmd('nnoremap <silent> <leader>qn :cn<CR>')
vim.cmd('nnoremap <silent> <leader>qp :cp<CR>')

--LSP Mappings
--nnoremap <F12> :lua vim.lsp.buf.definition()<CR>
vim.cmd('nnoremap gd :lua vim.lsp.buf.definition()<CR>')
vim.cmd('nnoremap gD :lua vim.lsp.buf.declaraion()<CR>')
vim.cmd('nnoremap gi :lua vim.lsp.buf.implementation()<CR>')
vim.cmd('nnoremap gr :lua vim.lsp.buf.references()<CR>')
vim.cmd('nnoremap <C-k> :lua vim.lsp.buf.signature_help()<CR>')
vim.cmd('nnoremap <F2> :lua vim.lsp.buf.rename()<CR>')
vim.cmd('nnoremap K :lua vim.lsp.buf.hover()<CR>')
-- nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
-- nnoremap <leader>vsd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
-- nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
-- nnoremap <leader>vll :call LspLocationList()<CR>

-- Telescope (telescope.nvim)
vim.cmd([[
nnoremap <C-P> <cmd>Telescope find_files
  \ find_command=fd,--type,f,--hidden,--exclude,.git<cr>
]])
vim.cmd([[
nnoremap <silent> <leader>b <cmd>Telescope buffers
  \ show_all_buffers='true' sort_lastused='true'<CR>
]])
vim.cmd([[
nnoremap <leader>f <cmd>lua require('telescope.builtin').live_grep
  \ {vimgrep_arguments={
  \   'rg',
  \   '--color=never',
  \   '--no-heading',
  \   '--hidden',
  \   '--with-filename',
  \   '--line-number',
  \   '--column',
  \   '--smart-case',
  \   '--glob',
  \   '!.git'
  \ }}<cr>
]])
vim.cmd('nnoremap <leader>tr <cmd>Telescope resume<cr>')
vim.cmd('nnoremap <leader>tp <cmd>Telescope pickers<cr>')
