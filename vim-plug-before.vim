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
set expandtab
set nosmartindent
set showmatch
set wildmode=list:longest,full
set hidden
set mouse=a
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

set tabstop=2
set shiftwidth=2
set softtabstop=2

filetype plugin indent on

