#!/bin/bash

# automates directory creation.
echo "Enter Directory Name: "
read -r dir

# Trim leading and trailing whitespace from user input
dir="${dir#"${dir%%[![:space:]]*}"}"
dir="${dir%"${dir##*[![:space:]]}"}"

# Checks if entered string is empty.
if [[ -z $dir ]]; then	# DOuble square bracket is only for functionality.
	echo "Directory name cannot be empty."
	exit 1
fi

# Checks if directory input contains invalid inputs
if [[ $dir =~ [^a-zA-Z0-9_-] ]]; then
	echo "Directory name contains invalid characters.  Only alphanumeric, underscore, and hyphen are allowed."
	exit 1
fi

#Check if directory already exosts
if [ -d "$dir" ]; then
	echo "Directory '$dir' already exists."
	exit 1
fi

# Create the directory and handles error.
mkdir "$dir" || { echo "Failed to create directory."; exit 1; }

# Copies the script, 'git.sh' to the To-be created dirrectory/
cp git.sh "$dir" || { echo "Failed to copy script to directory!"; exit 1; }

# Copies the script, 'temp.sh' to the To-be created dirrectory/
cp temp.sh "$dir" || { echo "Failed to copy script to directory!"; exit 1; }

# Change into newly created diretory;
cd "$dir" || { echo "Failed to change into directory."; exit 1; }

# Use vi to collect README input from the user
echo "Press enter to open README in vi. Write your README and save using ':wq'"
read -r
vi README.md || { echo "Failed to edit README file!"; exit 1; }

git add README.md

# Commit with a default message
git commit -m "Added Readme" || { echo "Failed to commit changes."; exit 1; }

git push
