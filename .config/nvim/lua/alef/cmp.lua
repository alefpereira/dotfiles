local luasnip_ok, luasnip = pcall(require, 'luasnip')
if not luasnip_ok then
   return
end

local cmp_ok, cmp = pcall(require, 'cmp')
if not cmp_ok then
   return
end

local vscode_snippets_ok, vscode_snippets = pcall(require, "luasnip.loaders.from_vscode")
if not vscode_snippets_ok then
   return
end

vscode_snippets.lazy_load()

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
vim.o.pumheight = 15

-- Setup nvim-cmp.
local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
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
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then cmp.select_next_item()
      elseif luasnip.expandable() then  luasnip.expand()
      elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
      elseif check_backspace() then fallback()
      else fallback()
      end
    end, { "i", "s"}),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then luasnip.jump(-1)
      else fallback()
      end
    end, { "i", "s"}),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
    { name = 'buffer' },
  })
})

-- Use buffer source for `/`.
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
