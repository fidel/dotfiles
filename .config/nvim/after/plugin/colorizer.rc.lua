local status, lualine = pcall(require, "colorizer")
if not status then
	return
end

require("colorizer").setup()
