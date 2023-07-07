# Repository Automation Scripts

This repository contains two automation scripts: `git.sh` and `directory.sh`. These scripts are designed to simplify and automate certain tasks related to version control and directory management.

## git.sh

The `git.sh` script automates the process of staging files and pushing them to GitHub. It performs the following steps:

1. Checks the status of the repository to identify any modified or new files.
2. Adds all modified and new files to the staging area.
3. Commits the changes with a default commit message.
4. Pushes the committed changes to the remote repository on GitHub.

## directory.sh

The `directory.sh` script streamlines the creation of directories, copying specific files, and generating a README file. It carries out the following actions:

1. Creates a new directory with a specified name.
2. Copies a set of predetermined files into the newly created directory.
3. Generates a README file with a default template and populates it with relevant information.

## Prerequisites

Before using these scripts, ensure that the following requirements are met:

- You have a local Git repository initialized and connected to a remote repository on GitHub.
- The necessary files to be staged and copied by the scripts are present in the appropriate locations.

## Usage

To use the `git.sh` script, follow these steps:

1. Open a terminal or command prompt.
2. Navigate to the root directory of your local Git repository.
3. Run the script by executing the following command: `./git.sh`
4. The script will automatically stage modified and new files, commit the changes, and push them to the remote repository on GitHub.

To utilize the `directory.sh` script, follow these steps:

1. Open a terminal or command prompt.
2. Navigate to the root directory of your local Git repository.
3. Run the script by executing the following command: `./directory.sh`
4. The script will create a new directory, copy the specified files into it, and generate a README file with a default template.

**Note:** Before executing the scripts, ensure that they have the necessary permissions to be executed. You can use the `chmod` command to provide the required permissions if needed.

## Customization

Feel free to modify the scripts according to your specific requirements. You can adjust the commit messages, file paths, directory names, or any other aspects to align with your project's needs.

## Disclaimer

These automation scripts are provided as a convenience tool, but they should be used with caution. It is recommended to review the code and understand its functionality before executing the scripts to ensure they align with your intended actions.

## Conclusion

The `git.sh` and `directory.sh` scripts provide automation and convenience for repetitive tasks in your Git workflow and directory management. By utilizing these scripts, you can streamline your processes and save time when working on your projects.
