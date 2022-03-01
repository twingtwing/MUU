<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <style>
    td,
    th {
      padding: 0.5rem;
    }

    thead {
      background-color: lightgray;
    }

    tbody>tr {
      cursor: pointer;
    }

    .list-link {
      color: black;
    }
        
    .list-link.active{
      font-weight: bold;
      color: #e53637;
    }
  </style>
</head>
<body>
  <!-- body 시작 -->

  <!-- 배너 시작-->
  <section class="normal-breadcrumb set-bg" data-setbg="img/normal-breadcrumb.jpg">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <div class="normal__breadcrumb__text">
            <h2>마이페이지</h2>
            <p>결제내역</p>
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
            <a href="#" class="text-dark font-weight-bold"><i class="fa fa-home "></i> Home</a>
            <a href="#" class="text-dark font-weight-bold">마이페이지</a>
            <span>결제내역</span>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 카테고리 끝-->

  <!-- body 의 body-->
  <section class="blog spad" style="margin : 0 10vw;" id="select_wishlist">
    <div class="container">
      <div class="row">
        <!-- 사이드 시작 -->
        <div class="col-lg-2">
          <div class="row mr-2" style="width:160px">
            <ul class="list-group w-100">
              <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                <a class="list-link" href="#">내 정보</a>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                <a class="list-link" href="#">내 강의리스트</a>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                <a class="list-link" href="./박정욱_위시리스트.html">위시 리스트</a>
              </li>
              <li class="list-group-item align-items-center d-flex" style="height: 55px;">
                <!-- 해당 상위카테고리 일때, active가 보여야함 => 자바스크립트 혹은 c:if구문으로 해결해야함 -->
                <a class="list-link active" href="./박정욱_유저결제내역.html">결제내역</a>
              </li>
            </ul>
          </div>
        </div>
        <!-- 사이드 끝 -->
        <div class="col-lg-10">
          <div class="row ml-2">
            <h3 class="font-weight-bold"><i class="fa fa-money text-danger" aria-hidden="true"></i>&nbsp;결제내역</h3>
          </div>
          <hr class="font-weight-bold">
          <div class="row py-3">
            <!-- 본편-->
            <div class="col-lg-12">
              <div class="card" style="height: auto;">
                <div class="card-body">
                  <div class="row">
                    <div class="col-lg-12">
                      <div class="row mt-2">
                        <div class="col-lg-12 d-flex justify-content-between mx-2">
                          <h5 class="font-weight-bold mb-2 text-dark"><i class="fa fa-truck text-danger"></i> 배송현황</h5>
                          <div class="align-items-bottom">
                            <p class="mb-0 text-danger mr-3" style="font-size: 10px;">*배송과 관련된 문제는 사이트에서 책임지지 않습니다.</p>
                          </div>
                        </div>
                      </div>
                      <div>
                        <!-- 카드 반복 시작-->
                        <!-- 배송현황에는 구매확정이 안된 데이터들만 보이게 합니다. -->
                        <div class="card" style="border-radius: 10px;">
                          <div class="card-body">
                            <div class="row">
                              <div class="col-lg-12">
                                <div class="row">
                                  <div class="col-lg-10">
                                    <div class="row mx-1">
                                      <h5 class="font-weight-bold mb-3 mt-1">강의 제목...</h5>
                                    </div>
                                    <div class="row mx-1 justify-content-between mb-2">
                                        <p class="mb-0">라면 (200,000원)</p> 
                                        <p class="mb-0">운송장번호 : 0000000</p>
                                    </div>
                                    <div class="row mx-1">
                                      <p class="mb-0 font-weight-bold">진행상황</p>
                                      <div class="progress-bar ml-2 bg-warning" role="progressbar" style="width: 80%;" aria-valuenow="50%" aria-valuemin="0" aria-valuemax="100">배송완료</div>
                                    </div>
                                  </div>
                                  <div class="col-lg-2 align-self-end">
                                    <button type="submit" class="site-btn mb-2" style="padding: 10px 20px;">구매확정</button>
                                    <button type="submit" class="site-btn" style="padding: 10px 20px;">반송신청</button>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <!-- 카드 반복 끝 -->
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-12">
                      <div class="mt-5 mb-2 d-flex justify-content-end">
                        <div class="form-group mb-0">
                          <div class="input-group date" id="datetimepicker1" data-target-input="nearest">
                            <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker1"
                              value="01/11/2020">
                            <div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
                              <div class="input-group-text">
                                <i class="fa fa-calendar"></i></div>
                            </div>
                          </div>
                        </div>
                        <div class="mx-3 align-self-center">
                          <h5 class="mb-0">-</h5>
                        </div>
                        <div class="form-group mb-0">
                          <div class="input-group date" id="datetimepicker2" data-target-input="nearest"> <input type="text"
                              class="form-control datetimepicker-input" data-target="#datetimepicker2" value="01/15/2020">
                            <div class="input-group-append" data-target="#datetimepicker2" data-toggle="datetimepicker">
                              <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <table class="table border-bottom">
                        <thead class="text-center">
                          <th style="width: 300px;">강의사진</th>
                          <th>강의제목</th>
                          <th>강의설명</th>
                          <th style="width: 110px;">강의비용</th>
                          <th style="width: 130px;">구매날짜</th>
                        </thead>
                        <tbody>                
                          <tr>
                            <td>
                              <div class="text-align-last:center">
                                  <img src="./img/blog/blog-1.jpg" alt="" class="rounded" style="height: 150px; width: 300px;">
                              </div>
                            </td>
                            <td class="text-center align-middle">
                                화려하게 흩날리는 천봉앵을 만드는 꽂꽂이
                            </td>
                            <td class="text-center align-middle">
                                무엇을 상상하는 그 이상의 꽂꽂이를 만들어 보세요! 모든것을 만들어내는 꽂꽂이!
                            </td>
                            <td class="text-center align-middle">
                                250,000
                            </td>
                            <td class="text-center align-middle">0000-00-00</td>
                          </tr>
                        </tbody>
                      </table>
                      <div class="product__pagination d-flex justify-content-center">
                        <a href="#"><i class="fa fa-angle-double-left"></i></a>
                        <a href="#" class="current-page">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        <a href="#"><i class="fa fa-angle-double-right"></i></a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- 본편 끝-->
              <!--card body end-->
            </div>
            <!-- card end-->
          </div>
        </div>
      </div>
      <div class="col-lg-12">
        <div class="row py-3">
        </div>
      </div>
    </div>
    </div>
  </section>
  <!-- body 의 body 끝 -->
  <!-- body 끝 -->
  <script type="text/javascript">
    $(function () {
      $('#datetimepicker1').datetimepicker({
        format: 'L'
      });
      $('#datetimepicker2').datetimepicker({
        format: 'L',
        useCurrent: false
      });
      $("#datetimepicker1").on("change.datetimepicker", function (e) {
        $('#datetimepicker2').datetimepicker('minDate', e.date);
      });
      $("#datetimepicker2").on("change.datetimepicker", function (e) {
        $('#datetimepicker1').datetimepicker('maxDate', e.date);
      });
    });

    //mouseover 이벤트 : 사이드바 css변경
    $('.list-group .list-group-item').on('mouseover',function(){
      $(this).css('background-color','#e53637');
      $(this).find('.list-link').css('color','#ffffff');
    })

    //mouseover 이벤트 : 사이드바 css변경
    $('.list-group .list-group-item').on('mouseout',function(){
      $(this).css('background-color','#ffffff');
      $(this).find('.list-link').css('color','#000000');
      $(this).find('.list-link.active').css('color','#e53637');
    })
  </script>
</body>
</html>