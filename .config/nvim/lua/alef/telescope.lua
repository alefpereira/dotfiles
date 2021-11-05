-- Telescope.nvim setup
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