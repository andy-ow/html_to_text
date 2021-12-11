# this script is started by main.sh, several times for each main directory
# This script uses beautifulsoup to get text from html files.
#

SCRIPT_DIR=`dirname "${BASH_SOURCE[0]}"`
source "$SCRIPT_DIR/config.sh"
# these directory will be processed.
ARTICLES_DIR="$1"
echo "Running process_all_files.sh for directory $ARTICLES_DIR, process $$" >> "${LOG_FILE}_dir_list"

find "$ARTICLES_DIR" | grep "html" | grep -v "Grafika~" | grep -v aao018 > "${INPUT_FILES}_$$"
cat "${INPUT_FILES}_$$" >> ${INPUT_FILES}
i=0
while IFS= read -r file; do
    i=$(("$i"+1))
    # shellcheck disable=SC2006
    output=`echo $file | sed "s#$BASE_DIR#$OUTPUT_DIR#g"`.aao018
    if [ ! -f "$output" ]; then
      mkdir -p "$(dirname $output)"
      echo "$i Process $$, Processing file $file ==> $output" >>"$LOG_FILE"
      python "$SCRIPT_DIR/main.py" "$file" | sed "s#${REMOVE_FOOTER}##g" | sed "s#${REMOVE_FOOTER2}##g" | sed "s#${REMOVE_REDIRECT}##g"> "$output" 2>>"$ERROR_FILE"
    else
      echo "Process $$, Skipped file $file" >> "$SKIPPED_FILES"
    fi
done < "${INPUT_FILES}_$$"
rm "${INPUT_FILES}_$$"