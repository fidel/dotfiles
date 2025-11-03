return {
  {
    "klen/nvim-test",
    config = function()
      require("nvim-test").setup({
        termOpts = {
          go_back = true,
          direction = "horizontal",
        },
        runners = {
          ruby = "nvim-test.runners.rspec",
        },
      })

      require("nvim-test.runners.rspec"):setup({
        command = "bundle",
      })

      vim.keymap.set(
        "n",
        "<Leader>tf",
        "<Cmd>TestFile<CR>",
        { desc = "Test opened file" }
      )

      vim.keymap.set(
        "n",
        "<Leader>tl",
        "<Cmd>TestLast<CR>",
        { desc = "Test opened file" }
      )

      vim.keymap.set(
        "n",
        "<Leader>tn",
        "<Cmd>TestNearest<CR>",
        { desc = "Test opened file" }
      )
    end,
  },
}
