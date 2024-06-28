# [My Esolang Utilities](/README.md#utility)


### **\<List>**

- [Bash : BrainF*** Code Rearranger (2024.06.27)](#bash--brainf-code-rearranger-20240627)
- [Bash : BrainF*** Code Cleaner (2024.06.23)](#bash--brainf-code-cleaner-20240623)


## [Bash : BrainF*** Code Rearranger (2024.06.27)](#list)

- Rearranges a Brainf*** code file based on a pattern file
- Usage
  ```bash
  ./BFCodeRearranger.sh <brainfuck_file> <pattern_file>
  ```
- Code and Result
  <details>
    <summary>Code : BFCodeRearranger.sh</summary>

    ```bash
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
    ```
  </details>
  <details open="">
    <summary>Result : StarPattern3_Cleaned_Rearranged.bf</summary>

    ```brainfuck
    ++++[>  +++++++ +++<-]> [     > +>+>+<< <     - ]>++++  
    +     +    +    +     > ++   >- -     - --    - -     - 
    >     +    +    +     + + + + + +     + > ,   < <     < 
    <     [    >    >>>-<<< <  -  ] >     > >  >  [ >     + 
    >     +    >    >     > >     + <     < <   < < <     - 
    ]     >    >    >     > +     < <     < [    >[ <     < 
    <<.>>>  >>+<-]> >     [ <     < <<<<<.> >     > >>>>>+  

    <-]>[<  +>-]<++ <[<+>-] <     - <<<.>>- ]     > ++>>--  
    -     -    >    >     [ <<   << <     + >>    > >     > 
    -     ]    <    <     < < < - [ >     [ < <   < <     . 
    >     >    >    >>+<-]> >  [  < <     < <  <  < <     . 
    >     >    >    >     > >     > >     + <   - ] >     [ 
    <     +    >    -     ] <     - -     < [    <+ >     - 
    ]<+<<<  .>>-]## #     # #     # ####### #     # ######  

    ```
  </details>


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

  - The original file : `StarPattern3.bf` from [Star Pattern 3 (2024.06.23)](/Brainfuck/README.md#star-pattern-3-20240623)
    ```brainfuck
    ++++[>++++++++++<-]>[>+>+>+<<<-]>++++++++>++>-------->++++++++++>,<<<<[>>>>-<<<<-]>>>>[>+>+>>>>+<<<<<<-]>>>>+<<<[>[<<<<.>>>>>+<-]>>[<<<<<<<.>>>>>>>>+<-]>[<+>-]<++<[<+>-]<-<<<.>>-]>++>>---->>[<<<<<+>>>>>-]<<<<<-[>[<<<<.>>>>>+<-]>>[<<<<<<<.>>>>>>>>+<-]>[<+>-]<--<[<+>-]<+<<<.>>-]
    ```
  </details>
