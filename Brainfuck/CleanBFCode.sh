#!/bin/bash

# Script: CleanBFCode.sh
#
# Author      : kimpro82
# Date        : 2024.06.23
# Description :
#   - This script takes a filename as an argument, checks if the file exists,
#     and then removes all characters except '[]<>\+\-\.,' using sed.
#   - It creates a new file with '_Cleaned' suffix appended to the original filename 
#     and saves the cleaned content into it.
#   - An intermediate temporary file is used for processing.
#   - The script ensures the final cleaned file ends with a newline character.
# Usage       : ./CleanBFCode.sh filename
# Argument    :
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
temp_filename="${filename%.*}_Temporary.${filename##*.}"
new_filename="${filename%.*}_Cleaned.${filename##*.}"

# Use tr to remove newline characters and save to a temporary file
tr -d '\n' < "$filename" > "$temp_filename"

# Use sed to remove all characters except '[]<>+-.,'
sed 's/[^][<>+-.,]//g' "$temp_filename" > "$new_filename"

# Add a newline character at the end of the new file
echo "" >> "$new_filename"

# Remove the temporary file
rm "$temp_filename"

# Confirm the operation is complete
echo "Cleaned file saved as $new_filename"
