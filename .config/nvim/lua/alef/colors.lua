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

  -- dap breakpoint sign
  cmd[[highlight DapBreakpointSign ctermfg=9]]
  cmd('set termguicolors')
  cmd[[highlight DiagnosticUnderlineError cterm=undercurl gui=undercurl]]
  cmd[[highlight DiagnosticUnderlineWarn cterm=undercurl gui=undercurl]]

  -- Diagnostic Colors
  cmd[[highlight DiagnosticInfo ctermfg=lightblue]]
end

return M
