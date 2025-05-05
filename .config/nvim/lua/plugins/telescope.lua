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

      function vim.getVisualSelection()
        local current_clipboard_content = vim.fn.getreg('"')

        vim.cmd('noau normal! "vy"')
        local text = vim.fn.getreg('v')
        vim.fn.setreg('v', {})

        vim.fn.setreg('"', current_clipboard_content)

        text = string.gsub(text, "\n", "")
        if #text > 0 then
          return text
        else
          return ''
        end
      end

      local keymap = vim.keymap.set
      local tb = require('telescope.builtin')
      local opts = { noremap = true, silent = true }

      keymap('n', '<leader>g', ':Telescope current_buffer_fuzzy_find<cr>', opts)
      keymap('v', '<leader>g', function()
        local text = vim.getVisualSelection()
        tb.current_buffer_fuzzy_find({ default_text = text })
      end, opts)

      keymap('n', '<leader>G', ':Telescope live_grep<cr>', opts)
      keymap('v', '<leader>G', function()
        local text = vim.getVisualSelection()
        tb.grep_string({ search = text })
      end, opts)
    end,
  },
}
