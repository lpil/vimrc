if has('nvim')
  runtime! plugin/python_setup.vim
  tnoremap <Esc> <C-\><C-n>
endif

call plug#begin('~/.config/nvim/plugged')

" Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'scss.css'] }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'derekwyatt/vim-scala', { 'for': ['scala', 'markdown'] }
Plug 'elixir-lang/vim-elixir', { 'for': ['elixir', 'markdown', 'eelixir'] }
Plug 'elmcast/elm-vim', { 'for': ['elm', 'markdown'] }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'foosoft/vim-argwrap', { 'on': 'ArgWrap' }
Plug 'frigoeu/psc-ide-vim', { 'for': 'purescript' }
Plug 'godlygeek/tabular'
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'honza/vim-snippets'
Plug 'idris-hackers/idris-vim', { 'for': 'idris' }
Plug 'jparise/vim-graphql', { 'for': 'graphql' }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'kylef/apiblueprint.vim', { 'for': 'apiblueprint' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'lnl7/vim-nix', { 'for': 'nix' }
Plug 'lpil/gleam.vim', { 'for': 'gleam' }
Plug 'marcweber/vim-addon-mw-utils'
Plug 'mbbill/undotree'
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
" Plug 'ncm2/ncm2'
Plug 'neomake/neomake'
Plug 'neovimhaskell/haskell-vim', { 'for' : 'haskell' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'raichoo/purescript-vim', { 'for': 'purescript' }
Plug 'reasonml-editor/vim-reason-plus', { 'for': 'reason' }
Plug 'rhysd/clever-f.vim'
Plug 'roxma/nvim-yarp'
Plug 'rust-lang/rust.vim', { 'for': ['rust', 'markdown'] }
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdtree'
Plug 'sirver/ultisnips'
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'supercollider/scvim', { 'for': 'supercollider' }
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/matchit.zip'

call plug#end()

filetype plugin indent on
filetype plugin on

" Allow switching buffers without saving current buffer
set hidden

" Syntax
syntax on
" Turn off syntax for long lines to improve performance
set synmaxcol=320

" Colors
set background=dark
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight Normal guibg=none
highlight NonText guibg=none

" Set it to scroll when cursor is # lines from top/bottom
set so=7

" Mouse support
set mouse=a

" Line numbers
set nu
highlight LineNr ctermfg=Brown
set ruler

" Improve backspace deletion behaviour
set backspace=indent,eol,start

" Disable search highlighting by default
set nohlsearch

" Smart case insensitive search
set ignorecase
set smartcase

" / searches before hitting enter
set incsearch

" Command line auto complete
set wildmenu

" Auto read external file changes
set autoread

" Colours
set t_Co=256

" don't redraw when performing macros (for performance)
set lazyredraw

" Default folds are no fun
set nofoldenable

" Delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j
endif

" Preview regex changes
set inccommand=split

"""""""""""""""""""""""""""""""""
" Indentation, Tabs, Space, Etc "
"""""""""""""""""""""""""""""""""

set wrap

set autoindent
set smartindent

set expandtab       "Always uses spaces instead of tabs
set nojoinspaces    "Don't convert spaces to tabs
set shiftround      "Round spaces to nearest shiftwidth multiple
set smarttab        "Indent instead of tab at start of line

set shiftwidth=2    "An indent is 2 spaces
set softtabstop=2   "Insert 2 spaces when tab is pressed
set tabstop=2       "A tab is 2 spaces

set backupcopy=yes
set backupdir=~/.config/nvim/tmp
set directory=~/.config/nvim/tmp
set undodir=~/.config/nvim/tmp " where to save undo histories
set undofile                   " Save undo's after file closes
set undolevels=1000            " How many undos
set undoreload=10000           " number of lines to save for undo

""""""""""""""""
" Highlighting "
""""""""""""""""
" Highlight fenced code blocks in markdown docs
let g:markdown_fenced_languages = [
      \'clojure',
      \'css',
      \'elixir',
      \'elm',
      \'erlang',
      \'go',
      \'haskell',
      \'html',
      \'javascript',
      \'js=javascript',
      \'json=javascript',
      \'ocaml',
      \'python',
      \'ruby',
      \'rust',
      \'rust,noplaypen=rust',
      \'sass',
      \'scala',
      \'scheme',
      \'sh',
      \'toml',
      \'xml',
      \'yaml',
      \'yml=yaml',
      \]

""""""""""""""""""
" Remapping keys "
""""""""""""""""""

let mapleader = " "

" Easier : commands!
nnoremap ; :
vnoremap ; :
nnoremap q; q:

" Have Y behave like D, C, etc (until end of line, not entire line)
nnoremap Y y$

" Turn off paste on leaving insert mode
" (only useful on machines with -clipboard where you have to use 'set paste')
au InsertLeave * set nopaste

" I've got used to the switched " and @ for buffers and macros on OSX.
" So lets swap those two mappings. Use a UK keymap for OSX
nnoremap @ "
nnoremap " @
vnoremap @ "
vnoremap " @

" Nicer split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-left> <C-w>h
nnoremap <C-down> <C-w>j
nnoremap <C-up> <C-w>k
nnoremap <C-right> <C-w>l

" Easier increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Go away ex mode, you suck
nnoremap Q <Nop>

" Let's not accidentally open help all the time
inoremap <F1> <Nop>

" Undo in insert mode
inoremap <C-U> <C-G>u<C-U>

" Open vimrc to edit
nnoremap <leader>ev :e $MYVIMRC<cr>

" Generate ctags
nnoremap <leader>ct :! ctags -R .<cr>

" Go pretty
nnoremap gp :Neoformat<CR>

"""""""""""""""""""
" Toggling stuff! "
"""""""""""""""""""

nnoremap <F1> :set hlsearch!<CR>
nnoremap <F4> :setlocal spell!<CR>
nnoremap <F5> :SyntasticToggleMode<CR>

" Reverse selection
if has('macunix')
  command! -range=% Reverse :'<,'>!gtac
else
  command! -range=% Reverse :'<,'>!tac
endif

""""""""""""""""""
"  Plugin: ncm2  "
""""""""""""""""""

" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()

" :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
set shortmess+=c

"""""""""""""""""""""""""""""""""""
"  Plugin: languageclient-neovim  "
"""""""""""""""""""""""""""""""""""

let g:LanguageClient_serverCommands = {
  \ 'typescript': ['typescript-language-server', '--stdio'],
  \ 'rust': ['rust-analyzer'],
  \ 'ruby': ['bundle', 'exec', 'srb', 'tc', '--lsp', '--disable-watchman'],
  \ 'elm': ['elm-language-server', '--stdio'],
  \ 'python': ['pyls'],
  \ 'go': ['gopls']
  \ }

let g:LanguageClient_rootMarkers = {
  \ 'javascript': ['package.json'],
  \ 'typescript': ['package.json'],
  \ 'python': ['Pipfile', 'requirements.txt'],
  \ 'rust': ['Cargo.toml'],
  \ 'elixir': ['mix.exs'],
  \ 'ruby': ['sorbet/config'],
  \ 'elm': ['elm.json'],
  \ 'go': ['go.mod'],
  \ }

let g:LanguageClient_diagnosticsList = 'Location'
let g:LanguageClient_diagnosticsSignsMax = 0
let g:LanguageClient_loggingFile = expand('/tmp/LanguageClient-neovim.log')

nnoremap <leader><leader> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <C-]> :call LanguageClient#textDocument_definition()<CR>

""""""""""""""""""
"  OCaml merlin  "
""""""""""""""""""
if executable('ocamlmerlin')
  let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
  execute "set rtp+=" . g:opamshare . "/merlin/vim"
endif

"""""""""""""""""""""""""""""""""""""
" And finally, per-project .vimrc's "
"""""""""""""""""""""""""""""""""""""

" Disable unsafe commands in local .vimrc files
set secure
" Enable reading of a .vimrc found in the current dir
set exrc
