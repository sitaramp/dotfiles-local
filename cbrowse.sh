#!/bin/zsh -f

if [[ -e /usr/bin/cscope ]]; then
      echo "Found Cscope"
else
      echo "failed to locate cscope DB. please set env using setupcal and symlinks"
      return 1
fi

if [[ -e $CALAVERAS_DIR/cscope.out ]]; then
     echo "Found cscope DB"
     export CSCOPE_DB=$CALAVERAS_DIR
     pushd $CALAVERAS_DIR
else
      echo "failed to locate cscope DB. please set env using setupcal and symlinks"
      return 1
fi

cscope -d -f cscope.out
popd
