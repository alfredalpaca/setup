#!/bin/bash

if [ -f "$HOME"/.gitconfig ]
  then mv "$HOME"/.gitconfig "$HOME"/.gitconfig.bckup
  echo "copied gitconfig. gitconfig.bckup is in homedir"
fi

ln -s ~/src/setup/.gitconfig ~/.gitconfig
