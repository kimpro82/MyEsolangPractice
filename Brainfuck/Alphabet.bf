# My initial Brainf*** code : Print A~Z
# 2024/06/05


# 1) Add 1 from 65('A') 25 times at ptr0

ptr0 +++++ +++++ +++++ +++++ +++++ +++++ +++++ +++++ +++++ +++++
     +++++ +++++ +++++ .                                          # Let ptr0 = 65 and print 'A'
     +.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.           # Increment and print ptr0 25 times


# 2) Use square brackets statements

ptr0 [-]                                                          # Reset ptr0 as 0
ptr0 +++++ +++++ . [-]                                            # Let ptr0 = 10 (LF) & Line replacement & Reset ptr0

ptr0 +++++ +++++ +++                                              # Let ptr0 = 13
[ > ptr1 +++++ < ptr0 - ] > ptr1 .                                # Increment ptr1 by 5 13 times to get 65 ('A') & print

< ptr0 +++++ +++++ +++++ +++++ +++++                              # Let ptr0 = 25
[ > ptr1 + . < ptr0 - ]                                           # Loop to increment 25 times & print ptr1 from 66 ('B') to 90 ('Z')
