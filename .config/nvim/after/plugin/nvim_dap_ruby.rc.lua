local status, lualine = pcall(require, "dap-ruby")
if not status then
	return
end

require("dap-ruby").setup()

