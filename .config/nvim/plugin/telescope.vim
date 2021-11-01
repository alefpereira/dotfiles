"" Telescope (telescope.nvim)
nnoremap <C-P> <cmd>Telescope find_files
    \ find_command=fd,--type,f,--hidden,--exclude,.git<cr>
nnoremap <silent> <leader>b <cmd>Telescope buffers
    \ show_all_buffers='true'<CR>
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
