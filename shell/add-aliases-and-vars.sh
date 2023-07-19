#!/bin/bash

# Change this accordingly if shell is not zsh
RC_FILE=$HOME/.zshrc

VERSION=v1
# For how the below line works: https://stackoverflow.com/questions/39340169/dir-cd-dirname-bash-source0-pwd-how-does-that-work
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Path to this file
SELF_PATH=$(realpath "$CURRENT_DIR"/add-aliases-and-vars.sh)

# Function for adding alias and env var files to rc file
# Arg 1: file to add - if it is a directory, function will be recursively called for everything in it
add_to_rc_file () {
  FILENAME=$(basename "$1")
  if [ -d "$1" ]
    then
      echo "DIR: $1"
      for f in "$1"/*; do
        add_to_rc_file "$f"
      done
    else
      if [ "$1" == "$SELF_PATH" ]; then
          echo "skipping $FILENAME"
          printf "\n"
          return 0
      fi
      if [ -f "$RC_FILE" ] && grep "\"$1\" #$VERSION" "$RC_FILE"
        then echo "$FILENAME all good."
        else
          echo "source \"$1\" #$VERSION" >> "$RC_FILE"
          echo "added $FILENAME."
      fi
      printf "\n"
  fi
}

add_to_rc_file "$CURRENT_DIR"
