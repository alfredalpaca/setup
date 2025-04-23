#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

defaultConfigLocation="$HOME"/.gitconfig
repoConfigLocation="$CURRENT_DIR"/.gitconfig
configBackup="$HOME"/.gitconfig.script-bckup

if [[ -L "$defaultConfigLocation" ]]; then
  currLink=$(readlink -f "$defaultConfigLocation")
  if [[ "$currLink" == "$repoConfigLocation" ]]; then
    echo "gitconfig is already symlinked to the config in this repository"
    exit
  else
    echo "gitconfig is already symlinked to: $currLink"
    echo "Do you want to proceed with this setup anyway? This WILL break your previous setup [y/n]"
    read -r res
    if [[ "$res" =~ ^([yY][eE][sS]|[yY])$ ]]; then
      echo "proceeding"
    elif [[ "$res" =~ ^([nN][oO]|[nN])$ ]]; then
      echo "roger. exiting"
      exit 0
    else
      echo "invalid input. exiting"
      exit 1
    fi
  fi
fi

if [[ -f "$defaultConfigLocation" || -L "$defaultConfigLocation" ]]; then
  mv "$defaultConfigLocation" "$configBackup"
  echo "copied gitconfig. gitconfig.script-bckup is in homedir"
fi

ln -s "$repoConfigLocation" "$defaultConfigLocation"
echo "linked $defaultConfigLocation to gitconfig in repo"

"$CURRENT_DIR/create-gituser.sh"
