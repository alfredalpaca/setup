#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

defaultConfigLocation="$HOME"/.gitconfig
repoConfigLocation="$CURRENT_DIR"/.gitconfig
configBackup="$HOME"/.gitconfig.bckup

if [ -h "$defaultConfigLocation" ];
then
  currLink=$(readlink -f "$defaultConfigLocation")
  echo "gitconfig is already symlinked to: $currLink"
  echo "Do you want to proceed with this setup anyway? This WILL break your previous setup [y/n]"
  read -r res
  if [[ "$res" =~ ^([yY][eE][sS]|[yY])$ ]];
  then
    echo "you said yes"
  elif [[ "$res" =~ ^([nN][oO]|[nN])$ ]];
    then
      echo "you said no"
  else
    echo "invalid input. exiting"
    exit
  fi
  exit
fi

if [ -h "$defaultConfigLocation" ];
then
  currLink=$(readlink -f "$defaultConfigLocation")
  if [ "$currLink" == "$repoConfigLocation" ];
  then
    echo "gitconfig is already symlinked to the config in this repository"
    exit
  else
    echo "gitconfig is already symlinked to: $currLink"
    echo "Do you want to proceed with this setup anyway? This WILL break your previous setup [y/n]"
    read -r res
    if [[ "$res" =~ ^([yY][eE][sS]|[yY])$ ]];
    then
      echo "you said yes"
    elif [[ "$res" =~ ^([nN][oO]|[nN])$ ]];
      then
        echo "you said no"
    else
      echo "invalid input. exiting"
      exit
    fi
    exit # TODO: remove line
  fi
fi

#echo "code should not be here"
#exit

if [ -f "$defaultConfigLocation" ]
  then mv "$defaultConfigLocation" "$configBackup"
  echo "copied gitconfig. gitconfig.bckup is in homedir"
fi

ln -s "$repoConfigLocation" "$defaultConfigLocation"
echo "linked $defaultConfigLocation to gitconfig in repo"

echo "Creating personal git user config"
echo "Provide name for git user: "
read -r ans