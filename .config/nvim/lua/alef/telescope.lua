local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then
   return
end

local actions_ok, actions = pcall(require, "telescope.actions")
if not actions_ok then
   return
end

-- Telescope.nvim setup
telescope.setup{
  defaults = {
    cache_picker = {
      num_pickers = 3
    },
    mappings = {
      i = {
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

telescope.load_extension('fzf')
