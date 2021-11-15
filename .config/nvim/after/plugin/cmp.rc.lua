local status, lualine = pcall(require, "gitsigns")
if not status then
	return
end

vim.o.completeopt = 'menu,menuone,noselect'

local cmp = require("cmp")

cmp.setup({
	mapping = {
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable,
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
	},

	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
	}, {
		{ name = "buffer" },
	}),
})

cmp.setup.cmdline("/", {
	completion = {
		autocomplete = false,
	},
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	completion = {
		autocomplete = false,
	},
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

