local status, lsp_config = pcall(require, "lspconfig")
if not status then
	return
end

local protocol = require("vim.lsp.protocol")

local on_attach = function(client, bufnr)
	if client.config.flags then
		client.config.flags.allow_incremental_sync = true
	end

	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_command([[augroup Format]])
		vim.api.nvim_command([[autocmd! * <buffer>]])
		vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
		vim.api.nvim_command([[augroup END]])
	end

	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	local opts = { noremap = true, silent = true }

	buf_set_keymap("n", "gr", '<Cmd>lua require("telescope.builtin").lsp_references()<CR>', opts)
	buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "gw", "<Cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
	buf_set_keymap("n", "gW", "<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)
	buf_set_keymap("n", "gt", "<Cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<leader>so", "<Cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", opts)
	buf_set_keymap("n", "<leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("v", "<leader>ca", "<Cmd>lua vim.lsp.buf.range_code_action()<CR>", opts)
	buf_set_keymap("n", "[d", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", "<Cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<leader>q", "<Cmd>lua vim.diagnostic.set_qflist()<CR>", opts)
end

vim.diagnostic.open_float()
-- vim.diagnostic.config({
-- 	virtual_text = false,
-- 	signs = true,
-- 	underline = true,
-- 	update_on_insert = false,
-- })
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
	signs = true,
	underline = true,
	update_on_insert = false,
})

lsp_config.solargraph.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
		on_attach(client, bufnr)
	end,
	capabilities = capabilities,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local null_ls = require("null-ls")
local tbl = require("plenary").tbl

null_ls.setup({
	sources = {
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier.with({
			filetypes = { "ruby", tbl.unpack(null_ls.builtins.formatting.prettier.filetypes) },
		}),
		null_ls.builtins.formatting.fish_indent,
	},
	on_attach = on_attach,
	capabilities = capabilities,
})
