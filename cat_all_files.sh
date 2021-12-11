SCRIPT_DIR=`dirname "${BASH_SOURCE[0]}"`
source "$SCRIPT_DIR/config.sh"

FILES=$(find "${OUTPUT_DIR}" | grep html | grep aao018)
if [ -f ${OUTPUT_CAT_FILE} ]; then
  echo "Error: Output file ${OUTPUT_CAT_FILE} already exists."
  exit 1
fi
while IFS= read -r file; do
  cat ${file} >> ${OUTPUT_CAT_FILE}
done < <(printf '%s\n' "$FILES")