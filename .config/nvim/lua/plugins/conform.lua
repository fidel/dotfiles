return {
  {
    "stevearc/conform.nvim",
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          lua = { "stylua" },
          javascript = { "prettier" },
          ruby = { "stree" },
          elm = { "elm_format" },
          erb = { "erb_format" },
          fish = { "fish_indent" },
          sql = { "pg_format" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
        formatters = {
          elm_format = {
            command = "npx",
            args = {
              "elm-format",
              "--stdin",
            },
          },
          stree = {
            command = "stree",
            args = {
              "write",
              "$FILENAME",
            },
            stdin = false,
          },
        },
      })

      vim.api.nvim_create_user_command("Format", function(args)
        local range = nil
        if args.count ~= -1 then
          local end_line =
            vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
          range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
          }
        end
        require("conform").format({
          async = true,
          lsp_fallback = true,
          range = range,
        })
      end, { range = true })
    end,
  },
}
