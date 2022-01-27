local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then
   return
end

local actions = require("telescope.actions")
local utils = require('telescope.utils')

local M = {}

M.find_command = 'fd --type file --type symlink --hidden --exclude .git'
M.vimgrep_arguments = 'rg --color=never --no-heading --hidden --with-filename --line-number --column --smart-case --glob !.git'

function M.filename_path_display(opts, path)
  local filename = utils.path_tail(path)

  local os_sep = utils.get_separator()
  local dirname = path:gsub(os_sep .. filename, ' ')

  return string.format('%s ● %s', filename, dirname)
end

function M.setup()
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
        find_command = vim.split(M.find_command, ' '),
        theme = 'dropdown',
        path_display = M.filename_path_display,
      },
      live_grep = {
        vimgrep_arguments = vim.split(M.vimgrep_arguments, ' '),
        theme = 'dropdown',
        path_display = M.filename_path_display,
      },
      buffers = {
        theme = 'dropdown',
        show_all_buffers = true,
        sort_lastused = true,
        path_display = M.filename_path_display,
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
end

return M
