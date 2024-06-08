# Star Pattern
# 2024/06/07

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
