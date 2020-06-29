call plug#begin('~/.vim/bundle')

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dispatch'
Plug 'skwp/greplace.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'regedarek/ZoomWin'
Plug 'godlygeek/tabular'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mxw/vim-jsx'
Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'markdown', 'yaml', 'html', 'ruby'] }
Plug 'ElmCast/elm-vim'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'atelierbram/Base2Tone-vim'
Plug 'kristijanhusak/vim-carbon-now-sh'

call plug#end()

set nocompatible
set pastetoggle=<F2>
filetype plugin indent on
if (has("termguicolors"))
  set termguicolors
endif
syntax on
set background=dark
colorscheme Base2Tone_EveningDark
set display=lastline
set scrolloff=1
set sidescrolloff=5
set lazyredraw
set number

set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//

let mapleader=","
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab

set confirm
set showcmd

set textwidth=78
set backspace=2
set autoindent

set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

map <Leader>= <C-w>=
map <Leader><Leader> :ZoomWin<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '~40%' }

nnoremap <silent> <Leader>p  :Files<CR>
nnoremap <silent> <Leader>t  :Files<CR>
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>
xnoremap <silent> <Leader>ag       y:Ag <C-R>"<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_use_password_in_gitconfig = 0

" autocmd BufWritePre * %s/\s\+$//e

" let g:prettier#quickfix_enabled = 0
" autocmd TextChanged,InsertLeave *.js,*.jsx,*.css,*.less,*.scss,*.json,,*.md,*.yaml,*.html,*.rb,*.erb PrettierAsync
