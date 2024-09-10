# [My Befunge Practice](/README.md#befunge)

wtf than [Brainf***](/Brainfuck/README.md)


### **\<References>**

- References
  - [Befunge (Esolang)](https://esolangs.org/wiki/Befunge)
  - [Bef-93 Tutorial](https://bef-93.blogspot.com/)
- Development Environments
  - [JDoodle / Online Befunge Compiler](https://www.jdoodle.com/execute-befunge-online)


### **\<List>**

- [Use Pseudo-Docstrings and Comments (2024.09.10)](#use-pseudo-docstrings-and-comments-20240910)
- [Hello World (2024.09.09)](#hello-world-20240909)


## [Use Pseudo-Docstrings and Comments (2024.09.10)](#list)

- **Not impossible!**
  - I first considered using `#` to skip over comment characters, but it required an exact match in the number of `#`s, risking errors.
  - The solution was simple: write freely outside the pointer's path (`<>^v`).
  - To make comments clearer, I prefixed them with `//`, similar to C-like languages.
- Code and Results
  <details open="">
    <summary>Code : HelloWorld.bf</summary>

    ```befunge
    v How to use docstrings and comments in Befunge         // pseudo-docstrings
    v 2024.09.10

    v // main()
    < v "This Befunge code demonstrates pseudo-docstrings and comments"
      > : v                                                 // Comments can be placed anywhere not pointed
      ^ , _ 55+, @                                          // End of the program
    ```
  </details>
  <details open="">
    <summary>Results</summary>

    ```txt
    This Befunge code demonstrates pseudo-docstrings and comments
    ```
  </details>


## [Hello World (2024.09.09)](#list)

- My first trial to run Befunge : Two methods to print "Hello World!"
  1. Normal Method
      - Befunge pushes a string onto the stack, which reverses the order of the user's input
      - However, by using the `<` command, the string can be read and printed in the correct order
  2. Second Method
      - A more efficient process using pointer redirection
      - Each character is popped and printed(`,`), followed by a check to see if the stack is empty(`_`) before continuing
- Tips
  - Befunge code starts at the top-left corner and moves according to directional commands (`>`, `<`, `^`, `v`).
  - When the pointer reaches the right edge of the code, it moves directly to the leftmost position on the same line unless redirected
  - How to Print a New Line in Befunge
    - The ASCII code `10` represents a newline character, but Befunge does not allow direct input of multi-character ASCII values.
    - To generate a newline, `55+` can be used to compute 10 using reverse Polish notation (`5 + 5 = 10`).
- Code and Results
  <details open="">
    <summary>Code : HelloWorld.bf</summary>

    ```befunge
    < v "Hello World!"
      >  ,,,,,,,,,,,, 55+, v

      v "Hello World!"     <
      > : v
      ^ , _ 55+, @
    ```
  </details>
  <details open="">
    <summary>Results</summary>

    ```txt
    Hello World!
    Hello World!
    ```
  </details>
