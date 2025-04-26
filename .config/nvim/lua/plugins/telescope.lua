return {
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        pickers = {
          find_files = {
            theme = "dropdown",
            find_command = { "rg", "--files", "--iglob", "!.git", "--hidden" },
            disable_devicons = true,
          },
          buffers = {
            theme = "dropdown",
            disable_devicons = true,
          },
          live_grep = {
            theme = "dropdown",
            disable_devicons = true,
          },
          oldfiles = {
            theme = "dropdown",
            only_cwd = true,
            disable_devicons = true,
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      telescope.load_extension("fzf")
      telescope.load_extension("ui-select")

      vim.keymap.set("n", "<leader>pf", function()
        require("telescope.builtin").find_files({ previewer = false })
      end, { desc = "Find files" })
      vim.keymap.set("n", "<leader>p", function()
        require("telescope.builtin").git_files({ previewer = false })
      end, { desc = "Find files" })
      vim.keymap.set("n", "<leader>e", function()
        require("telescope.builtin").oldfiles()
      end, { desc = "Old files" })
      vim.keymap.set("n", "<leader>fg", function()
        require("telescope.builtin").live_grep()
      end, { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fb", function()
        require("telescope.builtin").buffers({ sort_lastused = true })
      end, { desc = "Buffers" })
    end,
  },
}
