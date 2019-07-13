#!/bin/bash

#
# Script to browse existing cscope.db
#

if [[ -e /usr/bin/cscope ]]; then
      echo "Found cscope binary"
else
      echo "Failed to local cscope. Please install cscope."
      exit 1
fi

if [[ -e $CSCOPE_ROOT/cscope.out ]]; then
     echo "Found cscope DB"
else
      echo "Failed to locate cscope DB. Please setup project env and run gentags"
      exit 1
fi

pushd . ; cd $CSCOPE_ROOT
export CSCOPE_DB=$CSCOPE_ROOT
export CSCOPE_EDITOR=vim

cscope -d -f cscope.out
popd
