local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local colors = require("nightfox.colors").load()

local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

require("lualine").setup({
	options = {
		theme = "nightfox",
		icons_enabled = false,
	},
	sections = {
		lualine_b = {
			{
				"diff",
				source = diff_source,
				colored = true,
				diff_color = {
					added = { fg = colors.git.add },
					modified = { fg = colors.git.change },
					removed = { fg = colors.git.delete },
				},
			},
		},
	},
	extensions = { "quickfix" },
})
