#!/bin/bash

# validate project root

if ! [ -f "$CSCOPE_ROOT/DartCommon.mk" ];  then
      echo "$0 failed: Failed to find Project directory Please setup projeuct dir"
      exit 1
fi

pushd . ; cd $CSCOPE_ROOT

# Generate ctags
# vim sttings
#    set tags+=$CSCOPE_ROOT/tags,tags
ctags -R --extras=+q .

# Generate cscope DB
CSCOPE_DIR="$CSCOPE_ROOT/cscope"

if [ ! -d "$CSCOPE_DIR" ]; then
mkdir "$CSCOPE_DIR"
fi

echo "Finding files ..."
find "$CSCOPE_ROOT" -name '*.[ch]' \
-o -name '*.java' \
-o -name '*properties' \
-o -name '*.cpp' \
-o -name '*.cxx' \
-o -name '*.cc' \
-o -name '*.hpp' \
-o -name '*.hxx' \
-o -name '*.py' \
-o -name '*.php' > "$CSCOPE_DIR/cscope.files"

echo "Adding files to cscope db: $CSCOPE_ROOT/cscope.db ..."
cscope -b -u -C -i "$CSCOPE_DIR/cscope.files"

export CSCOPE_DB="$CSCOPE_ROOT/cscope.out"
echo "Exported CSCOPE_DB to: '$CSCOPE_DB'"
popd
