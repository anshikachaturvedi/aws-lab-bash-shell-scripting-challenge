#!/bin/bash

yourName="Anshika"

# Find the number of the last file, sorting naturally by version number
last_num=$(ls -v ${yourName}* 2>/dev/null | tail -n 1 | sed "s/${yourName}//")

# If no files exist, start at 1. Otherwise, start at the next number.
if [ -z "$last_num" ]; then
  start=1
else
  start=$((last_num + 1))
fi

end=$((start + 24))

echo "Creating 25 files from ${yourName}${start} to ${yourName}${end}..."

for (( i=$start; i<=$end; i++ )); do
  touch "${yourName}${i}"
done

echo "Script finished."
