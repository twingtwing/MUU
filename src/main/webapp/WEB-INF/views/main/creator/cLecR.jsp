<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/creator-menu.css" type="text/css">
<style>
    #wrmodal {
      margin-top: 12rem;
    }
    #stars .gr {
      color: gray;
      cursor: pointer;
    }
    .wrbox {
      height: 20rem;
    }
    #span .selected {
      color: var(--danger)
    }
    a {
      color: var(--secondary);
    }
  </style>
<script src="https://kit.fontawesome.com/8d99e6c8fb.js" crossorigin="anonymous"></script>
</head>
<body>
<!-- 배너 시작-->
  <section class="normal-breadcrumb set-bg" data-setbg="/resources/img/normal-breadcrumb.jpg">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <div class="normal__breadcrumb__text">
            <h2>크리에이터 페이지</h2>
            <p>환불 요청 내역</p>
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
                    <a href="#" class="text-dark font-weight-bold"><i class="fa fa-home"></i> Home</a>
                    <a href="#" class="text-dark font-weight-bold"> 내 강의 목록</a>
                    <span>상태에 따라 열렸는지 닫힌강의 열린강의 표시되어야함 </span>
                </div>
            </div>
        </div>
    </div>
</div>

<section class="blog spad">
    <div class="container">
      <div class="row">

        <div class="col-lg-2">
          <div class="row" style="width:160px">
            <ul class="list-group w-100" id="cctgr">
                            <!-- 해당 상위카테고리 일때, active가 보여야함 => 자바스크립트 혹은 jstl if구문으로 해결해야함 -->
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                                <a class="list-link active" href="/creS">크리에이터 정보</a>
                            </li>
                            <p class="list-group-item border-bottom-0 mb-0 align-items-center d-flex mylist">내 강의 목록</p>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex pl-40" style="height: 35px;">
                                <a class="list-link" href="/rLecL">&nbsp;&nbsp;- 신청한 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                                <a class="list-link" href="/oLecL">&nbsp;&nbsp;- 열린 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                                <a class="list-link" href="/clLecL">&nbsp;&nbsp;- 종료된 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                                <a class="list-link" href="/rpLecL">&nbsp;&nbsp;- 신고된 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                                <a class="list-link" href="/lecI">강의등록</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                                <a class="list-link" href="/creator/creSaleYear">매출내역</a>
                            </li>
                            <li class="list-group-item align-items-center d-flex" style="height: 55px;">
                                <a class="list-link" href="/creator/creRefund">환불 요청 내역</a>
                            </li>
                        </ul>
          </div>
        </div>

        <div class="col-lg-10">
          <div class="row ml-2">
            <h5 class="ml-1 mb-2 font-weight-bold">
                <i class="fa fa-hand-paper-o text-danger" aria-hidden="true"></i>
                열린 강의 정보
                <!-- 상태에 따라 닫힌인지 열린인지 달라짐 -->
            </h5>
          </div>
          <hr class="font-weight-bold">
          <div class="row col-12 mb-2 ml-3">
            <h5 class="mx-4 my-3 font-weight-bold">강의제목 : <strong class="text-danger">집에서 배우는...</strong></h5>

            <div class="row col-12">
                <div class="row col-12 mt-3 mb-3 justify-content-around">
                    <!-- 선택 : active -->
                    <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="location.href='rLecS.html'">강의정보</button>
                    <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="location.href='#'">질문&답변</button>
                    <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="location.href='#'">공지사항</button>
                    <button class="btn btn-outline-secondary lecbtn active" style="width: 150px;" type="button" onclick="location.href='#'">리뷰</button>
                    <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="location.href='#'">수강생</button>
                  </div>
                </div> 
                
                <hr class="font-weight-bold">
                
                <div class="row mt-4 col-12 justify-content-center">
                  <h5 class="font-weight-bold">수강 리뷰( <span class="fas fa-star"></span><span> 4.3</span> / 5 )</h5>
                </div>
                
                <div class="row col-12 justify-content-end mt-3 mb-1 pr-4">
                  <div>
                    <select class="border px-4">
                      <option value="">제목</option>
                      <option value="">내용</option>
                      <option value="">작성자ID</option>
                    </select>
                  </div>
                  <input type="text" class="border" spellcheck="false" placeholder="검색...">
                  <button type="button" class="border px-4 mr-4">검색</button>
                </div>

                <div class="row col-12 justify-content-center">
                  <!--  card 사실 유저페이지랑 거의 똑같음 -->
                  <div class="col-6 mt-3">
                    <div class="bg-light border rounded d-flex flex-column align-items-center p-3 mx-3 mb-3 rv">
                      <div class="d-flex justify-content-between w-100 mb-2 px-1">
                        <span>
                          <span>abc@naver.com</span>
                          <span class="fas fa-star"></span>
                          <span class="fas fa-star"></span>
                          <span class="fas fa-star"></span>
                          <span class="fas fa-star"></span>
                          <span class="fa fa-star-o"></span>
                        </span>
                        <span>
                          <span>2022.02.02</span><i class="fa fa-ban report text-danger ml-2" aria-hidden="true"></i>
                        </span>
                      </div>
                      <div class="bg-white h-25 w-100 h-100 rounded p-2">
                        아주 좋았어요 덕분에 지식이 많아졋어요
                      </div>
                    </div>
                  </div>
                  </div>
                  
                </div>
          
     

        </div>
      </div>
   
    </div>
  </section>
  <script type="text/javascript">
  $('.report').click((e)=>{
      $('#revReport').modal('show')
      // 누른 rpno 가져와서 ajax
    })
  </script>
</body>
</html>