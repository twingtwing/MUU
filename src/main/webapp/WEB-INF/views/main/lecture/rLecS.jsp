<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	.bg-dark{
	    color:white;
	}
	table {
	    border-collapse: separate;
	    border-spacing: 1px;
	    text-align: left;
	    line-height: 1.5;
	    border-top: 1px solid #ccc;
	    margin: 20px 10px;
	    font-size: small;
	    }
	th {
	    width: 250px;
	    padding: 10px;
	    font-weight: bold;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	    background: #efefef;
	}
	td {
	    width: 400px;
	    padding: 10px;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	}
</style>
</head>
<body>
<!-- 배너 시작-->
    <section class="normal-breadcrumb set-bg" data-setbg="img/normal-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>내 강의 목록</h2>
                        <p>신청한 강의</p>
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
                        <a href="/home" class="text-dark font-weight-bold"><i class="fa fa-home"></i> Home</a>
                        <a href="/creator/rLecL" class="text-dark font-weight-bold"> 신청한 강의</a>
                        <span>${rlists.ttl }</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 카테고리 끝-->

    <!-- body 의 body-->
    <!-- 신청한 강의, 썸네일 클릭시 ? 강의페이지로 이동 -->
    <!-- 이미지 a태그로 감싸서 페이지 링크-->
    <section class="blog spad">
        <div class="container">
            <div class="row">
                <!--사이드바-->
                <div class="col-lg-2">
                    <div class="row mr-2" style="width:160px">
                        <ul class="list-group w-100" id="cctgr">
                            <!-- 해당 상위카테고리 일때, active가 보여야함 => 자바스크립트 혹은 jstl if구문으로 해결해야함 -->

                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                                <a class="list-link" href="/creator/creS">크리에이터 정보</a>
                            </li>
                            <p class="list-group-item border-bottom-0 mb-0 align-items-center d-flex mylist">내 강의 목록</p>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex pl-40" style="height: 35px;">
                                <a class="list-link active" href="/creator/rLecL">&nbsp;&nbsp;- 신청한 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                                <a class="list-link" href="/creator/oLecL">&nbsp;&nbsp;- 열린 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                                <a class="list-link" href="/creator/clLecL">&nbsp;&nbsp;- 종료된 강의</a>
                            </li>
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

                <div class="col-lg-10">
                    <div class="row ml-2">
                        <h5 class="ml-1 mb-2 font-weight-bold">
                            <i class="fa fa-hand-paper-o text-danger" aria-hidden="true"></i>
                            신청한 강의 정보
                        </h5>
                    </div>

                    <hr class="font-weight-bold">
                    <!-- 강의 하나에 대한 상세정보페이지-->
                    <div class="col-12 ml-3">
                        <!-- 제목 입력 / 제목 가져오기-->
                        <h5 class="mx-4 my-4 font-weight-bold">강의제목 : <strong class="text-danger">${rlists.ttl }</strong></h5>
                        <h5 class="mx-4 my-3 font-weight-bold">신청상태 : 
                        <c:if test="${rlists.ltStCode eq 'L02' }"><strong class="text-success">미처리</strong></c:if>
                        <c:if test="${rlists.ltStCode eq 'L07' }"><strong class="text-danger">반려</strong></c:if>
                        </h5>
                        
                        <!-- 신청 상태 / 상태, 반려사유 가져오기(색처리)-->
                        <div class="row col-12">
                            <div class="col-12 text-right align-items-right">
                                <button class="btn btn-outline-secondary" type="button" onclick="lectureInfo(${rlists.ltNo })">강의정보수정</button>
                                &nbsp;&nbsp;&nbsp;
                                <!-- 
                                <button class="btn btn-outline-info"  type="button" onclick="lessonInfo(${rlists.ltNo })">영상 관리</button>
                                &nbsp;&nbsp;&nbsp;
                                 -->
                                <c:if test="${rlists.ltStCode == 'L07' }">
                                	<button class="btn btn-outline-danger" type="button" onclick="lectureReResister(${rlists.ltNo })">재신청</button>
                                </c:if>
                            </div>
                        </div>

                        <!--썸네일, 강의 소개 / 사진, 소개글 가져오기-->
                        <div class="row col-12 justify-content-center my-4">
                            <h5 class="font-weight-bold text-danger">강의 정보</h5>
                        </div>
                        <div class="row col-12 mt-3 mb-5">
                            <div class="col-4 text-center" style="border-right: 5px solid grey">
                                <img src="${rlists.thumb }" class="card-img-left img-thumbnail rounded-circle" style="width: 12rem; height: 12rem;">
                            </div>
                            <div class="col-8">
                                <div class="col-12 mt-2">
                                    <p>
                                       ${rlists.intro }
                                    </p>
                                </div>         
                            </div>
                        </div>

                       <!-- 대표사진-->
                        <div class="row col-12 justify-content-center my-4">
                            <h5 class="font-weight-bold">강의 사진 상세 정보</h5>
                        </div>
                        <div class="row col-12 justify-content-center border">
                            <div class="row mr-0 my-4">
                                <div class="col-lg-8 pr-2">
                                    <img src="${rlists.pht1 }" style="object-fit: cover; width: 100%; height: 500px;" alt="강의 이미지 1">
                                </div>
                                <div class="col-lg-4 p-0">
                                    <img src="${rlists.pht2 }" class="pb-2" style="object-fit: cover; width: 100%; height: 250px;" alt="강의 이미지 2">
                                    <img src="${rlists.pht3 }" style="object-fit: cover; width: 100%; height: 250px;" alt="강의 이미지 3">
                                </div>
                            </div>
                        </div>
                        <!-- 나중에 시간 남으면 누르면 원본 사진 팝업형식으로 보여주는 방법하기 -->
                        
                        <!--강의 정보 테이블, 태그-->
                        <div class="row col-12 mt-3 mb-3">
                            <div class="col-9">
                                <h5 class="font-weight-bold text-center">강의 상세 정보</h5>
                                <table>
                                    <tbody>
                                        <tr>
                                            <th>카테고리</th>
                                            <td>${rlists.upCtgr }/${rlists.downCtgr }</td>
                                            <th>강의게시기간</th>
                                            <td>${rlists.openTerm }개월</td>
                                        </tr>
                                        <tr>
                                            <th>강의수강기간</th>
                                            <td>${rlists.tlsnTerm }개월</td>
                                            <th>강의만료날짜</th>
                                            <td>${rlists.expDate }</td>
                                        </tr>
                                        <tr>
                                            <th>강의가격</th>
                                            <td>${rlists.prc }만원</td>
                                            <th>키트가격</th>
                                            <td>${rlists.kitPrc }원</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-3">
                                <h5 class="font-weight-bold mb-2">태그</h5>
                                <!-- 태그 반복문 등록-->
                                <div>
                                	<c:if test="${rlists.tag1 !='null' }">
	                                    <span class="badge bg-dark px-2 py-1 mr-1">${rlists.tag1 }</span>
                                	</c:if>
                                	<c:if test="${rlists.tag2 != 'null' }">
                                    	<span class="badge bg-dark px-2 py-1 mr-1">${rlists.tag2 }</span>
                                    </c:if>
                                    <c:if test="${rlists.tag3 != 'null' }">
                                    	<span class="badge bg-dark px-2 py-1 mr-1">${rlists.tag3 }</span>
                                    </c:if>
                                    <c:if test="${rlists.tag1 ==null && rlists.tag2 ==null && rlists.tag3 ==null }">
	                                	<span class="badge bg-dark px-2 py-1 mr-1">태그없음</span>
	                                </c:if>  
                                </div>
                            </div>
                        </div>

                        <!-- 키트가 있을경우에만 -->
                        <div class="row col-12 justify-content-center my-4">
                            <h5 class="font-weight-bold">키트 상세 정보</h5>
                        </div>
                        <div class="row col-12 align-items-end">
                            <div class="col-10">
                                <div class="row">
                                	<c:if test="${rlists.kitName != null }">
                                    <h6 class="font-weight-bold">${rlists.kitName }</h6>
                                    </c:if>
                                    <c:if test="${rlists.kitName == null}">
                                    <h6 class="font-weight-bold">키트 없음</h6>
                                    </c:if>
                                </div>
                                <c:if test="${rlists.kitIntro != null}">
                                <div class="row mt-3" style="border-left: 4px solid grey">
                                    <p class="mb-0 ml-3 my-1">
                                        ${rlists.kitIntro }
                                    </p>
                                </div>
                                </c:if>
                            </div>
                            <div class="col-2">
                                <div class="row align-self-end">
                                	<c:if test="${rlists.kitPrc != null }">
                                    <p class="mb-0">키트 가격 : ${rlists.kitPrc }원</p>
                                    </c:if>
                                </div>
                            </div>
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

//수정 페이지 이동
function lectureInfo(e){
	$('.sendltno').val(e);
	$('#frm').attr("action", "/creator/lecU");
	$('#frm').submit();
}

//영상 관리 페이지 이동
function lessonInfo(e){
	$('.sendltno').val(e);
	$('#frm').attr("action", "/creator/lesU");
	$('#frm').submit();
}

//시큐리티 토큰
let header = "${_csrf.headerName}";
let token = "${_csrf.token}";

//재신청
function lectureReResister(e){
	let ltNo = e;
	
	$.ajax({
		url : "/creator/lecReResister",
		method : "post",
		dataType: "text",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
         },
		data : {
			ltNo : ltNo
		},
		success : function(){
			alert('재신청하였습니다');
			location.reload();
		}
	})
}
</script>
</html>