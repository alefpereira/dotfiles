require("alef.telescope")
require("alef.lsp")
require("alef.treesitter")
require("alef.git")


require'lualine'.setup{
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = { left = '', right = '|'},
    section_separators = { left = '', right = ''},
  },
  sections = {
    lualine_c = {
      {
        'filename',
        file_status = true,  -- displays file status (readonly status, modified status)
        path = 1,            -- 0 = just filename, 1 = relative path, 2 = absolute path
      }
    }
}
}
