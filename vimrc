"" Perf issues on Ruby
set lazyredraw
set regexpengine=1

"" General
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

"" Interface
Plugin 'kien/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'regedarek/ZoomWin'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-dispatch'
Plugin 'skalnik/vim-vroom'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-eunuch'

"" Search
Plugin 'rking/ag.vim'
Plugin 'skwp/greplace.vim'
Plugin 'craigemery/vim-autotag'

"" Code edit
Plugin 'The-NERD-Commenter'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'godlygeek/tabular'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
"Plugin 'scrooloose/syntastic'

"" Ruby & Rails stuff
Plugin 'vim-ruby/vim-ruby'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rake'
Plugin 'henrik/vim-yaml-flattener'
Plugin 'thoughtbot/vim-rspec'

"" Python
Plugin 'jmcantrell/vim-virtualenv'

"" Code snippets
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

"" Markdown
Plugin 'tpope/vim-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'junegunn/goyo.vim'
Plugin 'amix/vim-zenroom2'

"" Git & Github
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

"" JavaScript
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'isRuslan/vim-es6'

"" CSS
Plugin 'cakebaker/scss-syntax.vim'

"" Nix
Plugin 'LnL7/vim-nix'

"" Colorschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'
Plugin 'reedes/vim-colors-pencil'
Plugin 'noahfrederick/vim-hemisu'
Plugin 'NLKNguyen/papercolor-theme'

call vundle#end()

syntax on
filetype plugin indent on " Load file type plugins + indentation
set fileencoding=utf-8    " set encoding
set linebreak
set history=1000
set mouse=a
set ttyfast
set hidden
set autoread
set showcmd               " display incomplete commands
let mapleader=","         " use comma as <Leader> key instead of backslash

"" Visual clues
set ruler
set cursorline
set showbreak=↪
set number
set colorcolumn=120
set wrap

"" Colours
set background=dark

" Solarized
"set t_Co=256
"let g:solarized_termtrans=1
"let g:solarized_termcolors=256
"colorscheme solarized

" Pencil
"colorscheme pencil
"let g:pencil_neutral_code_bg = 1
"let g:pencil_spell_undercurl = 1
"let g:pencil_terminal_italics = 1
"let g:pencil_higher_contrast_ui = 1

" Base16
"let base16colorspace=256
"colorscheme base16-defaul

" Hemisu
"colorscheme hemisu

" PaperColor
set t_Co=256
colorscheme PaperColor

"" Undo across sessions
if has('gui_running')
   set undodir=~/.vim/backups
   set undofile
endif

"" Whitespace
set nowrap			                    " don't wrap lines
set tabstop=2 shiftwidth=2	        " a tab is two spaces
set softtabstop=2
set expandtab			                  " use spaces, not tabs
set list listchars=tab:\ \ ,trail:·	" set trailing space name
set backspace=indent,eol,start	    " backspace through everything in insert mode

"" Searching
set hlsearch			          " highlight matches
set incsearch			          " incremental searching
set ignorecase			        " searches are case insensitive
set smartcase			          " ..unless they contatin at least one capital letter
nnoremap <F3> :set hlsearch!<CR>	" switch highlighting
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

"" Scrolling
set scrolloff=10
set sidescrolloff=15
set sidescroll=1

"" Backups
set nobackup
set nowritebackup
set noswapfile

"" Get off my lawn
"nnoremap <Left> :echoe "Use h"<CR>
"nnoremap <Down> :echoe "Use j"<CR>
"nnoremap <Up> :echoe "Use k"<CR>
"nnoremap <Right> :echoe "Use l"<CR>

"" Backup
set backupdir=~/.vim/backup
set directory=~/.vim/backup

"" Zoomwin
map <Leader>= <C-w>=
map <Leader><Leader> :ZoomWin<CR>

"" Ag
map <Leader>f :Ag<space>
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

"" CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]((public\/(images|assets|barcodes|components|experimental|pdflists|pdfs|public_images|swfs|system|videos))|\.(git|hg|svn))$',
  \ 'file': '\.log',
  \ }
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
"let g:ctrlp_lazy_update = 350
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:30,results:100'

nnoremap <leader>. :CtrlPTag<cr>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov,*.so,*.swp,*.zip

"" Filetypes
au BufNewFile,BufRead {Capfile,Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru,*.rabl,*.rake} set syntax=ruby
au BufNewFile,BufRead *.json                set syntax=javascript
au BufNewFile,BufRead *.es6                 set syntax=javascript
au BufNewFile,BufRead *.md,*.mkd,*.markdown set syntax=markdown
au BufRead,BufNewFile *.scss                set filetype=scss.css
au BufRead,BufNewFile *.py                  set tabstop=8 expandtab shiftwidth=4 softtabstop=4

let g:VMEPstylesheet = 'github2.css'

"" UltiSnip
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-h>"

"" Trailing whitespace remove on save
autocmd BufWritePre *.coffee,*.js,*.haml,*.erb,*.rb,*.py,*.c,*.h,*.feature,*.conf,*rc,*.md,README,CHANGELOG,README.* :%s/\s\+$//e

"" Toggle pasting
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

"" Bubble signle lines
nmap <C-Up> [e
nmap <C-Down> ]e

"" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

"" Tabular
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a> :Tabularize /=><CR>
vmap <Leader>a> :Tabularize /=><CR>
nmap <Leader>a{ :Tabularize /:<CR>
vmap <Leader>a{ :Tabularize /:<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

"" Gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1

"" Airline
let g:airline_powerline_fonts = 1
set laststatus=2

"" Tagbar
nmap <Leader>tb :TagbarToggle<CR>

"" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1

"" Vim templates
let g:templates_no_autocmd = 1

"" XML prettify
function! PrettifyXML()
  set ft=xml
  :%s/></>\r</g
  :0
  :norm =G
endfunction

"" ctags
" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js' --exclude=.git"

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

"" Instant Markdown
let g:instant_markdown_autostart = 0

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:rspec_command = "Dispatch rspec {spec}"

" Always use vertical diffs
set diffopt+=vertical

"" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'


"" JSX
let g:jsx_ext_required = 0

""" Poligono industrial
function! ExtractModule()
  try
    let name = common#get_input("Variable name: ", "No variable name given!")
  catch
    echo v:exception
    return
  endtry

  call s:select_variable_contents()

  let filename = substitute(name, '_\([a-z]\)', '\u\1', 'g')

  " Replace selected text with the variable name
  exec "normal c" . "var " . name . " = " . "require('./" . filename . "');"

  " Paste the original selected text to be the variable value
  exec "$ w " . filename . ".js"
  let foo = "module.exports = " . name . ";"
  exec "foo w >>" . a:filename . ".js"
endfunction

function! s:select_variable_contents()
  " select current word or re-establish selection
  " (not sure why we need to re-select)
  if (visualmode() == "")
    normal! viw
  else
    normal! gv
  endif
endfunction

