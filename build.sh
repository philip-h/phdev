#!/usr/bin/env bash

WRITING_DIR="writing"
SRC_DIR="src"
DIST_DIR="public"


make_dir_safe() {
  [ -d "$1" ] || mkdir "$1"
}

copy_html() {
  find src -name "*.html" -print0 | while read -d $'\0' file
  do
    path="${file#$SRC_DIR/}"
    folder="$(dirname ${file#$SRC_DIR/})"
    if [[ "$folder" != "$WRITING_DIR" ]]; then
      make_dir_safe "$DIST_DIR/$folder"
      cp "$file" "$DIST_DIR/$path"
    fi
  done
}

setup_writing() {
  make_dir_safe "$DIST_DIR/$WRITING_DIR"
  cp "$SRC_DIR/$WRITING_DIR/index.html" "$DIST_DIR/$WRITING_DIR"
  writing_index="$DIST_DIR/$WRITING_DIR/index.html"

  for file in "$SRC_DIR/$WRITING_DIR/"*.md
  do
    fn="$(basename ${file%%.*})"
    make_dir_safe "$DIST_DIR/$WRITING_DIR/$fn"
    pandoc --template "$SRC_DIR/$WRITING_DIR/tmpl.html" -o "$DIST_DIR/$WRITING_DIR/$fn/index.html" "$file"
  done
}
minify_css() {
  find src -name "*.css" -print0 | while read -d $'\0' file
  do
    path="${file#$SRC_DIR/}"
    folder="$(dirname ${file#$SRC_DIR/})"
    make_dir_safe "$DIST_DIR/$folder"
    npx uglifycss "$file" --output "$DIST_DIR/$path"
  done
}

minify_js() {
  find src -name "*.js" -print0 | while read -d $'\0' file
  do
    path="${file#$SRC_DIR/}"
    folder="$(dirname ${file#$SRC_DIR/})"
    make_dir_safe "$DIST_DIR/$folder"
    npx uglifyjs "$file" --compress --output "$DIST_DIR/$path"
  done
}


main() {
  # Step 0: Create dist folder
  make_dir_safe "$DIST_DIR"

  # Step 1: Just copy over all html not in `writing` folder
  copy_html

  # Step 2: Copy (perhaps in the future, generate) the writing index page
  setup_writing

  # Step 3: Copy and minify the css
  minify_css

  # Step 4: Copy and minify the j
  minify_js

  # TODO-Step 6: Generate a rss feed
}

main
