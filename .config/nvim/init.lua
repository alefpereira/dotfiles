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
cmd([[
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

cmd [[packadd packer.nvim]]

-- Things that shoud be set before everything else
-- Leader map
-- Set leader to space
vim.g.mapleader = ' '

-- Virtualenv python3 provider
vim.g.python3_host_prog = vim.fn.getenv 'PYENV_ROOT' ..
  '/versions/py3nvim/bin/python'

local packer = require('packer')
local plugins = require('alef.plugins')

return packer.startup(function(use)
  plugins.setup(use)
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    packer.sync()
  end
end)
