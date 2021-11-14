autocmd!
scriptencoding utf-8
if !1
  finish
endif

set nocompatible
set noswapfile
set number
syntax enable
set fileencodings=utf-8
set encoding=utf-8
set title
set autoindent
set background=dark
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
set expandtab
set shell=fish
set backupskip=/tmp/*,/private/tmp/*
set splitbelow
set splitright

if has('nvim')
  set inccommand=split
endif

set t_BE=
set nosc noru nosm
set lazyredraw
set ignorecase
set smarttab
filetype plugin indent on
set shiftwidth=2
set tabstop=2
set nowrap
set backspace=start,eol,indent
set path+=**
set wildignore+=*/node_modules/*
set signcolumn=yes

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
EOF

