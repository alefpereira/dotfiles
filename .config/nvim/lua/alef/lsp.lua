local lsp_ok, nvim_lsp = pcall(require, 'lspconfig')
if not lsp_ok then
   return
end

local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_ok then
   return
end

-- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- require('lspconfig')[%YOUR_LSP_SERVER%].setup {
--   capabilities = capabilities
-- }
local function config(_config)
  return vim.tbl_deep_extend("force", {
    capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }, _config or {})
end


-- Setup Language Server Protocol
local configs = require('lspconfig/configs')

-- lua sumneko language server config (Copy of ThePrimeagen)
local sumneko_root_path = vim.env.HOME .. "/Softwares/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"

local sumneko_config = {
  cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        },
      },
    },
  },
}

-- table of servers to setup {"<server-name>", <opts>}
local servers = {
  {"pyright", {}},
  {"tsserver", {}},
  {"cssls", {}},
  {"eslint", {}},
  {"jsonls", {}},
  {"html", {}},
  {"sumneko_lua", sumneko_config},
}

-- setup each server
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp[1]].setup(config(lsp[2]))
end
-- End of language server setup
