#!/bin/bash
# This stages and pushes file to git

# Check if the current directory is a Git repository
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
	echo "Not a Git repository. Please initialize Git in the current directory."
	exit 1
fi

# Ask the  user for the commit mode
echo "Select commit mode:"
echo "1. Add multiple files with one commit"
echo "2. Add different files with different commits"
read -r commit_mode

# Validate the commit mode
if [[ "$commit_mode" != "1" && "$commit_mode" != "2" ]]; then
	        echo "Invalid commit mode selected."
		exit 1
fi

# Ask user for files to add
while true; do
	echo "Enter a file to add (or press Enter to finish): "
	read -r file
	if [[ -z "$file" ]]; then
		break
	fi

	# Check if the entered file exists
	if [ ! -f "$file" ]; then
		echo "File does not exist!"
		continue
	fi
							
	git add "$file" || { echo "Failed to stage file '$file'."; exit 1; }

	if [[ "$commit_mode" == "1" ]]; then
		# If committing all files together, store the commit message
		echo "Enter commit message for all files: "
		read commit
		break
	else
		 # If committing files individually, prompt for a commit message for the current file
	echo "Enter commit message for '$file': "
	read commit
	# Commit the changes with the provided message for the current file
	git commit -m "$commit" || { echo "Failed to commit changes."; exit 1; }
	fi
done

# Commit all staged changes together with the stored commit message
if [[ "$commit_mode" == "1" ]]; then
	git commit -m "$commit" || { echo "Failed to commit changes."; exit 1; }
fi

# Confirm with the user before pushing
echo "Do you want to push the changes to the remote repository? (y/n)"
read -r confirm
if [[ "$confirm" == "y" ]]; then
	# Push to the remote repository
	git push || { echo "Failed to push changes."; exit 1; }
else
	echo "Changes are staged but not pushed."
fi
