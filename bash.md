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
``

### Command line enditing
```
Ctrl+a    # move cursor to start
Alt+b     # move cursor back
Alt+f     # move cursor forward
Alt+d     # delete word
Ctrl+w    # delete word+space
Ctrl+y    # paste delete word
Ctrl+e    # move cursor to end
```

###  Command line re-use
```
!!     # repeat last command
cd -   # change to last directory
cd     # change to home dir
Ctr+r  # recall command history
Ctr+d  # logout
Ctrl-l # clear terminal
```

### Stream redirection
```
>    # redirect stdout
2>&1 # redirect both stdout and stderr
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

###  find, grep awk and sed
```
fd  # fd-find find replacement
rg  # ripgrep grep replacement
```
