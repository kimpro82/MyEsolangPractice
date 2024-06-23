# Star Pattern 3 : Diamond
# 2024/06/23

# Set constants
ptr0 ++++                                                   # Let ptr0 = 4
[ ptr0 > ptr1 +++++ +++++ < ptr0 - ]                        # Let ptr1 = (10 * 4) = 40
> [ ptr1 > ptr2 + > ptr3 + > ptr4 + <<< ptr1 - ]            # Move ptr1 to ptr2 ptr3 ptr4
> ptr2 +++++ +++                                            # Let ptr2 = 48 ('0')
> ptr3 ++                                                   # Let ptr3 = 42 ('*')
> ptr4 ----- ---                                            # Let ptr4 = 32 (Space)
> ptr5 +++++ +++++                                          # Let ptr5 = 10 (LF)

# Input a number
> ptr6 ,                                                    # Input ptr6 between '0' and '9'
<<<< [ ptr2 >>>> ptr6 - <<<< ptr2 - ]                       # Convert ptr6 from char to int (ptr6 minus '0')
>>>> [ ptr6 > ptr7 + > ptr8 + >>>> prt12 + <<<<< < ptr6 -]  # Move ptr6 to ptr7 ptr8 ptr12
>>>> ptr10 +                                                # Let ptr10 = 1

# Phase 1 : Increase stars and decrease spaces
<<<
[ ptr7                                                      # ptr7: The loop times
  > [ ptr8 <<<< ptr4 . >>>>> ptr9 + < ptr8 - ]              # ptr8 & ptr9 : The number of spaces
  >> [ ptr10 <<<<< << ptr3 . >>>>> >>> ptr11 + < ptr10 - ]  # ptr10 & ptr11 : The number of stars
  > [ ptr11 < ptr10 + > ptr11 - ] < ptr10 ++                # Recover ptr10 from ptr11 and add 2
  < [ ptr9 < ptr8 + > ptr9 - ] < ptr8 -                     # Recover ptr8 from ptr9 and subtract 1
  <<< ptr5 .                                                # Line replacement
  >> ptr7 -
]

# Phase 2 : Increase spaces and decrease stars
> ptr8 ++                                                   # Add 2 to ptr8
>> ptr10 ----                                               # Subtract 2 from ptr10
>> [ ptr12 <<<<< ptr7 + >>>>> ptr12 -]                      # Move ptr12 to ptr7
<<<<<
ptr7 -                                                      # Subtract 1 from ptr7
[ ptr7                                                      # ptr7: The loop times
  > [ ptr8 <<<< ptr4 . >>>>> ptr9 + < ptr8 - ]              # ptr8 & ptr9: The number of spaces
  >> [ ptr10 <<<<< << ptr3 . >>>>> >>> ptr11 + < ptr10 - ]  # ptr10 & ptr11: The number of stars
  > [ ptr11 < ptr10 + > ptr11 - ] < ptr10 --                # Recover ptr10 from ptr11 and suptract 2
  < [ ptr9 < ptr8 + > ptr9 - ] < ptr8 +                     # Recover ptr8 from ptr9 and add 1
  <<< ptr5 .                                                # Line replacement
  >> ptr7 -
]
