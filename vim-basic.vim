if exists('g:loaded_sensible') || &compatible
  finish
else
  let g:loaded_sensible = 'yes'
endif

" Use :help 'option' to see the documentation for the given option.

endif
set nocompatible
set t_Co=256
set ttyfast
set lazyredraw
set encoding=utf8
set ffs=unix,dos,mac

set expandtab    " On pressing tab, insert 4 spaces
set smarttab
set autoindent
set nocindent
set nosmartindent
set tabstop=4    " show exiting tab with 4 spaces
set shiftwidth=4 " When indenting with '>' use 4 spaces
set backspace=indent,eol,start
set complete-=i
set nrformats-=octal

" make ESC key more responsive
set ttimout
set ttimoutlen=100

set hidden
set ruler
set number
set nowrap
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set cursorline
set background=dark
set scrolloff=4
set sidescrolloff=2
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+



"" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<Space>"
" Fast saving
nmap <leader>w :w!<cr>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" no bells
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * silent! checktime

set nobackup
set nowb
set noswapfile
set undofile
set history=1000

set laststatus=2
set showcmd
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

set mouse=a

syntax enable
syntax on
filetype plugin indent on

" Show tab bar if there are at least two tabs
set showtabline=1

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


