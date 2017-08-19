CSS 선택자를 이용한 웹 스크래이핑

기존 내용 

​	BeautifulSoup을 이용한 웹 페이지 스크래핑

​		HTML Tag를 이용한 수집. 

​		

지금 내용 

​	BeautifulSoup을 이용한 웹 페이지 스크래핑

​		CSS 선택자를 이용한 수집. 



CSS 선택자?

​	[링크](http://www.nextree.co.kr/p8468/)

​	webpage 구성 요소 

​		구조 : 웹 콘텐츠에 의미를 부여하고 구조를 생성 -> HTML 

​		표현 : 시각적인 디자인과 레이아웃 표현 -> CSS

​		행위 : 모든 front-end의 브라우저 상호작용을 담당 -> JavaScript

​	CSS 선택자 :

​		선택을 해주는 요소.

​		CSS의 특정 요소를 선택하기 위한 인터페이스 



웹페이지에서 선택자 가져오기 

​	구글 크롬을 이용해서 특정 페이지에서 마우스 오른쪽 버튼을 눌러서 "검사"를 선택하면 개발자 도구가 표시 

​	[동영상](./selector1.mp4)



위키피디아에서 선택자를 이용해서 특정 데이터 가져오기 

​	윤동주 작가의 작품 목록 가져오기 

​	윤동주 작가의 첫번째 작품 이름 가져오기 

​		크롬 오픈, 윤동주 위키피디아 접속 (https://ko.wikipedia.org/wiki/%EC%9C%A4%EB%8F%99%EC%A3%BC)

​		개발자 도구 오픈

​		개발자 도구에서 작품목록에서 첫번째 작품 선택 

​		개발자 도구를 통해 선택자 복사 

​			\#mw-content-text > div > ul:nth-child(46) > li:nth-child(1)

​		`#mw-content-text > div > ul:nth-child(46) > li:nth-child(1)`

​		mw-content-text 요소 및에 div 요소 및에 ul 요소의 46번째 요소의 li 요소의 첫번째 

`<ul>
<li>《새 명동》</li>
<li>《서시(序詩)》</li>
<li>《또 다른 고향》</li>
<li>《별 헤는 밤》</li>
<li>《<a href="/wiki/%ED%95%98%EB%8A%98%EA%B3%BC_%EB%B0%94%EB%9E%8C%EA%B3%BC_%EB%B3%84%EA%B3%BC_%EC%8B%9C" title="하늘과 바람과 별과 시">하늘과 바람과 별과 시</a>》 — 그의 대부분의 작품은 이 유고시집에 실려 있다. 1948년의 초간본은 31편이 수록되었으나, 유족들이 보관하고 있던 시를 추가하여 <a href="/wiki/1976%EB%85%84" title="1976년">1976년</a> 3판에서는 모두 116편이 실리게 되었다.</li>
<li>《사진판 윤동주 자필 시고전집》</li>
<li>《<a href="/w/index.php?title=%EB%B3%84%EC%9D%84_%EC%82%AC%EB%9E%91%ED%95%98%EB%8A%94_%EC%95%84%EC%9D%B4%EB%93%A4%EC%95%84&amp;action=edit&amp;redlink=1" class="new" title="별을 사랑하는 아이들아 (없는 문서)">별을 사랑하는 아이들아</a>》</li>
<li class="mw-empty-elt"></li>
</ul>`



위의 데이타를 기본으로 해서 데이터를 가져오는 코드를 작성 하면 다음과 같습니다. 

```python
from bs4 import BeautifulSoup 
import urllib.request as req
# 뒤의 인코딩 부분은 "저자:윤동주"라는 의미입니다.
# 따로 입력하지 말고 위키 문헌 홈페이지에 들어간 뒤에 주소를 복사해서 사용하세요.
url = "https://ko.wikisource.org/wiki/%EC%A0%80%EC%9E%90:%EC%9C%A4%EB%8F%99%EC%A3%BC"
res = req.urlopen(url)
soup = BeautifulSoup(res, "html.parser")
# #mw-content-text 바로 아래에 있는 
# ul 태그 바로 아래에 있는
# li 태그 아래에 있는
# a 태그를 모두 선택합니다.
a_list = soup.select("#mw-content-text > ul > li a")
for a in a_list:
    name = a.string
    print("-", name)
```

위의 코드는 동작하지 않습니다. 

다들 집에서 수정해 보면 어떨까요? 



css 선택자 자세히 보기 

| 서식        | 설명                 |
| --------- | ------------------ |
| *         | 모든 요소를 선택합니다       |
| <요소이름>    | 요소 이름을 기반으로 선택합니다  |
| .<클래스 이름> | 클래스 이름을 기반으로 선택합니다 |
| #<id 이름>  | id 속성을 기반으로 선택합니다  |



선택자들을 지정하는 서식

| 서식            | 설명                               |
| ------------- | -------------------------------- |
| <선택자>, <선택자>  | 쉼표로 구분되는 여러 개의 선택자를 모두 선택        |
| <선택자><선택자>    | 앞 선택자의 후손 중 뒤 선택자에 해당하는 것을 모두 선택 |
| <선택자> > <선택자> | 앞 선택자의 자손 중 뒤 선택자에 해당하는 것을 모두 선택 |
| <선택자> + <선택자> | 같은 계층에서 바로 뒤에 있는 요소를 선택          |
| <선택자1>~<선택자2> | 선택자1에서부터 선택자2까지의 요소를 모두 선택       |



선택자 속성을 기반으로 지정하는 서식

| 서식               | 설명                                       |
| ---------------- | ---------------------------------------- |
| <요소>[속성]         | 해당 속성을 가진 요소를 선택                         |
| <요소>[<속성>=<값>]   | 해당 속성의 값이 지정한 값과 같은 요소                   |
| <요소>[<속성>~=<값>]  | 해당 속성의 값이 지정한 값을 단어로 포함(띄어쓰기 포함 완전히 포함)하고 있다면 선택 |
| <요소>[<속성>\|=<값>] | 해당 속성의 값으로 시작하면 선택                       |
| <요소>[<속성>^=<값>]  | 해당 속성의 값이 지정한 값으로 시작하면 선택                |
| <요소>[<속성>$=<값>]  | 해당 속성의 값이 지정한 값으로 끝나면 선택                 |
| <요소>[<속성>*=<값>]  | 해당 속성의 값이 지정한 값을 포함하면 선택                 |



위치 또는 상태를 지정하는 서식 

| 서식                     | 설명                  |
| ---------------------- | ------------------- |
| <요소>:root              | 루트 요소               |
| <요소>:nth-child(n)      | n번째 자식 요소           |
| <요소>:nth-last_child(n) | 뒤에서 부터 n 번째 자식      |
| <요소>:nth-of-type(n)    | n번째 해당 종류의 요소       |
| <요소>:first-child       | 첫번째 자식 요소           |
| <요소>:last-child        | 마지막 자식 요소           |
| <요소>:first-of-type     | 첫번째 해당 종류의 요소       |
| <요소>:last-of-type      | 마지막 해당 종류의 요소       |
| <요소>:only-child        | 자식으로 유일한 요소         |
| <요소>:only-of-type      | 자식으로 유일한 종류의 요소     |
| <요소>:empty             | 내용이 없는 요소           |
| <요소>:lang(code)        | 특정 언어로 code를 지정한 요소 |
| <요소>:not(s)            | s 이외의 요소            |
| <요소>:enabled           | 활성화된 UI요소           |
| <요소>:disabled          | 비활성화된 UI 요소         |
| <요소>:checked           | 체크돼 있는 UI요소를 선택     |

위치 또는 상태를 지정하는 서식의 대부분은 BeautifulSooup(4.5.1)에서 지원하지 않습니다. 

이중 지원하는 것은 nth-of-type(n)이 유일 



CSS 선택자로 추출 연습 



예. books.html

```html
<ul id="bible">
  <li id="ge">Genesis</li>
  <li id="ex">Exodus</li>
  <li id="le">Leviticus</li>
  <li id="nu">Numbers</li>
  <li id="de">Deuteronomy</li>
</ul>
```



위의 HTML 문서에서 Numbers 요소를 추출하는 경우 

```python
from bs4 import BeautifulSoup 
fp = open("books.html", encoding="utf-8")
soup = BeautifulSoup(fp, "html.parser")
# CSS 선택자로 검색하는 방법
sel = lambda q : print(soup.select_one(q).string)
sel("#nu")  #(※1)
sel("li#nu")  #(※2)
sel("ul > li#nu")  #(※3)
sel("#bible #nu")  #(※4)
sel("#bible > #nu")  #(※5)
sel("ul#bible > li#nu")  #(※6)
sel("li[id='nu']")  #(※7)
sel("li:nth-of-type(4)")  #(※8)
# 그 밖의 방법
print(soup.select("li")[3].string)   #(※9)
print(soup.find_all("li")[3].string) #(※10)
```



위의 결과 코드 

```bash
➜  ch1 python sel-books.py 
Numbers
Numbers
Numbers
Numbers
Numbers
Numbers
Numbers
Numbers
Numbers
Numbers
```



좀 더 복작합 선택자 이용하기 

예제 html 

```html
<html>
<body>
<div id="main-goods" role="page">
  <h1>과일과 야채</h1>
  <ul id="fr-list">
    <li class="red green" data-lo="ko">사과</li>
    <li class="purple" data-lo="us">포도</li>
    <li class="yellow" data-lo="us">레몬</li>
    <li class="yellow" data-lo="ko">오렌지</li>
  </ul>
  <ul id="ve-list">
    <li class="white green" data-lo="ko">무</li>
    <li class="red green" data-lo="us">파프리카</li>
    <li class="black" data-lo="ko">가지</li>
    <li class="black" data-lo="us">아보카도</li>
    <li class="white" data-lo="cn">연근</li>
  </ul>
</div>
<body>
</html>
```



위의 html에서 "아보카도"를 추출 하려면 어떻게 해야 할까

```python
from bs4 import BeautifulSoup 
fp = open("fruits-vegetables.html", encoding="utf-8")
soup = BeautifulSoup(fp, "html.parser")
# CSS 선택자로 추출하기
print(soup.select_one("li:nth-of-type(8)").string)  #(※1)
print(soup.select_one("#ve-list > li:nth-of-type(4)").string)  #(※2)
print(soup.select("#ve-list > li[data-lo='us']")[1].string)  #(※3)
print(soup.select("#ve-list > li.black")[1].string)  #(※4)
# find 메서드로 추출하기 ---- (※5)
cond = {"data-lo":"us", "class":"black"}
print(soup.find("li", cond).string)
# find 메서드를 연속적으로 사용하기 --- (※6)
print(soup.find(id="ve-list")
           .find("li", cond).string)
```



결과 

```bash
python sel-avocado.py 
아보카도
아보카도
아보카도
아보카도
아보카도
아보카도
```

1 li 항목의 8 번째 요소 

2 ve-list id를 가진 요소의 자식 중에서 li 요소의 4번째 요소 

3 select()를 이용, id가 ve-list 요소 바로 아래에 있는 li 태그 주에서 data-lo속성이 us인것을 추출하고 그중에 1번째 요소의 문자열을 추출 

4 select()를 이용,  class 속성이 black인 요소 가운데 첫번째 요소를 선택 

5 find()를 이용, 조건을 이용하여 값을 추출 

6 find()를 연속해서 두번 사용하여 값을 추출 



정규 표현식을 이용하여 가져오기 

예제 HTML . 실제 코드 

```html
from bs4 import BeautifulSoup 
import re # 정규 표현식을 사용할 때 --- (※1)
html = """
<ul>
  <li><a href="hoge.html">hoge</li>
  <li><a href="https://example.com/fuga">fuga*</li>
  <li><a href="https://example.com/foo">foo*</li>
  <li><a href="http://example.com/aaa">aaa</li>
</ul>
"""
soup = BeautifulSoup(html, "html.parser")
# 정규 표현식으로 href에서 https인 것 추출하기 --- (※2)
li = soup.find_all(href=re.compile(r"^https://"))
for e in li: print(e.attrs['href'])
```



위의 코드 결과물 

```bash
➜  ch1 python sel-re.py 
https://example.com/fuga
https://example.com/foo
```

