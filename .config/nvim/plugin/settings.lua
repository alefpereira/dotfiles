--[[
"" Minimal (but really valuable) settings
" Show line numbers
set number
" Enable syntax
" (enable/uncomment here can cause weird behaviour in colors as vim-plug
" also enables it)
"syntax on
" Enable filetype detection, pluins and indentation
filetype plugin indent on
" Always display the status bar
set laststatus=2
" Always show the command typed in the status line
set showcmd
" Always show cursor position
set ruler
" Highlight search results
set hlsearch
" Search as you type
set incsearch
" Display command line’s tab complete options as a menu
set wildmenu
" Set screen to scroll following cursor offset
set scrolloff=8

" Personal choices
" Set lines not to wrap
set nowrap
" Show line relative numbers instead of usual sequential numbers
set relativenumber
" show existing tab with 4 spaces width
set tabstop=4
set softtabstop=-1
" when indenting with '>', use 4 spaces width
set shiftwidth=0
" On pressing tab, insert 4 spaces
set expandtab
" Smartcase
set ignorecase
set smartcase

" More customization
" Highlight current line
set cursorline
" Highlight colums
set colorcolumn=80,100
" Hide native mode indicator
set noshowmode
" Set update time so vim updates faster
set updatetime=50
" Setup persistent undo history
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set hidden
" Hide Pattern not found message from completion
set shortmess+=c

" ====== Other settings ======
"" Leader map
" Set leader to space
let mapleader = " "

"" Let vim to highlight embeded code: Lua, Python
let g:vimsyn_embed='lP'


"" Indent Lines config
let g:indentLine_color_term = 237
let g:indentLine_char = '▏'

"" Execute macros over visual range
" visual-at from: https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

"" Virtualenv python3 provider
let g:python3_host_prog = $PYENV_ROOT . '/versions/py3nvim/bin/python'

"" Set maximizer default keymaps
"let g:maximizer_set_default_mapping = 1

"" markdown
" This interacts with Yggdroot/indentLine plugin: Disable conceal for markdown
augroup FILETYPES
  autocmd FileType markdown let b:indentLine_enabled = 0
  autocmd FileType markdown set conceallevel=0
augroup END

"" Fixed python syntax
let g:python_highlight_all = 1

"" netrw settings
let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
--]]
