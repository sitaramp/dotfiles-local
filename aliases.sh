# Productivity
alias todo='$EDITOR ~/.todo'
alias dotfiles='cd ~/dotfiles-local'

# Git
#alias git='hub'
#alias gs='git status -uno'
#alias gs='git status -sb'
alias gf='git fetch'
# For Git >= 2.25 and latter use --rebase=merges
alias gpr='git pull --rebase=merges'
alias grc='git rebase --continue'
alias gss='git stash save'
alias gsl='git stash list'
alias gl='git log --oneline --decorate -10'


# Quick access
alias s=source
alias dir=ls
#alias path='echo $PATH'
# display path as a much more readable vertical list.
alias path='echo -e ${PATH//:/\\n}'
alias ..='cd ..'
alias apt-get='sudo apt-get'
alias apt-get='sudo apt-get'
#alias path='echo $PATH'
alias tgrep='ag -U \!*'
alias df='/bin/df -h'

#alias du='du -sh -d 2'
#du in rust
#aliase du=dust
alias du='du -x -h --max-depth=1 "$@" | sort -n -r'

ACKBIN=/usr/local/bin/ack

# A quick grep-for-processes.
function ps() { /bin/ps auxf; }
function myps() { /bin/ps -fjH -u "$USER"; }
function ps1() { /bin/ps auxww | $ACKBIN -i --color "$1" | $ACKBIN -v ack; }

# Zippin
function gz() { tar -zcvf "$@"; }
function rm() { /bin/rm -vi "$@"; }
function cp() { /bin/cp -avi "$@"; }
function mv() { /bin/mv -vi "$@" ; }
function mnt() { /bin/mount | column -t "$@" ; }
function netstat() { /bin/netstat -tlnp "$@" ; }
function cls() { clear; /bin/ls; /bin/pwd; }
#unalias grep >/dev/null 2>&1
#function grep() { $ACKBIN --color "$@"; }
#function grepp() { $ACKBIN -P --color "$@"; }
function atmux() { tmux new-session -A -s `hostname`; }
function gcd() { cd "`git rev-parse --show-toplevel`"; }

# check if command exists
_has() {
  return $( type "$1" > /dev/null 2>&1 )
}

# check if colors exist
_color() {
  return $( tput colors )
}

if _has gvim; then
  alias vi='gvim -v -X'
  alias gvim='gvim -v'
fi

unalias ls >/dev/null 2>&1
function ls() { /bin/ls --color=auto -F "$@"; }

# lsd https://github.com/Peltoche/lsd
unalias ll >/dev/null 2>&1
if _has lsd; then
  alias ll='lsd -alhrtF'
  alias llS='lsd -alhrS'
  alias llt='lsd --tree'
else
  function ll()  { /bin/ls -alhrt --color=auto -F "$@"; }
  function llS() { /bin/ls -alhrS --color=auto -F "$@"; }
fi

# show me files matching "ls grep"
function ls1()  { /bin/ls -alht | $ACKBIN --color -i "$1"; }

unalias z 2> /dev/null

# fz
# z [dir name slug]<TAB> #  recent dirs
# zz [dir name slug]<TAB> # limit to current cwd and subdirs
if [ -d ~/.bash_completion.d ]; then
  for file in ~/.bash_completion.d/*; do
        . $file
          done
fi
alias j=z
alias jj=zz

# prefer ripgrep over ack and ag
if _has rg; then
  alias ag=rg
  alias rg='rg --smart-case --colors path:fg:green --colors match:fg:red'
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
elif _has ag; then
  alias ag='ag --color-path 1\;31 --color-match 1\;32 --color'
elif _has ack; then
  if ! _color; then
    alias ack='ack --nocolor'
  fi
fi


# then edit all of the files containng the pattern
if _has rg; then
  vack() {
    vim `rg --color=never -l $@`
  }
elif _has ag; then
  vack() {
    vim `ag --nocolor -l $@`
  }
else
  vack() {
    vim `ack -l $@`
  }
fi

cheat() {
   curl "http://cht.sh/$1"
  }

tldr-web() {
   w3m -dump "https://raw.githubusercontent.com/tldr-pages/tldr/master/pages/common/$1.md"
   w3m -dump "https://raw.githubusercontent.com/tldr-pages/tldr/master/pages/linux/$1.md"
  }

man2txt() {
    man "$1" | col -bx
  }

manflags(){
    man "$1" | awk '{$1=$1;print}' | grep "^\-"
  } #man pages just the flags more or less, captures some extra

ubuman() {
   w3m -dump "https://manpages.ubuntu.com/manpages/$(lsb_release -cs)/en/man1/"$1".1.html"
  } # ubuntu web manpages note bionic, update with do release up

ubumanflags() {
   w3m -dump "https://manpages.ubuntu.com/manpages/$(lsb_release -cs)/en/man1/$1.1.html" | \
   awk '{$1=$1;print}' | grep "^\-"
  } # ubuntu web manpages

explain () {
    if [ "$#" -eq 0 ]; then
      while read  -p "Command: " cmd; do
        curl -Gs "https://www.mankier.com/api/v2/explain/?cols="$(tput cols) --data-urlencode "q=$cmd"
      done
      echo "Bye!"
    elif [ "$#" -eq 1 ]; then
      curl -Gs "https://www.mankier.com/api/v2/explain/?cols="$(tput cols) --data-urlencode "q=$1"
    else
      echo "Usage"
      echo "explain                  interactive mode."
      echo "explain 'cmd -o | ...'   one quoted command to explain it."
    fi
  }
# notetoself: check ```info``` check ```help``` check ```apropos``` check ```whatis```
