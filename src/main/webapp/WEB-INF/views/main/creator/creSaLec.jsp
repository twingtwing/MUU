<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/creator-menu.css" type="text/css">
</head>
<body>
<!-- 배너 시작-->
  <section class="normal-breadcrumb set-bg" data-setbg="/resources/img/normal-breadcrumb.jpg">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <div class="normal__breadcrumb__text">
            <h2>크리에이터</h2>
            <p>매출 내역</p>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- 배너끝 -->

  <!-- 카테고리 시작-->
  <div class="breadcrumb-option">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="breadcrumb__links">
            <a href="#"><i class="fa fa-home"></i> 홈</a>
            <a href="#">크리에이터</a>
            <span>매출 내역</span>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 카테고리 끝-->
  
  <section class="blog spad" style="margin : 0 10vw;">
    <div class="container">
      <div class="row">
        <div class="col-lg-2">
          <div class="row mr-2" style="width:160px">
            <ul class="list-group w-100" id="cctgr">
                <!-- 해당 상위카테고리 일때, active가 보여야함 => 자바스크립트 혹은 jstl if구문으로 해결해야함 -->
                <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                    <a class="list-link" href="#">크리에이터 정보</a>
                </li>
                <p class="list-group-item border-bottom-0 mb-0 align-items-center d-flex mylist">내 강의 목록</p>
                <li class="list-group-item border-bottom-0 align-items-center d-flex pl-40" style="height: 35px;">
                    <a class="list-link" href="#">&nbsp;&nbsp;- 신청한 강의</a>
                </li>
                <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                    <a class="list-link" href="#">&nbsp;&nbsp;- 열린 강의</a>
                </li>
                <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                    <a class="list-link" href="#">&nbsp;&nbsp;- 종료된 강의</a>
                </li>
                <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                    <a class="list-link" href="#">&nbsp;&nbsp;- 신고된 강의</a>
                </li>
                <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                    <a class="list-link" href="#">강의등록</a>
                </li>
                <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                    <a class="list-link active" href="#">매출내역</a>
                </li>
                <li class="list-group-item align-items-center d-flex" style="height: 55px;">
                    <a class="list-link" href="#">환불 요청 내역</a>
                </li>
            </ul>
          </div>
        </div>

        <div class="col-lg-10">
          <div class="col-12 ml-2">
            <div class="row col-12">
              <h3 class="font-weight-bold"><i class="fa fa-pie-chart text-danger" aria-hidden="true"></i>&nbsp;매출 내역</h3>
            </div>
            <hr class="font-weight-bold">
            
            <div class="row col-12">
              <div class="menu w-100 d-flex justify-content-between">
                <div>
                  <a href="/creator/creSaleYear"><button class="border mx-1 px-3 py-2">연도별 매출</button></a>
                  <a href="/creator/creSaleMonth"><button class="border mx-1 px-3 py-2">월별 매출</button></a>
                  <a href="/creator/creSaleLec"><button class="border mx-1 px-3 py-2 bg-secondary text-white">강의별 매출</button></a>
                </div>
              </div>
              <hr class="font-weight-bold">
              <div class="row col-12 justify-content-end">
                <input type="date" class="border mx-1"> - <input type="date" class="border mx-1">
                <button class="border">조회</button>
              </div>
              <div class="col-12 row justify-content-center">
                <div class="row col-11">
                  <div class="w-100 d-flex mt-3">
                    <canvas id="myChart" class="m-3"></canvas>
                  </div>
                </div>
              </div>
            </div>
            <!-- 시간 되면 테이블 추가 -->
            <div class="row col-12 mr-5 justify-content-end">
              <button class="border px-3 py-2 bg-danger text-white">PDF 다운</button>
              <button class="border ml-1 mr-5 px-3 py-2 bg-success text-white">EXCEL 다운</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script>
    const ctx = document.getElementById('myChart').getContext('2d');
    const myChart = new Chart(ctx, {
      type: 'bar', // 이거 차트 형태 나타내는거임 line 도되는듯
      data: {
        labels: [
          '단타 너도 할 수 있다', '인스타그램으로 매달 100만원 들어와요', '주식',
        ],
        datasets: [
          {//데이터
            label: '판매량',// 이거 차트 제목임
            fill: false, // 이거 라인형태인데 이거 지워도 이상없는거 확인
            data: [
              50, 70, 50, 30 // x축에 들어가는건데 실제 데이터값 들어가면됨
            ],
            backgroundColor: [ // 이거 막대색임 남자는빨강
              'red',
              'red',
              'red',
              'red',
            ],
            borderColor: [ // 경계선 색임 검은색 통일하고싶음
              'black',
              'black',
              'black',
              'black'
            ],
            borderWidth: 1 // 이거 경계선 굵기임
          },
          {
            label: '총매출',
            data: [
            70, 80, 90, 40
          ]
          }
        ]
      }, // 이거 데이터 넣는건데 좀더 찾아야하는듯
      options: {
        scales: { // 이거 y축의 설정인데 좀더 찾아봐야할거같은데 맞는거같음
          y: {
            beginAtZero: true //이거 0부터하는거임 이거사이사이에 도있는데 블로그 마다추가되는 옵션들도있고 없는곳도있음
          }
        }
      }
    });

    //mouseover 이벤트 : 사이드바 css변경
        $('#cctgr > .list-group-item:not(.mylist)').on('mouseover',function(){
        $(this).css('background-color','#e53637');
        $(this).find('.list-link').css('color','#ffffff');
    })

    //mouseover 이벤트 : 사이드바 css변경
    $('#cctgr > .list-group-item:not(.mylist)').on('mouseout',function(){
        $(this).css('background-color','#ffffff');
        $(this).find('.list-link').css('color','#000000');
        $(this).find('.list-link.active').css('color','#e53637');
    })
  </script>
</body>
</html>