" Install vimplug if missing
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rsi'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'mileszs/ack.vim'
Plug 'mhinz/vim-grepper'
Plug 'tomasr/molokai'
Plug 'sheerun/vim-polygot'
Plug 'fidian/hexmode'
Plug 'chrisbra/csv.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/vim-gist'
Plug 'rgarver/Kwbd.vim'
Plug 'preservim/vimux'
Plug 'preservim/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'preservim/tagbar'
"Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'plasticboy/vim-markdown'
Plug 'rhysd/vim-clang-format'
"Plug 'sjl/gundo.vim'
Plug 'simnalamburt/vim-mundo'
"Plug 'zhou13/vim-easyescape'
Plug 'farmergreg/vim-lastplace'
Plug 'easymotion/vim-easymotion'
Plug 'simeji/winresizer'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
"Plug 'tpope/vim-tbone'
"Plug 'roxma/vim-tmux-clipboard'
Plug 'ojroques/vim-oscyank', { 'tcommit': '14685fc' }
"Plug 'jabirali/vim-tmux-yank'
Plug 'Yggdroot/indentline'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
let g:vim_markdown_folding_disabled = 1
"Plug 'ap/vim-buftabline'
Plug 'pacha/vem-tabline'
Plug 'chriskempson/base16-vim'

" disable X clipboard for startup performance
" or start with -X
"set clipboard=exclude:.*
if filereadable($HOME . "/dotfiles-local/vim-plug-before.vim")
  source ~/dotfiles-local/vim-plug-before.vim
endif

" Initialize plugin system
call plug#end()
"PlugInstall
"PlugStatus
"PlugUpdate

if filereadable($HOME . "/dotfiles-local/vim-plug-after.vim")
  source ~/dotfiles-local/vim-plug-after.vim
endif

if filereadable($HOME . "/dotfiles-local/vimrc.project")
  source ~/dotfiles-local/vimrc.project
endif

"if filereadable($HOME . "/dotfiles-local/osc52.vim")
"  source ~/dotfiles-local/osc52.vim
"endif
