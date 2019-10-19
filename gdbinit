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

# set logging redirect on
# thread apply all where
# thread apply all where
# thread <thread pid#>

# info break
# cond 3 if var=value
# cond 3

# watch --location addr
# info watch
# https://ccrma.stanford.edu/~jos/stkintro/Useful_commands_gdb.html

