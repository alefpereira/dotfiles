#!/bin/bash

# Defaults
NOEXEC_MODE=false
VERBOSE_MODE=false

DEFAULT_DOTFILE_PATH="$HOME/dotfile"
DOTFILEWD=${DOTFILE_PATH:-$DEFAULT_DOTFILE_PATH}

DOTFILE_VERSION="v0.1"

function dotfile_usage {
  cat << EOF
Usage: dotfile [OPTIONS]... <COMMAND> [<ARGS>]
Manage dotfiles

Commands:
  add             add a file to be tracked
  apply           apply a tracked file to the real path
  tree            list tree of tracked files
  remove          run 'apply' and remove a file from the repository

Options:
  -n, --noexec    do NOT execute any file changes; useful for testing
  -V, --verbose   show detailed logs
  -d, --debug     debug mode; equivalent to -nV
  -h, --help      shows this help
  -v, --version   show version

Example:
  dotfile
EOF
  exit 1
}

#} getopt options
SHORT_OPTS="nVdhv"
LONG_OPTS="noexec,verbose,debug,help,version"

function dotfile_add_usage {
  cat << EOF
dotfile add

Usage: dotfile add [OPTIONS]... <FILE> [<DESTINATION>]
EOF
  exit 1
}

function dotfile_apply_usage {
  cat << EOF
dotfile apply

Usage: dotfile apply [OPTIONS]... <FILE> [<DESTINATION>]
EOF
  exit 1
}

function dotfile_tree_usage {
  cat << EOF
dotfile tree

Usage: dotfile tree [OPTIONS]... [<DESTINATION>]
EOF
  exit 1
}

function dotfile_remove_usage {
  cat << EOF
dotfile remove

Usage: dotfile remove [OPTIONS]... <FILE> [<DESTINATION>]
EOF
  exit 1
}

function dotfile_version {
  echo "dotfile $DOTFILE_VERSION"
  exit 0
}

function not_dotfile_command {
  cat << EOF
dotfile: '$1' is not a dotfile command. See 'dotfile --help'.

Commands supported:
  add
  apply
  tree
  remmove
EOF
  exit 1
}

function dotfile_add {
  dotfile_add_usage
}

function dotfile_apply {
  dotfile_apply_usage
}

function dotfile_tree {
    echo "PWD: $(pwd)"
    echo "DOTFILEWD: $DOTFILEWD"
  (git ls-tree -r --name-only HEAD &> /dev/null) && (
    git ls-tree -r --name-only HEAD | tree --fromfile
  ) || (
    echo "dotfile: Error in git command. Falling back to 'tree'."
    tree -a
    exit 1
  )
}

function dotfile_remove {
  dotfile_remove_usage
}

function dotfile_print_vars {
  echo "NOEXEC_MODE           : $NOEXEC_MODE"
  echo "VERBOSE_MODE          : $VERBOSE_MODE"
  echo "DOTFILE_PATH (global) : $DOTFILE_PATH"
  echo "DEFAULT_DOTFILE_PATH  : $DEFAULT_DOTFILE_PATH"
  echo "DOTFILE_WORKING_DIR   : $DOTFILEWD"
  echo "DOTFILE_VERSION       : $DOTFILE_VERSION"
}

# Parse params with getopt
PARSED_PARAMS=$(getopt -n "dotfile" -o $SHORT_OPTS -l $LONG_OPTS -- "$@")

# Check last command (getopt params parsing) executed without error.
VALID_PARAMS=$?
if [ ! $VALID_PARAMS -eq 0 ]; then # 0 is ok, other than that is error
    dotfile_usage
fi

echo "PARSED_PARAMS: $PARSED_PARAMS"

# Loop over getopt parsed params
eval set -- "$PARSED_PARAMS"
while :
do
  case "$1" in
    -n | --noexec  ) NOEXEC_MODE=true  ; shift ;;
    -V | --verbose ) VERBOSE_MODE=true ; shift ;;
    -d | --debug   ) NOEXEC_MODE=true  ;
                     VERBOSE_MODE=true ; shift ;;
    -h | --help    ) dotfile_usage     ;       ;;
    -v | --version ) dotfile_version   ;       ;;
    --) shift; break ;;
  esac
done

dotfile_print_vars

# Command
case "$1" in
  add    ) dotfile_add         $2 ;;
  apply  ) dotfile_apply       $2 ;;
  tree   ) dotfile_tree        $2 ;;
  remove ) dotfile_remove      $2 ;;
  ''     ) dotfile_usage          ;;
  *      ) not_dotfile_command $1 ;;
esac

echo "Positional Parameters: $@"
exit 1




# Add file to repository
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

## ## prepare dotfiles directory tree
## mkdir -p $OUT_DIR
##
## ## copy original file to dotfiles tree
## cp $FILE_PATH "$OUT_DIR/$FILENAME"
##
## ### Apply ###
## ## create backup
## mv $FILE_PATH $FILE_PATH.backup
##
## ## create link
## ln -s "$OUT_DIR/$FILENAME" "$HOME/$DIR_PATH"
## ### End Apply ###

echo "Done."
