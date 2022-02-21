local M = {}

M.plugins = {
  -- set packer to manage itself
  'wbthomason/packer.nvim',

  -- Main functionalities
  -- fugitive.vim: A Git wrapper so awesome, it should be illegal
  {
    'tpope/vim-fugitive',
    config = function()
      require 'alef.git'
      -- fold file diffs
      vim.cmd'autocmd User FugitiveCommit set foldmethod=syntax'
    end,
  },

  -- Find, Filter, Preview, Pick. All lua, all the time.
  {
    'alefpereira/telescope.nvim', branch = 'center-layout-strategy-allow-vertical-anchor',
    config = function()
      require'alef.telescope'.setup()
    end,
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'natecraddock/telescope-zf-native.nvim' },
      { 'alefpereira/telescope-live-grep-raw.nvim', branch = 'better-configuration' },
    }
  },

  -- nvim signs (depends on plenary.nvim)
  {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  },

  -- Inject LSP diagnostics, code actions, and more via Lua
  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      local null_ls = require('null-ls')
      null_ls.setup {
        sources = {
          null_ls.builtins.diagnostics.pylint,
          null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.completion.spell,
        },
      }
    end,
    requires = { 'nvim-lua/plenary.nvim' },
  },

  -- Quickstart configurations for the Nvim LSP client
  {
    'neovim/nvim-lspconfig',
    config = function()
       require 'alef.lsp'
    end,
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
    }
  },

  -- A pretty diagnostics
  {
    'folke/trouble.nvim',
    config = function()
      require('trouble').setup {
      }
    end,
    requires = {
      { 'neovim/nvim-lspconfig' },
    }
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    config = function()
       require 'alef.cmp'
    end,
    requires = {
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  },

  -- Other related to lsp (ui references, outlines)
  --'glepnir/lspsaga.nvim'
  --'simrat39/symbols-outline.nvim'

  -- The undo history visualizer for VIM
  'mbbill/undotree',

  -- Nvim Treesitter configurations and abstraction layer
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require 'alef.treesitter'
    end
  },

  -- Show code context
  {
    'romgrk/nvim-treesitter-context',
    requires = { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
  },

  -- vimspector - A multi-language debugging system for Vim
  --'puremourning/vimspector'

  -- nvim-dap Debug
  {
    'mfussenegger/nvim-dap',
    config = function ()
      require'alef.dap'.setup()
    end,
    requires = {
      -- nvim lua debugger
      { 'jbyuki/one-small-step-for-vimkind' },
    }
  },

  -- Main code display
  -- A vim plugin to display the indention levels with thin vertical lines
  'Yggdroot/indentLine',

  -- Better trailing whitespace highlighting for Vim
  'ntpeters/vim-better-whitespace',

  -- Plugin highlighting word under cursor and all of its occurences
  'dominikduda/vim_current_word',

  -- Main interface
  -- Vim python syntax
  'vim-python/python-syntax',

  -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
  {
    'nvim-lualine/lualine.nvim',
    config = function()
       require 'alef.lualine'
    end,
  },

  -- gruvbox colorscheme
  'morhetz/gruvbox',

  -- VSCode (code) dark+ inspired colorscheme.
  {
    'tomasiser/vim-code-dark',
    config = function ()
      require('alef.colors').setup()
    end
  },

  -- Adds file type icons to Vim plugins such as: NERDTree, vim-airline, CtrlP, unite, Denite, lightline, vim-startify, etc
  'ryanoasis/vim-devicons',

  -- lua `fork` of vim-web-devicons for neovim
  'kyazdani42/nvim-web-devicons',

  -- Other functionalities
  -- Maximizes and restores the current window in Vim.
  --'szw/vim-maximizer',

  -- eunuch.vim: Helpers for UNIX
  'tpope/vim-eunuch',

  -- vinegar.vim: Combine with netrw to create a delicious salad dressing
  --'tpope/vim-vinegar',

  -- Other plugins
  -- surround.vim: quoting/parenthesizing made simple
  --'tpope/vim-surround',

  -- commentary.vim: comment stuff out
  --'tpope/vim-commentary',

  -- obsession.vim: continuously updated session files
  'tpope/vim-obsession',

  -- A simple, easy-to-use Vim alignment plugin.
  --'junegunn/vim-easy-align',

  -- EditorConfig plugin for Vim (Use for parsing .editorconfig files.)
  'editorconfig/editorconfig-vim',

  -- Show color table. Useful when playing with colorschemes and highlights
  --'guns/xterm-color-table.vim',

}

function M.setup(use)
  -- Plugins Setup
  for _, plugin in ipairs(M.plugins) do
    use(plugin)
  end
end

return M
