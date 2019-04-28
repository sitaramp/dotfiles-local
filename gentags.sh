#!/bin/bash

# validate project root

if ! [ -f "$PWD/DartCommon.mk" ];  then
      echo "$0 failed: Wrong current directory. First cd to Dart directory"
      exit 1
fi

# Generate ctags
ctags -R .

# Generate cscope DB
CSCOPE_DIR="$PWD/cscope"

if [ ! -d "$CSCOPE_DIR" ]; then
mkdir "$CSCOPE_DIR"
fi

echo "Finding files ..."
find "$PWD" -name '*.[ch]' \
-o -name '*.java' \
-o -name '*properties' \
-o -name '*.cpp' \
-o -name '*.cxx' \
-o -name '*.cc' \
-o -name '*.hpp' \
-o -name '*.hxx' \
-o -name '*.py' \
-o -name '*.php' > "$CSCOPE_DIR/cscope.files"

echo "Adding files to cscope db: $PWD/cscope.db ..."
cscope -b -i "$CSCOPE_DIR/cscope.files"

export CSCOPE_DB="$PWD/cscope.out"
echo "Exported CSCOPE_DB to: '$CSCOPE_DB'"
