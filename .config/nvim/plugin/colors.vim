fun! ColorMyPencils()
    "" Colors
    " Terminal Color Scheme
    colorscheme gruvbox

    " Column lines color
    highlight ColorColumn ctermbg=238

    " CursorLineLn white foreground and grey background
    highlight CursorLineNr ctermbg=236 ctermfg=248

    " GitGutter and LineBar
    highlight! link SignColumn LineNr
    highlight GitGutterAdd    guifg=green ctermfg=2 ctermbg=2
    highlight GitGutterChange guifg=blue ctermfg=4 ctermbg=4
    highlight GitGutterDelete guifg=red ctermfg=9 ctermbg=9
endfun

call ColorMyPencils()