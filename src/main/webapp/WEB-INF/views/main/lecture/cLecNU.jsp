<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    #cctgy>li {
        cursor: pointer;

    }
    .list-link {
        color: black;
    }
    .list-link.active {
        font-weight: bold;
        color: #e53637;

    }
    #bu {
        position: absolute;
        left: 80%;
        bottom: 8%;
    }
    td,
    th {
        padding: 0.5rem;
    }
    thead {
        background-color: lightgray;
    }
    #my_modal {
        text-align: center;
        display: none;
        width: 300px;
        padding: 20px 60px;
        background-color: #fefefe;
        border: 1px solid #888;
        border-radius: 3px;
    }
    .modal_btn:hover{
        cursor: pointer;
        font-weight: bold;
    }
</style>
</head>
<body>
<section class="normal-breadcrumb set-bg" data-setbg="/resources/img/normal-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>크리에이터 - 공지사항</h2>
                        <p>공지사항 선택</p>
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
                    <div class="row" style="width:160px">
                        <ul class="list-group w-100" id="cctgy">
                            <!-- 해당 상위카테고리 일때, active가 보여야함 => 자바스크립트 혹은 jstl if구문으로 해결해야함 
                             이때 상태에 따라서 열린강의인지 종료된강의인지 구별해야함
                            -->
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
                    <!-- 강의 하나에 대한 상세정보페이지-->
                    <div class="row col-12 mb-2 ml-3">
                        <h5 class="mx-4 my-3 font-weight-bold">강의제목 : <strong class="text-danger">집에서 배우는...</strong></h5>

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

                        <div class="row col-12 justify-content-center mt-4">
                            <h4 class="font-weight-bold">공지사항 수정</h4>
                        </div>
                        
                        <div class="row col-12 mr-5 mt-3">
                            <div class="row col-12 bg-light py-2" style="border-top: 2px solid black; border-bottom:1px solid black;">
                                <div class="col-1 px-0 d-flex align-items-center">
                                    <h5><strong>제목 : </strong></h5>
                                </div>
                                <div class="col-11 px-0">
                                    <input class="w-100" type="text" id="ttl" spellcheck="false" value="${noinfo.ttl }">
                                </div>
                            </div>
                            <div class="row col-12 justify-content-between bg-light py-2"  style="border-bottom: 2px solid black;">
                                <p class="mb-0">글번호 : ${noinfo.ntNo }</p>
                                <div class="row">
                                    <p class="mb-0">조회수 : ${noinfo.hits }</p>
                                    <p class="mb-0 ml-2">작성날짜 : ${noinfo.wrDate }</p>
                                    <!-- 수정안했으면 안해도됨 -->
                                    <c:if test="${noinfo.modDate != null }">
                                    	<p class="mb-0 ml-2 mr-2">수정날짜 : ${noinfo.modDate }</p>
                                    </c:if>
                                </div>
                            </div>
                            <div class="row col-12 my-3" style="height: 45vh;">
                                <textarea id="content" cols="130" rows="10" spellcheck="false"></textarea>
                            </div>
                            <div class="row col-12 bg-light py-2" style="border-top: 2px solid black; border-bottom:2px solid black;">
                                <div class="d-flex align-items-center">
	                                <input type="file" id="multiFile" name="multiFile" multiple="multiple" onchange="fileChange()">
                                </div>
                                    <c:if test="${not empty noinfo.fileList}">
                                    	<div id="fileDiv" class="row align-items-center position-absolute bg-light" style="left: 120px; top: 8px; padding-right: 100px;">
	                                     	<c:forEach items="${noinfo.fileList }" var="file">
	                                      		<p class="mb-0">${file.filePath}</p>&nbsp;&nbsp;&nbsp;
	                                     	</c:forEach>
                                    	</div>
                                   	</c:if>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row col-12 ml-1 justify-content-between">
                        <button onclick="history.back()" class="btn btn-outline-secondary">뒤로가기</button>
                        <div class="row mr-4">
                            <!-- 등록하면 list가 아니라 그 수정된 페이지로 이동해야함 -->
                            <button class="btn btn-outline-secondary mr-2" onclick="noticeUpdate()">수정</button>
                            <button onclick="history.back()" class="btn btn-outline-secondary mr-2">취소</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <form id="frm">
    	<input class="sendltno" type="hidden" name="ltNo" value="">
    </form>
</body>
<script>
//mouseover 이벤트 : 사이드바 css변경
$('#cctgy > .list-group-item:not(.mylist)').on('mouseover', function () {
    $(this).css('background-color', '#e53637');
    $(this).find('.list-link').css('color', '#ffffff');
})

//mouseover 이벤트 : 사이드바 css변경
$('#cctgy > .list-group-item:not(.mylist)').on('mouseout', function () {
    $(this).css('background-color', '#ffffff');
    $(this).find('.list-link').css('color', '#000000');
    $(this).find('.list-link.active').css('color', '#e53637');
})

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

//파일 다운로드 불러오기(무늬)
function fileChange(){
	if($('#multiFile')[0].files.length !=0){
		$('#fileDiv').addClass('d-none');
	}
}
//공지사항 수정
function noticeUpdate(){
	let form = new FormData();
	let content = $('#content').val();
	content = lineMaker(content);
	form.append("ntNo", ${noinfo.ntNo});
	form.append("ttl", $('#ttl').val());
	form.append("content", content);
	if(${noinfo.fileNo}!=''){
		form.append("fileNo",${noinfo.fileNo});
	}
	for(obj of $('#multiFile')[0].files){
		form.append("files",obj);
	}
	
	$.ajax({
		url : "/creator/cLecNUpdate",
		method : "post",
		processData : false,
        contentType : false,
        async : false,
        beforeSend: function(xhr) {
             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		data : form,
		success: function(e){
			alert('글이 수정되었습니다');
			location.href="/creator/cLecNS?ntNo="+e.ntNo;
		}
	})
	
}

//줄바꿈
const lineMaker = (e)=>{
	let inputVal = e;
	inputVal = inputVal.replace(/\r\n/ig,'<br>');
	inputVal = inputVal.replace(/\\n/ig,'<br>');
	inputVal = inputVal.replace(/\n/ig,'<br>');
	return inputVal;
}

//br없애기
const brDel = (e)=>{
	let inputVal = e;
	inputVal = inputVal.replace(/<br>/ig,'\n');
	inputVal = inputVal.replace(/<\/br>/ig,'\n');
	inputVal = inputVal.replace(/<br\/>/ig,'\n');
	return inputVal
}

//공지사항 수정란
$(function(){
	let content = '${noinfo.content}';
	content = brDel(content);
	$('#content').val(content);
})

</script>
</html>