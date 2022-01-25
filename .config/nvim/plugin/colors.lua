--[[
fun! ColorMyPencils()
    "" Colors
    " Terminal Color Scheme
    "let g:gruvbox_contrast_dark='hard'
    "colorscheme gruvbox
    "For "codedark" also set netrwMarkFile to fix netrw marked files
    colorscheme codedark
    highlight netrwMarkFile ctermbg=237

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
--]]
