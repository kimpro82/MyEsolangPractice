# My initial Brainf*** code : Print A~Z
# 2024/06/05


# 1) Add 1 from A(65) 25 times at ptr0

ptr0 +++++ +++++ +++++ +++++ +++++ +++++ +++++ +++++ +++++ +++++
     +++++ +++++ +++++ .                                          # Let ptr0 = 65 and print 'A'
     +.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.           # Increment & print next 25 characters


# 2) Use square brackets statement

ptr0 [-]                                                          # Reset ptr0 = 0
ptr0 +++++ +++++ . [-]                                            # Initialize ptr0 to 10 & print newline & reset ptr0

ptr0 +++++ +++++ +++                                              # Initialize ptr0 to 13
[ > ptr1 +++++ < ptr0 - ] > ptr1 .                                # Increment ptr1 by 5 13 times to get 65 & print 'A'

< ptr0 +++++ +++++ +++++ +++++ +++++                              # Initialize ptr0 to 25
[ > ptr1 + . < ptr0 - ]                                           # Loop to increment & print ptr1 from 66 ('B') to 90 ('Z')
