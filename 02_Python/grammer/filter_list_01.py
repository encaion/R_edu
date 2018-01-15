# 람다 함수를 사용하여 특정 조건에 맞는 리스트의 원소를 필터링 할 수 있다.

aa = list([10, 50, 100])
aa

list(filter(lambda x: x > 40, aa))
# [50, 100]
