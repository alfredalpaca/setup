#!/bin/bash

# Change this accordingly if shell is not zsh
RC_FILE=$HOME/.zshrc

VERSION=v1
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ALIAS_DIR=`realpath $CURRENT_DIR/aliases`
ENV_DIR=`realpath $CURRENT_DIR/env-vars`

# Function for adding alias and env var files to rc file
# Arg 1: file to add
# Arg 2: name of the file
add_to_rc_file () {
  if [ -d $1 ]
    then
      for f in $1/*; do
        add_to_rc_file $f `basename $f`
      done
    else
      if [ -f $RC_FILE ] && grep "\"$1\" #$VERSION" $RC_FILE
        then echo "$2 all good."
        else
          set -x
          echo "source \"$1\" #$VERSION" >> $RC_FILE
          echo "added $2."
          set +x
      fi
  fi
}

add_to_rc_file $ALIAS_DIR
add_to_rc_file $ENV_DIR
