Intro

Quick terminal setup to get started.
Use off the self components and keep tweaks to minimum to reduce maintenance.
These files are modeled after https://github.com/statico/dotfiles

Installation
============

1. Launch Zsh:
'zsh

2. Clone the repository:
'git clone --recursive https://github.com/sitaramp/dotfiles

3. Create a new Zsh configuration

4. Set Zsh as you default shell:
'chsh - /bin/zsh

5. Open a new Zsh terminal window or tab

6. Make symlink to files from $HOME directory or source from correspodning files in $HOME

Updating:
'''
cd $DOTFILES_DIR
git pull
git submodule update --init --recursive



ZSH
=====
1. Install prezto

2. Edit ~/.zshrc to:
  - source ~/.zpretzo/runcoms/zshrc
  - source ~/dotfiles/zshrc.local
  - source ~/dotfiles/aliases.local

3. Edit ~/.zpretzorc to enable modules:
  'syntax-highlighting'
  'autosuggestions'
  'git'
  'fasd'
  'prompt'

 4 Set the prompt theme to load.
  Auto set to 'off' on dumb terminals.
+zstyle ':prezto:module:prompt' theme 'powerlevel9k'

TMUX
====
1. Install TPM
 a) mkdir -p ~/.tmux/plugins/tpm
 b) git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
 c) prefix + I to fetch the plugins
 c) prefix + U to update the plugins

VIM
===
1. Install Janus
2. Comments out unused modules in vimrc.before
3. Edit ~/dotfiles-local/vim.after
4. Create symlink ~/.janus to ~/dotfiles-local/janus
5. Install modules not covered by Janus to ~/.janus or
/dotfiles-local/janus using command:

`git submodule add https://github.com/login-name/repo.vim repo.vim`

The <leader> key is set to <Space>, it can be changed in file 'vimrvc.before'.
Some handy shortcut to know:
```
 <F-4>       Toggle paste mode
 <C-e>       toggle buffer
 <C-w>       close all buffers
 <leader>hs  toggle highlight seach
 <leader>k   grep current directgory
 <leader>n   toggle NERDTree
 <leader>cd  change path to active buffer file
 [b ]b       prev and next buffer
 [g ]g       prev and next git change hulk
 [q ]q       prev and next quick window
 [w ]w       prev and next ALE errors
 :SudoWrite   write buffer
 [c ]c       vimdiff prev and next conflict in change
 do          vimdiff diff obtain
 dp          vimdiff diff put
 <leader>gb  gitblame
 <leader>gd  gitdiff
 [on ]on     on/off number
 [or ]or     on/off relativenumber
```

GIT
===
1. Add  ~/.gitconfig.user
2. ln -s  ~/dotfiles-local/gitconfig ~/.gitconfig
3. ln -s ~/dotfiles-local/gitignore ~/.gitignore

