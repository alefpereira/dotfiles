" Load config from ~/.vimrc
"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath=&runtimepath
"source ~/.vimrc

" ====== vim-plug manager setup ======
" Install vim-plug if not found (neovim specifc)
if empty(glob(stdpath('data'). '/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

"" vim-plug manager setup
call plug#begin(stdpath('data') . '/plugged')

"" Main functionalities
" fugitive.vim: A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" Find, Filter, Preview, Pick. All lua, all the time.
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" nvim signs (depends on plenary.nvim)
Plug 'lewis6991/gitsigns.nvim'

" Quickstart configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'

" Autocompletion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
"Plug 'hrsh7th/cmp-path'
"Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'

" Other related to lsp (ui references, outlines)
"Plug 'glepnir/lspsaga.nvim'
"Plug 'simrat39/symbols-outline.nvim'

" The undo history visualizer for VIM
Plug 'mbbill/undotree'

" Nvim Treesitter configurations and abstraction layer
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Show code context
Plug 'romgrk/nvim-treesitter-context'

" A tree explorer plugin for vim.
"Plug 'preservim/nerdtree'

" vimspector - A multi-language debugging system for Vim
"Plug 'puremourning/vimspector'

"" Main code display
" A vim plugin to display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'

" Better trailing whitespace highlighting for Vim
Plug 'ntpeters/vim-better-whitespace'

" Plugin highlighting word under cursor and all of its occurences
Plug 'dominikduda/vim_current_word'

" Treesitter module to rainbow parenthesis
Plug 'p00f/nvim-ts-rainbow'

"" Main interface
" Vim python syntax
Plug 'vim-python/python-syntax'

" A blazing fast and easy to configure neovim statusline plugin written in pure lua.
Plug 'nvim-lualine/lualine.nvim'

" gruvbox colorscheme
Plug 'morhetz/gruvbox'

" VSCode (code) dark+ inspired colorscheme.
Plug 'tomasiser/vim-code-dark'

" onehalf colorscheme
Plug 'sonph/onehalf', {'rtp': 'vim/'}

" Adds file type icons to Vim plugins such as: NERDTree, vim-airline, CtrlP, unite, Denite, lightline, vim-startify, etc
Plug 'ryanoasis/vim-devicons'

" lua `fork` of vim-web-devicons for neovim
Plug 'kyazdani42/nvim-web-devicons'

"" Other functionalities
" Maximizes and restores the current window in Vim.
"Plug 'szw/vim-maximizer'

" eunuch.vim: Helpers for UNIX
Plug 'tpope/vim-eunuch'

"" Other plugins
" surround.vim: quoting/parenthesizing made simple
"Plug 'tpope/vim-surround'

" commentary.vim: comment stuff out
"Plug 'tpope/vim-commentary'

" obsession.vim: continuously updated session files
Plug 'tpope/vim-obsession'

" Markdown Vim Mode
"Plug 'plasticboy/vim-markdown'

" A simple, easy-to-use Vim alignment plugin.
" Plug 'junegunn/vim-easy-align'

" EditorConfig plugin for Vim (Use for parsing .editorconfig files.)
Plug 'editorconfig/editorconfig-vim'

call plug#end()
" ====== End of vim-plug manager setup ======

" ====== Other settings ======
"" Leader map
" Set leader to space
let mapleader = " "

"" Let vim to highlight embeded code: Lua, Python
let g:vimsyn_embed='lP'

" ====== Keymaps ======
" Esc Remaps
" inoremap jk <Esc>

" Ctrl-P and Ctrl-N to behave like arrow (partial search in command mode)
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Ctrl-J to brake line in Normal Mode
nnoremap <NL> i<CR><ESC>

"" Possible abnt2 keyboard usability improvements for vim.
" Map ç to behave like ":" (colon) to enter command mode.
"nnoremap ç :
"xnoremap ç :
"nnoremap <A-ç> :
"inoremap <A-ç> <Esc>:

" Esc to clear search highlights
nnoremap <Esc> :noh<Esc>

" Y to behave like C and D
nnoremap Y y$
" Auto close matching ([{<'"`
"inoremap <silent> ( ()<Esc>i
"inoremap <silent> [ []<Esc>i
"inoremap <silent> { {}<Esc>i
"inoremap <silent> " ""<Esc>i
"inoremap <silent> ' ''<Esc>i
"inoremap <silent> < <><Esc>i
"inoremap <silent> ` ``<Esc>i
"inoremap <silent> <C-e> <Esc>/[)}"'\]>]`<CR>:nohl<CR>a

"" Lots of great mapings. Thanks to ThePrimeagen for the inspiration
" Prevent paste to replace register in visual mode
xnoremap p "_dP

" Select all text
nnoremap <leader>a ggVG
xnoremap <leader>a <Esc>ggVG

" Copy to system clipboard using leader key. Y to copy all file.
nnoremap <leader>y "+y
xnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" Paste from system clipboard with leader key.
nnoremap <leader>p "+p
xnoremap <leader>p "+p
nnoremap <leader>P "+P
xnoremap <leader>P "+P

" Delete to blackhole
nnoremap <leader>d "_d
xnoremap <leader>d "_d

" Window navigation management
"nnoremap <leader>q <c-w>q
"nnoremap <leader>h <c-w>h
"nnoremap <leader>j <c-w>j
"nnoremap <leader>k <c-w>k
"nnoremap <leader>l <c-w>l

"" Vim Fugitive (vim-fugitive)
nnoremap <leader>g :G<CR>

" Undotree
nnoremap <leader>u :UndotreeToggle<CR>:UndotreeFocus<CR>

" NERDTree
"nnoremap <silent> <leader>e :NERDTreeToggle<CR>

" <cr> and <c-j> to behave like <c-y> in completion list
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <nl> pumvisible() ? "\<C-y>" : "\<C-g>u\<NL>"

" ====== End of Keymaps ======

"" Indent Lines config
let g:indentLine_color_term = 237
let g:indentLine_char = '│'

"" Execute macros over visual range
" visual-at from: https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

"" NERDTree
" NerdTree always shows hidden files
"let NERDTreeShowHidden=1

"" Virtualenv python3 provider
let g:python3_host_prog = $PYENV_ROOT . '/versions/py3nvim/bin/python'

"" Set maximizer default keymaps
"let g:maximizer_set_default_mapping = 1

"" vim-markdown
" Disable auto folding
"let g:vim_markdown_folding_disabled = 1
" Disable conceal
"let g:vim_markdown_conceal = 0
"let g:vim_markdown_conceal_code_blocks = 0

"" Fixed python syntax
let g:python_highlight_all = 1

" ====== Lua settings ======
lua require('alef')
" ====== End of Lua settings ======
