" Load config from ~/.vimrc
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

" Set leader to space
let mapleader = " "
"" Let vim to highlight embeded code: Lua, Python
let g:vimsyn_embed='lP'

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
" fugitive.vim: A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

if has('nvim-0.0.5')
    " Find, Filter, Preview, Pick. All lua, all the time.
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
else
    " fzf :heart: vim
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
endif

" Quickstart configurations for the Nvim LSP client
if has('nvim-0.0.5')
    Plug 'neovim/nvim-lspconfig'
endif

" Auto completion plugin for nvim written in Lua
if has('nvim-0.0.5')
    Plug 'hrsh7th/nvim-compe'
endif

" The undo history visualizer for VIM
Plug 'mbbill/undotree'

" A tree explorer plugin for vim.
" Plug 'preservim/nerdtree'

" vimspector - A multi-language debugging system for Vim
" Plug 'puremourning/vimspector'

"" Main code display
" A vim plugin to display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'

" Better trailing whitespace highlighting for Vim
Plug 'ntpeters/vim-better-whitespace'

" Plugin highlighting word under cursor and all of its occurences
Plug 'dominikduda/vim_current_word'

"" Main interface
" Vim python syntax
Plug 'vim-python/python-syntax'

" A Vim plugin which shows a git diff in the sign column. It shows which lines have been added, modified, or removed.
Plug 'airblade/vim-gitgutter'

" lean & mean status/tabline for vim that's light as air
" Plug 'vim-airline/vim-airline'

" A collection of themes for vim-airline
" Plug 'vim-airline/vim-airline-themes'

" gruvbox colorscheme
Plug 'morhetz/gruvbox'

" VSCode (code) dark+ inspired colorscheme.
Plug 'tomasiser/vim-code-dark'

" onehalf colorscheme
Plug 'sonph/onehalf', {'rtp': 'vim/'}

" Adds file type icons to Vim plugins such as: NERDTree, vim-airline, CtrlP, unite, Denite, lightline, vim-startify, etc
" Plug 'ryanoasis/vim-devicons'

"" Other functionalities
" Maximizes and restores the current window in Vim.
" Plug 'szw/vim-maximizer'

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
" Plug 'plasticboy/vim-markdown'

" A simple, easy-to-use Vim alignment plugin.
" Plug 'junegunn/vim-easy-align'

call plug#end()
"" End of vim-plug manager setup

"" Colors
" Terminal Color Scheme
colorscheme gruvbox

" Column lines color
highlight ColorColumn ctermbg=238

" CursorLineLn white foreground and grey background
highlight CursorLineNr ctermbg=236 ctermfg=248

"" Keymaps
" Esc Remaps
" inoremap jk <Esc>

" Ctrl-P and Ctrl-N to behave like arrow (partial search in command mode)
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Ctrl-J to brake line in Normal Mode
nnoremap <NL> i<CR><ESC>

" Map ç to behave like : (commands). Improve abnt2 keyboard usability for vim.
nnoremap ç :
xnoremap ç :
nnoremap <A-ç> :
inoremap <A-ç> <Esc>:

" Esc to clear search highlights
nnoremap <Esc> :noh<Esc>

" Y to behave like C and D
nnoremap Y y$

" Auto close matching ([{<'"
inoremap <silent> ( ()<Esc>i
inoremap <silent> [ []<Esc>i
inoremap <silent> { {}<Esc>i
inoremap <silent> " ""<Esc>i
inoremap <silent> ' ''<Esc>i
inoremap <silent> < <><Esc>i
inoremap <silent> <C-e> <Esc>/[)}"'\]>]<CR>:nohl<CR>a

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
nnoremap <leader>q <c-w>q
nnoremap <leader>h <c-w>h
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>l <c-w>l

if has('nvim-0.0.5')
    "" Telescope (telescope.nvim)
    nnoremap <C-P> <cmd>Telescope find_files
        \ find_command=fd,--type,f,--hidden,--exclude,.git<cr>
    nnoremap <silent> <leader>b <cmd>Telescope buffers
        \ show_all_buffers='true'<CR>
    nnoremap <leader>f <cmd>lua require('telescope.builtin').live_grep
        \ {vimgrep_arguments={
        \   'rg',
        \   '--color=never',
        \   '--no-heading',
        \   '--hidden',
        \   '--with-filename',
        \   '--line-number',
        \   '--column',
        \   '--smart-case',
        \   '--glob',
        \   '!.git'
        \ }}<cr>
else
    "" fzf.vim
    nnoremap <C-P> :Files<CR>
    nnoremap <silent> <leader>b :Bu<CR>
    command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \ "rg --column --line-number --hidden --glob '!.git' --no-heading --color=always --smart-case ".shellescape(<q-args>), 1,
      \ fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
    nnoremap <silent> <leader>f :Rg<CR>
endif

"" Vim Fugitive (vim-fugitive)
nnoremap <leader>g :vert Git<CR>

" Undotree
nnoremap <leader>u :UndotreeToggle<CR>:UndotreeFocus<CR>

" NERDTree
" nnoremap <silent> <leader>e :NERDTreeToggle<CR>

" <cr> and <c-j> to behave like <c-y> in completion list
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <nl> pumvisible() ? "\<C-y>" : "\<C-g>u\<NL>"

"" End of Keymaps

"" Indent Lines config
let g:indentLine_color_term = 237
let g:indentLine_char = '│'

"" airline/powerline settings
" airline theme
" let g:airline_theme='onedark'
" fix font symbols
" let g:airline_powerline_fonts = 1

"" gitgutter configs
let g:gitgutter_map_keys = 0
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
" let NERDTreeShowHidden=1

"" Virtualenv python3 provider
if has('nvim')
    let g:python3_host_prog = $PYENV_ROOT . '/versions/py3nvim/bin/python'
endif

"" Set maximizer default keymaps
let g:maximizer_set_default_mapping = 1

"" vim-markdown
" Disable auto folding
let g:vim_markdown_folding_disabled = 1
" Disable conceal
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

"" Fixed python syntax
let g:python_highlight_all = 1

if has('nvim-0.0.5')
" Setup Pyright
lua << EOF
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("v", "<space>F", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=238 guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=238 guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=238 guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- Setup language servers
local servers = {
    "pyright",
    "tsserver",
}

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup{ on_attach = on_attach }
end
-- End of language server setup

-- nvim-compe setup
vim.o.completeopt = "menuone,noselect"
vim.o.pumheight = 15

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
  };
}

local actions = require('telescope.actions')
require('telescope').setup{
    defaults = {
        mappings = {
            i = {
                ["<C-j>"]= actions.select_default,
            },
            n = {
                ["<C-j>"]= actions.select_default,
            }
        }
    }
}
EOF
endif
