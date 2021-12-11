# this script is started by main.sh, several times for each main directory
SCRIPT_DIR=`dirname "${BASH_SOURCE[0]}"`
source "$SCRIPT_DIR/config.sh"
# these directory will be processed.
ARTICLES_DIR="$1"
find "$ARTICLES_DIR" | grep "html" | grep -v aao018 > "$INPUT_FILES"
i=0
while IFS= read -r file; do
    i=$(("$i"+1))
    # shellcheck disable=SC2006
    output=`echo $file | sed "s#$BASE_DIR#$OUTPUT_DIR#g"`.aao018
    echo "$i Processing file $file" >>"$LOG_FILE"
    if [ ! -f "$output" ]; then
      mkdir -p "$(dirname $output)"
      echo "$output" >> "$OUTPUT_INPUT_FILES"
      python main.py "$file">"$output" 2>>"$ERROR_FILE"
    fi
done < "$INPUT_FILES"
