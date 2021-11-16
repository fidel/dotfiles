local status, lualine = pcall(require, "nvim-autopairs")
 if not status then
 	return
 end

 local auto_pairs = require("nvim-autopairs")

 auto_pairs.setup({})
 auto_pairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))
 auto_pairs.add_rules(require("nvim-autopairs.rules.endwise-ruby"))

