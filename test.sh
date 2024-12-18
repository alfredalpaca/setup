#!/bin/bash

echo "Creating a git user config"
echo "Provide name for gitconfig: "
read -r filename
echo "Provide name for git user: "
read -r name
echo "Provide email for git user: "
read -r email

cp ./templates/gituser ./gituser/"$filename"
sed -i -e "s/#NAME#/$name/g" ./gituser/"$filename"
sed -i -e "s/#EMAIL#/$email/g" ./gituser/"$filename"
