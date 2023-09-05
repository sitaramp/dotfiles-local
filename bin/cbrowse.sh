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

if [[ -e $CSCOPE_DB ]]; then
     echo "Found cscope DB"
else
      echo "Failed to locate cscope DB. Please setup project env and run gentags"
      exit 1
fi

pushd . ; cd $TAGS_ROOT
export CSCOPE_EDITOR=vim

if [[ -e $GTAGS_DB ]]; then
      gtags-cscope -d
else
      cscope -d -f cscope.out
fi
popd
