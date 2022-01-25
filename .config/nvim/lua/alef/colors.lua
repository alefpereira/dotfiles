local M = {}

function M.setup()
  -- Colors
  -- Terminal Color Scheme
  --vim.g.gruvbox_contrast_dark='hard'
  --vim.cmd('colorscheme gruvbox')
  --For "codedark" also set netrwMarkFile to fix netrw marked files
  -- TODO: Use vim.highlight.create to setup highlights
  vim.cmd('colorscheme codedark')
  vim.cmd('highlight netrwMarkFile ctermbg=237')

  -- Column lines color
  vim.cmd('highlight ColorColumn ctermbg=238')

  -- CursorLineLn white foreground and grey background
  vim.cmd('highlight CursorLineNr ctermbg=236 ctermfg=248')

  -- GitSigns and LineBar
  vim.cmd('highlight! link SignColumn LineNr')
  vim.cmd('highlight GitSignsAdd      ctermfg=2 ctermbg=234')
  vim.cmd('highlight GitSignsChange   ctermfg=4 ctermbg=234')
  vim.cmd('highlight GitSignsDelete   ctermfg=9 ctermbg=234')
end

return M
