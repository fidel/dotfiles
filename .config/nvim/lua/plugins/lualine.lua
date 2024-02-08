return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local function diff_source()
        local gitsigns = vim.b.gitsigns_status_dict

        if gitsigns then
          return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
          }
        end
      end

      require("lualine").setup({
        options = {
          icons_enabled = true,
          globalstatus = true,
        },
        sections = {
          lualine_x = {
            "aerial",
          },
          lualine_b = {
            "branch",
            {
              "diff",
              source = diff_source,
              colored = false,
            },
            {
              "diagnostics",
              sections = { "error" },
            },
          },
        },
        extensions = {
          "quickfix",
          "oil",
          "lazy",
        },
        theme = "rose-pine",
      })
    end,
  },
}
