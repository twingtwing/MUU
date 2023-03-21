# Make U up
> 온라인 강의 플랫폼 서비스  

</br>

## 1. 제작 기간 & 참여 인원
- 2022년 2월 08일 ~ 3월 22일
- 팀 프로젝트

</br>

## 2. 사용 기술
#### `Back-end`
  - Java 11
  - Spring ??
  - Maven
  - My Batis
  - Oracle DB ??
  - Spring Security
#### `Front-end`
  - Javascript
  - jQuery
  - Vue.js ?
  - Bootstrap 4

</br>

## 3. ERD 설계
![ERD](https://user-images.githubusercontent.com/86578586/226083753-7ca454fc-3b9f-4041-a443-dfdc442cd633.png)

## 4. 핵심 기능
이 서비스의 핵심 기능은 강의 결제 기능입니다.  
사용자가 원하는 강의를 선택해서 결제 버튼만 클릭하면 끝입니다.
아래 기능의 흐름을 보면, 서비스가 어떻게 동작하는지 알 수 있습니다.

<details>
<summary><b>핵심 기능 설명 펼치기</b></summary>
<div markdown="1">

### 4.1. 전체 흐름
![전체흐름](https://user-images.githubusercontent.com/86578586/226534258-b7b07597-887a-4dab-af11-6937fdca762d.png)

### 4.2. 사용자 요청 :pushpin: [코드 확인](https://github.com/twingtwing/MUU/blob/master/src/main/webapp/WEB-INF/views/main/lecture/lecP.jsp)
![정규식 체](https://user-images.githubusercontent.com/86578586/226534330-1259ba35-4832-4161-946b-0645fd72cebb.png)

  - **정규식 체크** : Vue.js로 렌더링된 화면단에서, 사용자가 등록한 정보를 정규식으로 환영합니다.
    
![결제 요](https://user-images.githubusercontent.com/86578586/226534405-6bb718e7-e7e7-4d44-94ef-d94c67a08399.png)
  
  - **결제 요청** : 결제 API서비스를 연결하여, 성공 시에 강의를 결제하는 요청을 POST로 보냅니다.
  
### 4.3. Controller :pushpin: [코드 확인](https://github.com/twingtwing/MUU/blob/master/src/main/java/co/makeu/up/sugang/web/SugangController.java)

![Controller](https://user-images.githubusercontent.com/86578586/226535197-fba14091-023b-4974-9764-c63f705ee01c.png)

- **요청 처리** : Controller에서는 강의 신청 요청을 화면단에서 넘어온 요청을 받고, Service 계층에 로직 처리를 위임합니다.
- **추가 요청** : 포인트, 진행상태 등 관련 테이블 처리를 Service 계층으로 보냅니다.

### 4.4. Mapper :pushpin: [코드 확인](https://github.com/twingtwing/MUU/blob/master/src/main/java/co/makeu/up/sugang/service/sugang-map.xml)

![Mapper](https://user-images.githubusercontent.com/86578586/226536602-c5082716-4915-471f-a318-e6598bfd9169.png)

- **강의 저장** : 강의 컨텐츠는 다시 Mapper - Service - Controller를 거쳐 화면단에 송출됩니다.

</div>
</details>

## 5.성과와 수치 중심의 결과 요약
후기 작성
