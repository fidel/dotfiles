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
})
