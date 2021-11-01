"" fzf.vim
nnoremap <C-P> :Files<CR>
nnoremap <silent> <leader>b :Bu<CR>
command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \ "rg --column --line-number --hidden --glob '!.git' --no-heading --color=always --smart-case ".shellescape(<q-args>), 1,
    \ fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
nnoremap <silent> <leader>f :Rg<CR>
