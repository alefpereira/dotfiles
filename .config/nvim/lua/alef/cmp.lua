local luasnip_ok, luasnip = pcall(require, 'luasnip')
if not luasnip_ok then
   return
end

local cmp_ok, cmp = pcall(require, 'cmp')
if not cmp_ok then
   return
end

local vscode_snippets_ok, vscode_snippets = pcall(require, 'luasnip.loaders.from_vscode')
if not vscode_snippets_ok then
   return
end

vscode_snippets.lazy_load()

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,noinsert,noselect'
vim.o.pumheight = 15

-- Setup nvim-cmp.
local check_backspace = function()
  local col = vim.fn.col '.' - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s'
end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local function handle_tab(fallback)
  if cmp.visible() then cmp.select_next_item()
  elseif luasnip.expandable() then  luasnip.expand()
  elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
  elseif check_backspace() then fallback()
  else return false
  end
  return true
end

local function handle_tab_command(fallback)
  if not handle_tab(fallback) then
    cmp.complete()
  end
end

local function handle_tab_insert(fallback)
  if not handle_tab(fallback) then
    fallback()
  end
end

local tab_or_next = function(_)
  if cmp.visible() then
    cmp.select_next_item()
  else
    cmp.complete()
  end
end

local tab_or_prev = function(_)
  if cmp.visible() then
    cmp.select_prev_item()
  else
    cmp.complete()
  end
end

local super_tab = function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  elseif luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  elseif has_words_before() then
    cmp.complete()
  else
    fallback()
  end
end

local super_tab_shift = function(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  elseif luasnip.jumpable(-1) then
    luasnip.jump(-1)
  else
    fallback()
  end
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
    ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i' }),
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i' }),
    -- ['<C-e>'] = cmp.mapping.close(),
    -- ['<C-e>'] = cmp.config.disable,
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<NL>'] = cmp.mapping.confirm({ select = false }),
    ["<Tab>"] = cmp.mapping({
      i = super_tab,
      s = super_tab,
      c = tab_or_next,
    }),
    ["<S-Tab>"] = cmp.mapping({
      i = super_tab_shift,
      s = super_tab_shift,
      c = tab_or_prev
    }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'buffer' },
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
