autocmd!
scriptencoding utf-8
if !1
  finish
endif

set noswapfile
set number
syntax enable
set fileencodings=utf-8
set title
set background=dark
set nobackup
set showcmd
set cmdheight=1
set scrolloff=10
set shell=fish
set splitbelow
set splitright

if has('nvim')
  set inccommand=split
endif

set nosc noru nosm
set lazyredraw
set expandtab
set ignorecase
filetype plugin indent on
set shiftwidth=2
set tabstop=2
set nowrap
set path+=**
set wildignore+=*/node_modules/*
set signcolumn=yes
set updatetime=250

autocmd InsertLeave * set nopaste
set formatoptions+=r
set cursorline

highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40
highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

au TextYankPost * lua vim.highlight.on_yank { higroup = 'IncSearch', timeout = 150, on_visual = true }

au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.fish set filetype=fish

set suffixesadd=.js,.json,.css,.md,.elm

runtime ./plug.vim
runtime ./maps.vim

if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  if system('defaults read -g AppleInterfaceStyle') =~ '^Dark'
    colorscheme nightfox
  else
    colorscheme dayfox
  endif
endif

set exrc

let test#strategy = {
  \ 'nearest': 'neovim',
  \ 'file':    'dispatch',
  \ 'suite':   'basic',
\}

lua <<EOF
  vim.g.did_load_filetypes = 1
  require("my_lsp_config")
EOF

