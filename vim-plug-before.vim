" janus vimrc.before
"  januc core  ---> vimrc.before ---> plugins ---> vimrc.after
" This is perfect for setting things like the mapleader. Because any mappings
" using the <leader> keywords that is parsed before changing the mapleader,
" the mapleader won't have any effect on them.

"" Two keys can be mapped as leaders <leader> <localleader>
"let mapleader = ','
"let maplocalleader = ','

" SPACE as a Leader
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" set fzf path before loading fzf.vim
set rtp+=~/.fzf

" term supports 24bit truecolor sequences
"set termguicolors

"  Janus uses pathogen
" To disable plugins
" call janus#disable_plugin('nerdcommenter')"
"
"
"" color plugins
 "call janus#disable_plugin('base16-vim')
 "call janus#disable_plugin('darcula')
 "call janus#disable_plugin('github')
 "call janus#disable_plugin('irblack')
 "call janus#disable_plugin('janus-colors')
"" call janus#disable_plugin('molokai')
 "call janus#disable_plugin('pyte')
 "call janus#disable_plugin('sampler-pack')
"" call janus#disable_plugin('solarized')
 "call janus#disable_plugin('vim-tomorrow-theme')
 "call janus#disable_plugin('vividchalk')
"
""Language plugins
 "call janus#disable_plugin('csv')
 "call janus#disable_plugin('minitest')
 "call janus#disable_plugin('nodejs')
 "call janus#disable_plugin('rails')
 "call janus#disable_plugin('rdoc')
"" call janus#disable_plugin('vim-polyglot')
"
""Tools plugins
"
"" call janus#disable_plugin('ack')
 "call janus#disable_plugin('buffergator')
 "call janus#disable_plugin('css-color')
 "call janus#disable_plugin('ctrlp') " use fzf
 "call janus#disable_plugin('dispatch')
 "call janus#disable_plugin('easymotion')
"" call janus#disable_plugin('endwise')
"" call janus#disable_plugin('eunuch')
"" call janus#disable_plugin('fugitive')
"" call janus#disable_plugin('gist')
 "call janus#disable_plugin('gundo')
 "call janus#disable_plugin('indent-object')
"" call janus#disable_plugin('kwbd')
 "call janus#disable_plugin('multiple-cursors')
 "call janus#disable_plugin('narrowregion')
"" call janus#disable_plugin('nerdcommenter')
"" call janus#disable_plugin('nerdtree')
"" call janus#disable_plugin('repeat')
 "call janus#disable_plugin('snipmate')
"" call janus#disable_plugin('supertab')
"" call janus#disable_plugin('surround')
 "call janus#disable_plugin('syntastic') "use ale
"" call janus#disable_plugin('tagbar')
 "call janus#disable_plugin('tlib')
"" call janus#disable_plugin('unimpaired')
 "call janus#disable_plugin('vim-addon-mw-utils')
"" call janus#disable_plugin('vim-gitgutter')
 "call janus#disable_plugin('vim-snippets')
"" call janus#disable_plugin('vim-trailing-whitespace')
 "call janus#disable_plugin('vimwiki')
 "call janus#disable_plugin('visualstar')
 "call janus#disable_plugin('vroom')
 "call janus#disable_plugin('webapi')
 "call janus#disable_plugin('zoomwin')