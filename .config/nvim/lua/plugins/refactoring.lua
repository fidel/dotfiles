return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("refactoring").setup()

    vim.keymap.set("n", "<leader>rr", function()
      require("telescope").extensions.refactoring.refactors()
    end, { desc = "Refactor" })
  end,
}
