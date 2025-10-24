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

      local tb = require('telescope.builtin')

      -- Helper function to get visual selection
      local function get_visual_selection()
        local current_clipboard_content = vim.fn.getreg('"')
        vim.cmd('noau normal! "vy"')
        local text = vim.fn.getreg('v')
        vim.fn.setreg('v', {})
        vim.fn.setreg('"', current_clipboard_content)
        text = string.gsub(text, "\n", "")
        return #text > 0 and text or ''
      end

      -- File navigation
      vim.keymap.set("n", "<leader>pf", function()
        tb.find_files({ previewer = false })
      end, { desc = "Find files" })

      vim.keymap.set("n", "<leader>p", function()
        tb.git_files({ previewer = false })
      end, { desc = "Git files" })

      vim.keymap.set("n", "<leader>e", tb.oldfiles, { desc = "Old files" })

      vim.keymap.set("n", "<leader>fb", function()
        tb.buffers({ sort_lastused = true })
      end, { desc = "Buffers" })

      -- Search in current buffer
      vim.keymap.set('n', '<leader>g', tb.current_buffer_fuzzy_find, { desc = "Search in buffer" })
      vim.keymap.set('v', '<leader>g', function()
        tb.current_buffer_fuzzy_find({ default_text = get_visual_selection() })
      end, { desc = "Search selection in buffer" })

      -- Live grep / grep string
      vim.keymap.set('n', '<leader>fg', tb.live_grep, { desc = "Live grep" })
      vim.keymap.set('n', '<leader>G', tb.live_grep, { desc = "Live grep" })
      vim.keymap.set('v', '<leader>G', function()
        tb.grep_string({ search = get_visual_selection() })
      end, { desc = "Grep selection" })
    end,
  },
}
