OBTW
    Multiplication Table - 2025.04.20

    This program prints a multiplication table (1–9) arranged in a 3×3 block format.
    Each block contains 3 columns (dan), and each dan is multiplied by numbers from 1 to 9.
TLDR

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
