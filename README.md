## Bash Scripting Challenge: Automated File Creation
This repository contains the solution for a Bash scripting challenge lab completed as part of the AWS re/Start program. The goal was to create a script that automates the creation of numbered files in batches.

## Lab Objectives
The script was required to meet the following criteria:
- Creates 25 empty files in each run.
- Names the files sequentially (e.g., Anshika1, Anshika2, ...).
- Automatically detects the last file number in the directory and continues the sequence on subsequent runs.
- Does not use any hardcoded numbers for the sequence.

## How It Works?
The script uses a combination of shell commands to determine the starting number for each new batch of files. The key line of logic is:
`last_num=$(ls -v ${yourName}* 2>/dev/null | tail -n 1 | sed "s/${yourName}//")`

This command does the following:
* `ls -v ${yourName}*`: Lists all files starting with the specified name, using a natural version sort to handle numbers correctly (e.g., Anshika9 comes before Anshika10).
* `2>/dev/null`: Suppresses any errors if no files are found on the first run.
* `tail -n 1`: Selects the very last file from the sorted list, which will have the highest number.
* `sed "s/${yourName}//"`: Removes the name prefix from the filename, leaving only the number.
The script then uses this number to calculate the start and end of the next batch of 25 files.

## Usage and Demonstration
- Make the script executable: (chmod +x create_files.sh)
- Run the script: (./create_files.sh)

## Technologies Used
- Bash Scripting
- Linux Command Line(ls, tail, sed, chmod, touch)
- AWS EC2(for the Linux environment)
