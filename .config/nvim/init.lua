local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ","
-- vim.g.ruby_path = "$HOME/.rbenv/shims"

require("lazy").setup("plugins")

vim.opt.shortmess:append({ I = true })

vim.o.swapfile = false
vim.o.backup = false
vim.o.scrolloff = 5
vim.o.shell = "fish"
vim.o.termguicolors = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.cursorline = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.updatetime = 250
vim.o.ignorecase = true
vim.o.wrap = false
vim.wo.number = true
vim.o.relativenumber = true
vim.wo.signcolumn = "yes"

vim.keymap.set(
  "n",
  "<Leader>ve",
  "<Cmd>e $MYVIMRC<CR>",
  { desc = "Edit init.lua" }
)

vim.keymap.set(
  "n",
  "<Leader>vf",
  "<Cmd>e ~/.config/fish/config.fish<CR>",
  { desc = "Edit fish.config" }
)

vim.keymap.set(
  { "n", "v" },
  "<Leader>y",
  "\"*y",
  { desc = "Copy to system clipboard" }
)

vim.api.nvim_create_autocmd("WinEnter", {
  pattern = "*",
  callback = function()
    vim.o.cursorline = true
  end,
})

vim.api.nvim_create_autocmd("WinLeave", {
  pattern = "*",
  callback = function()
    vim.o.cursorline = false
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ timeout = 150 })
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    vim.o.paste = false
  end,
})
