# [My LOLCODE Practice](/README.md#lolcode)




### **\<References>**

- References
  - [Wikipedia / LOLCODE](https://en.wikipedia.org/wiki/LOLCODE)
  - [Esolang / LOLCODE](https://esolangs.org/wiki/LOLCODE)
- Development Environments
  - [JDoodle / Online LOLCODE Compiler](https://www.jdoodle.com/execute-lolcode-online)
  - [tutorialspoint / Oline LOLCODE Compiler](https://www.tutorialspoint.com/compilers/online-lolcode-compiler.htm)
- Educations(?)
  - [Codecademy / Learn LOLCODE](https://www.codecademy.com/learn/learn-lolcode)


### **\<List>**

- [Multiplication Table (2025.04.20)](#multiplication-table-20250420)


## [Multiplication Table (2025.04.20)](#list)

- Compared to languages like [Brainf***](/Brainfuck/README.md) or [Befunge](/Befunge/README.md), LOLCODE is relatively more readable and structured.
- I've written the multiplication table in languages like [Ada](https://github.com/kimpro82/MyLegacyPractice/blob/main/Ada/README.md#multiplication-table-20240221), [ALGOL](https://github.com/kimpro82/MyLegacyPractice/blob/main/ALGOL/README.md#multiplication-table-20241018), [COBOL](https://github.com/kimpro82/MyLegacyPractice/blob/main/COBOL/README.md#multiplication-table-20241025), [Pascal](https://github.com/kimpro82/MyLegacyPractice/blob/main/Pascal/README.md#multiplication-table-20241017), and so on──but I still get confused every time.
- Code and Results
  <details>
    <summary>Code : MultiplicationTable.lol</summary>

    ```lolcode
    OBTW
        Multiplication Table - 2025.04.20

        This program prints a multiplication table (1–9) arranged in a 3×3 block format.
        Each block contains 3 columns (dan), and each dan is multiplied by numbers from 1 to 9.
    TLDR
    ```
    ```lolcode
    HAI 1.2
    CAN HAS STDIO?

    I HAS A IS_TEST ITZ 1
    I HAS A MAX_DAN ITZ 9
    I HAS A MAX_MULTIPLICAND ITZ 9
    I HAS A DANS_PER_BLOCK ITZ 3

    I HAS A IDX ITZ 1

    IM IN YR OUTER_LOOP BTW Loop that increases IDX by 3 each cycle

        IM IN YR INNER_LOOP UPPIN YR JDX TIL BOTH SAEM DIFF OF JDX AN 1 AN MAX_MULTIPLICAND
            I HAS A LINE ITZ ""

            BOTH SAEM JDX AN 0,
            O RLY?
                YA RLY
                    BTW Skip when multiplicand is 0
                NO WAI
                    IM IN YR ROW_LOOP UPPIN YR KDX TIL BOTH SAEM KDX AN DANS_PER_BLOCK
                        I HAS A LDX ITZ SUM OF IDX AN KDX

                        BOTH SAEM LDX AN 0
                        O RLY?
                            YA RLY
                                BTW Skip when dan is 0
                            NO WAI
                                LINE R SMOOSH LINE AN LDX AN " * " AN JDX AN " = " MKAY
                                I HAS A RESULT ITZ PRODUKT OF LDX AN JDX

                                BOTH SAEM SMALLR OF RESULT AN 10 AN 10
                                O RLY?
                                    YA RLY
                                        LINE R SMOOSH LINE AN RESULT AN "   " MKAY
                                    NO WAI
                                        LINE R SMOOSH LINE AN " " AN RESULT AN "   " MKAY
                                OIC
                        OIC

                    IM OUTTA YR ROW_LOOP

                    VISIBLE LINE
            OIC
        IM OUTTA YR INNER_LOOP

        VISIBLE ""
        IDX R SUM OF IDX AN 3

        BOTH SAEM IDX AN BIGGR OF IDX AN MAX_DAN
        O RLY?
            YA RLY
                GTFO BTW Similar to a 'break' statement
        OIC

    IM OUTTA YR OUTER_LOOP

    KTHXBYE
    ```
  </details>
  <details open="">
    <summary>Results</summary>

    ```txt
  1 * 1 =  1     2 * 1 =  2     3 * 1 =  3     
  1 * 2 =  2     2 * 2 =  4     3 * 2 =  6     
  1 * 3 =  3     2 * 3 =  6     3 * 3 =  9     
  ……   
  1 * 9 =  9     2 * 9 = 18     3 * 9 = 27     
  
  4 * 1 =  4     5 * 1 =  5     6 * 1 =  6     
  4 * 2 =  8     5 * 2 = 10     6 * 2 = 12     
  4 * 3 = 12     5 * 3 = 15     6 * 3 = 18     
  ……
  4 * 9 = 36     5 * 9 = 45     6 * 9 = 54     
  
  7 * 1 =  7     8 * 1 =  8     9 * 1 =  9     
  7 * 2 = 14     8 * 2 = 16     9 * 2 = 18     
  7 * 3 = 21     8 * 3 = 24     9 * 3 = 27     
  ……
  7 * 9 = 63     8 * 9 = 72     9 * 9 = 81     
  ```
  </details>
