#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_ROOT="$(realpath "$CURRENT_DIR/..")"
FIND_AND_REPLACE_SCRIPT="$REPO_ROOT/utils/find-and-replace-in-file.sh"
echo $FIND_AND_REPLACE_SCRIPT
echo $REPO_ROOT

echo -n "Provide name for git profile: (leave empty for the default, personal)"
read -r configName
if [[ -z "$configName" ]]; then
  configName="personal"
fi

configPath="$REPO_ROOT/gitusers/$configName"
echo "Creating git user config $configName at $configPath"

while true; do
  echo -n "Provide name for git user: "
  read -r name
  if [[ -z "$name" ]]; then
    echo "Name cannot be empty. Please enter a valid name."
  else
    break
  fi
done
while true; do
  echo "Provide an email for the git user: "
  read -r email
  if [[ -z "$email" ]]; then
    echo "Email cannot be empty. Please enter a valid email."
  elif [[ ! "$email" =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$ ]]; then
    echo "Invalid email format. Please enter a valid email."
  else
    break
  fi
done

mkdir -p "$REPO_ROOT/gitusers"
cp "$REPO_ROOT/templates/git/gituser" "$configPath"

$FIND_AND_REPLACE_SCRIPT "$configPath" "s/#NAME#/$name/g"
$FIND_AND_REPLACE_SCRIPT "$configPath" "s/#EMAIL#/$email/g"
