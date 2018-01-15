# set() 으로 집합생성 후 색인을 위해 list() 함수를 사용할 수 있다.
# 하지만 list() 함수로 리스트 형태로 변환하게 되면 정렬이... 

aa = set(["aa", "bb", "cc", "dd"])
aa
# {'aa', 'bb', 'cc', 'dd'}

list(aa)
# ['cc', 'dd', 'bb', 'aa']
