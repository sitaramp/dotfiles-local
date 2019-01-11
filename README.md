### Intro

Quick terminal setup to get started.
Use off the self components and keep tweaks to minimum to reduce maintenance.
These files are modeled after https://github.com/statico/dotfiles

### Installation

1. Launch Zsh:
'zsh

2. Install the  required packages and dependencies
 - fzf
 - enhancd
 - colorls
 - tldr
 - thefuck
 - cht.sh
 - zsh prezto
 - vim janus
 - ripgrep
3. Clone the repository to you home directory:

`git clone --recursive https://github.com/sitaramp/dotfiles-local ~/dotfiles-local

4. Create a new Zsh configuration

5. Set Zsh as you default shell:
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
  - Choose prompt theme to load:

```
   +zstyle ':prezto:module:prompt' theme 'powerlevel9k'
```
4. Some keyboard shortcuts to know:
```
Ctrl + R : reverse command history chooser
Ctrl + T : fuzy directory chooser
cd -     : directory matches down the current directory hirarchy
cd ..    : directory matches up the current directory hirarchy
```

### TMUX

Prefixc is set to "`" backquote
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

Some shortcuts to know:
```
` - prefix key
`prefix + c`      : crete window 
`prefix + #`      : switch to numbered window 
`prefix + Escape` : switch to vi mode
'prefix + d'      : disconnect the session without lossing session 
```

### VIM

1. Install Janus
2. Comments out unused modules in vimrc.before
3. Edit ~/dotfiles-local/vim.after
4. Create symlink ~/.janus to ~/dotfiles-local/janus
5. Install modules not covered by Janus to ~/.janus or
/dotfiles-local/janus using command:

`git submodule add https://github.com/login-name/repo.vim repo.vim`

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

### GIT

1. Create  ~/.gitconfig.user to store personal inforation like Name and Email
2. ``` ln -s  ~/dotfiles-local/gitconfig ~/.gitconfig```
3. ``` ln -s ~/dotfiles-local/gitignore ~/.gitignore```

