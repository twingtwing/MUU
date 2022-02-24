<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #cctgr li {
      cursor: pointer;

    }

    .list-link {
      color: black;
    }

    .list-link.active {
      font-weight: bold;
      color: #e53637;

    }

    #rfmodal {
      margin-top: 12rem;
    }
  </style>
</head>
<body>
 <!-- 배너 시작-->
  <section class="normal-breadcrumb set-bg" data-setbg="/resources/img/normal-breadcrumb.jpg">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <div class="normal__breadcrumb__text">
            <h2>내 강의리스트</h2>
            <p>환불</p>
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
            <a href="#">마이페이지</a>
            <a href="#">내 강의리스트</a>
            <span>환불</span>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 카테고리 끝-->
  
  <!-- body 의 body-->
  <section class="blog spad" style="margin : 0 10vw;">
    <div class="container">
      <div class="row">
        <div class="col-lg-2">
          <div class="row mr-2" style="width:160px">
            <ul class="list-group w-100" id="cctgr">
              <li class="list-group-item border-bottom-0 align-items-center d-flex justify-content-center" style="height: 75px;">
                <a class="list-link" href="#">
                  <div class="row">
                    <div class="col-lg-4 justify-content-center align-items-center d-flex">
                      <imo style="font-size:25px;">🚀</imo>
                    </div>
                    <div class="col-lg-8 pr-0 pl-0 align-items-center d-flex">
                      <p class="font-weight-bold mb-0">&nbsp;&nbsp;&nbsp;&nbsp;GO TO<br>강의 리스트</p>
                    </div>
                  </div>
                </a>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                <!-- 해당 상위카테고리 일때, active가 보여야함 => 자바스크립트 혹은 c:if구문으로 해결해야함 -->
                <a class="list-link" href="#">수업 목록</a>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                <a class="list-link" href="./박정욱_위시리스트.html">공지사항</a>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                <a class="list-link" href="./박정욱_위시리스트.html">질문 & 답변</a>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                <a class="list-link" href="./박정욱_위시리스트.html">리뷰 & 별점</a>
              </li>
              <li class="list-group-item align-items-center d-flex" style="height: 55px;">
                <a class="list-link active" href="./박정욱_유저결제내역.html">환불</a>
              </li>
            </ul>
          </div>
        </div>

        <div class="col-lg-10">
          <div class="row col-lg-12 ml-2">
            <h3 class="font-weight-bold"><i class="fa fa-retweet text-danger" aria-hidden="true"></i>&nbsp;수강 중 - 리뷰 & 별점</h3>
          </div>
          <hr class="font-weight-bold"> 
          <div class="col-lg-12">
            <div class="row justify-content-center">
              <div class="col-lg-10">
                <div class="card" style="position: relative; height: 60vh;">
                  <div class="card-body d-flex align-items-center justify-content-center">
                    <div class="d-flex flex-column align-items-center">
                      <h4>환불 규정</h4>
                      <div class="card bg-light m-3 my-5 p-3 text-center w-75"><b>강의 기간 시작일로부터 7일 이내, 3개 이하 수업 영상(OT 영상 제외)을
                          시청한 경우</b>결제대금 전액 환불 가능합니다.
                        강의 기간 시작일은 결제일부터입니다.
                      </div>
                      <div>
                        <!--기간이 지난 경우 표시
                          <div>해당 강의는 환불이 불가합니다.</div>
                        -->
                        <button class="border px-3 py-2" id="refund">환불 신청</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
    <!--확인창 모달-->
    <div class="modal fade p-3" id="rfmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
      aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content p-3">
          <div class="modal-header">
            <h5 class="modal-title">환불 신청 사유</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body d-flex flex-column align-items-center ">
            <!--환불 사유 카테고리-->
            <select name="" class="w-100" id="reason">
              <option value="."disabled selected>환불 사유(필수)</option>
              <option value=".">강의의 질이 떨어짐</option>
              <option value=".">터무니 없는 가격</option>
              <option value=".">쏼라쏼라</option>
              <option value=".">쏼라쏼라</option>
              <option value=".">쏼라쏼라</option>
              <option value="">기타</option>
            </select>
            <div class="reasonbox w-100"></div>
          </div>
          <div class="modal-footer d-flex justify-content-center">
            <button type="button" class="border px-3 py-2 bg-danger text-white">환불</button>
            <button type="button" class="border px-3 py-2" data-dismiss="modal">취소</button>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- body 의 body 끝 -->
  
  <script>
    $('#refund').click(() => {
      $('#rfmodal').modal('show')
    })
    $('#reason').change((e)=>{
      if(!e.currentTarget.value){
        $('.reasonbox').append(
          $('<input>').attr('type','text').addClass('border w-100 p-2 my-3')
        )
      } else {
        $('.reasonbox').children().remove();
      }
    })

    //mouseover 이벤트 : 사이드바 css변경
        $('#cctgr  .list-group-item:not(.mylist)').on('mouseover',function(){
        $(this).css('background-color','#e53637');
        $(this).find('.list-link').css('color','#ffffff');
        $(this).find('p').css('color','#ffffff');
    })

    //mouseover 이벤트 : 사이드바 css변경
    $('#cctgr  .list-group-item:not(.mylist)').on('mouseout',function(){
        $(this).css('background-color','#ffffff');
        $(this).find('.list-link').css('color','#000000');
        $(this).find('p').css('color','#000000');
        $(this).find('.list-link.active').css('color','#e53637'); 
    })
  </script>
</body>
</html>