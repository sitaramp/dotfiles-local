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

"" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<Space>"
" Fast saving
nmap <leader>w :w!<cr>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

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

set laststatus=2
set showcmd
set wildmenu
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


