local status, telescope = pcall(require, "telescope")
if not status then
	return
end

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>p", "<Cmd>lua project_files()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>e", "<Cmd>Telescope oldfiles<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fg", "<Cmd>Telescope grep_string<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fb", "<Cmd>Telescope buffers<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fm", "<Cmd>Telescope marks<CR>", opts)

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

function project_files()
	local opts = {}
	local ok = pcall(builtin.git_files, opts)
	if not ok then
		builtin.find_files(opts)
	end
end

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
		},
	},
	pickers = {
		find_files = {
			theme = "dropdown",
		},
		marks = {
			theme = "dropdown",
		},
		buffers = {
			theme = "dropdown",
		},
		live_grep = {
			theme = "dropdown",
		},
		grep_string = {
			theme = "dropdown",
		},
		oldfiles = {
			theme = "dropdown",
			only_cwd = true,
		},
	},
	extensions = {
		frecency = {
			workspaces = {
				["d"] = "/Users/fidel/iCloudDrive/dotfiles",
				["t"] = "/Users/fidel/Code/trezy",
				["r"] = "/Users/fidel/Code/rails_event_store",
			},
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("frecency")
telescope.load_extension("gh")
telescope.load_extension("dap")
