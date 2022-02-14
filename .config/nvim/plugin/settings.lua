local set = vim.opt
local cmd = vim.cmd

-- Minimal (but really valuable) settings
-- Show line numbers
set.number = true
-- Enable filetype detection, pluins and indentation
cmd('filetype plugin indent on')
-- Always display the status bar
set.laststatus = 2
-- Always show the command typed in the status line
set.showcmd = true
-- Always show cursor position
set.ruler = true
-- Highlight search results
set.hlsearch = true
-- Search as you type
set.incsearch = true
-- Display command line’s tab complete options as a menu
set.wildmenu = true
-- Set screen to scroll following cursor offset
set.scrolloff = 8

-- Personal choices
-- Set lines not to wrap
set.wrap = false
-- Show line relative numbers instead of usual sequential numbers
set.relativenumber = true
-- show existing tab with 4 spaces width
set.tabstop = 4
set.softtabstop = -1
-- when indenting with '>', use 4 spaces width
set.shiftwidth = 0
-- On pressing tab, insert 4 spaces
set.expandtab = true
-- Smartcase
set.ignorecase = true
set.smartcase = true

-- More customization
-- Highlight current line
set.cursorline = true
-- Highlight colums
set.colorcolumn = { 80, 100 }
-- Hide native mode indicator
set.showmode = false
-- Set update time so vim updates faster
set.updatetime = 50
-- Setup persistent undo history
set.swapfile = false
set.backup = false
set.undodir = vim.fn.getenv 'HOME' .. '/.vim/undodir'
set.undofile = true
set.hidden = true
-- Hide Pattern not found message from completion
set.shortmess = vim.o.shortmess .. 'c'

-- ====== Other settings ======
-- Let vim to highlight embeded code: Lua, Python
vim.g.vimsyn_embed='lP'

-- Indent Lines config
vim.g.indentLine_color_term = 237
vim.g.indentLine_char = '▏'
-- Fix conceal for json and markdown files
-- since i'm using default vim syntax (not using any plugin), these vars
-- disable conceal for their specific file type but keeps showing indentLines
-- (i.e. JSON). See vim files:
--   runtime/syntax/json.vim
--   runtime/syntax/markdown.vim
vim.g.vim_json_conceal=0
vim.g.markdown_syntax_conceal=0

-- Fixed python syntax
vim.g.python_highlight_all = 1

-- netrw settings
vim.g.netrw_banner = 0
--vim.g.netrw_liststyle = 3
--vim.g.netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

-- Execute macros over visual range
-- visual-at from:
--    https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
vim.api.nvim_exec([[
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
]], false)

-- dap breakpoint sign
vim.fn.sign_define('DapBreakpoint', {
  text='⏺',
  texthl='DapBreakpointSign', -- highlight group; see colors
  linehl='',
  numhl=''})
