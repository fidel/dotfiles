local status, lualine = pcall(require, 'gitsigns')
if (not status) then return end

require('gitsigns').setup {
  current_line_blame = true
}

