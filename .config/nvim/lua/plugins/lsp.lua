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

      local lspconfig = require("lspconfig")

      -- Elm
      -- https://github.com/elm-tooling/elm-language-server#installation
      lspconfig.elmls.setup({
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
      })

      -- Ruby
      -- https://github.com/Shopify/ruby-lsp/blob/main/EDITORS.md#Neovim-LSP
      local _timers = {}
      local function setup_diagnostics(client, buffer) -- textDocument/diagnostic support until 0.10.0 is released
        if require("vim.lsp.diagnostic")._enable then
          return
        end

        local diagnostic_handler = function()
          local params = vim.lsp.util.make_text_document_params(buffer)
          client.request(
            "textDocument/diagnostic",
            { textDocument = params },
            function(err, result)
              if err then
                local err_msg =
                    string.format("diagnostics error - %s", vim.inspect(err))
                vim.lsp.log.error(err_msg)
              end
              local diagnostic_items = {}
              if result then
                diagnostic_items = result.items
              end
              vim.lsp.diagnostic.on_publish_diagnostics(
                nil,
                vim.tbl_extend(
                  "keep",
                  params,
                  { diagnostics = diagnostic_items }
                ),
                { client_id = client.id }
              )
            end
          )
        end

        diagnostic_handler() -- to request diagnostics on buffer when first attaching

        vim.api.nvim_buf_attach(buffer, false, {
          on_lines = function()
            if _timers[buffer] then
              vim.fn.timer_stop(_timers[buffer])
            end
            _timers[buffer] = vim.fn.timer_start(200, diagnostic_handler)
          end,
          on_detach = function()
            if _timers[buffer] then
              vim.fn.timer_stop(_timers[buffer])
            end
          end,
        })
      end

      lspconfig.ruby_lsp.setup({
        capabilities = capabilities,
        on_attach = function(client, buffer_nr)
          setup_diagnostics(client, buffer_nr)
        end,
      })

      -- Lua
      -- https://luals.github.io/#install
      require("neodev").setup()

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      })
    end,
  },
}
