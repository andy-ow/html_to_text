LOGS_DIR="/home/andrzej/programowanie/ml/wiki/logs"
OUTPUT_DIR="/home/andrzej/programowanie/ml/wiki"
BASE_DIR="/home/andrzej/programowanie/ml/wiki-pl/pl"
#ARTICLES_DIR="/home/andrzej/programowanie/ml/wiki-pl/pl/articles/a/b"
ARTICLES_DIR="$1"
INPUT_FILES="$LOGS_DIR/$?_input_all_files.tmp.aao018"
OUTPUT_INPUT_FILES="$LOGS_DIR/$?_output_all_files.tmp.aao018"
ERROR_FILE="$LOGS_DIR/error"
find "$ARTICLES_DIR" | grep "html" | grep -v aao018 > "$INPUT_FILES"
i=0
while IFS= read -r file; do
    i=$(("$i"+1))
    # shellcheck disable=SC2006
    output=`echo $file | sed "s#$BASE_DIR#$OUTPUT_DIR#g"`.aao018
    echo "$i Processing file $file"
    if [ ! -f "$output" ]; then
      mkdir -p "$(dirname $output)"
      echo "$output" >> "$OUTPUT_INPUT_FILES"
      python main.py "$file">"$output" 2>>"$ERROR_FILE"
    fi
done < "$INPUT_FILES"
