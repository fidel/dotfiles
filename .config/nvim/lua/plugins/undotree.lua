return {
  "mbbill/undotree",
  config = function()
    vim.keymap.set(
      "n",
      "<Leader>u",
      "<Cmd>UndotreeToggle<CR>",
      { desc = "Undotree" }
    )
  end,
}
