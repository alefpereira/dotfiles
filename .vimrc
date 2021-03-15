set number
set relativenumber
syntax on
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
set softtabstop=-1
" when indenting with '>', use 4 spaces width
set shiftwidth=0
" On pressing tab, insert 4 spaces
set expandtab
" Always display the status bar
set laststatus=2
" Always show cursor position
set ruler
" Highlight current line
set cursorline
" Highlight colums
set colorcolumn=80,100
" Display command line’s tab complete options as a menu
set wildmenu
" Always show the command in the status line
set showcmd
" Highlight search results
set hlsearch
" Search as you type
set incsearch
" Set update time so gitgutter updates faster
set updatetime=100
" Set screen to scroll following cursor offset
set scrolloff=8
" Setup persistent undo history
set noswapfile
set nobackup
set undodir=~/.undodir
set undofile
set hidden
" Set lines not to wrap
set nowrap
" Set leader to space
let mapleader = " "

" Install vim-plug if not found (neovim specifc)
if has('nvim')
    if empty(glob(stdpath('data'). '/site/autoload/plug.vim'))
      silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif
else
" Install vim-plug if not found (vim specifc)
    if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

"" vim-plug manager setup
if has('nvim')
    call plug#begin(stdpath('data') . '/plugged')
else
    call plug#begin('~/.vim/plugged')
endif

"" Main functionalities
" Find, Filter, Preview, Pick. All lua, all the time.
if has('nvim-0.0.5')
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
endif

" Quickstart configurations for the Nvim LSP client
if has('nvim-0.0.5')
    Plug 'neovim/nvim-lspconfig'
endif

" fzf :heart: vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Nodejs extension host for vim & neovim, load extensions like VSCode and host language servers.
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" A tree explorer plugin for vim.
Plug 'preservim/nerdtree'

" The undo history visualizer for VIM
Plug 'mbbill/undotree'

" Jump to any definition and references IDE madness without overhead
Plug 'pechorin/any-jump.vim'

"" Main code display
" A Vim plugin for visually displaying indent levels in code
Plug 'nathanaelkane/vim-indent-guides'

" Better trailing whitespace highlighting for Vim
Plug 'ntpeters/vim-better-whitespace'

" Plugin highlighting word under cursor and all of its occurences
Plug 'dominikduda/vim_current_word'

"" Main interface
" A Vim plugin which shows a git diff in the sign column. It shows which lines have been added, modified, or removed.
Plug 'airblade/vim-gitgutter'

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'

" A collection of themes for vim-airline
Plug 'vim-airline/vim-airline-themes'

" one colorscheme pack to rule them all!
Plug 'flazz/vim-colorschemes'

" Adds file type icons to Vim plugins such as: NERDTree, vim-airline, CtrlP, unite, Denite, lightline, vim-startify, etc
Plug 'ryanoasis/vim-devicons'

"" Other functionalities
" fugitive.vim: A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" A git commit browser in Vim
Plug 'junegunn/gv.vim'

" eunuch.vim: Helpers for UNIX
Plug 'tpope/vim-eunuch'

"" Other plugins
" surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" commentary.vim: comment stuff out
Plug 'tpope/vim-commentary'

" obsession.vim: continuously updated session files
Plug 'tpope/vim-obsession'

" Markdown Vim Mode
Plug 'plasticboy/vim-markdown'

" A simple, easy-to-use Vim alignment plugin.
Plug 'junegunn/vim-easy-align'

call plug#end()
"" End of vim-plug manager setup

"" Colors
" Terminal Color Scheme
colorscheme wombat256mod
" Column lines color
highlight ColorColumn ctermbg=238

" CursorLineLn white foreground and grey background
highlight CursorLineNr ctermbg=236 ctermfg=248

"" Keymaps
" Esc Remaps
inoremap jk <Esc>

" Ctrl-J to brake line in Normal Mode
nnoremap <NL> i<CR><ESC>

" FZF Fuzzy ctrlP setup
nnoremap <C-P> :Files<CR>
" nnoremap <C-P> :FZF<CR>

" Map ç to behave like : (commands). Improve abnt2 keyboard usability for vim.
nnoremap ç :
xnoremap ç :
nnoremap <A-ç> :
inoremap <A-ç> <Esc>:

" Esc to clear search highlights
nnoremap <Esc> :noh<Esc>

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

" Delete to blackhole
nnoremap <leader>d "_d
xnoremap <leader>d "_d

" Window navigation management
nnoremap <leader>q <c-w>q
nnoremap <leader>h <c-w>h
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>l <c-w>l

" Undotree
nnoremap <leader>u :UndotreeToggle<CR>:UndotreeFocus<CR>

" NERDTree
nnoremap <silent> <leader>e :NERDTreeToggle<CR>

"" fzf.vim
nnoremap <leader>g :Git<CR>
nnoremap <silent> <leader>b :Bu<CR>
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \ "rg --column --line-number --hidden --glob '!.git' --no-heading --color=always --smart-case ".shellescape(<q-args>), 1,
  \ fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
nnoremap <silent> <leader>f :Rg<CR>

"" coc.nvim keymaps
nmap <F2> <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" AnyJump keymaps
nnoremap <leader>i :AnyJump<CR>

"" End of Keymaps

"" Indent Guides config
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
hi IndentGuidesEven ctermbg=235
hi IndentGuidesOdd ctermbg=235

"" airline/powerline settings
" fix font symbols
let g:airline_powerline_fonts = 1

"" gitgutter configs
highlight! link SignColumn LineNr
highlight GitGutterAdd    guifg=green ctermfg=2 ctermbg=2
highlight GitGutterChange guifg=blue ctermfg=4 ctermbg=4
highlight GitGutterDelete guifg=red ctermfg=9 ctermbg=9

" visual-at from: https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

"" NERDTree
" NerdTree always shows hidden files
let NERDTreeShowHidden=1

"" Virtualenv python3 provider
let g:python3_host_prog = '/home/alef/.pyenv/versions/py3nvim/bin/python'
