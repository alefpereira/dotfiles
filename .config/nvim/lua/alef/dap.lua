local dap_ok, dap = pcall(require, 'dap')
if not dap_ok then
   return
end

local widgets = require('dap.ui.widgets')

local M = {}

-- lua debugger: one-small-step-for-vimkind
function M.nlua()
  dap.configurations.lua = {
    {
      type = 'nlua',
      request = 'attach',
      name = 'Attach to running Neovim instance',
      host = function()
        local value = vim.fn.input('Host [127.0.0.1]: ')
        if value ~= '' then
          return value
        end
        return '127.0.0.1'
      end,
      port = function()
        local val = tonumber(vim.fn.input('Port: '))
        assert(val, 'Please provide a port number')
        return val
      end,
    }
  }

  dap.adapters.nlua = function(callback, config)
    callback({ type = 'server', host = config.host, port = config.port })
  end
end

local pythonPath = vim.api.nvim_exec(
  [[python3 import sys; print(sys.executable)]],
  true
)

function M.python()
  dap.adapters.python = {
    type = 'executable';
    command = vim.fn.getenv 'PYENV_ROOT' .. '/versions/debugpy/bin/python';
    args = { '-m', 'debugpy.adapter' };
  }

  dap.configurations.python = {
    {
      -- The first three options are required by nvim-dap
      type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
      request = 'launch';
      name = "Launch file";
      program = "${file}"; -- This configuration will launch the current file if used.
      pythonPath = pythonPath;
    },
  }
end

M.scopes_sidebar = widgets.sidebar(widgets.scopes)

function M.setup()
  M.nlua()
  M.python()
end

return M
