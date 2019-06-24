# Today I Learned
- - - 
## 기본학습
- [javascript](https://www.youtube.com/watch?v=PZIPsKgWJiw&list=PLuHgQVnccGMA4uSig3hCjl7wTDeyIeZVU)
- [오라클 SQL과 PL/SQL을 다루는 기술](https://thebook.io/006696/) 3~7장
- [모두의 SQL](https://thebook.io/006977/) 4, 6~8장 
 
## 1 Week 
* day1 ( 2019.06.04 )
  - 메일/그룹웨어/SVN 계정 생성
  - 필요 장비 주문
  
* day2 ( 2019.06.05 )
  - PC 및 환경셋팅
  - 개발 툴 설치
    + Oracle 10g, STS, VScode ...[(wiki : 1W2D)](https://github.com/fyrn4/TIL/wiki/1W2D)
    
* day3 ( 2019.06.06 )
  - 사용중인 그룹웨어 소개 [(wiki : 1W3D)](https://github.com/fyrn4/TIL/wiki/1W3D)
  - [javascript 함수 모듈화에 대한 이해](http://www.nextree.co.kr/p4150/)
  
## 2 Week
* day1 ( 2019.06.10 ) [(repo : 2W1D)](https://github.com/fyrn4/TIL/tree/master/2W1D)
  - [SQL JOIN](https://www.youtube.com/watch?v=2Xa54XBXbk0&list=PLuHgQVnccGMAG1O1BRZCT3wkD_aPmPylq)
  - [CROSS JOIN](https://thebook.io/006696/part01/ch06/03/03/)
  - [과제] 그룹웨어 SQL작성하기.[(wiki : 2W1D)](https://github.com/fyrn4/TIL/wiki/2W1D)
  
* day2 ( 2019.06.11 )
  - mybatis guide
    - [Mapper XML파일](http://www.mybatis.org/mybatis-3/ko/sqlmap-xml.html)
    - [동적 SQL](http://www.mybatis.org/mybatis-3/ko/dynamic-sql.html)
    - [mybatis 룰과 사용시 발생 가능한 오류 대응](https://github.com/jaeyeolkim/jaeyeolkim.github.io/wiki/mybatis)
    
* day3 ( 2019.06.12 )
  - JSON 호출하여 결과를 console.log로 출력.(INPUT 하나의 조회조건)

* day4 ( 2019.06.13 ) [(repo : 2W4D)](https://github.com/fyrn4/TIL/tree/master/2W4D)
  - JQuery 기본 이해 [(학습)](https://www.youtube.com/watch?v=iQlURl_QjAk&list=PLBXuLgInP-5kLy13XLuK8iBWVFDBJygYr&index=67)
      - jQuery 객체 (63강)
      - jQuery로 문서 객체 조작하기 (64~66강)
      - jQuery로 이벤트 연결하기 (67강)
  - jQuery Selector 에 대한 학습(script는 반드시 코드를 직접 입력해보고 이해한다 [(학습)](https://api.jquery.com/category/selectors/)
    - Attribute Contains Selector [name*=”value”]부터 Class Selector (“.class”)(11개)
    - Element Selector (“element”)
    - ID Selector (“#id”)
    - :input Selector
    - Multiple Attribute Selector [name=”value”][name2=”value2″]
    - Multiple Selector (“selector1, selector2, selectorN”)
    - :selected Selector
    
* day5 ( 2019.06.14 ) [(repo : 2W5D)](https://github.com/fyrn4/TIL/tree/master/2W5D)
  - jQuery 함수 및 이벤트 
    - [http://api.jquery.com/category/effects/basics/](http://api.jquery.com/category/effects/basics/)
    - [http://api.jquery.com/on/](http://api.jquery.com/on/)
    - [http://api.jquery.com/click/](http://api.jquery.com/click/)
  - [Javascript Standard Style](https://standardjs.com/readme-kokr.html)
  
## 3 Week
* day1 ( 2019.06.17 )
  - [RealGrid Youtube](https://www.youtube.com/watch?list=PLdJpJI2SrqEnPxnHZneS0qBisto2c8efm&v=xUXubZmyKi4)
  - [Demo.RealGrid](http://demo.realgrid.com/)
    - 그리드 구성요소 [(wiki:3W1D Grid Component)](https://github.com/fyrn4/TIL/wiki/3W1D-Grid-Component)
    - 셀 구성요소 [(wiki:3W1D Cell Component)](https://github.com/fyrn4/TIL/wiki/3W1D-Cell-Component)
    - 컬럼 [(wiki:3W1D Column&Field attr)](https://github.com/fyrn4/TIL/wiki/3W1D-Column&Field-attr)
    - 그리드 편집
    - 렌더러(*체크) [(wiki:3W1D CheckCellRenderer)](https://github.com/fyrn4/TIL/wiki/3W1D-CheckCellRenderer)
* day2 ( 2019.06.18 )
  - [RealGrid tutorial](http://help.realgrid.com/tutorial) [(wiki:3W2D)](https://github.com/fyrn4/TIL/wiki/3W2D-Grid-Tutorial)
    - A, B Class 구현해보기.
* day3 ~ 5 ( 2019.06.18~21 )
  - RealGrid CRUD 작성해보기.
    - 공통 함수를 사용하지 않고 순수하게 RealGrid 에서 제공하는 API를 보고 진행한다.
    - 어느 정도 화면이 나오는 수준이 되면 공통함수를 이해하도록 한다.


## 4 Week
> Ls/Ed/P CRUD 화면 작성하기
- RealGrid CRUD 화면 작성.
  - 공통함수(gridJs)를 사용하지 않고, 순수 API참고하여 작성한다.
  - 이 후, 공통함수를 이해하도록 한다. 

> 과제:3가지 조회쿼리 작성하고 view작성하기. [(wiki:4W1D)](https://github.com/fyrn4/TIL/wiki/4W1D)

- 요구사항
  - 월별 급여를 입력하는 화면만들기.
  - 조회조건은 조회월(달력), 부서(콤보), 이름(text) 이다.
  - 그리드 컬럼에는 번호/부서명/이름/전월급여/복사(icon)/금월급여/지급여부(checkbox)
  - 급여가 입력되지 않은 직원도 대상자면, 목록에 나오도록 한다.
  - 복사 아이콘을 클릭하면 전월급여가 금월급여로 복사된다.
  - 금월급여는 편집가능하고, 0원보다 커야한다.
  - 지급여부는 Default가 'N'값이 입력되도록 한다. 



