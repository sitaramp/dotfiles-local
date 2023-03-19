"
" Credit https://github.com/statico/dotfiles/blob/master/.vim/vimrc
"
" <leader> Mnemonics
" b - buffer; g git, \ = project; s = search; t = toggle, , n = notes, h = help

":sudoW sudoWrite
"<F1> escape
"<F2> toggle tagbar
"<F3> toggle number
"<F4> toggle highlight
"<F5> toggle paste mode

"<leader>nl underline
"<leader>tw toggle wrap
"<leader>cd :cd...

" Goto
" <C-o> go to the prev search
" <C-i> go to the next search
" gi    go to the last insert
" g;    go to the next modification
" g,    go to the prev modification
" gf    go to file located at the filepath under the cursor
" gx    execute the file under the cursor
" gI    insert at column 0


"Macros
" qa
" Do what you have to do
" q
" @a -- repeat macro a

" Unimpaired
"[b go to the prev buffer
"]b go to the next buffer
"[n go to the prev conflict
"]n go to the next confiict
"[q go to the prev quickix item
"]q go to the next quickfix item

" windows movement
" Quicker window movement
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-h> <C-w>h
"nnoremap <C-l> <C-w>l

" Commentary
" Comment - uncomment
"    gcc -- one line comment
"    [count] gcc -- count lines
"    gc {4j} -- 4 lines
"    {visual} gc --- visual block
"    gcgc -- the current comment block

" vim-trailing-whitespace
nnoremap <leader>cw :FixWhitespace<CR>

"To More keyboard mappings
" :nmap for normal mode mapping
" :vmap for visual mode mapping
" :imap for insert mode mapping
" :nore non-recursive
" :help map verbose
" Vim Debug:
" http://inlehmansterms.net/2014/10/31/debugging-vim/
" vim -D somefile.txt
" vim --startuptime vim.log
" vim -V9 somefile.txt
" vim -V9vim-debug.log somefile.txt
" Check key mappings
"   :verbose map <any-key>
" :set verbosefile = vim-verbose.txt
" :set verbose=9
" Vim Keymap Debug:
" :redir! > vim_keys.txt
" :silent verbose map
" :redir END
" What overrode you mapping ?
" https://vi.stackexchange.com/7722/how-to-debug-a-mapping

":Gcd      change to top level git directory

" single key acess to Buffers
"nmap ;  :Buffers<CR>
nnoremap <leader>0 :buffers<CR>
nnoremap <leader>1 :bf<CR>
nnoremap <leader>2 2<C-^>
nnoremap <leader>3 3<C-^>
nnoremap <leader>4 4<C-^>
nnoremap <leader>5 5<C-^>
nnoremap <leader>6 6<C-^>
nnoremap <leader>7 7<C-^>
nnoremap <leader>8 8<C-^>
nnoremap <leader>9 :bl<CR>

" Cycle through  tabs
"noremap <silent> <tab>   :tabnext<CR>
"noremap <silent> <S-tab> :tabprevious<CR>
"noremap <silent> <C-n>   :tabnew<CR>
"noremap <silent> <C-F4>  :close<CR>


" Cycle through buffers
" Switch between the last two files
"nmap <C-e> <C-^>
nnoremap <Leader><Leader> <C-^>

"nmap [b   :bprev<CR>
"nmap ]b   :bnext<CR>
nnoremap <leader>b1 :bf<CR>
nnoremap <leader>b2 2<C-^>
nnoremap <leader>b3 3<C-^>
nnoremap <leader>b4 4<C-^>
nnoremap <leader>b5 5<C-^>
nnoremap <leader>b6 6<C-^>
nnoremap <leader>b7 7<C-^>
nnoremap <leader>b8 8<C-^>
nnoremap <leader>b9 :bl<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprev<CR>
let g:winresizer_start_key = "<leader>wr"

" close, open quickfix window
nmap \x :cclose<CR>
nmap <leader>qo :copen<CR>
nmap <leader>qc :cclose<CR>

augroup autoquickfix
    autocmd!
    autocmd QuickfixCmdPost []* cwindow
    autocmd QuickFixCmdPost    l*  lwindow
augroup END

" Fix annoyances inthe QuickFix window
autocmd FileType qf setlocal number nolist
autocmd FileType qf wincmd J " Makes sure it's at the bottom of the vim window

" farmergreg/vim-lastplace
let g:lastplace_ignore_buftype = "quickfix,nofile,help"
let g:lastplace_ignore = "gitcommit"

" Fugitive
nmap <leader>gs :Git<CR> " git status
nmap <leader>gb :Git blame<CR>
nmap <leader>gd :Gdiffsplit<CR> " dd side-by-side diff
" git revert file
nmap <leader>gr :Gread<CR> " checkout file, undo changes
"<leader>gl maps to :Glog<CR>
"<leader>gc maps to :Gcommit<CR>
"<leader>gp maps to :Gpush<CR>

" Easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
nmap s <Plug>(easymotion-overwin-f2)
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
"map <Leader>l <Plug>(easymotion-lineforward)
"map <Leader>h <Plug>(easymotion-linebackward))

map! <A-LEFT> <S-LEFT>
map <A-LEFT> <S-LEFT>
map! <A-RIGHT> <S-RIGHT>
map <A-RIGHT> <S-RIGHT>

inoremap jj <Esc>
"inoremap kk <Esc>
inoremap bb <Esc>

" fzf
"[Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump=1
" Empty value to disable preview window altogether
let g:fzf_preview_window = []
nnoremap <silent> <leader>bt :call fzf#vim#buffer_tags('', { 'options': ['--nth', '1,2', '--query', '^f$ '] })<CR>

" Files
" :Files ..
" :Rg ...
nmap <Leader><Tab> <plug>(fzf-maps-n)
xmap <Leader><Tab> <plug>(fzf-maps-x)
omap <Leader><Tab> <plug>(fzf-maps-o)

" Single key access to files fzf and tags
" find a buffer in current window
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>/ :BLines<CR>
nnoremap <leader>l :Lines<CR>
"use :Rg to search across files

" find recent files
nmap <leader>bh :History<CR>
"" find git files
"nmap <leader>g :GFiles<CR>
" find files in current directory and below
nmap <leader>bf :Files<CR>
nmap <leader>bg :GFiles<CR>
" find code tags
nnoremap <leader>ct :Tags<CR>
" toggle colorscheme
nnoremap <leader>tc :Colors<CR>
"nmap \e :Files<CR>
"nmap \r :Rg<CR>

"" Ack
"" Tell ack.vim or grepper to use ripgrep instead
if executable('rg')
   let g:ackprg = 'rg --vimgrep --no-heading --smart-case --follow'
   let g:grepprg = 'rg --vimgrep --no-heading --smart-case --follow'
   set grepformat^=%f:%l:%c:%m
endif

"" Auto close the Quickfix list after pressing '<enter>' on a list item
"" To open quick fix window :copen
"let g:ackhighlight = 1
"let g:ack_autoclose = 1
"let g:ack_use_cword_for_empty_search = 1

"" Don't jump to first match
"cnoreabbrev Ack Ack!

"" Search for word under the cursor in the current directory
"" fuzzy grep/ack  Use ^c to abort
"nnoremap <leader>/ :Ack!<Space>
"""nnoremap <leader>a mo:Ack!   "\b<cword>\b" <CR>
""nnoremap <leader>ack :Ack --follow <Space>
""nmap <Leader>ac yiw<leader>ack<C-r>"
""vmap <Leader>ac   y<Leader>ack<C-r>"
""map  <leader>k     <leader>ac<Bs><CR>
""nnoremap <leader>s mo:Ggrep! "\b<cword>\b" <CR>

" imhinz/vim-grepper
let g:grepper={}
let g:grepper.tools=["rg"]
" Search current word
nnoremap <leader>* :Grepper -tool rg -cword -noprompt<cr>
nnoremap <leader>a :Grepper -tool git -noopen -jump<cr>

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
map  <F4>      :set hls!<bar> set hls?<CR>
imap <F4> <Esc><F4>
map <leader>th <F4>

set pastetoggle=<F5>
map <leader>tp <F5>

" Tagbar C++ class outline viewer
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_compat = 1
let g:tagbar_sort = 0 "Sort according to their structure in file & not filename
nmap <F2> :TagbarToggle<CR>
nnoremap <leader>tt <F2>

" SuperTab
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1
au Filetype typescript let b:SuperTabDefaultCompletionType = "<C-x><C-o>"

" Change j,k to act more visually in presence of wrapped lines
" wrapparound line movement
noremap <silent> j gj
noremap <silent> k gk
noremap <silent> <Down> gj
noremap <silent> <Up> gk
inoremap <silent> <Down> <C-o>gj
inoremap <silent> <Up> <C-o>gk
noremap <silent> 0 g0
noremap <silent> $ g$
nnoremap ' `
nnoremap Y y$

nnoremap <C-s> :write<CR>
inoremap <C-s> <ESC>:write<CR>
"nnoremap <leader>w :w!<CR>

" remap :W, :Q etc if you press the shift key for tool lonag
cabbrev Q q
cabbrev W w
cabbrev Wq wq
cabbrev WQ wq
cnoreabbrev q1 q!

augroup checktime
  au!
  if !has("gui_running")
    "silent! is necessary,otherwise throws errors when using cmd
    autocmd BufEnter,CursorHold,CursorHoldI * silent! checktime
  endif
augroup END

map <F1> <Esc>
imap <F1> <Esc>

" Quitting
" quit all, don't force
map <leader>qq :qa<CR>
" quit all, losing unsaved changes
map <leader>qQ :qa!<CR>
" quit all, after saving all files
map <leader>qw :wqa!<CR>

" Consider < and > a pair
set matchpairs+=<:>

" Makes foo-bar considered one word
"set iskeyword+=-

" Open vertical split to the right
set splitright

" Show tab bar if there are at least two tabs
set showtabline=1

" Show matching brackets
set showmatch
set matchtime=15

"  Copy paste across vim sessions
" On MacOS X and Windows the + and * regusters are the same
" On Linux + is the desktop clipboard (usable via ctl-c/x/v)
"          * is the X11 primary selection ( usable via mouse buttons)
" Warning: vim must be compiled with +clipboard and xterm_clipboard
"See plugin vim-tmux-clipboard and vim-osc-yank
" set cross-platform value
set clipboard=unnamed,unnamedplus
"  noremap x "_x
"  noremap X "_X
"  noremap <del> "_X

nnoremap <leader>y <Plug>OSCYank
vnoremap <leader>y :OSCYank<cr>
"nnoremap <leader>y "+y
vnoremap <leader>d "+d
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P

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
nmap <leader>t0 :set invrelativenumber<CR>
noremap <F3> :set invnumber invrelativenumber<CR>
inoremap <F3> <ESC><F3>
nmap <leader>tn <F3>

set ruler
set scroll=4
set scrolloff=4
set textwidth=100
set linebreak
set display=lastline


" Undo
" u, C-r seq undo/redo
"Display the undo tree with <leader>tu.
nnoremap <leader>tu :MundoToggle<CR>
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
" term supports 24bit truecolor sequences
  set termguicolors
  " true color (i.e. 24bit RGB) escape codes
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  "restore screen after quitting
  " Comment t_ti and t_te for windows terminal
  "let &t_ti = "\<Esc>7\<Esc>[r\<Esc>[?47h"
  "let &t_te = "\<Esc>[?47l\<Esc>8"

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

"set background=light
set background=dark

"Solarized settings
" set termcolors=256 for 256color. Comment out for TC
" putty=default 256, use patch putty for true color
"let g:solarized_termcolors=256

" gruvbox settings soft, medium or hard
"let g:gruvbox_contrast_dark = medium
"let g:gruvbox_contrast_light = hard

"Molokai settings
" Set the following for 256color. Comment out for TC
"let g:rehash256 = 1

"colorscheme molokai
"colorscheme solarized
colorscheme gruvbox

"" highlight whitespace errors
set list
"set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨

"match ExtraWhitespace /\s\+\%#\@<!$/
"highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
"highlight WhiteSpaceEOL ctermbg=white guibg=white
let c_space_errors = 1
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Trim spaces at EOL and retab. I run `:CLEAN` a lot to clean up files.
command! TEOL %s/\s\+$//
command! CLEAN retab | TEOL

set colorcolumn=80
highlight ColorColumn ctermbg=darkgray

"" use login Shell instead of interactive shell
if executable('zsh')
  set shell=/usr/bin/zsh\ -l
endif
set shell=/bin/bash\ -l

" Show the list for multiple matches
nnoremap <C-]> g<C-]>

""""""""""""" cscope/vim key mappings as define by skywind3000/gutentags_plus
" The following maps all invoke one of the following cscope search types:
"
"  <leader> cs   symbol: find all references to the token under cursor
"  <leader> cg   global: find global definition(s) of the token under cursor
"  <leader> cc   callers:find all calls to the function name under cursor
"  <leader> ct   text:   find all instances of the text under cursor
"  <leader> ce   egrep:  egrep search for the word under cursor
"  <leader> cf   file:   open the filename under cursor
"  <leader> ci   includes: find files that include the filename under cursor
"  <leader> cd   called: find functions that function under cursor calls
"  <leader> ca   assigned: find places where current symbol is assigned
"

" NERDTree
nnoremap <leader>ft :NERDTreeToggle<CR>
nnoremap <leader>ff :NERDTreeFind<CR>
nnoremap <leader>fn :NERDTreeFocus<CR>
"map <leader>cd :cd %:p:h<CR>:pwd<CR>
"nnoremap <C-n> :NERDTree<CR>
"nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>
"nnoremap <C-n> :NERDTree<CR>

" Open NERDTree if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDTree if directory is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") |
      \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv[0] | endif

" don't show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

"Close vim if NERDTree is the last pane
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | quit | endif

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

"vim-commentary
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
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_linters = {'python': ['autopep8']}

augroup VimDiff
    autocmd!
    autocmd VimEnter,FilterWritePre * if &diff | ALEDisable | endif
augroup END

" Airline status line  settings
set laststatus=2
let g:airline_detect_paste=1
let g:airline_theme='molokai' "cool molokai
let g:airline_powerline_fonts = 1
let g:aitline#extensions#tabline#enabled = 1
let g:aitline#extensions#tabline#left_sep = ' '
let g:aitline#extensions#tabline#left_alt_sep = '|'
let g:aitline#extensions#tabline#fnamemode = ':t'
let g:airline#extensions#ale#enabled = 1
" disable +32 ~9 -0 hunks information in airline section B
let g:airline#extensions#hunks#enabled = 0
" remove encoding text & devicon
au VimEnter * let g:airline_section_x = airline#section#create_right(['tagbar']) | :AirlineRefresh
" Show the buffers in the tabline.
let g:airline#extensions#neomake#enabled = 0

" Spell-checking settings

    " Keep the spellfile in the homedir. This will be a symlink to the dotfiles
    " version of the spellfile.
    "set spellfile=$HOME/.vim-spell-en.utf-8.add

    " Spell check markdown and git commit messages.
    autocmd FileType markdown setlocal spell
    autocmd FileType gitcommit setlocal spell
    " For filetypes with spellcheck available, we'll also support auto-complete.
    set complete+=kspell

    " Don't count acronyms / abbreviations as spelling errors
    " (all upper-case letters, at least three characters)
    " Also will not count acronym with 's' at the end a spelling error
    " Also will not count numbers that are part of this
    " Recognizes the following as correct:
    au BufNewFile,BufRead syn match AcronymNoSpell '\<\(\u\|\d\)\{3,}s\?\>' contains=@NoSpell
    au BufNewFile,BufRead syn match UrlNoSpell '\w\+:\/\/[^[:space:]]\+' contains=@NoSpell



" SuperTab
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1
au Filetype typescript let b:SuperTabDefaultCompletionType = "<C-x><C-o>"

" syntastic
"if janus#is_plugin_enabled('syntastic')
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
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

    set nofoldenable "disable folds
    "set foldmethod=indent
    autocmd Syntax * normal zR

    if has("patch-8.1.0360")
      set diffopt+=internal,algorithm:patience
    endif
  endif
augroup END

fun! Divider(char)
  let len = strlen(getline('.'))
  call append('.', repeat(a:char, len))
  normal j
endfun

map \d :read !date +"\%B \%-d, \%Y"<CR>
map \= :call Divider('=')<CR>
map \- :call Divider('-')<CR>
map \~ :call Divider('~')<CR>
" Pandoc/markdown config.
let g:pandoc#syntax#conceal#use = 0


