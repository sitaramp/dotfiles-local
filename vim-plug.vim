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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/vim-gist'
Plug 'rgarver/Kwbd.vim'
Plug 'preservim/vimux'
Plug 'preservim/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'preservim/tagbar'
Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'plasticboy/vim-markdown'
Plug 'sjl/gundo.vim'

if filereadable($HOME . "/dotfiles-local/vim-plug-before.vim")
	source ~/dotfiles-local/vim-plug-before.vim
endif

" Initialize plugin system
call plug#end()

if filereadable($HOME . "/dotfiles-local/vim-plug-after.vim")
	source ~/dotfiles-local/vim-plug-after.vim
endif

if filereadable($HOME . "/dotfiles-local/vimrc.project")
	source ~/dotfiles-local/vimrc.project
endif
