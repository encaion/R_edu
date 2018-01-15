# set() 으로 집합생성 후 색인을 위해 list() 함수를 사용할 수 있다.
# 하지만 list() 함수로 리스트 형태로 변환하게 되면 내림차순 정렬이 된다. 

aa = set(["aa", "bb", "cc"])
aa

list(aa)

list(aa)[:2]
