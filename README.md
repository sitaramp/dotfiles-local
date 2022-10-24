### Introduction

Quick terminal setup to get started.
Use off-the-shelve components and keep local changes to a minimum thus reducing maintenance.
These files are modeled after https://github.com/statico/dotfiles and thoughbot.

### Prerequisites:

1. Launch Zsh:
'zsh

2. Install the  required packages and dependencies:
 - zsh
 - prezto
 - bash-completion: https://github.com/scop/bash-completion
 - vim-plug: https://github.com/junegunn/vim-plug
 - fzf
 - enhancd
 - lsd
 - tldr
 - cargo
 - python3
 - ripgrep
 - ack2
 - fd-find
 - enhancd
 - Universal-ctags
 - cscope
 - git
 - ruby
 - perl
 - App::Ack
 - cht.sh

3. On the client install powerline or nerdfonts. Configure terminal to
   your liking

### Installation
1. Clone the repository to your home directory:

```
git clone --recursive https://github.com/sitaramp/dotfiles-local ~/dotfiles-local
```

2. Set Zsh as your default shell:
```
chsh - /bin/zsh
```
3. Open a new Zsh terminal window or tab

4. Create symlinks
```
ln -s ~/dotfiles/janus ~/.janus
ln -s ~/dotfiles/inputrc ~/.inputrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/global-gitignore ~/.gitignore
ln -s ~/dotfiles/dircolors ~/.dircolors
```

5. Follow more customization below

### Updating:

```
cd $DOTFILES_DIR
git pull
git submodule update --init --recursive
```

### Uninstall
To remove the dotfile configs, run the following commands. Be certain to double check the contents of the files before removing so you don't lose custom settings.
```
unlink ~/.janus
unlink ~/.inputrc
unlink ~/.tmux.conf
unlink ~/.gitignore
unlink ~/.dircolors
rm -rf ~/dotfiles-local
chsh -s /bin/bash # change back to Bash if you want
```
Then open a new terminal window to see the effects.

### Usage and customization
## Some keyboard shortcuts to know:
```
Ctrl + R : reverse command history chooser
Ctrl + T : fuzzy directory chooser
cd -     : directory matches down the current directory hierarchy
cd ..    : directory matches up the current directory hierarchy
```

## Shell Command line
1. Navigation :
- Ctrl + A : Go to beginning of the line
- Ctrl + E : Go to end of the line
-  Alt + F : Go to next word
-  Alt + B : Go to previous work
2. Edit :
- Ctrl + D : Delete word
- Ctrl + W : Delete previous word
-  Alt + D : Delete next word
- Ctrl + - : undo
2. History
- $ secret-command --password 1234qwerty  # oh no! that should not be in my history!
- $ sed -i '/secret-command/d' $HISTFILE  # delete history line containing 'secret-command'
- $  secret-command --password 1234qwerty  # Avoid histort. Notice the space at the start of the command!

## Bash
1. Create symlink to inputrc for command line completion
```
ln -s ~/dotfiles-local/inputrc ~/.inputrc
```

2. Edit ~/.bashrc to:

```
  source ~/dotfiles-local/sensible.bash
  source ~/dotfiles-local/aliases.sh
```

## ZSH

1. Ensure zprezto is installed

2. Edit ~/.zshrc to:

```
  source ~/.zpretzo/runcoms/zshrc
  source ~/dotfiles-local/zshrc.local
  source ~/dotfiles-local/aliases.sh
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

Prefix is set to "``" backquote
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

Some shell shortcuts to know:
```
`back_tick` : prefix key
 `prefix + c`      : crete window
 `prefix + #`      : switch to the numbered window
 `prefix + Escape` : switch to vi mode
 `prefix + d`      : detach the session without lossing session
 `prefix + I`      : Install tmux plugins
 `prefix + U`      : Update tmux plugins
 `prefix + Cltr-r` : Restore closed session
 `atmux`           : aliases to open or re-attack existing session
```

For more information see: https://learnxinyminutes.com/docs/tmux/

### VIM

1. Install vim-plug
2. Comments out unused modules in vim-plug.vim
3. Edit ~/dotfiles-local/vim-plug-after.vim
4. Create symlink ~/.vimrc to ~/dotfiles-local/vim-plug.vim
5. Add modules not covered by existing modules to vim-plug.vim

The \<leader> key is set to \<Space>, it can be changed in file 'vim-plug-before.vim'.
Some handy keyboard shortcut to know:
```
 <F3>        Toggle Numberline
 <F5>        Toggle paste mode
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
For more information see:
http://www.viemu.com/vi-vim-cheat-sheet.gif
https://learnxinyminutes.com/docs/vim/

### GIT


Create and the Add the following to ~/.gitconfig
```
 [include]
    path= ~/dotfiles-local/gitconfig.cfg
```

For each workspace add the following line to ~/.gitconfig
```
 [includeIf "gitdir:/workspace-dir/"]
    path= /workspace-dir/.gitconfig
```

Under each workspace create /your-workspace-dir/.gitconfig
Then add the details specific to that repo
```
[user]
    name = someusername lastname
    email = someusername@users.noreply.github.com
```

2. Create symlinks and configure other settings
See install.sh

## GIT Usage
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
