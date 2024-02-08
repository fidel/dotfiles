return {
  {
    "troydm/zoomwintab.vim",
    config = function()
      vim.keymap.set(
        "n",
        "<Leader><Leader>",
        "<Cmd>ZoomWinTabToggle<CR>",
        { desc = "Zoom window" }
      )
    end,
  },
}
