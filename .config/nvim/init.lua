local cmd = vim.cmd
local fn = vim.fn

-- packer.nvim
-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap = nil
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
		'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
		install_path
	})
end
-- Auto compile when there are changes in plugins.lua
cmd 'autocmd BufWritePost init.lua PackerCompile'

cmd [[packadd packer.nvim]]

-- Leader map
-- Set leader to space
vim.g.mapleader = ' '

-- require("alef.telescope")
local packer = require('packer')
return packer.startup(function(use)
  -- set packer to manage itself
  use 'wbthomason/packer.nvim'

  -- Main functionalities
  -- fugitive.vim: A Git wrapper so awesome, it should be illegal
  use {
    'tpope/vim-fugitive',
    config = function()
       require "alef.git"
    end,
  }

  -- Find, Filter, Preview, Pick. All lua, all the time.
  use {
    'nvim-telescope/telescope.nvim',
    --config = function()
    --   require "alef.telescope"
    --end,
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    }
  }

  -- nvim signs (depends on plenary.nvim)
  use 'lewis6991/gitsigns.nvim'

  -- Quickstart configurations for the Nvim LSP client
  use {
    'neovim/nvim-lspconfig',
    config = function()
       require "alef.lsp"
    end,
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
    }
  }

  -- Autocompletion
  use {
    'hrsh7th/nvim-cmp',
    config = function()
       require "alef.cmp"
    end,
    requires = {
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'rafamadriz/friendly-snippets' }
    }
  }

  -- Other related to lsp (ui references, outlines)
  --use 'glepnir/lspsaga.nvim'
  --use 'simrat39/symbols-outline.nvim'

  -- The undo history visualizer for VIM
  use 'mbbill/undotree'

  -- Nvim Treesitter configurations and abstraction layer
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require "alef.treesitter"
    end
  }

  -- Show code context
  use {
    'romgrk/nvim-treesitter-context',
    requires = { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  }

  -- vimspector - A multi-language debugging system for Vim
  --use 'puremourning/vimspector'

  -- Main code display
  -- A vim plugin to display the indention levels with thin vertical lines
  use 'Yggdroot/indentLine'

  -- Better trailing whitespace highlighting for Vim
  use 'ntpeters/vim-better-whitespace'

  -- Plugin highlighting word under cursor and all of its occurences
  use 'dominikduda/vim_current_word'

  -- Main interface
  -- Vim python syntax
  use 'vim-python/python-syntax'

  -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
       require "alef.lualine"
    end,
  }

  -- gruvbox colorscheme
  use 'morhetz/gruvbox'

  -- VSCode (code) dark+ inspired colorscheme.
  use {
    'tomasiser/vim-code-dark',
    config = function ()
      require('alef.colors').setup()
    end
  }

  -- Adds file type icons to Vim plugins such as: NERDTree, vim-airline, CtrlP, unite, Denite, lightline, vim-startify, etc
  use 'ryanoasis/vim-devicons'

  -- lua `fork` of vim-web-devicons for neovim
  use 'kyazdani42/nvim-web-devicons'

  -- Other functionalities
  -- Maximizes and restores the current window in Vim.
  --use 'szw/vim-maximizer'

  -- eunuch.vim: Helpers for UNIX
  use 'tpope/vim-eunuch'

  -- vinegar.vim: Combine with netrw to create a delicious salad dressing
  --use 'tpope/vim-vinegar'

  -- Other plugins
  -- surround.vim: quoting/parenthesizing made simple
  --use 'tpope/vim-surround'

  -- commentary.vim: comment stuff out
  --use 'tpope/vim-commentary'

  -- obsession.vim: continuously updated session files
  use 'tpope/vim-obsession'

  -- A simple, easy-to-use Vim alignment plugin.
  --use 'junegunn/vim-easy-align'

  -- EditorConfig plugin for Vim (Use for parsing .editorconfig files.)
  use 'editorconfig/editorconfig-vim'

  -- Show color table. Useful when playing with colorschemes and highlights
  --use 'guns/xterm-color-table.vim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    packer.sync()
  end
end)
