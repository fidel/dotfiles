return {
  {
    "klen/nvim-test",
    config = function()
      require("nvim-test").setup({
        runners = {
          ruby = "nvim-test.runners.rspec",
        },
      })
    end,
  },
}
