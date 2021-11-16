let g:plug_home = stdpath('data') . '/plugged'

call plug#begin()

Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-dispatch'
Plug 'preservim/nerdcommenter'
Plug 'vim-test/vim-test'
Plug 'troydm/zoomwintab.vim'
Plug 'puremourning/vimspector'

Plug 'EdenEast/nightfox.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'folke/which-key.nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-frecency.nvim'
Plug 'nvim-telescope/telescope-github.nvim'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'tami5/sqlite.lua'
Plug 'cormacrelf/dark-notify'
Plug 'nathom/filetype.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'suketa/nvim-dap-ruby'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

call plug#end()

