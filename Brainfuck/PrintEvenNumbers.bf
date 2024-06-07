# Conditional Statement Practice : Print Even Numbers
# 2024/06/06


# 1) Add 2 from 48('0') 4 times at ptr0

ptr0 +++++ +++++ +++++ +++++ +++++ +++++ +++++ +++++ +++++ +++  # Let ptr0 = 48('0')
     ++. ++. ++. ++.                                            # Print 2 4 6 8


# 2) Use Loop statement

ptr0 [-]                                                        # Reset ptr0 as 0
     +++++ +++++ . [-]                                          # Let ptr0 = 10 (LF) & Line replacement & Reset ptr0

ptr0 +++++                                                      # Let ptr0 = 5
[ > ptr1 +++++ +++++ < ptr0 -] > ptr1 --                        # Let ptr1 = (10 * 5) minus 2 = 48('0')

< ptr0 ++++                                                     # Let ptr0 = 4
[ > ptr1 ++ . < ptr0 - ]                                        # Print 2 4 6 8 with Loop statement


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
