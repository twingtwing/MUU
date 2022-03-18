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
            <a href="/home" class="text-secondary"><i class="fa fa-home"></i>Home</a>
            <a href="/user/userSelect" class="text-dark font-weight-bold">마이페이지</a>
            <a href="/user/userLectureList" class="text-dark font-weight-bold">내 강의리스트</a>
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
              <li class="list-group-item border-bottom-0 align-items-center d-flex justify-content-center" style="height: 75px;"onclick="location.href='/user/userLectureList'">
                <div class="list-link">
                  <div class="row">
                    <div class="col-lg-4 justify-content-center align-items-center d-flex">
                      <span style="font-size:25px;">🚀</span>
                    </div>
                    <div class="col-lg-8 pr-0 pl-0 align-items-center d-flex">
                      <p class="font-weight-bold mb-0">&nbsp;&nbsp;&nbsp;&nbsp;GO TO<br>강의 리스트</p>
                    </div>
                  </div>
                </div>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex  listmenu" data-url="/lecD" style="height: 55px;">
                <div class="list-link">강의 상세정보</div>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex  listmenu" data-url="/user/userLectureSelect" style="height: 55px;">
                <div class="list-link">수업 목록</div>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex listmenu" data-url="/user/userLNL" style="height: 55px;">
                <div class="list-link active">공지사항</div>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex listmenu" data-url="/user/userLQ" style="height: 55px;">
                <div class="list-link" data-url="/user/userLQ">질문 & 답변</div>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex listmenu" data-url="/user/userLR"style="height: 55px;">
                <div class="list-link" >리뷰 & 별점</div>
              </li>
              <li class="list-group-item align-items-center d-flex listmenu"  data-url="/user/userRefund" style="height: 55px;">
                <div class="list-link">환불</div>
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
                    <img class="rounded" src="${sugang.thumb }" alt="" style="object-fit: cover; width: 100%; height: 150px;">
                  </div>
                  <div class="col-9 d-flex align-items-center">
                    <div class="w-100">
                      <h3 class="font-weight-bold pb-3">${sugang.ttl }</h3>
                      <div class="progress mt-3">
                         <div class="progress-bar bg-danger text-left" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:${sugang.progPct}%">
							　${sugang.progPct}%
                        </div>
                      </div>
                     <div class="text-right font-weight-bold mt-2 text-secondary">수강기간:　${sugang.regDate }　-　${sugang.expDate }　</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row col-lg-12 p-0 m-0">
            <div class="col-12 p-0">
              <div class="col-12 bg-light px-3 py-2" style="border-top: 2px solid lightgray;">
                  <h5><strong> &nbsp;${notice.ttl}</strong></h5>
              </div>
              <div class="row col-12 bg-light px-3 py-0 m-0 justify-content-between"  style="border-bottom: 2px solid lightgray;">
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
              <div class="col-12 my-3" style="height: 45vh;">
                  <p class="px-2">${notice.content}</p>
              </div>
              <!-- 다중파일 -->
              <div class="row col-12 bg-light px-3 py-0 m-0 bg-light py-2" style="border-top: 2px solid lightgray; border-bottom:2px solid lightgray;">
                  <div class="d-flex align-items-center"><span class="text-light">'</span>
                  <c:if test="${notice.fileNo ne 0}">
                  <c:forEach items="${noticeFiles }" var="f">
	                      <i class="fa fa-download mx-3"></i>
		                  <a href="/download?phyPath=${f.phyPath}" class="text-muted file_download">${f.filePath }</a>
                  </c:forEach>
                  </c:if>
                  </div>
              </div>
            </div>
          </div>
      
          <div class="col-12 mt-3 justify-content-end">
              <button class="mr-5 btn btn-outline-secondary" id="back">뒤로가기</button>
          </div>
        </div>
      </div>

    </div>
  </section>
  
    <form action="" id="move" method="get">
  	<input type="hidden" name="ltNo" value="${sugang.ltNo}">
  	<input type="hidden" name="tlsnNo" value="${sugang.tlsnNo }">
  </form>
  <script>
  $('.listmenu').click((e)=>{
	  let url = e.currentTarget.dataset.url;
	  $('#move').attr('action',url);
	  $('#move').submit();
  })
  
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