if !exists('g:loaded_cmp')
  finish
endif

set completeopt=menu,menuone,noselect

lua << EOF
  local cmp = require('cmp')

  cmp.setup {
    mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable,
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },

    sources = cmp.config.sources({
      { name = "nvim_lsp" },
    }, {
      { name = "buffer" }
    })
  }

  cmp.setup.cmdline('/', {
    completion = { 
      autocomplete = false
    },
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    completion = { 
      autocomplete = false
    },
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
EOF

