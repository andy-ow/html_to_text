SCRIPT_DIR=`dirname "${BASH_SOURCE[0]}"`
source "$SCRIPT_DIR/config.sh"
ARTICLE_DIRS=$(find "$MAIN_DIR" -mindepth "$DIRECTORY_DEPTH" -maxdepth "$DIRECTORY_DEPTH" | grep "wiki-pl")
echo $PROCESS_ALL_FILES_SCRIPT
echo "Please wait..."
while IFS= read -r file; do
  echo \""$file"\"
  "$SCRIPT_DIR/process_all_files.sh" "$file" &
  count=`jobs -p | wc -l`
  echo "New job started. $count jobs running."
  if [ "$count" -gt "$MAX_JOBS" ]; then
    wait -n
    echo "One job finished."
  fi
done < <(printf '%s\n' "$ARTICLE_DIRS")
count=`jobs -p | wc -l`
echo "$count jobs running."
echo "Please wait..."
while [ "$count" -ne 0 ]; do
  wait -n #|| {
    code="$?"
    count=`jobs -p | wc -l`
    echo "$count jobs running, please wait..."
    ([[ $code = "127" ]] && echo "Done.")
    #break
  #}
done;
echo "Done."