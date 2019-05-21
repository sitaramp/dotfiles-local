#!/bin/zsh -f
#
# Script to browse existing cscope.db
#

if [[ -e /usr/bin/cscope ]]; then
      echo "Found Cscope"
else
      echo "failed to locate cscope DB. please set env using setupcal and symlinks"
      return 1
fi

     pushd .; cd $CALAVERAS_DIR

if [[ -e $CALAVERAS_DIR/cscope.out ]]; then
     echo "Found cscope DB"
     export CSCOPE_DB=$CALAVERAS_DIR
else
      echo "failed to locate cscope DB. please set env using setupcal and symlinks"
      return 1
fi
export CSCOPE_EDITOR=vim

cscope -d -f cscope.out
popd
