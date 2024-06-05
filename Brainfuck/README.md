# [My Brainf*** Practice](/README.md#brainf)

wtf


### \<List>

- [Print Alphabet with Loop Statement (2024.06.05)](#print-alphabet-with-loop-statement-20240605)


## [Print Alphabet with Loop Statement (2024.06.05)](#list)

- My initial *Brainf**** practice; Print from A to Z
  - I think I've become ready to deal with Assembly!
- Reference
  - [Brainfuck (Wikipedia)](https://en.wikipedia.org/wiki/Brainfuck)
- Development Environment
  - [JDoodle / Online B******K Compiler IDE](https://www.jdoodle.com/execute-b******k-online)
  - [Tutorialspoint / Online Brainfuck Compiler](https://www.tutorialspoint.com/execute_brainfk_online.php)
- Code and Result
  <details>
    <summary>Code : PrintAlphabet.bf</summary>

    ```brainfuck
    # 1) Add 1 from 65('A') 25 times at ptr0

    ptr0 +++++ +++++ +++++ +++++ +++++ +++++ +++++ +++++ +++++ +++++
         +++++ +++++ +++++ .                                          # Let ptr0 = 65 and print 'A'
         +.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.           # Increment and print ptr0 25 times
    ```
    ```brainfuck
    # 2) Use square brackets statements

    ptr0 [-]                                                          # Reset ptr0 as 0
    ptr0 +++++ +++++ . [-]                                            # Let ptr0 = 10 (LF) & Line replacement & Reset ptr0

    ptr0 +++++ +++++ +++                                              # Let ptr0 = 13
    [ > ptr1 +++++ < ptr0 - ] > ptr1 .                                # Increment ptr1 by 5 13 times to get 65 ('A') & print

    < ptr0 +++++ +++++ +++++ +++++ +++++                              # Let ptr0 = 25
    [ > ptr1 + . < ptr0 - ]                                           # Loop to increment 25 times & print ptr1 from 66 ('B') to 90 ('Z')
    ```
  </details>
  <details>
    <summary>Result</summary>

    ```brainfuck
    ABCDEFGHIJKLMNOPQRSTUVWXYZ
    ABCDEFGHIJKLMNOPQRSTUVWXYZ
    ```
  </details>