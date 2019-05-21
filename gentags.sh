#!/bin/bash

# validate project root

if ! [ -f "$CALAVERAS_DIR/DartCommon.mk" ];  then
      echo "$0 failed: Failed to find Project directory Please setup projeuct dir"
      exit 1
fi

pushd . ; cd $CALAVERAS_DIR

# Generate ctags
ctags -R .

# Generate cscope DB
CSCOPE_DIR="$CALAVERAS_DIR/cscope"

if [ ! -d "$CSCOPE_DIR" ]; then
mkdir "$CSCOPE_DIR"
fi

echo "Finding files ..."
find "$CALAVERAS_DIR" -name '*.[ch]' \
-o -name '*.java' \
-o -name '*properties' \
-o -name '*.cpp' \
-o -name '*.cxx' \
-o -name '*.cc' \
-o -name '*.hpp' \
-o -name '*.hxx' \
-o -name '*.py' \
-o -name '*.php' > "$CSCOPE_DIR/cscope.files"

echo "Adding files to cscope db: $CALAVERAS/cscope.db ..."
cscope -b -u -C -i "$CSCOPE_DIR/cscope.files"

export CSCOPE_DB="$CALAVERAS_DIR/cscope.out"
echo "Exported CSCOPE_DB to: '$CSCOPE_DB'"
popd
