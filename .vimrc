set number
set relativenumber
syntax on
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" Always display the status bar
set laststatus=2
" Always show cursor position
set ruler
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

" Install vim-plug if not found (neovim specifc)
if has('nvim')
    if empty(glob(stdpath('data'). 'site/autoload/plug.vim'))
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

" fugitive.vim: A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'

" A Vim plugin which shows a git diff in the sign column. It shows which lines have been added, modified, or removed.
Plug 'airblade/vim-gitgutter'

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'

" Vim plugin for intensely nerdy commenting powers
Plug 'scrooloose/nerdcommenter'

" A collection of themes for vim-airline
Plug 'vim-airline/vim-airline-themes'

" fzf :heart: vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" A Vim plugin for visually displaying indent levels in code
Plug 'nathanaelkane/vim-indent-guides'

" one colorscheme pack to rule them all!
Plug 'flazz/vim-colorschemes'

" A simple, easy-to-use Vim alignment plugin.
Plug 'junegunn/vim-easy-align'

" Markdown Vim Mode
Plug 'plasticboy/vim-markdown'

" Better trailing whitespace highlighting for Vim
Plug 'ntpeters/vim-better-whitespace'

" commentary.vim: comment stuff out Tim Pope
Plug 'tpope/vim-commentary'

" obsession.vim: continuously updated session files
Plug 'tpope/vim-obsession'

" surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" sensible.vim: Defaults everyone can agree on
Plug 'tpope/vim-sensible'

" eunuch.vim: Helpers for UNIX
Plug 'tpope/vim-eunuch'

call plug#end()
"" End of vim-plug manager setup

" Terminal Color Scheme
colorscheme wombat256mod

"" Keymaps
" Esc Remaps
inoremap jk <Esc>
" Backup remap for <C-[>. My keyboard layout is pt-BR,
" so <C-`> in pt-br is same as <C-[> in en-us
inoremap <C-`> <Esc>
vnoremap <C-`> <Esc>

" Ctrl Backspace remap to delete word backward
inoremap <C-BS> <C-W>
" Workaround to ctrl backspace delete word backward to work
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" Ctrl-J to brake line in Normal Mode
nnoremap <NL> i<CR><ESC>

" Move line(s) Alt-J (down) and Alt-K (up)
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
" inoremap <A-j> <Esc>:m .+1<CR>==gi
" inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" FZF Fuzzy ctrlP setup
nnoremap <C-P> :Files<CR>
" nnoremap <C-P> :FZF<CR>

"" airline/powerline settings
" fix font symbols
let g:airline_powerline_fonts = 1

"" gitgutter configs
" let g:gitgutter_set_sign_backgrounds = 1
highlight! link SignColumn LineNr
" highlight SignColumn guibg=NONE ctermbg=NONE
highlight GitGutterAdd    guifg=green ctermfg=2 ctermbg=2
highlight GitGutterChange guifg=blue ctermfg=4 ctermbg=4
highlight GitGutterDelete guifg=red ctermfg=9 ctermbg=9
" let g:gitgutter_highlight_linenrs = 1
" highlight GitGutterAddLineNr ctermfg=10 ctermbg=232
" highlight GitGutterChangeLineNr ctermfg=4 ctermbg=232
" highlight GitGutterDeleteLineNr ctermfg=9 ctermbg=232

" visual-at from: https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

