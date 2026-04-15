### Know the system

```
id                # know your self
w                 # who is logged in
lsblk             # list block storage devices
lscpu             # list CPU info
lstopo            # list hardware topology
free -g           # free and used memory
uptime            # uptime
lsb_release -a    # distro info
```

### Know the processes

```
ps                  # process list
pstree              # process tree list
top, htop, atop     # top cpu consumer
kill <pid>          # kill pid
```
### Know the ports

```
netstat -lntp                      # LISTEN and CONNECTED ports
ss      -plat                      # -u for udp
lsof    -iTCP -sTCP:LISTEN -p -n   # MacOS
```


### Working with files

```
cat states.txt
less /etc/ntp.conf
tail -f # watch file growing live

# Multiline output to a file "Here document"
cat <<EOF
input 
on multiple lines
EOF

```

### Bunary files

```
strings  # print the printable strings of file
od       # octal format
cmp      # compare byte by byte
```

### Text files

```
comm   # sorted files line by line
diff   # differences line by line

```

### Internet

```
curl -O http://www.gutenburg.com/files/4300/4300-0.txt
curl ifconfig.me  # quickly find my IP
wget http://www.gutenburg.com/files/4300/4300-0.txt
```

### Command line enditing

```
# Cursore movements
Ctrl+a    # jump cursor to start of the line
Alt+b     # move cursor back
Alt+f     # move cursor forward
Ctrl+e    # jump cursor to end of the line

# Cut and paste
Alt+d     # delete word
Ctrl+w    # delete word + space
Ctrl+u    # delete to the begining of line
Ctrl+y    # paste delete word
```

###  Command line re-use

```
!!     # repeat last command
cd -   # change to last directory
cd     # change to home dir
Ctr+r  # recall command history
Ctr+d  # logout
Ctrl-l # clear screen
```

### Stream redirection

```
>    # redirect stdout
2>&1 # redirect both stdout and stderr
command |& tee file.log # log both stdout and stderr
```

### Pipes

```
# stdout and stdin
free -m | grep Mem:  |  awk  '{print 4}'

# command that don't take stdin
find . -name '*.py' | xargs grep some_function
find . -name '*.html' | xarg mv {} web /

# Execute commands in parallel, same as xarg
find . -name '*.html' | parallel mv {} web /
```
# find and execute
fd -e zst -x sh -c 'cd "$1" && tar --zstf -xf "{/}"' sh {//}


###  find, grep awk and sed
# lines before and after match
grep -B 3 -A 2 foo /path/to/file
# lines not matching or invert
grep -v foo /path/to/file
```
fd  # fd-find find replacement
rg  # ripgrep grep replacement
```
# Script
set -e # stop on err
set -x # debug
set -u # fail if unset var is used
set -o # ?
use shellcheck

# Background process
Ctrl-z # suspend the process
bg     # resume in the background 
disown # detach from the shell

# Copy files
rsync -auvhP username@host:/pathname/ /pathname

# More Command line hacks
https://github.com/onceupon/Bash-Oneliner

# On the laptop ~/.ssh/config
Host jumpbox
  HostName jumpbox-ip-addr
  User root
  IdentityFile ~/.ssh/id_rsa
Host devvm
  HostName  devvm-ip-addr
  User username
  IdentityFile ~/.ssh/id_rsa
  Localforward 5900 localhost:5900
Host testhost-1
  Hostname testhost-1
  User root
  IdentityFile ~/.ssh/id_rsa
  ProxyJump jumpbox

# On testhost-1 add two entries to ~/.ssh/config
Host jumpbox
  HostName jumpbox-ip-addr
  User usename
  IdentityFile ~/.ssh/id_rsa
Host devvm
  HostName devvm-ip-addr
  User username
  IdentityFile ~/.ssh/id_rsa
  ProxyJump jumpbox


