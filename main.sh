MAIN_DIR="/home/andrzej/programowanie/ml/wiki-pl/pl/articles/a/b"
ARTICLE_DIRS=$(find "$MAIN_DIR" -mindepth 1 -maxdepth 1 | grep "wiki-pl")
for DIR in $ARTICLE_DIRS; do
  echo \""$DIR"\"
  ./process_all_files "$DIR" &
done