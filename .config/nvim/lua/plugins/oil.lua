return {
  {
    "stevearc/oil.nvim",
    config = function()
      local oil = require("oil")
      oil.setup({
        skip_confirm_for_simple_edits = true,
        columns = {},
      })

      vim.keymap.set("n", "-", function()
        oil.open()
      end, { desc = "Open parent directory" })
    end,
  },
}
