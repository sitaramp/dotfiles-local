# Sensible Bash - An attempt at saner Bash defaults
# Maintainer: mrzool <http://mrzool.cc>
# Repository: https://github.com/mrzool/bash-sensible
# Version: 0.2.2

# prereqs: install bash-completion bash-completion-extra

# Unique Bash version check
if ((BASH_VERSINFO[0] < 4))
then 
  echo "sensible.bash: Looks like you're running an older version of Bash." 
  echo "sensible.bash: You need at least bash-4.0 or some options will not work correctly." 
  echo "sensible.bash: Keep your software up-to-date!"
fi

# Stop here if this is a non-interactive shell
[ -z "$PS1" ] && return

## GENERAL OPTIONS ##

# Prevent file overwrite on stdout redirection
# Use `>|` to force redirection to an existing file
set -o noclobber

# Update window size after every command
shopt -s checkwinsize

# Automatically trim long paths in the prompt (requires Bash 4.x)
PROMPT_DIRTRIM=2

# Enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space

# Turn on recursive globbing (enables ** to recurse all directories)
shopt -s globstar 2> /dev/null

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

## SMARTER TAB-COMPLETION (Readline bindings) ##

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"

## SANE HISTORY DEFAULTS ##

# Append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Record each line as it gets issued
PROMPT_COMMAND='history -a'

# Huge history. Doesn't appear to slow things down, so why not?
HISTSIZE=500000
HISTFILESIZE=100000

# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
HISTTIMEFORMAT='%F %T '

# Enable incremental history search with up/down arrows (also Readline goodness)
# Learn more about this here: http://codeinthehole.com/writing/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

## BETTER DIRECTORY NAVIGATION ##

# Prepend cd to directory names automatically
shopt -s autocd 2> /dev/null
# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null
# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null

# This defines where cd looks for targets
# Add the directories you want to have fast access to, separated by colon
# Ex: CDPATH=".:~:~/projects" will look for targets in the current working directory, in home and in the ~/projects folder
CDPATH="."

# This allows you to bookmark your favorite places across the file system
# Define a variable containing a path and you will be able to cd into it regardless of the directory you're in
shopt -s cdable_vars

# Overridable locale support.
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# fzf
export FZF_COMPLETION_TRIGGER=''

# Infinite bash history
export HISTSIZE=
export HISTFILESIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# Force prompt to write history after every command.
export HISTFILE=~/.bash_eternal_history
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Prompt
#\u - user name
#\h - short hostname
#\W - current working dir
#\? - exit status of the command
#export PS1="{\[\e[32m\]\u\[\e[m\]@\[\e[36m\]\h\[\e[m\]:\W_\$?}$ "
export PS1="\[$(tput setaf 2)\]\u@\h:\w $ \[$(tput sgr0)\]"

# Examples:
# export documents="$HOME/Documents"
# export dropbox="$HOME/Dropbox"
 export dotfiles="$HOME/dotfiles-local"
 export projects="/c4_working/"
 export downloads="$HOME/Downloads"

# fzf
if [[ -f ~/.fzf.bash ]]; then
#   source ~/.fzf.bash
#  export FZF_TMUX=1
#  export FZF_TMUXHEIGHT=50%
   export FZF_DEFAULT_COMMAND='fd --type file'
   export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
   export FZF_COMPLETION_TRIGGER=''
fi

# enhancd
if [[ -f ~/enhancd/init.sh ]]; then
#   source ~/enhancd/init.sh
   export ENHANCD_FILTER=fzy:fzf:peco
   export ENHANCD_DISABLE_DOT=1
   export ENHANCD_DISABLE_HYPHEN=1
   export ENHANCD_COMPLETION_BEHAVIOR=history
fi
