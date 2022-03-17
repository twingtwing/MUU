<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
    #cctgr li{
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
    tbody>tr{
      cursor: pointer;
    }
    a{
    	cursor: pointer;
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
            <a href="/home" class="text-dark font-weight-bold"><i class="fa fa-home"></i>Home</a>
            <a href="/user/userSelect" class="text-dark font-weight-bold">마이페이지</a>
            <a href="/user/userLectureList" class="text-dark font-weight-bold">내 강의리스트</a>
            <span>공지사항</span>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 카테고리 끝-->

<section class="blog spad">
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
                <div class="list-link ">수업 목록</div>
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
          
          <div class="row col-lg-12 py-3 m-0 justify-content-center">
            <div class="card w-100" style="position: relative;">
              <div class="card-body my-3">
                <div class="col-12 row justify-content-end mb-1">
                  <select class="border px-4" id="searchType">
                    <option value="ttlSearchKey">제목</option>
                    <option value="contentSearchKey">내용</option>
                  </select>
                  <input type="text" class="border" id="noticeSearchKey">
                  <button type="button" class="border px-4" id="noticeSearch">검색</button>
                </div>

                <div class="col-12 row mb-3">
                  <table class="w-100 list text-center">
                    <thead class="bg-light">
                      <tr>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>파일</th>
                        <th>작성일</th>
                        <th>조회수</th>
                      </tr>
                    </thead>
                    <tbody id="noticeList">
                      <c:forEach items="${notices}" var="notice">
                      <tr>
                        <td>${notice.ntNo}</td>
                        <td>${notice.ttl}</td>
                        <td>
                        	<c:if test="${notice.fileNo ne 0}"><i class="fa fa-file" aria-hidden="true"></i></c:if>
                        </td>
                        <td>${notice.wrDate }</td>
                        <td>${notice.hits }</td>
                      </tr>
                    </c:forEach>
                    </tbody>
                  </table>
                </div>
	
				<div class="product__pagination d-flex justify-content-center">
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
              <!--card body end-->
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <form action="/user/userLNS" id="userLNS">
  <input type="hidden" name="ntNo">
  <input type="hidden" name="ltNo" value="${sugang.ltNo}">
  </form>
  
  <form action="" id="move" method="get">
  	<input type="hidden" name="ltNo" value="${sugang.ltNo}">
  	<input type="hidden" name="tlsnNo" value="${sugang.tlsnNo }">
  </form>
  <!-- body 끝 -->
  <script> 
  $('.listmenu').click((e)=>{
	  let url = e.currentTarget.dataset.url;
	  $('#move').attr('action',url);
	  $('#move').submit();
  })
  // 일반 페이지네이션 함수
  const normalPageAjax = (data)=>{
	  $.ajax({
			url : '/user/userNoticePage',
			data : data,
			contentType : 'application/json;charset=utf-8',
		})
		.done((res)=>{
			$(document.querySelectorAll('.product__pagination>a')).removeClass('current-page');
			removeAll();
			changePage(res);
		})
  }
  // 검색시 페이지네이션 함수
  const searchPageAjax = (searchData) =>{
	  $.ajax({
  		url : '/user/userNoticeSearch',
  		data : searchData,
  		contentType : 'application/json;charset=utf-8',
  	})
  	.done((res)=>{
  		$(document.querySelectorAll('.product__pagination>a')).removeClass('current-page');
  		removeAll();
  		changePage(res);
  	})
  }
  
  // 페이지네이션
	$('.paging').click((e)=>{
		let pageNum = +e.currentTarget.textContent;
		const data = {ltNo : ${ltno} , page : pageNum};
		if(!$('#noticeSearchKey').val()){
			normalPageAjax(data);			
		} else {
			const searchData = makeSearchObj();
			searchData.page = pageNum;
			searchPageAjax(searchData);
		}
		$('.current-page').removeClass('current-page');
	    $(e.target).addClass('current-page');
	})
	
  // 페이지네이션 DOM 조작 함수
	const removeAll = ()=>{
		$('#noticeList').children().remove();
	}
	const changePage = (list)=>{
		list.forEach((val)=>{
			let fileicon = '';
			if(val.fileNo!=0){
				fileicon = '<i class="fa fa-file" aria-hidden="true"></i>';
			}
			console.log(fileicon)
			let tr = $('<tr>').append(
					$('<td>').text(val.ntNo),
					$('<td>').text(val.ttl),
					$('<td>').html(fileicon),
					$('<td>').text(dateformat(val.wrDate)),
					$('<td>').text(val.hits));
			$('#noticeList').append(tr);
		})
	}
	const dateformat = (num)=>{
    	let date = new Date(num);
    	return new Date(num - date.getTimezoneOffset()*60000).toISOString().slice(0,10);
    }
	
	
  // 클릭시 공지사항 내용으로
    $('#noticeList').click((e)=>{
      let ntNo = e.target.parentElement.closest('tr').firstElementChild.textContent;
      document.querySelector('#userLNS').firstElementChild.value = ntNo;
      $('#userLNS').submit();
    })

   // 페이징에 필요한 검색 객체 생성
   const makeSearchObj = ()=>{
	   let ttl = null; 
	   let cont = null;
	   if($('#searchType').val()==='ttlSearchKey'){
	   		ttl = $('#noticeSearchKey').val()
	   } else {
	   		cont = $('#noticeSearchKey').val();
	   }
	   const searchData = { ttlSearchKey : ttl , contentSearchKey : cont, ltNo : ${ltno}, page : 1}
	   return searchData
   }
   
   // 검색
    $('#noticeSearch').click((e)=>{   	
    	searchPageAjax(makeSearchObj());
    })
    $('#noticeSearchKey').keypress((e)=>{
    	if(e.key=='Enter'){
    		$('#noticeSearch').click();
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