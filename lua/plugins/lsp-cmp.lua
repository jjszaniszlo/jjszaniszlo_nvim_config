local cmp = require 'cmp'
local lspkind = require 'lspkind'

cmp.setup {
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      maxwidth = 50,
      before = function(entry, vim_item)
        return vim_item
      end,
    },
  },
  snippet = {
    expand = function(args)
      require 'luasnip'.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<Tab>']     = cmp.mapping(cmp.mapping.select_next_item()),
    ['<C-b>']     = cmp.mapping(cmp.mapping.scroll_docs( -4), { 'i', 'c' }),
    ['<C-f>']     = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>']     = cmp.config.disable,
    ['<CR>']      = cmp.mapping.confirm { select = true },
    ['<C-e>']     = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
}

-- completion for /
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' },
  },
})

-- completion for :
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
})
