fun! ColorMyPencils()
    "" Colors
    " Terminal Color Scheme
    "colorscheme gruvbox
    colorscheme codedark

    " Column lines color
    highlight ColorColumn ctermbg=238

    " CursorLineLn white foreground and grey background
    highlight CursorLineNr ctermbg=236 ctermfg=248

    " GitSigns and LineBar
    highlight! link SignColumn LineNr
    highlight GitSignsAdd      ctermfg=2 ctermbg=234
    highlight GitSignsChange   ctermfg=4 ctermbg=234
    highlight GitSignsDelete  ctermfg=9 ctermbg=234
endfun

call ColorMyPencils()
