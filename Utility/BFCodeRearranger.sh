#!/bin/bash

# Script: BFCodeRearranger.sh
#
# Author      : kimpro82
# Date        : 2024.06.27
# Description :
#   - This script rearranges a Brainfuck code file based on a pattern file.
#   - It takes two filenames as arguments:
#     the Brainfuck code file and the pattern file.
#   - The script extracts relevant characters from the Brainfuck code file
#     and replaces '#' in the pattern file with these characters.
#   - It creates a new file with '_Rearranged' suffix
#     appended to the original Brainfuck code filename
#     and saves the rearranged content into it.
# Usage       : ./BFCodeRearranger.sh <brainfuck_file> <pattern_file>
# Argument    :
#   - brainfuck_file: The filename of the Brainfuck code file to be rearranged.
#   - pattern_file  : The filename that specifies the rearrangement pattern.

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <brainfuck_file> <pattern_file>"
  exit 1
fi

# Assign arguments to variables
brainfuck_file="$1"
pattern_file="$2"

# Check if the required files exist
if [ ! -f "$brainfuck_file" ]; then
  echo "$brainfuck_file not found!"
  exit 1
fi

if [ ! -f "$pattern_file" ]; then
  echo "$pattern_file not found!"
  exit 1
fi

# Read the content of brainfuck_file
brainfuck_content=$(<"$brainfuck_file")

# Extract relevant characters from brainfuck_file
filtered_content=$(echo "$brainfuck_content" | sed 's/[^[]<>\+\-\.,]//g')

# Read the content of pattern_file
pattern_content=$(<"$pattern_file")

# Function to replace '#' with characters from brainfuck_content
replace_pattern() {
  local content="$1"
  local index="$2"
  local result=""
  
  for ((i=0; i<${#content}; i++)); do
  char="${content:i:1}"
  if [[ "$char" == "#" ]]; then
    if [ $index -lt ${#filtered_content} ]; then
    result+="${filtered_content:index:1}"
    index=$((index + 1))
    else
    result+="#"
    fi
  else
    result+="$char"
  fi
  done

  echo "$result"
  echo "$index" > "$temp_file"          # Save the updated index in the temporary file
}

# Process the brainfuck content
result=""
char_index=0
temp_file="./temp.txt"

while [ $char_index -lt ${#filtered_content} ]; do
  replaced_pattern=$(replace_pattern "$pattern_content" "$char_index")
  result+="$replaced_pattern"$'\n\n'
  char_index=$(<"$temp_file")           # Read the next index from the temp file
done

# Remove the temporary file
rm "$temp_file"

# Create the new filename
new_filename="${brainfuck_file%.*}_Rearranged.${brainfuck_file##*.}"

# Save the result to the new file
echo -n "$result" > "$new_filename"

# Confirm the operation is complete
echo "Rearranged file saved as $new_filename"
