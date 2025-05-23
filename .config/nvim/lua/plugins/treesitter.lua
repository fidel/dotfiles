return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = "*",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
        sync_install = false,
        auto_install = true,
        ensure_installed = {
          "css",
          "diff",
          "elm",
          "fish",
          "git_config",
          "git_rebase",
          "gitcommit",
          "gitignore",
          "haskell",
          "html",
          "javascript",
          "json",
          "lua",
          "make",
          "markdown",
          "markdown_inline",
          "nix",
          "query",
          "ruby",
          "sql",
          "toml",
          "yaml",
        },
      })

      vim.cmd([[set foldmethod=expr]])
      vim.cmd([[set foldexpr=nvim_treesitter#foldexpr()]])
      vim.cmd([[set nofoldenable]])
    end,
  },
  { "nvim-treesitter/nvim-treesitter-context", },
}
