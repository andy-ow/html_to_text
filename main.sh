SCRIPT_DIR=`dirname "${BASH_SOURCE[0]}"`
source "$SCRIPT_DIR/config.sh"
ARTICLE_DIRS=$(find "$MAIN_DIR" -mindepth 1 -maxdepth 1 | grep "wiki-pl")
echo $PROCESS_ALL_FILES_SCRIPT
echo "please wait"
while IFS= read -r file; do
  echo \""$file"\"
  "$SCRIPT_DIR/process_all_files.sh" "$file" &
done < <(printf '%s\n' "$ARTICLE_DIRS")
count=`jobs -p | wc -l`
echo "$count jobs running..."
while true; do
  wait -n || {
    code="$?"
    count=`jobs -p | wc -l`
    echo "$count jobs running..."
    ([[ $code = "127" ]] && echo "Done." && exit 0 || exit "$code")
    break
  }
done;