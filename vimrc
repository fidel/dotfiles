set rtp+=/usr/local/opt/fzf
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-Dispatch'
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'regedarek/ZoomWin'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'bling/vim-airline'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'godlygeek/tabular'
Plug 'janko-m/vim-test'
Plug 'neomake/neomake'
" Plug 'eslint/eslint'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
Plug 'scrooloose/nerdcommenter'
Plug 'mxw/vim-jsx'
Plug 'skwp/greplace.vim'
Plug 'evidanary/grepg.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'sbdchd/neoformat'
Plug 'christoomey/vim-tmux-runner'
Plug 'ElmCast/elm-vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
" Plug 'lifepillar/vim-wwdc16-theme'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()


syntax on
color dracula
set number
set expandtab
set shiftwidth=2
set softtabstop=2
set shortmess+=I
set ruler
set cursorline
set showbreak=↪
set colorcolumn=120
set wrap
set noswapfile

set shell=bash
set shellcmdflag=-c
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//


let test#strategy = "dispatch"
map <Leader>v :VtrOpenRunner { 'orientation': 'h', 'percentage': 40 }<CR>
" map <Leader>. :TestLast<CR>

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>


let mapleader=','
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:deoplete#enable_at_startup = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:jsx_ext_required = 0

let test#javascript#mocha#executable = "webpack/node_modules/.bin/mocha"
let test#javascript#mocha#options = "--compilers js:babel/register -r webpack/test/helpers.js"

map <Leader><Leader> :ZoomWin<CR>
map <Leader>= <C-w>=

map <C-p> :Files<CR>
map <C-t> :Files<CR>

au BufWritePre * :%s/\s\+$//e
" autocmd BufWritePre *.js exe "normal! gggqG\<C-o>\<C-o>"
autocmd BufWritePre *.js Neoformat

"" Tabular
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a> :Tabularize /=><CR>
vmap <Leader>a> :Tabularize /=><CR>
nmap <Leader>a{ :Tabularize /:<CR>
vmap <Leader>a{ :Tabularize /:<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
"
"" Perf issues on Ruby
set lazyredraw
set regexpengine=1

"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

call neocomplete#util#set_default_dictionary(
  \ 'g:neocomplete#sources#omni#input_patterns',
  \ 'elm',
  \ '\.')
