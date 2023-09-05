
# validate project root

if ! [ -f "$TAGS_ROOT/DartCommon.mk" ];  then
      echo "$0 failed: Failed to find Project directory Please setup project dir"
      exit 1
fi

pushd . ; cd $TAGS_ROOT

# Generate ctags
# vim sttings
#    set tags+=$TAGS_ROOT/tags,tags
ctags -R --extras=+q .

# Generate file list
export TAGS_DIR="$TAGS_ROOT/.tags_root"
if [ ! -d "$TAGS_DIR" ]; then
mkdir "$TAGS_DIR"
fi

echo "Finding files ..."
find "$TAGS_ROOT" -name '*.[ch]' \
-o -name '*.java' \
-o -name '*properties' \
-o -name '*.cpp' \
-o -name '*.cxx' \
-o -name '*.cc' \
-o -name '*.hpp' \
-o -name '*.hxx' \
-o -name '*.py' \
-o -name '*.php' > "$TAGS_DIR/cscope.files"

# Generate cscope DB
echo "Generating cscope db: $TAGS_ROOT/cscope.db ..."
cscope -b -q -u -C -i "$TAGS_DIR/cscope.files"

export CSCOPE_DB="$TAGS_ROOT/cscope.out"
echo "CSCOPE_DB is set to $CSCOPE_DB"

#Generate gtags
echo "Generating gtags db: $TAGS_ROOT/GTAGS ..."
export GTAGSFORCECPP=1
gtags --accept-dotfiles -c -f "$TAGS_DIR/cscope.files"
export GTAGS_DB="$TAGS_ROOT/GTAGS"
echo "CSCOPE_DB is set to $GTAGS_DB"
popd
