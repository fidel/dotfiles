if !exists('g:lspconfig')
  finish
endif

lua << EOF
  local lsp_config = require('lspconfig')
  local protocol = require('vim.lsp.protocol')

  local on_attach = function(client, bufnr)
    if client.config.flags then
      client.config.flags.allow_incremental_sync = true
    end

    if client.resolved_capabilities.document_formatting then
      vim.api.nvim_command [[augroup Format]]
      vim.api.nvim_command [[autocmd! * <buffer>]]
      vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
      vim.api.nvim_command [[augroup END]]
    end

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    local opts = { noremap = true, silent = true }

    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gr', '<Cmd>lua require("telescope.builtin").lsp_references()<CR>', opts)
    buf_set_keymap('n', "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap('n', "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap('n', "gw", "<Cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
    buf_set_keymap('n', "gW", "<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)
    buf_set_keymap('n', "gt", "<Cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap('n', "K",  "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap('n', "<c-k>",      "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap('n', "<leader>af", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_set_keymap('n', "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap('n', '<leader>so', [[<Cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  end

  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

  local null_ls = require("null-ls")

  null_ls.config({
    sources = {
    	null_ls.builtins.code_actions.gitsigns,
    	null_ls.builtins.formatting.stylua,
    	null_ls.builtins.formatting.prettier.with({
    		filetypes = { "ruby", require("plenary").tbl.unpack(null_ls.builtins.formatting.prettier.filetypes) }
      }),
      null_ls.builtins.formatting.fish_indent,
    },
  })

  local servers = { "null-ls", "solargraph", "elmls" }
  for _, lsp in ipairs(servers) do
    lsp_config[lsp].setup({
    	on_attach = on_attach,
    	capabilities = capabilities,
    })
  end

  lsp_config.solargraph.setup({
  	on_attach = on_attach,
  	capabilities = capabilities,
  	settings = {
  		solargraph = {
  			formatting = false,
  		},
  	},
  })
EOF

