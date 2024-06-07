# [My Brainf*** Practice](/README.md#brainf)

wtf


### **\<References>**

- Reference
  - [Brainfuck (Wikipedia)](https://en.wikipedia.org/wiki/Brainfuck)
- Development Environments
  - [JDoodle / Online B******K Compiler IDE](https://www.jdoodle.com/execute-b******k-online)
  - [Tutorialspoint / Online Brainfuck Compiler](https://www.tutorialspoint.com/execute_brainfk_online.php)


### **\<List>**

- [Star Pattern (2024.06.07)](#star-pattern-20240607)
- [Print Even Numbers with Conditional Statement (2024.06.06)](#print-even-numbers-with-conditional-statement-20240606)
- [Print Alphabet with Loop Statement (2024.06.05)](#print-alphabet-with-loop-statement-20240605)


## [Star Pattern (2024.06.07)](#list)

- Only can input a number as a character between 0 and 9
- Learned nested `[]` brackets and the behavior of `<>` within them
- Code and Result
  <details>
    <summary>Code : StarPattern.bf</summary>

    ```brainfuck
    < ptr0 +++++
    [ > ptr1 +++++ +++++ < ptr0 - ] > ptr1 --                   # Let ptr1 = (10 * 5) minus 2 = 48('0')
    < ptr0 ++++
    [ >> ptr2 +++++ +++++ << ptr0 - ] >> ptr2 ++                # Let ptr2 = (10 * 4) plus 2 = 42('*')
    > ptr3 +++++ +++++                                          # Let ptr3 = 10 (LF)

    > prt4 ,                                                    # Input ptr4 between '0' and '9'
    <<< [ >>> ptr4 - <<< ptr1 - ]                               # Convert ptr4 from char to int (ptr4 minus '0')

    >>> ptr4
    [   << ptr2 .           > ptr3 . > ptr4 -
      [ << ptr2 ..          > ptr3 . > ptr4 -
      [ << ptr2 ...         > ptr3 . > ptr4 -
      [ << ptr2 ....        > ptr3 . > ptr4 -
      [ << ptr2 .....       > ptr3 . > ptr4 -
      [ << ptr2 ..... .     > ptr3 . > ptr4 -
      [ << ptr2 ..... ..    > ptr3 . > ptr4 -
      [ << ptr2 ..... ...   > ptr3 . > ptr4 -
      [ << ptr2 ..... ....  > ptr3 . > ptr4 - ]]]]] ]]]]
    ```
  </details>
  <details>
    <summary>Result</summary>

    ```brainfuck
    *
    **
    ***
    ****
    *****
    ```
  </details>


## [Print Even Numbers with Conditional Statement (2024.06.06)](#list)

- Limitations of Using Loops to Approximate Conditional Statements
  - Loops could only approximate conditional behavior, failing to fully replicate the functionality of standard conditional statements.
  - Reusing pointer values that had been set to 0 within [] brackets was not possible when checking conditional requirements.
- Code and Result
  <details>
    <summary>Code : PrintEvenNumbers.bf</summary>

    ```brainfuck
    # 1) Add 2 from 48('0') 4 times at ptr0

    ptr0 +++++ +++++ +++++ +++++ +++++ +++++ +++++ +++++ +++++ +++  # Let ptr0 = 48('0')
         ++. ++. ++. ++.                                            # Print 2 4 6 8
    ```
    ```brainfuck
    # 2) Use Loop statement

    ptr0 [-]                                                        # Reset ptr0 as 0
         +++++ +++++ . [-]                                          # Let ptr0 = 10 (LF) & Line replacement & Reset ptr0

    ptr0 +++++                                                      # Let ptr0 = 5
    [ > ptr1 +++++ +++++ < ptr0 -] > ptr1 --                        # Let ptr1 = (10 * 5) minus 2 = 48('0')

    < ptr0 ++++                                                     # Let ptr0 = 4
    [ > ptr1 ++ . < ptr0 - ]                                        # Print 2 4 6 8 with Loop statement
    ```
    ```brainfuck
    # 3) Use Conditional statement

    ptr0 [-]                                                        # Reset ptr0 as 0
    > prt1 [-]                                                      # Reset ptr1 as 0
    < ptr0 +++++ +++++ . [-]                                        # Let ptr0 = 10 (LF) & Line replacement & Reset ptr0

    ptr0 +++++                                                      # Let ptr0 = 5
    [ > ptr1 +++++ +++++ < ptr0 -] > ptr1 --                        # Let ptr1 = (10 * 5) minus 2 = 48('0')

    < ptr0 +++++ +++                                                # Let ptr0 = 8
    [
      > ptr1 + < ptr0 -                                             # If odd then not print
      > ptr1 + . < ptr0 -                                           # If even then print
    ]
    # Unable to use new ptr to judge if odd or even because it can't be reused in loop statement
    ```
  </details>
  <details>
    <summary>Result</summary>

    ```brainfuck
    2468
    2468
    2468
    ```
  </details>


## [Print Alphabet with Loop Statement (2024.06.05)](#list)

- My initial *Brainf**** practice; Print from A to Z
  - I think I've become ready to deal with Assembly!
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
