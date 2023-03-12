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
	    width: 200px;
	    padding: 10px;
	    font-weight: bold;
	    vertical-align: center;
	    text-align: center;
	    border-bottom: 1px solid #ccc;
	    background: #efefef;
	}
	td {
	    width: 300px;
	    padding: 10px;
	    vertical-align: center;
	    border-bottom: 1px solid #ccc;
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
                        <h2>내 강의 목록</h2>
                        <p>열린 강의</p>
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
                        <a href="/creator/oLecL" class="text-dark font-weight-bold"> 열린강의</a>
                        <span>${olists.ttl }</span>
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
                                <a class="list-link" href="/creator/rLecL">&nbsp;&nbsp;- 신청한 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                                <a class="list-link active" href="/creator/oLecL">&nbsp;&nbsp;- 열린 강의</a>
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
                <!--사이드바-->
                <div class="col-lg-10">
                    <div class="row ml-2">
                        <h5 class="ml-1 mb-2 font-weight-bold">
                            <i class="fa fa-hand-paper-o text-danger" aria-hidden="true"></i>
                            열린 강의 정보
                        </h5>
                    </div>

                    <hr class="font-weight-bold">
                    <!-- 강의 하나에 대한 상세정보페이지-->
                    <div class="row col-12 mb-5 ml-3">
                        <!-- 제목 입력 / 제목 가져오기-->
                        <h5 class="mx-4 my-3 font-weight-bold">강의제목 : <strong class="text-danger">${olists.ttl }</strong></h5>

                        <div class="row col-12">
                            <div class="row col-12 mt-3 mb-3 justify-content-around">
                                <!-- 선택 : active -->
                                <button class="btn btn-outline-secondary lecbtn active" style="width: 150px;" type="button" onclick="#">강의정보</button>
                                <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="goQna(${olists.ltNo })">질문&답변</button>
                                <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="goNotice(${olists.ltNo })">공지사항</button>
                                <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="goReview(${olists.ltNo })">리뷰</button>
                                <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="goStudent(${olists.ltNo })">수강생</button>
                            </div>
                        </div>

                        <div class="row col-12 mt-3">
                            <div class="col-12 text-right align-items-right">
                                <button class="btn btn-outline-secondary" type="button" onclick="lectureInfo(${olists.ltNo })">강의정보수정</button>
                                &nbsp;&nbsp;&nbsp;
                                <button class="btn btn-outline-info"  type="button" onclick="lessonInfo(${olists.ltNo })">영상 관리</button>
                            </div>      
                        </div>

                        <!--썸네일, 강의 소개 / 사진, 소개글 가져오기-->
                        <div class="row col-12 justify-content-center my-4">
                            <h5 class="font-weight-bold text-danger">강의 정보</h5>
                        </div>
                        <div class="row col-12 mt-3 mb-5">
                            <div class="col-4 text-center" style="border-right: 5px solid grey">
                                <img src="${olists.thumb }" class="card-img-left img-thumbnail rounded-circle" style="width: 12rem; height: 12rem;">
                            </div>
                            <div class="col-8">
                                <div class="col-12 mt-2">
                                    <p>
                                        ${olists.intro }
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
                                    <img src="${olists.pht1 }" style="object-fit: cover; width: 100%; height: 500px;" alt="강의 이미지 1">
                                </div>
                                <div class="col-lg-4 p-0">
                                    <img src="${olists.pht2 }" class="pb-2" style="object-fit: cover; width: 100%; height: 250px;" alt="강의 이미지 2">
                                    <img src="${olists.pht3 }" style="object-fit: cover; width: 100%; height: 250px;" alt="강의 이미지 3">
                                </div>
                            </div>
                        </div>
                        <!-- 나중에 시간 남으면 누르면 원본 사진 팝업형식으로 보여주는 방법하기 -->
                        
                        <!--강의 정보 테이블, 태그-->
                        <div class="row col-12 mt-5 mb-3">
                            <div class="col-9">
                                <h5 class="font-weight-bold text-center">강의 상세 정보</h5>
                                <table>
                                    <tbody>
                                        <tr>
                                            <th>카테고리</th>
                                            <td>${olists.upCtgr }/${olists.downCtgr }</td>
                                            <th>강의게시기간</th>
                                            <td>${olists.openTerm }개월</td>
                                        </tr>
                                        <tr>
                                            <th>강의수강기간</th>
                                            <td>${olists.tlsnTerm }개월</td>
                                            <th>강의만료날짜</th>
                                            <td>${olists.expDate }</td>
                                        </tr>
                                        <tr>
                                            <th>강의가격</th>
                                            <td class="prccomma1">${olists.prc }</td>
                                            <th>키트가격</th>
                                            <c:if test="${olists.kitPrc == null}">
                                            <td> - </td>
                                            </c:if>
                                            <c:if test="${olists.kitPrc != null}">
                                            <td class="prccomma2">${olists.kitPrc }</td>
                                            </c:if>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-3">
                                <h5 class="font-weight-bold mb-2">태그</h5>
                                <!-- 태그 반복문 등록-->
                                <div>
                                	<c:if test="${olists.tag1 !='null' }">
                                    	<span class="badge bg-dark px-2 py-1 mr-1">${olists.tag1 }</span>
                                    </c:if>	
                                    <c:if test="${olists.tag2 !='null' }">
	                                    <span class="badge bg-dark px-2 py-1 mr-1">${olists.tag2 }</span>
	                                </c:if>
	                                <c:if test="${olists.tag3 !='null' }">    
	                                    <span class="badge bg-dark px-2 py-1 mr-1">${olists.tag3 }</span>
	                                </c:if>
	                                <c:if test="${olists.tag1 ==null && olists.tag2 ==null && olists.tag3 ==null }">
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
                            <div class="row col-12">
                                <div class="row">
                                	<c:if test="${olists.kitName != null }">
                                    <h6 class="font-weight-bold">${olists.kitName }</h6>
                                    </c:if>
                                    <c:if test="${olists.kitName == null}">
                                    <h6 class="font-weight-bold">키트 없음</h6>
                                    </c:if>
                                </div>
                                <c:if test="${olists.kitIntro != null}">
                                <div class="row mt-3" style="border-left: 4px solid grey">
                                    <p class="mb-0 ml-3 my-1">
                                        ${olists.kitIntro }
                                    </p>
                                </div>
                                </c:if>
                            </div>
                            <div class="row col-12 justify-content-end mt-3">
                                <div class="row align-self-end">
                                	<c:if test="${olists.kitPrc != nell }">
                                    <p class="font-weight-bold mb-0 kitprccomma">${olists.kitPrc }</p>
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
    
    //천단위 콤마
    function addComma(value){
         value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
         return value; 
    }
    
    $(function(){
    	let prccomma1 = $('.prccomma1').text();
    	prccomma1 = addComma(prccomma1);
    	$('.prccomma1').text(prccomma1+"원");
    	
    	let prccomma2 = $('.prccomma2').text();
    	prccomma2 = addComma(prccomma2);
    	$('.prccomma2').text(prccomma2+"원");
    	
    	let kitprccomma = $('.kitprccomma').text();
    	kitprccomma = addComma(kitprccomma);
    	$('.kitprccomma').text("키트 가격 : "+kitprccomma+"원");
    })

</script>
</html>