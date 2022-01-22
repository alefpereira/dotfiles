-- Telescope.nvim setup
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    cache_picker = {
      num_pickers = 3
    },
    mappings = {
      i = {
        ["<c-w>"] = "which_key",
        ["<c-j>"] = actions.select_default,
    	  ['<c-d>'] = actions.delete_buffer,
      },
      n = {
        ["<c-j>"] = actions.select_default,
    	  ['<c-d>'] = actions.delete_buffer,
    	  ['<c-c>'] = actions.close,
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
}

require('telescope').load_extension('fzf')
