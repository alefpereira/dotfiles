local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then
   return
end

local actions_ok, actions = pcall(require, "telescope.actions")
if not actions_ok then
   return
end

local find_command = 'fd --type f --hidden --exclude .git'
local vimgrep_arguments = 'rg --color=never --no-heading --hidden --with-filename --line-number --column --smart-case --glob !.git'

-- Telescope.nvim setup
telescope.setup{
  defaults = {
    cache_picker = {
      num_pickers = 3
    },
    mappings = {
      i = {
        ["<c-j>"] = actions.select_default,
      },
      n = {
        ["<c-j>"] = actions.select_default,
    	  ['<c-d>'] = actions.delete_buffer,
    	  ['<c-c>'] = actions.close,
      }
    }
  },
  pickers = {
    find_files = {
      find_command = vim.split(find_command, ' '),
      theme = 'dropdown',
    },
    live_grep = {
      vimgrep_arguments = vim.split(vimgrep_arguments, ' '),
      theme = 'dropdown',
    },
    buffers = {
      theme='dropdown',
      show_all_buffers='true',
      sort_lastused='true',
    },
    help_tags = {
      theme='dropdown',
    },
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
