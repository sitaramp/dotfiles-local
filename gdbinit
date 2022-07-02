set environment HISTSIZE 1000000
set history filename ~/.gdb_history
set history save on
set history size 1000000
set history expansion on
show history
set print pretty on
set print static off
set output-radix 16
set pagination off
set logging off
set height 0
set filename-display basename
set max-value-size unlimited


# https://sourceware.org/gdb/onlinedocs/gdb/Logging-Output.html
set logging file /opt/sdnas/config/sitaram-gdb.txt
set logging overwrite on
set logging on
# set logging redirect on
show logging

# target core <path/to/core_file>
# file cdx.so
# set sysroot .

# set solib-search-path  ./sdnas/csx_pkg.dir/ulib:./sdnas/csx_pkg.dir:./sdnas
# set solib-search-path  ./csx_pkg.dir/ulib:./csx_pkg.dir:./lib64
# set substitute-path  /home/jenkins-build/workspace/SDNas_corsica-buildall/ /c4_working/corsica-ufs64

# breakpoints
# break function | linenum
# break ... if condition==true
#info breakpoints

# set var variable_name=newval
# tbreak +1          # set break before jump
# jump +1            # jump over not executed
# skip function_name # always execute w/o break/steps


# watchpoints stops execution whenever that value of an expression changes
#watch expr
#watch *addr
#info watchpoints

# Display summary of all threads
# info threads
# Get thread info, switch and bt all
# thread apply all where

# Switch to thread <threadno>
# thread                              # info on current thread
# thread <num>                        # switch to thread
# thread <thread pid#>
# thread apply <threadno> where
# thread apply 100-200 where
# http://www.sourceware.org/gdb/current/onlinedocs/gdb/Threads.html

# info break
# cond 3 if var==value
# cond 3

# watch --location addr
# info watch
# https://ccrma.stanford.edu/~jos/stkintro/Useful_commands_gdb.html

# Disassembly
#(gdb) layout asm
#(gdb) layout split 
#(Gdb) layout regs

# make a function call
# print (int) getSplCount()
