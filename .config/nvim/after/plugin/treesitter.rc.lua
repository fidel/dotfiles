local status, treesitter = pcall(require, "nvim-treesitter")
if not status then
	return
end

require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	ensure_installed = {
		"elm",
		"toml",
		"fish",
		"yaml",
		"css",
		"json",
		"lua",
		"ruby",
		"javascript",
	},
	refactor = {
		highlight_definitions = { enable = true },
		--highlight_current_scope = { enable = true },
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "grr",
			},
		},
		navigation = {
			enable = true,
			keymaps = {
				goto_definition = "gnd",
				list_definitions = "gnD",
				list_definitions_toc = "gO",
				goto_next_usage = "<a-*>",
				goto_previous_usage = "<a-#>",
			},
		},
	},
})
