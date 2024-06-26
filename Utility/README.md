# [My Esolang Utilities](/README.md#brainf)


### **\<List>**

- [Bash : BrainF*** Code Cleaner (2024.06.23)](#bash--brainf-code-cleaner-20240623)


## [Bash : BrainF*** Code Cleaner (2024.06.23)](#list)

- Creates a new file with `_Cleaned` suffix appended to the original filename.
  - Removes all characters except `[]<>\+\-\.,` using sed.
  - Usage
    ```bash
    ./BFCodeCleaner.sh ./filename
    ```
- Code and Result
  <details>
    <summary>Code : BFCodeCleaner.sh</summary>

    ```bash
    #!/bin/bash

    # Check if a filename is provided
    if [ -z "$1" ]; then
      echo "Usage: $0 filename"
      exit 1
    fi

    # Get the filename from the argument
    filename="$1"

    # Check if the file exists
    if [ ! -f "$filename" ]; then
      echo "Error: File '$filename' not found!"
      exit 1
    fi

    # Create the new filename with '_Cleaned' suffix
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
    ```
  </details>
  <details open="">
    <summary>Result : StarPattern3_Cleaned.bf</summary>

    ```brainfuck
    ++++[>++++++++++<-]>[>+>+>+<<<-]>++++++++>++>-------->++++++++++>,<<<<[>>>>-<<<<-]>>>>[>+>+>>>>+<<<<<<-]>>>>+<<<[>[<<<<.>>>>>+<-]>>[<<<<<<<.>>>>>>>>+<-]>[<+>-]<++<[<+>-]<-<<<.>>-]>++>>---->>[<<<<<+>>>>>-]<<<<<-[>[<<<<.>>>>>+<-]>>[<<<<<<<.>>>>>>>>+<-]>[<+>-]<--<[<+>-]<+<<<.>>-]
    ```
  </details>
