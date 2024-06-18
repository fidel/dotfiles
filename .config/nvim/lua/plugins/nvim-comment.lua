return {
  {
    "terrortylor/nvim-comment",
    version = "*",
    event = "VeryLazy",
    config = function()
      require('nvim_comment').setup()
    end
  },
}
