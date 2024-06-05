# [My Brainf*** Practice](/README.md#brainf)

wtf


### \<List>

- [Print Alphabet (2024.06.05)](#print-alphabet-20240605)


## [Print Alphabet (2024.06.05)](#list)

- My initial *Brainf**** practice; Print from A to Z
- Reference
  - [Brainfuck (Wikipedia)](https://en.wikipedia.org/wiki/Brainfuck)
- Development Environment
  - [JDoodle / Online B******K Compiler IDE](https://www.jdoodle.com/execute-b******k-online)
  - [Tutorialspoint / Online Brainfuck Compiler](https://www.tutorialspoint.com/execute_brainfk_online.php)
- Code and Result
  <details>
    <summary>Code : PrintAlphabet.bf</summary>

    ```brainfuck
    # 1) Add 1 from A(65) 25 times at ptr0

    ptr0 +++++ +++++ +++++ +++++ +++++ +++++ +++++ +++++ +++++ +++++
        +++++ +++++ +++++ .                                          # Let ptr0 = 65 and print 'A'
        +.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.           # Increment & print next 25 characters
    ```
    ```brainfuck
    # 2) Use square brackets statement

    ptr0 [-]                                                          # Reset ptr0 = 0
    ptr0 +++++ +++++ . [-]                                            # Initialize ptr0 to 10 & print newline & reset ptr0

    ptr0 +++++ +++++ +++                                              # Initialize ptr0 to 13
    [ > ptr1 +++++ < ptr0 - ] > ptr1 .                                # Increment ptr1 by 5 13 times to get 65 & print 'A'

    < ptr0 +++++ +++++ +++++ +++++ +++++                              # Initialize ptr0 to 25
    [ > ptr1 + . < ptr0 - ]                                           # Loop to increment & print ptr1 from 66 ('B') to 90 ('Z')
    ```
  </details>
  <details>
    <summary>Result</summary>

    ```brainfuck
    ABCDEFGHIJKLMNOPQRSTUVWXYZ
    ABCDEFGHIJKLMNOPQRSTUVWXYZ
    ```
  </details>