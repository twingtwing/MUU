<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #cctgr > li{
      cursor: pointer;

    }

    .list-link {
      color: black;
    }

    .list-link.active{
      font-weight: bold;
      color: #e53637;
    }
    td,th{
      padding: 0.5rem;
    }
    thead{
      background-color: lightgray;
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
            <p>공지사항</p>
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
            <span>공지사항</span>
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
                <a class="list-link active" href="./박정욱_위시리스트.html">공지사항</a>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                <a class="list-link" href="./박정욱_위시리스트.html">질문 & 답변</a>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                <a class="list-link" href="./박정욱_위시리스트.html">리뷰 & 별점</a>
              </li>
              <li class="list-group-item align-items-center d-flex" style="height: 55px;">
                <a class="list-link" href="./박정욱_유저결제내역.html">환불</a>
              </li>
            </ul>
          </div>
        </div>
        
        <div class="col-lg-10">
          <div class="row col-lg-12 ml-2">
            <h3 class="font-weight-bold"><i class="fa fa-table text-danger" aria-hidden="true"></i>&nbsp;수강 중 - 공지사항</h3>
          </div>
          <hr class="font-weight-bold">
          <div class="col-lg-12 px-0 mb-3">
            <div class="card w-100">
              <div class="card-body">
                <div class="row">
                  <div class="col-3">
                    <img class="rounded" src="/img/blog/blog-1.jpg" alt="" style="object-fit: cover; width: 100%; height: 150px;">
                  </div>
                  <div class="col-9 d-flex align-items-center">
                    <div class="w-100">
                      <h3 class="font-weight-bold pb-3">강의명</h3>
                      <div class="progress mt-3">
                        <div class="progress-bar bg-danger" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:70%">
                          70%
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row col-lg-12 py-3">
            <div class="row col-12 mr-5 mt-3">
              <div class="row col-12 bg-light py-2" style="border-top: 2px solid lightgray;">
                  <h5><strong> &nbsp;${notice.ttl}</strong></h5>
              </div>
              <div class="row col-12 justify-content-between bg-light py-2"  style="border-bottom: 2px solid lightgray;">
                  <p class="mb-0">글번호 : ${notice.ntNo }</p>
                  <div>
                      <span class="mb-0">조회수 : ${notice.hits }</span>
                      <span class="mb-0 ml-2">작성날짜 : ${notice.wrDate}</span>
                      <!-- 수정안했으면 안해도됨 -->
                      <c:if test="${not empty notice.modDate}">
                      <span class="mb-0 ml-2 mr-2">수정날짜 : ${notice.modDate}</span>
                      </c:if>
                  </div>
              </div>
              <div class="row col-12 my-3" style="height: 45vh;">
                  <p class="px-2">${notice.content}</p>
              </div>
              <div class="row col-12 bg-light py-2" style="border-top: 2px solid lightgray; border-bottom:2px solid lightgray;">
                  <div class="d-flex align-items-center">
                  <c:if test="${not empty notice.fileNo}">
                      <i class="fa fa-download mr-2"></i>
                  </c:if>
                  </div>
                  <span class="mb-0 mr-2">
	                  <a href="" class="text-muted file_download">${notice.fileNo }</a>
               </span>
              </div>
            </div>
          </div>
      
          <div class="row col-12 mr-5 justify-content-end">
              <button class="mr-5 btn btn-outline-secondary" id="back">뒤로가기</button>
          </div>
        </div>
      </div>

    </div>
  </section>
  <script>
    $('#back').click(()=>{
      location.href = '/user/userLNL?ltNo=${notice.ltNo}';
    })

    
    //mouseover 이벤트 : 사이드바 css변경
    $('#cctgr .list-group-item:not(.mylist)').on('mouseover',function(){
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