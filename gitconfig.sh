#!/bin/bash

if [ -f $HOME/.gitconfig ]
  then mv $HOME/.gitconfig $HOME/.gitconfig.bckup
fi

cp ./.gitconfig $HOME
