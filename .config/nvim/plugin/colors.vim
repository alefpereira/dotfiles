fun! ColorMyPencils()
    "" Colors
    " Terminal Color Scheme
    "colorscheme gruvbox
    colorscheme codedark

    " Column lines color
    highlight ColorColumn ctermbg=238

    " CursorLineLn white foreground and grey background
    highlight CursorLineNr ctermbg=236 ctermfg=248

    " GitGutter and LineBar
    highlight! link SignColumn LineNr
    highlight GitGutterAdd    guifg=green ctermfg=2 ctermbg=2
    highlight GitGutterChange guifg=blue ctermfg=4 ctermbg=4
    highlight GitGutterDelete guifg=red ctermfg=9 ctermbg=9
    highlight link GitGutterChangeDelete GitGutterChange
    "highlight link GitGutterChangeDeleteLine GitGutterChange
    "highlight link GitGutterAddIntraLine GitGutterChange
    "highlight link GitGutterDeleteIntraLine GitGutterChange
endfun

call ColorMyPencils()