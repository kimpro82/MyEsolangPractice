# Star Pattern 2
# 2024/06/08

# Set constants
< ptr0 ++++                                                 # Let ptr0 = 4
[ ptr0 > ptr1 +++++ +++++ < ptr0 - ]                        # Let ptr1 = (10 * 4) = 40
> [ ptr1 > ptr2 + > ptr3 + > ptr4 + <<< ptr1 - ]            # Move ptr1 to ptr2 ptr3 ptr4
> ptr2 +++++ +++                                            # Let ptr2 = 48 ('0')
> ptr3 ++                                                   # Let ptr3 = 42 ('*')
> ptr4 ----- ---                                            # Let ptr4 = 32 (Space)
> ptr5 +++++ +++++                                          # Let ptr5 = 10 (LF)

# Input a number
> ptr6 ,                                                    # Input ptr6 between '0' and '9'
<<<< [ ptr2 >>>> ptr6 - <<<< ptr2 - ]                       # Convert ptr6 from char to int (ptr6 minus '0')
>>>> [ ptr6 > ptr7 + > ptr8 + << ptr6 -]                    # Move ptr6 to ptr7 and ptr8
>>>> ptr10 +                                                # Let ptr10 = 1

# Print the pattern with general loop statement
<<<
[ ptr7                                                      # ptr7: The loop times
  > [ ptr8 <<<< ptr4 . >>>>> ptr9 + < ptr8 - ]              # ptr8 & ptr9: The number of spaces
  >> [ ptr10 <<<<< << ptr3 . >>>>> >>> ptr11 + < ptr10 - ]  # ptr10 & ptr11: The number of stars
  > [ ptr11 < ptr10 + > ptr11 - ] < ptr10 ++                # Recover ptr10 from ptr11 and add 2
  < [ ptr9 < ptr8 + > ptr9 - ] < ptr8 -                     # Recover ptr8 from ptr9 and subtract 1
  <<< ptr5 .                                                # Line replacement
  >> ptr7 -
]
