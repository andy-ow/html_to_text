SCRIPT_DIR=`dirname "${BASH_SOURCE[0]}"`
source "$SCRIPT_DIR/config.sh"
ARTICLE_DIRS=$(find "$MAIN_DIR" -mindepth "$DIRECTORY_DEPTH" -maxdepth "$DIRECTORY_DEPTH" | grep "wiki-pl")
echo "$ARTICLE_DIRS" > "${LOG_FILE}_article_list"
echo $PROCESS_ALL_FILES_SCRIPT
echo "Please wait..."
while IFS= read -r file; do
  echo \""$file"\"
  "$SCRIPT_DIR/process_all_files.sh" "$file" &
  echo "New job started."
  count=`jobs -p | wc -l`
  while [ $count -gt ${MAX_JOBS} ]; do
    wait -n
    count=`jobs -p | wc -l`
    echo "$count jobs running."
  done
done < <(printf '%s\n' "$ARTICLE_DIRS")
count=1
while [ "$count" -ne 0 ]; do
  echo "Please wait..."
  count=`jobs -p | wc -l`
  echo "$count jobs running."
  wait -n
done;
echo "Done."