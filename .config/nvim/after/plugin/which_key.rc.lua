local status, which_key = pcall(require, "which-key")
if not status then
	return
end

require("which-key").setup()
