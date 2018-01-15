# set() 함수는 집합을 의미하고 python 2.3 부터 추가가 되었다.
# 집합은 중복을 허용하지 않는다.
# 똑같은 원소를 추가 하더라도 에러를 발생하지 않는다.

set_test = set()
set_test.add("asdf")
set_test.add("sss")
set_test.add("sss")
set_test
# {'asdf', 'sss'}
