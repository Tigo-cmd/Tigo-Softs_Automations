#!/bin/bash
# This stages and pushes file to git

# Check if the current directory is a Git repository
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
	echo "Not a Git repository. Please initialize Git in the current directory."
	exit 1
fi

echo "Enter file name: >"
read input
if [ ! -f "$input" ]; then
	echo "File does not exist!"
	exit 1
fi

git add "$input" || { echo "Failed to add "$input" to git!"; exit 1; }

echo "Enter commit message: "
read commit

git commit -m "$commit" || { echo "Failed to commit changes."; exit 1; }

# Prompt to know what branch user is pushing
echo "What branch do you want to push?"
read -r branch

git push --set-upstream origin "$branch" || { echo "Failed to push changes."; exit 1; }
