return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      -- Ruby adapters
      "olimorris/neotest-rspec",
      "zidhuss/neotest-minitest",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-rspec")({
            rspec_cmd = function()
              return vim.tbl_flatten({
                "bundle",
                "exec",
                "rspec",
              })
            end,
            transform_spec_path = function(path)
              return path
            end,
            results_path = "tmp/rspec.output",
          }),
          require("neotest-minitest"),
        },
        -- Optionally configure output window
        output = {
          enabled = true,
          open_on_run = true,
        },
        -- Optionally configure quickfix
        quickfix = {
          enabled = false,
        },
        -- Show test status in sign column
        status = {
          enabled = true,
          virtual_text = true,
          signs = true,
        },
        -- Configure icons
        icons = {
          passed = "✓",
          running = "⟳",
          failed = "✗",
          skipped = "⊘",
          unknown = "?",
        },
      })
    end,
    keys = {
      {
        "<leader>tt",
        function()
          require("neotest").run.run()
        end,
        desc = "Run nearest test",
      },
      {
        "<leader>tf",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Run current file",
      },
      {
        "<leader>ta",
        function()
          require("neotest").run.run(vim.fn.getcwd())
        end,
        desc = "Run all tests",
      },
      {
        "<leader>ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Toggle test summary",
      },
      {
        "<leader>to",
        function()
          require("neotest").output.open({ enter = true })
        end,
        desc = "Open test output",
      },
      {
        "<leader>tO",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Toggle test output panel",
      },
      {
        "<leader>tS",
        function()
          require("neotest").run.stop()
        end,
        desc = "Stop test",
      },
      {
        "<leader>tw",
        function()
          require("neotest").watch.toggle()
        end,
        desc = "Toggle watch mode",
      },
      {
        "<leader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run last test",
      },
      {
        "<leader>td",
        function()
          require("neotest").run.run({ strategy = "dap" })
        end,
        desc = "Debug nearest test",
      },
    },
  },
}
