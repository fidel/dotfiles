augroup my-glyph-palette
  autocmd! *
  autocmd FileType TelescopePrompt,TelescopeResults,statusline call glyph_palette#apply()
  autocmd FileType lspkind call glyph_palette#apply()
  autocmd FileType LSP call glyph_palette#apply()
augroup END
