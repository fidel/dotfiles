if !exists('g:loaded_telescope')
  finish
endif

nnoremap <silent> <leader>p  <cmd>Telescope find_files<cr>
nnoremap <silent> <leader>e  <cmd>Telescope frecency<cr>
nnoremap <silent> <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <silent> <leader>fb <cmd>Telescope buffers<cr>
nnoremap <silent> <leader>fm <cmd>Telescope marks<cr>

lua << EOF
  local telescope = require("telescope")
  local actions = require("telescope.actions")
  
  telescope.setup {
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = actions.close
        }
      }
    },
    pickers = {
      find_files = {
        disable_devicons = true,
        theme = "dropdown"
      },
      marks = { 
        theme = "dropdown"
      },
      frecency = { 
        theme = "dropdown"
      },
      buffers = { 
        theme = "dropdown"
      },
      live_grep = { 
        theme = "dropdown"
      },
    },
  }
  telescope.load_extension("fzf")
  telescope.load_extension("frecency")
  telescope.load_extension("gh")
EOF

