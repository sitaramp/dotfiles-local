"
" Credit https://github.com/statico/dotfiles/blob/master/.vim/vimrc
"
" Mnemonic
" b - buffer; p = project; s = search; h = help

" Janus custominzation
"======================
"<leader>ul underline
":sudoW sudoWrite
"<F4> toggle paste mode
"<leader>u covert the entire word to lowercase
"<leader>l covert the entire word to lowercase
"<leader>tw toggle wrap
"<leader>cd :cd...

" NERDTree
"<leader>n NERDTreeToggle
"<leader>/ NERDTreeToggle
"
" Unimpaired
"[b go to the prev buffer
"]b go to the next buffer
"[n go to the prev conflict
"]n go to the next confiict
"[q go to the prev quickix item
"]q go to the next quickfix item

" Fugitive
nmap <leader>gs :Git<CR> " git status
nmap <leader>gb :Git blame<CR>
nmap <leader>gd :Gdiffsplit<CR> " dd side-by-side diff
nmap <leader>gr :Gread<CR> " checkout file, undo changes
"<leader>gl maps to :Glog<CR>
"<leader>gc maps to :Gcommit<CR>
"<leader>gp maps to :Gpush<CR>

" vim-trailing-whitespace
":FixWhitespace
"
"To More keyboard mappings
" :nmap for normal mode mapping
" :vmap for visual mode mapping
" :imap for insert mode mapping
" :help map verbose
" Vim Debug:
" http://inlehmansterms.net/2014/10/31/debugging-vim/
" vim -D somefile.txt
" vim --startuptime vim.log
" vim -V9 somefile.txt
" :set verbosefile = vim-verbose.txt
" :set verbose=9
" Vim Keymap Debug:
" :redir! > vim_keys.txt
" :silent verbose map
" :redir END
" What overrode you mapping ?
" https://vi.stackexchange.com/7722/how-to-debug-a-mapping

" Undo
" u, C-r seq undo/redo
" g-, g+ timed undo/redo
" <leader> u gundo treeview

" Switch between the last two files
nmap <C-e> :e#<CR>
nnoremap <Leader><Leader> <C-^>
"nmap [b   :bprev<CR>
"nmap ]b   :bnext<CR>
":Gcd      change to top level git directory

" single key acess to Buffers
"nmap ;  :Buffers<CR>
nmap \0 :buffers<CR>
nmap \1 :e #1<CR>
nmap \2 :e #2<CR>
nmap \3 :e #3<CR>
nmap \4 :e #4<CR>
nmap \5 :e #5<CR>
nmap \6 :e #6<CR>
nmap \7 :e #7<CR>
nmap \8 :e #8<CR>
nmap \9 :e #9<CR>
"close quickfix window
nmap \x :cclose<CR>
nnoremap <leader>w :w!<CR>
" Cycle through  buffers
nnoremap <Tab>     :bnext<CR>
nnoremap <S-Tab>   :bprev<CR>
"nnoremap <C-M>     :GitFiles?<CR>

"[Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump=1

" Single key access to files fzf and tags
" edit a buffer in current window
nmap <leader>b :Buffers<CR>
" edit recent files
nmap <leader>e :History<CR>
" edit files in current directory and below
"nmap <leader>o :Files<CR>
nmap <leader>t :Tags<CR>
"nmap <leader>c :Colors<CR>

map <Leader> <Plug>(easymotion-prefix)

map! <A-LEFT> <S-LEFT>
map <A-LEFT> <S-LEFT>
map! <A-RIGHT> <S-RIGHT>
map <A-RIGHT> <S-RIGHT>

" Tell ack.vim to use ripgrep instead
if executable('rg')
   let g:ackprg = 'rg --vimgrep --no-heading'
   let g:grepprg = 'rg --vimgrep --no-heading'
   set grepformat^=%f:%l:%c:%m
endif

"" fuzzy file find
"nnoremap <leader>ee :call FzyCommand("fd ''", ":e")<cr>
"nnoremap <leader>ev :call FzyCommand("fd ''", ":vs")<cr>
"nnoremap <leader>es :call FzyCommand("fd ''", ":sp")<cr>

augroup autoquickfix
    autocmd!
    autocmd QuickfixCmdPost []* cwindow
    autocmd QuickFixCmdPost    l*  lwindow
augroup END

" fuzzy grep/ack  Use ^c to abort
nnoremap <leader>/ :Rg<space>

" Search for word under the cursor in the current directory
" Use \x to close quickfix window
"nnoremap <leader>a mo:Ack!   "\b<cword>\b" <CR>
nnoremap <leader>ack :Ack --follow <Space>
nmap <Leader>ac yiw<leader>ack<C-r>"
vmap <Leader>ac   y<Leader>ack<C-r>"
map  <leader>k     <leader>ac<Bs><CR>
nnoremap <leader>gg mo:Ggrep! "\b<cword>\b" <CR>

" Search for file
"noremap <F1> :denite<Space>
"map  <leader>fdr <F1> -no-split -no-auto-resize ignorecase -start-insert file_rec buffer<CR>
"nmap <leader>fd  yiw<leader>fdr<C-r>"
"vmap <leader>fd    y<leader>fdr<C-r>"
"map  <leader>o      <leader>fd<Bs><cr>

" italicize comments
highlight Comment cterm=italic

"""""""""""""""""""""""""""""""
" Toggle search highlight on off with F5
"""""""""""""""""""""""""""""""""
map  <F5>      :set hls!<bar> set hls?<CR>
imap <F5><Esc> :set hls!<bar> set hls?<CR>
set pastetoggle=<F2>
" Tagbar C++ class outline viewer
nmap <F8> :TagbarToggle<CR>


" SuperTab
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1
au Filetype typescript let b:SuperTabDefaultCompletionType = "<C-x><C-o>"

" Change j,k to act more visually in presence of wrapped lines
" wrapparound line movement
nmap     j gj
nmap     k gk
nnoremap ' `
nnoremap Y y$

" Emacs-like binding in the command line
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
" Emacs-like bindings in insert mode
imap <C-e> <C-o>$
imap <C-a> <C-o>0
inoremap jj <Esc>


" Fix annoyances inthe QuickFix window
autocmd FileType qf setlocal number nolist
autocmd FileType qf wincmd J " Makes sure it's at the bottom of the vim window

set noswapfile
set autowrite
set autoread

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

" These are things that I mistype and want ignored.
nmap Q  <silent>
nmap q: <silent>
nmap K  <silent>
command! Q q
command! W w

" Quitting
" quit all, don't force
map <leader>qq :qa<CR>
" quit all, losing unsaved changes
map <leader>qQ :qa!<CR>
" quit all, after saving all files
map <leader>qw :wqa!<CR>

" tab, spacing, wrapping
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set nowrap

" Trim spaces at EOL and retab. I run `:CLEAN` a lot to clean up files.
command! TEOL %s/\s\+$//
command! CLEAN retab | TEOL

"" highlight whitespace errors
set list
"set listchars=tab:▸\ ,eol:¬
set listchars=tab:\ \ ,extends:·,precedes:·,trail:·

" Consider < and > a pair
set matchpairs+=<:>

" Makes foo-bar considered one word
set iskeyword+=-

" Open vertical split to the right
set splitright

" Show tab bar if there are at least two tabs
set showtabline=1

" Show matching brackets
set showmatch
set matchtime=15

highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0
set colorcolumn=80
highlight ColorColumn ctermbg=darkgray

"match ExtraWhitespace /\s\+\%#\@<!$/
"highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
"highlight WhiteSpaceEOL ctermbg=white guibg=white
let c_space_errors = 1

" enable mouse in normal and visual mode. See help using-mouse
set mouse=nv

" Use Shift + Drag shift + Right Click to copy paste
" Use Shift + Cntrl + v to insert
" To enable Right to paste disable mouse
" set mouse-=a

" The * is the default clipboard + is the system clipboard
" paste plus clipboard using using "+p
"set clipboard=unamed
" Warning: vim must be compiled with clipboard support, use vim-gtk or vim-X11
set clipboard+=unnamed,unnamedplus
"copy paste to system cliboard by prefixing with <leader>
noremap <leader>y "*y
noremap <leader>p "*p
noremap <leader>Y "+y
noremap <leader>P "+p
"reformat reindent
noremap <Esc>P P'[v']=
noremap <Esc>p p'[v']=

"" {{{ automatic paste mode
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end   = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
" }}}

" Numbers
set number
set numberwidth=5
set relativenumber
set number
nmap <leader>n0 :set relativenumber!<CR>
nmap <leader>nn :set number!<CR>
set ruler
set scroll=4
set scrolloff=4
set textwidth=100
set linebreak
set display=lastline

" show command as they are being entered, like in emacs
set showcmd

" windows movement
" Quicker window movement
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-h> <C-w>h
"nnoremap <C-l> <C-w>l

"Display the undo tree with <leader>u.
nnoremap <leader>u :GundoToggle<CR>
"Add this line if you are using Python 3.
"let g:gundo_prefer_python3 = 1

" Use persistent history.
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile

"Colors
" Prereq export XTERM=xterm-256color,;  install ncurses-term
" The cterm color numbers refer to XTerm colors in 256 color mode.
" Map rgb to cterm colors using <URL:https://gist.github.com/719710>.
" xterm 256 sent using ANSI escape sequence via terminfo file
" guicolor  ---map---> hi-color i.e. 256-color terminal
"    use CSApprox or colorsupport.vim
" Double check color-scheme support hi-color terminal not 16 colors
" Prereqs: install ncurses-term6.1+ TERM=xterm-256, tput color
"
if &term =~ "xterm"
  " 256 colors
  let &t_Co = 256
  set termguicolors
  " true color (i.e. 24bit RGB) escape codes
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  "restore screen after quitting
  " Comment t_ti and t_te for windows terminal
  let &t_ti = "\<Esc>7\<Esc>[r\<Esc>[?47h"
  let &t_te = "\<Esc>[?47l\<Esc>8"
  let &t_ts = "\<Esc>[k"
  let &t_fe = "\<Esc>G"
  if has("terminfo")
    let &t_Sf = "\<Esc>[3%p1%dm"
    let &t_Sb = "\<Esc>[4%p1%dm"
  else
    let &t_Sf = "\<Esc>[3%dm"
    let &t_Sb = "\<Esc>[4%dm"
  endif
  "distable background color erase when within tmux
  if $TMUX != ""
    set t_ut=
  endif

endif

" send more characters for redraws
set ttyfast
syntax on
set background=dark

"Solarized settings
" set termcolors=256 for 256color. Comment out for TC
" putty=default 256, use patch putty for true color
let g:solarized_termcolors=256
"colorscheme solarized

"Molokai settings
" Set the following for 256color. Comment out for TC
let g:rehash256 = 1
colorscheme molokai

"" use login Shell instead of interactive shell
if executable('zsh')
  set shell=/usr/bin/zsh\ -l
endif
set shell=/bin/bash\ -l

if has("cscope")
  "use both cscope and tag
  set cscopetag
  " add any local cscope db
  if filereadable($CSCOPE_DB)
    cs  add  $CSCOPE_DB $CSCOPE_ROOT
    set tags+=tags;$CSCOPE_ROOT
  endif
endif
" Show the list for multiple matches
nnoremap <C-]> g<C-]>

""""""""""""" cscope/vim key mappings
" The following maps all invoke one of the following cscope search types:
"
"  <C-\> 's'   symbol: find all references to the token under cursor
"  <C-\> 'g'   global: find global definition(s) of the token under cursor
"  <C-\> 'c'   calls:  find all calls to the function name under cursor
"  <C-\> 't'   text:   find all instances of the text under cursor
"  <C-\> 'e'   egrep:  egrep search for the word under cursor
"  <C-\> 'f'   file:   open the filename under cursor
"  <C-\> 'i'   includes: find files that include the filename under cursor
"  <C-\> 'd'   called: find functions that function under cursor calls
"
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" NERDTree
map <C-n> :NERDTreeToggle<CR>
"map <leader>cd :cd %:p:h<CR>:pwd<CR>

" Open NERDTree if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDTree if directory is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" don't show these fil types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

"Close vim if NERDTree is the last pane
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" More space with NERDTree
let g:NERDTreeMinimalUI = 1
let g:NERDTreeMarkBookmarks = 0
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeStatusLine = -1


" GitGutter
nmap [g  :GitGutterPrevHunk<CR>
nmap ]g  :GitGutterNextHunk<CR>
augroup VimDiff
    autocmd!
    autocmd VimEnter,FilterWritePre * if &diff | GitGutterDisable | endif
augroup END

autocmd FileType apache setlocal commentstring=#\ %s

" ALE settings
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title
nmap ]w :ALENextWrap<CR>
nmap [w :ALEPreviousWrap<CR>
nmap <Leader>fw <Plug>(ale_fix)
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_save = 0

augroup VimDiff
    autocmd!
    autocmd VimEnter,FilterWritePre * if &diff | ALEDisable | endif
augroup END

" Airline status line  settings
set laststatus=2
let g:airline_detect_paste=1
let g:airline_theme='molokai' "cool molokai
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1

" SuperTab
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1
au Filetype typescript let b:SuperTabDefaultCompletionType = "<C-x><C-o>"

" CtrlP
let g:ctrlp_map= '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

" symtastic
"if janus#is_plugin_enabled('syntastic')
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
"endif

"if janus#is_plugin_enabled('ale')
  " run linter when files is saved
  let g:ale_lint_on_text_changed = 'never'
  " don't want linters to run on opening a file
  let g:ale_lint_on_enter = 0
"endif

"Always use vertical diffs
set diffopt+=vertical
" ignore whitespace
set diffopt+=iwhite
set diffexpr=""

augroup VimDiff
  autocmd!
  if &diff

    set norelativenumber
    set diffopt=filler,context:200 " filler is default and inserts empty lines for sync
    "map ] ]c
    "map [ [c
    map <leader>1 :diffget LOCAL<CR>
    map <leader>2 :diffget BASE<CR>
    map <leader>3 :diffget REMOTE<CR>
    let g:diff_translations = 0
    let g:solarized_diffmode="high"

    set background=dark
    "syntax off
    "set syntax=diff
    colorscheme evening

    set cursorline
    ""set cursorcolumn
    ""hi CursorColumn cterm=none ctermbg=135 ctermfg=NONE guibg=darkred guifg=white
    "hi CursorLine   cterm=underline ctermbg=18 ctermfg=white gui=underline guibg=#000087 guifg=white

    "Color code map https://jonasjacek.github.io/colors/
    ""hi DiffAdd   cterm=none    ctermbg=LightGreen ctermfg=233 gui=none guibg=#DDFFDD guifg=#003300
    "hi DiffAdd    cterm=none    ctermbg=46         ctermfg=233 gui=none guibg=#00FF00 guifg=#003300
    "hi DiffDelete cterm=none    ctermbg=9          ctermfg=233 gui=none guibg=Red guifg=white
    "hi DiffChange cterm=bold    ctermbg=17         ctermfg=10  gui=none guibg=Red guifg=bg
    "hi DiffText   cterm=bold    ctermbg=88         ctermfg=10  gui=none guibg=Red guifg=bg

    set foldmethod=indent
    autocmd Syntax * normal zR

    if has("patch-8.1.0360")
      set diffopt+=internal,algorithm:patience
    endif
  endif
augroup END

" Local config
if filereadable($HOME . "/.vimrc.project")
  source ~/.vimrc.project
endif
"


