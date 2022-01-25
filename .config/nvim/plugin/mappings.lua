--[[
" ====== Keymaps ======
" Esc Remaps
" inoremap jk <Esc>

" Ctrl-P and Ctrl-N to behave like arrow (partial search in command mode)
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Ctrl-J to brake line in Normal Mode
nnoremap <NL> i<CR><ESC>

"" Possible abnt2 keyboard usability improvements for vim.
" Map ç to behave like ":" (colon) to enter command mode.
"nnoremap ç :
"xnoremap ç :
"nnoremap <A-ç> :
"inoremap <A-ç> <Esc>:

" Esc to clear search highlights
nnoremap <Esc> :noh<Esc>

" Y to behave like C and D
nnoremap Y y$
" Auto close matching ([{<'"`
"inoremap <silent> ( ()<Esc>i
"inoremap <silent> [ []<Esc>i
"inoremap <silent> { {}<Esc>i
"inoremap <silent> " ""<Esc>i
"inoremap <silent> ' ''<Esc>i
"inoremap <silent> < <><Esc>i
"inoremap <silent> ` ``<Esc>i
"inoremap <silent> <C-e> <Esc>/[)}"'\]>]`<CR>:nohl<CR>a

"" Lots of great mapings. Thanks to ThePrimeagen for the inspiration
" Prevent paste to replace register in visual mode
xnoremap p "_dP

" Select all text
nnoremap <leader>a ggVG
xnoremap <leader>a <Esc>ggVG

" Copy to system clipboard using leader key. Y to copy all file.
nnoremap <leader>y "+y
xnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" Paste from system clipboard with leader key.
nnoremap <leader>p "+p
xnoremap <leader>p "+p
nnoremap <leader>P "+P
xnoremap <leader>P "+P

" Delete to blackhole
nnoremap <leader>d "_d
xnoremap <leader>d "_d

" Window navigation management
"nnoremap <leader>q <c-w>q
"nnoremap <leader>h <c-w>h
"nnoremap <leader>j <c-w>j
"nnoremap <leader>k <c-w>k
"nnoremap <leader>l <c-w>l

"" Vim Fugitive (vim-fugitive)
nnoremap <leader>g :G<CR>

" Undotree
nnoremap <leader>u :UndotreeToggle<CR>:UndotreeFocus<CR>

" Open netrw Lexplore
nnoremap <silent> <leader>e :Lexplore<CR>

" <cr> and <c-j> to behave like <c-y> in completion list
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <nl> pumvisible() ? "\<C-y>" : "\<C-g>u\<NL>"

" quickfix list mappings
nnoremap <silent> <leader>qo :copen<CR>
nnoremap <silent> <leader>qc :cclose<CR>
nnoremap <silent> <leader>qn :cn<CR>
nnoremap <silent> <leader>qp :cp<CR>

" ====== End of Keymaps ======

"nnoremap <F12> :lua vim.lsp.buf.definition()<CR>
nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap gD :lua vim.lsp.buf.declaraion()<CR>
nnoremap gi :lua vim.lsp.buf.implementation()<CR>
nnoremap gr :lua vim.lsp.buf.references()<CR>
nnoremap <C-k> :lua vim.lsp.buf.signature_help()<CR>
nnoremap <F2> :lua vim.lsp.buf.rename()<CR>
nnoremap K :lua vim.lsp.buf.hover()<CR>
" nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
" nnoremap <leader>vsd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
" nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
" nnoremap <leader>vll :call LspLocationList()<CR>

"" Telescope (telescope.nvim)
nnoremap <C-P> <cmd>Telescope find_files
    \ find_command=fd,--type,f,--hidden,--exclude,.git<cr>
nnoremap <silent> <leader>b <cmd>Telescope buffers
    \ show_all_buffers='true' sort_lastused='true'<CR>
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

nnoremap <leader>tr <cmd>Telescope resume<cr>
nnoremap <leader>tp <cmd>Telescope pickers<cr>
--]]

--LSP Mappings

--Telescope (telescope.nvim)
