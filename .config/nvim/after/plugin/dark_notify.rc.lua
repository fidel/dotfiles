local status, dn = pcall(require, "dark_notify")

if not status then
	return
end

dn.run({
	schemes = {
		dark = "nightfox",
		light = "dayfox",
	},
})
