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
![전체흐름도](https://user-images.githubusercontent.com/86578586/226525871-60bb2735-1bfe-4311-965e-771a943b87bd.png)

### 4.2. 사용자 요청 :pushpin: [코드 확인](https://github.com/twingtwing/MUU/blob/master/src/main/webapp/WEB-INF/views/main/lecture/lecP.jsp)
![정규식 체크](https://user-images.githubusercontent.com/86578586/226526814-76f2613f-d370-4ca5-b22b-efb55d481656.png)

  - 정규식 체크 : Vue.js로 렌더링된 화면단에서, 사용자가 등록한 정보를 정규식으로 환영합니다.
    
![비동기 요청](https://user-images.githubusercontent.com/86578586/226526935-0eb740a6-c42c-46e3-b9ff-d40bc9a161ed.png)
  
  - Ajax 비동기 요청 : 강의를 결제하는 POST요청을 비동기로 보냅니다.
  
### 4.3. Controller

![](https://zuminternet.github.io/images/portal/post/2019-04-22-ZUM-Pilot-integer/flow_controller.png)

- **요청 처리** :pushpin: [코드 확인](https://github.com/Integerous/goQuality/blob/b2c5e60761b6308f14eebe98ccdb1949de6c4b99/src/main/java/goQuality/integerous/controller/PostRestController.java#L55)
  - Controller에서는 요청을 화면단에서 넘어온 요청을 받고, Service 계층에 로직 처리를 위임합니다.

- **결과 응답** :pushpin: [코드 확인]()
  - Service 계층에서 넘어온 로직 처리 결과(메세지)를 화면단에 응답해줍니다.

### 4.4. Service

![](https://zuminternet.github.io/images/portal/post/2019-04-22-ZUM-Pilot-integer/flow_service1.png)

- **Http 프로토콜 추가 및 trim()** :pushpin: [코드 확인]()
  - 사용자가 URL 입력 시 Http 프로토콜을 생략하거나 공백을 넣은 경우,  
  올바른 URL이 될 수 있도록 Http 프로토콜을 추가해주고, 공백을 제거해줍니다.

- **URL 접속 확인** :pushpin: [코드 확인]()
  - 화면단에서 모양새만 확인한 URL이 실제 리소스로 연결되는지 HttpUrlConnection으로 테스트합니다.
  - 이 때, 빠른 응답을 위해 Request Method를 GET이 아닌 HEAD를 사용했습니다.
  - (HEAD 메소드는 GET 메소드의 응답 결과의 Body는 가져오지 않고, Header만 확인하기 때문에 GET 메소드에 비해 응답속도가 빠릅니다.)

  ![](https://zuminternet.github.io/images/portal/post/2019-04-22-ZUM-Pilot-integer/flow_service2.png)

- **Jsoup 이미지, 제목 파싱** :pushpin: [코드 확인]()
  - URL 접속 확인결과 유효하면 Jsoup을 사용해서 입력된 URL의 이미지와 제목을 파싱합니다.
  - 이미지는 Open Graphic Tag를 우선적으로 파싱하고, 없을 경우 첫 번째 이미지와 제목을 파싱합니다.
  - 컨텐츠에 이미지가 없을 경우, 미리 설정해둔 기본 이미지를 사용하고, 제목이 없을 경우 생략합니다.


### 4.5. Repository

![](https://zuminternet.github.io/images/portal/post/2019-04-22-ZUM-Pilot-integer/flow_repo.png)

- **컨텐츠 저장** :pushpin: [코드 확인]()
  - URL 유효성 체크와 이미지, 제목 파싱이 끝난 컨텐츠는 DB에 저장합니다.
  - 저장된 컨텐츠는 다시 Repository - Service - Controller를 거쳐 화면단에 송출됩니다.

</div>
</details>

## 5.성과와 수치 중심의 결과 요약
후기 작성
