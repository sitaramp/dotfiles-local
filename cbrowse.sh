#!/bin/zsh -f

if [[ -e /usr/bin/cscope ]]; then
      echo "Found Cscope"
else
      echo "failed to locate cscope DB. please set env using setupcal and symlinks"
      return 1
fi

if [[ -e $PRODUCT_ROOT/cscope.out ]]; then
     echo "Found cscope DB"
     export CSCOPE_DB=$PRODUCT_ROOT
     pushd $PRODUCT_ROOT
else
      echo "failed to locate cscope DB. please set env using setupcal and symlinks"
      return 1
fi

cscope -d -f cscope.out
popd
