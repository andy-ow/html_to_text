# Both BASE_DIR and OUTPUT_DIR should either both end with slash / or have both no slash /
BASE_DIR="/home/andrzej/programowanie/ml/wiki-pl/pl"
OUTPUT_DIR="/home/andrzej/programowanie/ml/wiki"


# This directory will be processed. It must be a subdirectory of BASE_DIR. BASE_DIR will be replaced with OUTPUT_DIR.
MAIN_DIR="/home/andrzej/programowanie/ml/wiki-pl/pl/articles/a/a"

# Directory depth. Main dir must have at least $DIRECTORY_DEPTH directory structure. For example MAIN_DIR/a/b/ if DIRECTORY_DEPTH=2.
DIRECTORY_DEPTH=2

# Max number of jobs
MAX_JOBS=16

# For excluded files, see process_all_files.sh script

LOGS_DIR="/home/andrzej/programowanie/ml/wiki/logs"
mkdir -p "$LOGS_DIR"

INPUT_FILES="$LOGS_DIR/input_all_files"
OUTPUT_INPUT_FILES="$LOGS_DIR/output_all_files"
ERROR_FILE="$LOGS_DIR/error"
LOG_FILE="$LOGS_DIR/log"