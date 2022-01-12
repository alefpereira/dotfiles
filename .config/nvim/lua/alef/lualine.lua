require'lualine'.setup{
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = { left = '', right = '︱'},
    section_separators = { left = '', right = ''},
  },
  sections = {
    -- lualine_b = {{'branch', icon=''}},
    -- lualine_b = {{'FugitiveHead', icon=''}},
    -- lualine_b = {{'b:gitsigns_head', icon=''}},
    lualine_c = {
      {
        'filename',
        file_status = true,  -- displays file status (readonly status, modified status)
        path = 1,            -- 0 = just filename, 1 = relative path, 2 = absolute path
      }
    }
  }
}
