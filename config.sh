BASE_DIR="/home/andrzej/programowanie/ml/wiki-pl/pl"

# This directory will be processed. It must be a subdirectory of the BASE_DIR.
MAIN_DIR="/home/andrzej/programowanie/ml/wiki-pl/pl/articles/a"



LOGS_DIR="/home/andrzej/programowanie/ml/wiki/logs"
mkdir -p "$LOGS_DIR"
OUTPUT_DIR="/home/andrzej/programowanie/ml/wiki"
INPUT_FILES="$LOGS_DIR/$$_input_all_files.tmp.aao018"
OUTPUT_INPUT_FILES="$LOGS_DIR/$$_output_all_files.tmp.aao018"
ERROR_FILE="$LOGS_DIR/error"
LOG_FILE="$LOGS_DIR/log"