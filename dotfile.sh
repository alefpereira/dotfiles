#!/bin/bash

## Add file to repository
## input: FILE_PATH, DOTFILES_PATH

FILE_PATH=$1
echo "File:" $FILE_PATH

DOTFILES_PATH=$HOME/dotfiles

RELATIVE_PATH=$(realpath -se $FILE_PATH --relative-to=$HOME)
echo "RELATIVE_PATH="$RELATIVE_PATH

FILENAME=$(basename $RELATIVE_PATH)
DIR_PATH=$(dirname $RELATIVE_PATH)

OUT_DIR="$DOTFILES_PATH/$DIR_PATH"

echo "FILENAME="$FILENAME
echo "DIR_PATH="$DIR_PATH
echo "DOTFILES_PATH="$DOTFILES_PATH
echo "OUT_DIR="$OUT_DIR

## Check if dotfiles DESTINE_FILE already exists. Skip file in that case.
DESTINE_FILE=$OUT_DIR/$FILENAME
echo "Destine file:" $DESTINE_FILE
if test -e "$DESTINE_FILE";
then
    echo "Already in version control. Exiting..."
    exit 1
fi

## prepare dotfiles directory tree
mkdir -p $OUT_DIR

## copy original file to dotfiles tree
cp $FILE_PATH "$OUT_DIR/$FILENAME"

### Apply ###
## create backup
mv $FILE_PATH $FILE_PATH.backup

## create link
ln -s "$OUT_DIR/$FILENAME" "$HOME/$DIR_PATH"
### End Apply ###

echo "Done."
