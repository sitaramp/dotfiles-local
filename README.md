### Introduction

Quick terminal setup to get started.
Use off-the-shelve components and keep local changes to a minimum thus reducing maintenance.
These files are modeled after https://github.com/statico/dotfiles and thoughbot.

### Installation

1. Launch Zsh:
'zsh

2. Install the  required packages and dependencies
 - zsh
 - prezto
 - bash-completion
 - fzf
 - enhancd
 - lsd
 - tldr
 - thefuck
 - cht.sh
 - cargo
 - python3
 - vim janus
 - ripgrep
 - ack2
 - Universal ctags
 - cscope
 - bash-completion

3. On the client install powerline or nerdfonts. Configure terminal to
   your liking

4. Clone the repository to your home directory:

`git clone --recursive https://github.com/sitaramp/dotfiles-local ~/dotfiles-local

4. Create a new zsh configuration

5. Set Zsh as your default shell:
```
chsh - /bin/zsh
```
6. Open a new Zsh terminal window or tab

7. Follow more customization below

### Updating:

```
cd $DOTFILES_DIR
git pull
git submodule update --init --recursive
```

### ZSH

1. Ensure zprezto is installed

2. Edit ~/.zshrc to:

```
  source ~/.zpretzo/runcoms/zshrc
  source ~/dotfiles-local/zshrc.local
  source ~/dotfiles-local/aliases.local
```

3. Edit `~/.zpretzorc` :

  - Enable modules:
```
'syntax-highlighting'
'autosuggestions'
'git'
'fasd'
'prompt'
```
  - Choose a prompt theme to load:

```
   +zstyle ':prezto:module:prompt' theme 'powerlevel9k'
```
4. Some keyboard shortcuts to know:
```
Ctrl + R : reverse command history chooser
Ctrl + T : fuzzy directory chooser
cd -     : directory matches down the current directory hierarchy
cd ..    : directory matches up the current directory hierarchy
```

### TMUX

Prefix is set to "`" backquote
1. Install TPM :
```
  mkdir -p ~/.tmux/plugins
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
2. Create symlink to tmux.conf
```
ln -s ~/dotfiles-local/tmux.conf ~/.tmux.conf
```
3. Load tmux do the following:
 - prefix + I to fetch the plugins
 - prefix + U to update the plugins
 - prefix + R to rename window
 - prefix + Ctl+R  reload config

Some shortcuts to know:
```
` - prefix key
`prefix + c`      : crete window
`prefix + #`      : switch to numbered window
`prefix + Escape` : switch to vi mode
'prefix + d'      : disconnect the session without lossing session
```
For more information see: https://learnxinyminutes.com/docs/tmux/

### VIM

1. Install Janus
2. Comments out unused modules in vimrc.before
3. Edit ~/dotfiles-local/vim.after
4. Create symlink ~/.janus to ~/dotfiles-local/janus
5. Install modules not covered by Janus to ~/.janus or
```
cd ~/dotfiles-local/janus
git submodule add https://github.com/login-name/repo.vim repo.vim
```
The \<leader> key is set to \<Space>, it can be changed in file 'vimrvc.before'.
Some handy keyboard shortcut to know:
```
 <F-4>       Toggle paste mode
 <C-e>       toggle buffer
 <C-w>       close all buffers

 <C-]>       Tag function definition
 :tn         nextfunction definition
 <C-t>       pop back from tag
 <C-n>       word compltion
 
 <leader><leader> toggle buffer
 <leader>hs       toggle highlight seach
 <leader>k        grep current directgory
 <leader>n        toggle NERDTree
 <leader>cd       change path to active buffer file
 <leader>cc       comment out line or visual selection block
 <leader>cu       comment out line
 <leader>gb       gitblame
 <leader>gd       gitdiff
 
 [b and ]b       prev and next buffer
 [g and ]g       prev and next git change hulk
 [q and ]q       prev and next quick window
 [w and ]w       prev and next ALE errors
 [on and ]on     on/off the numbers
 [or and ]or     on/off the relative numbers
 
 
 [c and ]c   vimdiff prev and next conflict in change
 do          vimdiff diff obtain
 dp          vimdiff diff put
 
 :CLEAN      cleanup trailing white spaces
 :SudoWrite  write buffer
```
For more information see: https://learnxinyminutes.com/docs/vim/

### GIT

1. Create  ~/.gitconfig.user to store personal information like Name and Email
```
[user]
    email = someuser@example.com
    name = someusername lastname
```
2. Create symlinks and configure other settings

```
 ln -s  ~/dotfiles-local/gitconfig ~/.gitconfig
 ln -s ~/dotfiles-local/gitignore ~/.gitignore
```
If you get merge conflict during pull or rebase:
```
git mergetool
```
Use the following vim commands to merge or edit conflicts:
```
:diffg RE  # get from REMOTE
:diffg BA  # get from BASE
:diffg LO  # get from LOCAL
:wqa       # write and close all the splits
```
Then forward-port local commit to the update upstream HEAD:
```
git commit -add/rm <conflicted-files>
git rebase --continue
```
For more information on how to configure settings see: https://learnxinyminutes.com/docs/git/
