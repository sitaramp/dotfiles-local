"" Two keys can be mapped as leaders <leader> <localleader>
"let mapleader = ','
"let maplocalleader = ','

" SPACE as a Leader
"use space as leader in sensible modes
let mapleader = "\<Space>"
let maplocalleader = "\\"
nmap <space> <leader>
vmap <space> <leader>

set nocompatible
set t_Co=256

" set fzf path before loading fzf.vim
set runtimepath+=~/.fzf
set runtimepath+=/opt/homebrew/opt/fzf

set directory=$HOME/.vim/swapfiles
set synmaxcol=200

set scrolloff=7

" search settings
set incsearch
set hlsearch
set ignorecase
set smartcase
set signcolumn=yes " always show sign column on left side


" show command as they are being entered, like in emacs
set showcmd
set showmatch
set wildmenu "bash style tab completion
set wildignorecase
set wildmode=list:longest,full

" Tmux mouse
set ttymouse=xterm2
" Use Shift + Drag shift + Right Click to copy paste
" Use Shift + Cntrl + v to insert
" To enable Right to paste-- disable mouse
"set mouse-=a
" Use the mouse to move the cursor
set mouse=a
" Enable mouse in normal and visual mode. See help using-mouse
"set mouse=nv
"set mouse=v
"set mouse=c    "disable cursor

set formatoptions=cjoqrtw
set shell=/bin/bash\ -l
set nofoldenable
set spellcapcheck= " Have no need for this.
" Let modelines set things like indentexpr
if has('modelineexpr')
  set modelineexpr
endif
set autochdir
if exists('+colorcolumn')
  set colorcolumn=80
endif

" tab, spacing, wrapping
set expandtab "use space
set smarttab
set tabstop=4
set shiftwidth=4
set shiftround
set softtabstop=4
set autoindent
set smartindent
set copyindent
set preserveindent
set nowrap
" Use softwrapping in text documents
autocmd FileType text,markdown,tex,html setlocal wrap linebreak
if exists('+breakindent')
  set breakindent
endif

" Number
set number
set numberwidth=5
set relativenumber
augroup linenumbers
  autocmd!
  autocmd BufEnter *    :set relativenumber
  autocmd BufLeave *    :set number norelativenumber
  autocmd WinEnter *    :set relativenumber
  autocmd WinLeave *    :set number norelativenumber
  autocmd InsertEnter * :set number norelativenumber
  autocmd InsertLeave * :set relativenumber
  autocmd FocusLost *   :set number norelativenumber
  autocmd FocusGained * :set relativenumber
augroup END

" Dont write backup amd swap files
set nobackup
set nowritebackup
set noswapfile
set autowrite
set autoread

" Use persistent history.
if has ('persistent_undo')
  if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "p", 0700)
  endif
  set undodir=~/.vim/undo-dir
  set undofile
  set history=200
  set undolevels=1000
endif


" Save and restore marks, registers content,
" command-line history, search pattern history
set viminfo='1000,<500,:500,/500

set ttimeout " Do time out on mappings and others
set ttimeoutlen=20000 " Wait {num} ms before timing out a mapping
" When you’re pressing Escape to leave insert mode in the terminal, it will by
" default take a second or another keystroke to leave insert mode completely
" and update the statusline. This fixes that. I got this from:
" https://powerline.readthedocs.org/en/latest/tipstricks.html#vim
augroup FastEscape
    autocmd!
    au InsertEnter * set ttimeoutlen=50
    au InsertLeave * set ttimeoutlen=20000
augroup END

augroup checktime
  au!
  if !has('gui_running')
    "silent! is necessary,otherwise throws errors when using cmd
    autocmd BufEnter,CursorHold,CursorHoldI * silent! checktime
  endif
augroup END

" Enable completion where available.
" This setting must be set before ALE is loaded.
"
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
let g:ale_completion_enabled = 1

" Hyphen names as single word for style files
autocmd FileType css,scss setl iskeyword+=-

filetype plugin indent on
if !has('nvim')
  set encoding=utf-8
end
