-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
vim.o.pumheight = 15

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    -- ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
    -- ['<C-e>'] = cmp.mapping.close(),
    ['<C-e>'] = cmp.config.disable,
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<NL>'] = cmp.mapping.confirm({ select = false }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'buffer' },
  })
})

-- Use buffer source for `/`.
-- cmp.setup.cmdline('/', {
--   sources = {
--     { name = 'buffer' }
--   }
-- })

-- Use cmdline & path source for ':'.
-- cmp.setup.cmdline(':', {
--   sources = cmp.config.sources({
--     { name = 'path' }
--   }, {
--     { name = 'cmdline' }
--   })
-- })

-- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- require('lspconfig')[%YOUR_LSP_SERVER%].setup {
--   capabilities = capabilities
-- }
local function config(_config)
  return vim.tbl_deep_extend("force", {
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }, _config or {})
end


-- Setup Language Server Protocol
local nvim_lsp = require('lspconfig')
local configs = require'lspconfig/configs'

-- ls_emmet configs
configs.ls_emmet = {
  default_config = {
    cmd = { 'ls_emmet', '--stdio' };
    filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' };
    root_dir = function(fname)
      return vim.loop.cwd()
    end;
    settings = {};
  };
}

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
  {"ls_emmet", {}},
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
