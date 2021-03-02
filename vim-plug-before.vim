"" Two keys can be mapped as leaders <leader> <localleader>
"let mapleader = ','
"let maplocalleader = ','

" SPACE as a Leader
"use space as leader in sensible modes
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"
nmap <space> <leader>
vmap <space> <leader>

set nocompatible
set t_Co=256

" set fzf path before loading fzf.vim
set rtp+=~/.fzf

set directory=$HOME/.vim/swapfiles
set synmaxcol=200
set incsearch
set showcmd
"set scrolloff=10
set hlsearch
set expandtab "use space
set nosmartindent
set showmatch
set wildmenu "bash style tab completion
set wildignorecase
set wildmode=list:longest,full
set hidden
"set mouse=a
"set mouse=nv
set mouse=c
set formatoptions=tcqrow
set shell=/bin/bash
set clipboard=unnamedplus
set foldlevel=99
set spellcapcheck= " Have no need for this.
" Let modelines set things like indentexpr
if has("modelineexpr")
  set modelineexpr
endif
" set autochdir
if exists('+colorcolumn')
  set colorcolumn=80
endif

" tab, spacing, wrapping
set expandtab
"set tabstop=2
set tabstop=4
"set shiftwidth=2
set shiftwidth=4
"set softtabstop=2
set softtabstop=4
set smarttab
set nowrap

set noswapfile
set autowrite
set autoread
set undofile " persist undo history

" make it possible to edit crontabs in vim.
if $VIM_CRONTAB == "true"
    set nobackup
    set nowritebackup
endif

set timeout " Do time out on mappings and others
set timeoutlen=20000 " Wait {num} ms before timing out a mapping
" When you’re pressing Escape to leave insert mode in the terminal, it will by
" default take a second or another keystroke to leave insert mode completely
" and update the statusline. This fixes that. I got this from:
" https://powerline.readthedocs.org/en/latest/tipstricks.html#vim
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=20000
augroup END

augroup checktime
  au!
  if !has("gui_running")
    "silent! is necessary,otherwise throws errors when using cmd
    autocmd BufEnter,CursorHold,CursorHoldI * silent! checktime
  endif
augroup END

" Hyphen names as single word for style files
au FileType css,scss setl iskeyword+=-

filetype plugin indent on

