#!/bin/bash

if [ -f $HOME/.gitconfig ]
  then mv $HOME/.gitconfig $HOME/.gitconfig.bckup
	echo "copied gitconfig. gitconfig.bckup is in homedir"
fi

# cp ./.gitconfig $HOME
ln -s ~/src/setup/.gitconfig ~/.gitconfig
