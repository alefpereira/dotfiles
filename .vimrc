"" Minimal (but really valuable) settings
" Show line numbers
set number
" Enable syntax
syntax on
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

"" Personal choices
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

"" Plugins
" Install vim-plug if not found (vim specifc)
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

"" vim-plug manager setup
call plug#begin('~/.vim/plugged')

" fugitive.vim: A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" fzf :heart: vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()
"" End of vim-plug manager setup

" Set leader to space
let mapleader = " "

"" Vim Fugitive (vim-fugitive)
nnoremap <leader>g :vert Git<CR>
