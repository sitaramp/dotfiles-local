if exists('g:loaded_sensible') || &compatible
  finish
else
  let g:loaded_sensible = 'yes'
endif

" Use :help 'option' to see the documentation for the given option.
" Helper function
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

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
set whichwrap+=<,>,[,]
set complete-=i
set nrformats-=octal
set formatoptions=cjoqrtw

" make ESC key more responsive
set ttimeout
set ttimeoutlen=100

set hidden
set ruler
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
set signcolumn=yes " always show sign column on left side
set list
set splitright " Open new vertical split panes on the right

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

" Folding Settings
set foldenable " enable folding
set foldlevelstart=20 " open most folds by default
set foldnestmax=10 " 10 nested folds max
set foldmethod=indent " this is good for python, fold based on indents

" Critical Mappings
let mapleader=" "
let mapleader = "\<Space>"
" let g:maplocalleader = ','
inoremap  jk <esc>
inoremap  jj <esc>
inoremap  kk <esc>

" Mappings to move by visual lines when wrapped
nnoremap <silent> j gj
onoremap <silent> j gj
nnoremap <silent> k gk
onoremap <silent> k gk
nnoremap <silent> <down> gj
onoremap <silent> <down> gj
onoremap <silent> <up> gk
nnoremap <silent> <up> gk

" Mapping for motion
nnoremap H g^
onoremap H g^
nnoremap L g$
onoremap L g$
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" Mappings to make Y work like C and ':t'D
nnoremap Y y$

" Mappings to indent without exiting visual mode
vnoremap > >gv
vnoremap < <gv

"" With a map leader it's possible to do extra key combinations
nnoremap <Leader>s :update<CR>

" like <leader>w saves the current file
let mapleader = "\<Space>"
" Fast saving
nmap <leader>w :w!<cr>

" Disable highlight when <leader><cr> is pressed
nnoremap <silent> <leader>sc (&hls && v:hlsearch ? ':nohls' : ':set hls')<cr>
"nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" Smart way to move between windows
"map <C-j> <C-W>j
"map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Scroll
"nnoremap J 5j
"nnoremap K 5k
"map <C-j> <C-W>e
"map <C-k> <C-W>y

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

set clipboard=unnamed,unnamedplus
set showcmd
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

set mouse=a

set background=dark
syntax enable
syntax on
filetype plugin indent on

"distable background color erase when within tmux
if $TMUX != ""
  set t_ut=
endif

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

set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

map <F1> <Esc>
imap <F1> <Esc>
" Mappings for moving around buffers
nnoremap <leader>bb :buffers<CR>:b<space>
nnoremap <Leader><Leader> <C-^>
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
map <leader>qq :qa<CR>
map <leader>qQ :qa!<CR>

" remap :W, :Q etc if you press the shift key for tool long
cabbrev Q q
cabbrev W w
cabbrev Wq wq
cabbrev WQ wq
cnoreabbrev q1 q!

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

