return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
    require("rose-pine").setup({
    variant = "auto", -- auto, main, moon, or dawn
    dark_variant = "moon", -- main, moon, or dawn
    })
		vim.cmd("colorscheme rose-pine")
	end
}
