local telescope_ok, telescope = pcall(require, 'telescope')
if not telescope_ok then
   return
end

local actions = require('telescope.actions')
local action_layout = require('telescope.actions.layout')
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
          ['<esc>'] = actions.close,
          ['<c-j>'] = actions.select_default,
          ['<c-s>'] = action_layout.toggle_preview,
        },
      }
    },
    pickers = {
      buffers = {
        mappings = {
          i = {
            ['<c-d>'] = actions.delete_buffer,
          },
        },
        show_all_buffers = true,
        sort_lastused = true,
        path_display = M.filename_path_display,
        theme = 'dropdown',
        previewer = false,
        layout_config = {
          anchor = 'N',
        },
      },
      find_files = {
        find_command = vim.split(M.find_command, ' '),
        path_display = M.filename_path_display,
        theme='dropdown',
        previewer = false,
        layout_config = {
          anchor = 'N',
        }
      },
      git_files = {
        path_display = M.filename_path_display,
        theme = 'dropdown',
        previewer = false,
        layout_config = {
          anchor = 'N',
        },
      },
      help_tags = {
        theme='dropdown',
        layout_config = {
          anchor = 'S',
        }
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = 'smart_case',
      },
    },
  }

  telescope.load_extension('fzf')
end

function M.project_files()
  local ok = pcall(require'telescope.builtin'.git_files)
  if not ok then require'telescope.builtin'.find_files() end
end

function M.live_grep_raw(opts)
  local defaults = {
    vimgrep_arguments = vim.split(M.vimgrep_arguments, ' '),
    path_display = M.filename_path_display,
    theme = 'dropdown',
    layout_config = {
      anchor = 'S',
    },
  }
  opts = vim.tbl_extend("force", defaults, opts or {})
  -- Apply theme
  opts = require("telescope.themes")["get_" .. opts.theme](opts)
  require("telescope").extensions.live_grep_raw.live_grep_raw(opts)
end
return M
