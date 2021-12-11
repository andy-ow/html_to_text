# this script is started by main.sh, several times for each main directory
SCRIPT_DIR=`dirname "${BASH_SOURCE[0]}"`
source "$SCRIPT_DIR/config.sh"
# these directory will be processed.
ARTICLES_DIR="$1"
echo "Running process_all_files.sh for directory $ARTICLES_DIR, process $$" >> "$LOG_FILE"

find "$ARTICLES_DIR" | grep "html" | grep -v "Grafika~" | grep -v aao018 > "${INPUT_FILES}_$$"
i=0
while IFS= read -r file; do
    i=$(("$i"+1))
    # shellcheck disable=SC2006
    output=`echo $file | sed "s#$BASE_DIR#$OUTPUT_DIR#g"`.aao018
    echo "$i Process $$, Processing file $file ==> $output" >>"$LOG_FILE"
    if [ ! -f "$output" ]; then
      mkdir -p "$(dirname $output)"
      echo "$output" >> "$OUTPUT_INPUT_FILES"
      python "$SCRIPT_DIR/main.py" "$file" | sed "s#${REMOVE_FOOTER}##g" > "$output" 2>>"$ERROR_FILE"
    fi
done < "${INPUT_FILES}_$$"
