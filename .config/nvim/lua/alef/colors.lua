local cmd = vim.cmd

local M = {}
function M.setup()
  -- Colors
  -- Terminal Color Scheme
  --vim.g.gruvbox_contrast_dark='hard'
  --cmd('colorscheme gruvbox')
  --For "codedark" also set netrwMarkFile to fix netrw marked files
  cmd('colorscheme codedark')
  cmd('highlight netrwMarkFile ctermbg=237')

  -- Column lines color
  cmd('highlight ColorColumn ctermbg=238')

  -- CursorLineLn white foreground and grey background
  cmd('highlight CursorLineNr ctermbg=236 ctermfg=248')

  -- GitSigns and LineBar
  cmd('highlight! link SignColumn LineNr')
  cmd('highlight GitSignsAdd      ctermfg=2 ctermbg=234')
  cmd('highlight GitSignsChange   ctermfg=4 ctermbg=234')
  cmd('highlight GitSignsDelete   ctermfg=9 ctermbg=234')
end

return M
