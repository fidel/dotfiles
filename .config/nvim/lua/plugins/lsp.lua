return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/neodev.nvim",
        version = "*",
      },
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      vim.diagnostic.config({
        underline = false,
        -- {
        --  severity = vim.diagnostic.severity.ERROR,
        -- },
        virtual_text = false,
        update_in_insert = true,
        virtual_lines = true,
      })

      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
      vim.keymap.set("n", "<leader>Q", vim.diagnostic.setqflist)

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          vim.keymap.set(
            "n",
            "gD",
            vim.lsp.buf.declaration,
            { buffer = ev.buf, desc = "Declaration" }
          )
          vim.keymap.set(
            "n",
            "gd",
            vim.lsp.buf.definition,
            { buffer = ev.buf, desc = "Definition" }
          )
          vim.keymap.set(
            "n",
            "K",
            vim.lsp.buf.hover,
            { buffer = ev.buf, desc = "Hover" }
          )
          vim.keymap.set(
            "n",
            "gi",
            vim.lsp.buf.implementation,
            { buffer = ev.buf, desc = "Implementation" }
          )
          vim.keymap.set(
            "n",
            "<C-s>",
            vim.lsp.buf.signature_help,
            { buffer = ev.buf, desc = "Signature help" }
          )
          vim.keymap.set(
            "n",
            "<leader>D",
            vim.lsp.buf.type_definition,
            { buffer = ev.buf, desc = "Type definition" }
          )
          vim.keymap.set(
            "n",
            "<leader>rn",
            vim.lsp.buf.rename,
            { buffer = ev.buf, desc = "Rename" }
          )
          vim.keymap.set(
            "n",
            "so",
            require("telescope.builtin").lsp_references,
            { buffer = ev.buf, desc = "References" }
          )
        end,
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )

      -- Elm
      -- https://github.com/elm-tooling/elm-language-server#installation
      vim.lsp.config.elmls = {
        cmd = {
          "npx",
          "elm-language-server",
        },
        capabilities = capabilities,
        on_attach = function(client)
          -- client.resolved_capabilities.document_formatting = false
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      }
      vim.lsp.enable('elmls')

      -- Ruby
      -- https://github.com/Shopify/ruby-lsp/blob/main/EDITORS.md#Neovim-LSP
      vim.lsp.config.ruby_lsp = {
        cmd = { "ruby-lsp" },
        capabilities = capabilities,
      }
      vim.lsp.enable('ruby_lsp')

      -- Lua
      -- https://luals.github.io/#install
      require("neodev").setup()

      vim.lsp.config.lua_ls = {
        capabilities = capabilities,
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      }
      vim.lsp.enable('lua_ls')

      vim.lsp.enable('herb_ls')
    end,
  },
}
