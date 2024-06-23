#!/bin/bash

# Script: CleanBFCode.sh
#
# Author      : kimpro82
# Date        : 2024.06.23
# Description :
#     This script takes a filename as an argument, checks if the file exists,
#   and then removes all characters except '[]<>\+\-\.,' using sed.
#     It creates a new file with '_cleaned' suffix appended to the original filename 
#   and saves the cleaned content into it.
# Usage       : ./clean_file.sh filename
# Arguement   :
#   - filename: The name of the file to be cleaned. Should be a valid file path.

# Check if a filename is provided
if [ -z "$1" ]; then
  echo "Usage: $0 filename"
  exit 1
fi

# Get the filename from the argument
filename="$1"

# Check if the file exists
if [ ! -f "$filename" ]; then
  echo "File not found!"
  exit 1
fi

# Create the new filename with '_cleaned' suffix
new_filename="${filename%.*}_Cleaned.${filename##*.}"

# Use sed to remove all characters except '[]<>\+\-\.,' and ASCII codes for new line (0D 0A)
sed 's/[^][<>\+\-\.,\x0D\x0A]//g' "$filename" > "$new_filename"

# Confirm the operation is complete
echo "Cleaned file saved as $new_filename"
