local status, nvim_web_devicons = pcall(require, "nvim-web-devicons")
if not status then
	return
end

nvim_web_devicons.setup()
