# Both BASE_DIR and OUTPUT_DIR should either both end with slash / or have both no slash /
BASE_DIR="/home/andrzej/programowanie/ml/wiki-pl/pl"
OUTPUT_DIR="/home/andrzej/programowanie/ml/wiki"

OUTPUT_CAT_FILE="${OUTPUT_DIR}/wikipedia_pl_2008_without_Grafika.txt"

# This directory will be processed. It must be a subdirectory of BASE_DIR. BASE_DIR will be replaced with OUTPUT_DIR. It must contain subdirectories, at least DIRECTORY_DEPTH deep.
MAIN_DIR="/home/andrzej/programowanie/ml/wiki-pl/pl/articles"

# Directory depth. Main dir must have at least $DIRECTORY_DEPTH directory structure. For example MAIN_DIR/a/b/ if DIRECTORY_DEPTH=2.
DIRECTORY_DEPTH=2

# Max number of jobs.
MAX_JOBS=16

# The following strings will be removed from files, with sed. For excluded files, see process_all_files.sh script
REMOVE_FOOTER="tekst udostępniany na licencji gnu free documentation license . (patrz: prawa autorskie ) wikipedia® jest zarejestrowanym znakiem towarowym wikimedia foundation . możesz przekazać dary pieniężne fundacji wikimedia . o wikipedii informacje prawne"
REMOVE_FOOTER2="views wikipedysta dyskusja aktualna wersja nawigacja strona główna kategorie artykułów bieżące wydarzenia losuj stronę zmiany zgłoś błąd zgłoś złą grafikę częste pytania (faq) kontakt z wikipedią wspomóż fundację dla edytorów ostatnie zmiany zasady edycji pomoc portal wikipedystów szukaj ostatnia edycja tej strony"
REMOVE_REDIRECT="redirecting to"

LOGS_DIR="/home/andrzej/programowanie/ml/wiki/logs"
mkdir -p "$LOGS_DIR"

INPUT_FILES="$LOGS_DIR/input_all_files"
SKIPPED_FILES="$LOGS_DIR/skipped_files"
ERROR_FILE="$LOGS_DIR/error"
LOG_FILE="$LOGS_DIR/log"