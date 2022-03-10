<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    td,th{
      padding: 0.5rem;
    }
    thead{
      background-color: lightgray;
    }
    tbody>tr{
      cursor: pointer;
    }
    #cctgy > li{
      cursor: pointer;
    }
    .list-link {
      color: black;
    }
    .list-link.active{
      font-weight: bold;
      color: #e53637;
    }
    #but{
      position:absolute;
      right: 60px;
      bottom: 1px;
    }
    a{
    	cursor:pointer;
    }
  </style>
</head>
<body>
<section class="normal-breadcrumb set-bg" data-setbg="/resources/img/normal-breadcrumb.jpg">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <div class="normal__breadcrumb__text">
            <h2>공지사항</h2>
            <p>크리에이터 공지사항</p>
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
                  </div>
              </div>
          </div>
      </div>
  </div>
  <!-- 카테고리 끝-->

  <!-- body 의 body-->
  <section class="blog spad">
    <div class="container">
      <div class="row">
        <!--사이드바-->
        <div class="col-lg-2">
          <div class="row mr-2" style="width:160px">
              <ul class="list-group w-100" id="cctgr">
                  <!-- 해당 상위카테고리 일때, active가 보여야함 => 자바스크립트 혹은 jstl if구문으로 해결해야함 
                                               이때 상태에 따라서 열린강의인지 종료된강의인지 구별해야함-->
                  <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                      <a class="list-link" href="/creator/creS">크리에이터 정보</a>
                  </li>
                  <p class="list-group-item border-bottom-0 mb-0 align-items-center d-flex mylist">내 강의 목록</p>
                  <li class="list-group-item border-bottom-0 align-items-center d-flex pl-40" style="height: 35px;">
                      <a class="list-link" href="/creator/rLecL">&nbsp;&nbsp;- 신청한 강의</a>
                  </li>
                  <c:choose>
                  <c:when test="${lecinfo.ltStCode eq 'L01' }">
                  <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                      <a class="list-link active" href="/creator/oLecL">&nbsp;&nbsp;- 열린 강의</a>
                  </li>
                  <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                      <a class="list-link" href="/creator/clLecL">&nbsp;&nbsp;- 종료된 강의</a>
                  </li>
                  </c:when>
                  <c:when test="${lecinfo.ltStCode eq 'L03' }">
                  <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                      <a class="list-link" href="/creator/oLecL">&nbsp;&nbsp;- 열린 강의</a>
                  </li>
                  <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                      <a class="list-link active" href="/creator/clLecL">&nbsp;&nbsp;- 종료된 강의</a>
                  </li>
                  </c:when>
                  </c:choose>
                  <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                      <a class="list-link" href="/creator/rpLecL">&nbsp;&nbsp;- 신고된 강의</a>
                  </li>
                  <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                      <a class="list-link" href="/creator/lecI">강의등록</a>
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
        <!--사이드바-->
        <div class="col-lg-10">
          <div class="row ml-2">
            <h5 class="ml-1 mb-2 font-weight-bold">
                <i class="fa fa-hand-paper-o text-danger" aria-hidden="true"></i>
                <c:if test="${lecinfo.ltStCode eq 'L01' }">
                열린 강의 정보
                </c:if>
                <c:if test="${lecinfo.ltStCode eq 'L03' }">
                닫힌 강의 정보
                </c:if>
                <!-- 상태에 따라 닫힌인지 열린인지 달라짐 -->
            </h5>
          </div>
          <hr class="font-weight-bold">
          <div class="row col-12 mb-5 ml-3">
                        <!-- 제목 입력 / 제목 가져오기-->
              <h5 class="mx-4 my-3 font-weight-bold">강의제목 : <strong class="text-danger">${lecinfo.ttl }</strong></h5>

              <div class="row col-12">
                <div class="row col-12 mt-3 mb-3 justify-content-around">
                  <!-- 선택 : active -->
                  <c:if test="${lecinfo.ltStCode eq 'L01' }">
                  <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="gooLecture(${lecinfo.ltNo })">강의정보</button>
	              </c:if>
	              <c:if test="${lecinfo.ltStCode eq 'L03' }">
	              <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="goclLecture(${lecinfo.ltNo })">강의정보</button>
	              </c:if>
                  <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="goQna(${lecinfo.ltNo })">질문&답변</button>
                  <button class="btn btn-outline-secondary lecbtn active" style="width: 150px;" type="button" onclick="goNotice(${lecinfo.ltNo })">공지사항</button>
                  <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="goReview(${lecinfo.ltNo })">리뷰</button>
                  <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="goStudent(${lecinfo.ltNo })">수강생</button>
                </div>
              </div>  
                 
              <div class="row col-12 justify-content-end mt-3 mb-1">
                <!--여기서 부터임-->
                  <div class="row mr-1">
                      <div>
                          <select id="toc">                            	
                              <option value="제목">제목</option>
                              <option value="내용">내용</option>
                          </select>
                      </div>
                      <input class="border mb-0 ml-1" id="tocval" style="height: 37px; width: 170px" type="text"
                          placeholder="검색..." spellcheck=false onkeypress="if(event.keyCode==13){tocSearch();}">
                      <a class="btn btn-outline-secondary search-a" onclick="tocSearch()"><i class="icon_search"></i></a>

                  </div>
            </div>
            <div class="row col-12">
              <table class="w-100 mt-3 text-center">
                <thead>
                  <tr class="table-secondary border-top-0">
                    <th>글번호</th>
                    <th>제목</th>
                    
                    <th>작성날짜</th>
                    <th>조회수</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${nlists }" var="list" varStatus="status">
                  <tr onclick="noticeSelect(${list.ntNo}, ${list.noticeNo })">
                    <td>${list.ntNo }</td>
                    <td>${list.ttl }</td>
                    <td>${list.wrDate }</td>
                    <td>${list.hits }</td>
                  </tr>
                 </c:forEach>
                </tbody>
              </table>
          </div>
          
          <div class="row col-12 justify-content-center mt-3">
            <div class="product__pagination">
                <c:if test="${pagination.currRange ne 1}">
					<a><i class="fa fa-angle-double-left"></i></a>
				</c:if>
				<c:forEach begin="${pagination.startPage }" end="${pagination.endPage }" var="page">
					<c:choose>
						<c:when test="${page eq pagination.currPage}">
							<a class="current-page paging">${page}</a>
						</c:when>
						<c:otherwise>
							<a class="paging">${page}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pagination.currRange ne pagination.pageCnt && pagination.pageCnt > 0}">
					<a><i class="fa fa-angle-double-right"></i></a>
				</c:if>
            </div>
          </div>
          <button id="but" class="btn btn-outline-secondary" onclick="insertNotice(${lecinfo.ltNo})"> 글쓰기</button>
        </div>
        </div>
      </div>
    </div>
  </section>
  <form id="frm">
   	<input class="sendltno" type="hidden" name="ltNo" value="">
  </form>
  <form id="pageFrm">
   	<input class="sendltno" type="hidden" name="ltNo" value="">
   	<input class="spage" type="hidden" name="page" value="">
  </form>
  <form id="pagesearchFrm">
    <input class="sendltno" type="hidden" name="ltNo" value="${lecinfo.ltNo}">
   	<input class="sendttl" type="hidden" name="ttlSearchKey" value="">
   	<input class="sendcontent" type="hidden" name="contentSearchKey" value="">
   	<input class="spage" type="hidden" name="page" value="">
  </form>
  <form id="noticeSelectFrm">
  	<input class="sendltno" type="hidden" name="ltNo" value="${lecinfo.ltNo}">
   	<input class="sendntno" type="hidden" name="ntNo" value="">
   	<input class="sendnoticeno" type="hidden" name="noticeNo" value="">
  </form>
  <form id="noticeSearchFrm">
  	<input class="sendltno" type="hidden" name="ltNo" value="${lecinfo.ltNo}">
   	<input class="sendttl" type="hidden" name="ttlSearchKey" value="">
   	<input class="sendcontent" type="hidden" name="contentSearchKey" value="">
  </form>
  
</body>
<script>
$(function(){
	$('select').niceSelect('destroy');
})
$('#tocval').keyup(function(e){
	e.preventDefault();
})

//시큐리티 토큰
let header = "${_csrf.headerName}";
let token = "${_csrf.token}";

//검색키 선언
let ttlSearchKey;
let contentSearchKey;

$(function(){
	$('.paging').on('click', function(){
		//검색 후 페이지 이동
		if($('#tocval').val() != null){
			$('.spage').val($(this).text());
			if($('#toc option:selected').val() == '제목'){
		  	    ttlSearchKey = $('#tocval').val();
		  	} else if($('#toc option:selected').val() == '내용'){
				contentSearchKey = $('#tocval').val();
			}
			$('.sendttl').val(ttlSearchKey);
		    $('.sendcontent').val(contentSearchKey);
		  	$('#pagesearchFrm').attr('action', '/creator/cLecNLpagesearch');
		  	$('#pagesearchFrm').submit();
		//페이지 이동
		} else {
			$('.sendltno').val(${lecinfo.ltNo});
			$('.spage').val($(this).text());
		  	$('#pageFrm').attr('action', '/creator/cLecNLpage');
		  	$('#pageFrm').submit();
		}
	})
})

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
  
  //강의 공지사항 글쓰기
  function insertNotice(e){
	  $('.sendltno').val(e);
  	  $('#frm').attr("action", "/creator/cLecNI");
  	  $('#frm').submit();
  }
  
  //열린강의정보 페이지 이동
  function gooLecture(e){
  	$('.sendltno').val(e);
  	$('#frm').attr("action", "/creator/oLecS");
  	$('#frm').submit();
  }
  //닫힌강의정보 페이지 이동
  function goclLecture(e){
  	$('.sendltno').val(e);
  	$('#frm').attr("action", "/creator/clLecS");
  	$('#frm').submit();
  }
  //qna 페이지 이동
  function goQna(e){
  	$('.sendltno').val(e);
  	$('#frm').attr("action", "/creator/cLecQ");
  	$('#frm').submit();
  }
  //공지사항 페이지 이동
  function goNotice(e){
  	$('.sendltno').val(e);
  	$('#frm').attr("action", "/creator/cLecNL");
  	$('#frm').submit();
  }
  //리뷰 페이지 이동
  function goReview(e){
  	$('.sendltno').val(e);
  	$('#frm').attr("action", "/creator/cLecR");
  	$('#frm').submit();
  }
  //수강생 리스트 페이지 이동
  function goStudent(e){
  	$('.sendltno').val(e);
  	$('#frm').attr("action", "/creator/cLecSt");
  	$('#frm').submit();
  }
  
  //공지사항 한건 조회
  function noticeSelect(a, b){
	  $('.sendntno').val(a);
	  $('.sendnoticeno').val(b);
	  $('#noticeSelectFrm').attr("action", "/creator/cLecNS");
	  $('#noticeSelectFrm').submit();
  }
  
  //공지사항 검색 조회
  function tocSearch(){
	  if($('#toc').val() == '제목'){
		  ttlSearchKey = $('#tocval').val();
	  }
	  if($('#toc').val() == '내용'){
		  contentSearchKey = $('#tocval').val();
	  }
	  $('.sendttl').val(ttlSearchKey);
	  $('.sendcontent').val(contentSearchKey);
	  
	  $('#noticeSearchFrm').attr("action", "/creator/cLecNLsearch");
	  $('#noticeSearchFrm').submit();
  }
  
  //검색 조회시 검색란 선입력
  $(function(){
	  $('#toc option:selected').removeAttr('selected');
	  if(${inputTtl != ''}){
		  $($('#toc option[value="제목"]')).attr('selected', 'selected');
		  $('#tocval').val('${inputTtl}');
	  } 
	  if(${inputContent != ''}){
		  $($('#toc option[value="내용"]')).attr('selected', 'selected');
		  $('#tocval').val('${inputContent}');
	  }
  })
  </script>
</html>