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
