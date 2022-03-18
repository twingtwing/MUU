<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
        table, tr, th, td {
            border : none !important;
        }
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
        a{
        	cursor : pointer;
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
                        <p>종료된 강의</p>
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
                        <span>종료된 강의</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 카테고리 끝-->

    <!-- body 의 body-->
    <!-- 열린 강의, 썸네일 클릭시 ? 강의페이지로 이동 -->
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
                                <a class="list-link" href="/creator/oLecL">&nbsp;&nbsp;- 열린 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                                <a class="list-link active" href="/creator/clLecL">&nbsp;&nbsp;- 종료된 강의</a>
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
                        <h3 class="font-weight-bold">
                            <i class="fa fa-braille text-danger" aria-hidden="true"></i>
                            &nbsp;내 강의 목록
                        </h3>
                    </div>
                    <hr class="font-weight-bold">
                    <div class="row py-3">
                        <div class="col-lg-12">
                            <h5 class="ml-1 mb-3 font-weight-bold">
                                <i class="fa fa-exclamation-triangle text-danger" aria-hidden="true"></i>
                                종료된 강의
                                <c:if test="${listCnt != null}">
                                (<span><i class="fa fa-check" aria-hidden="true"></i>${listCnt }개 종료됨</span>)
                                </c:if>
                                <c:if test="${listCnt == null}">
                                (<span><i class="fa fa-check" aria-hidden="true"></i>0개 종료됨</span>)
                                </c:if>
                            </h5>
                            <c:if test="${cllists == '[]'}">
                            <div class="mt-5 mb-5">
                            	<h3><i class="fa fa-search" aria-hidden="true"></i>종료된 강의가 없습니다</h3>
                            </div>
                            </c:if>
                            <c:if test="${cllists != '[]'}">
                            <!-- 강의 하나-->
                            <c:forEach items="${cllists}" var="list" varStatus="status" begin="0" end="2">
                            <div class="card ml-1 mt-2 mb-3">
                                <div class="card-body ml-1">
                                    <div class="row ml-1">
                                        <div class="col-3 d-flex align-items-center">
                                            <a>
                                                <img src="${list.thumb }" onclick="lectureInfo(${list.ltNo })" class="card-img-left img-thumbnail rounded-circle" style="width: 12rem; height: 12rem;">
                                            </a>
                                        </div>
                                        <div class="col-8 d-flex align-items-center ml-3">
                                            <table class="table" style="table-layout:fixed">
                                                <tbody>
                                                    <tr>
                                                        <th scope="row" style="width:150px">강의제목</th>
                                                        <td colspan="3" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${list.ttl }</td>                                                    
                                                    </tr>
                                                    <tr>
                                                        <th scope="row" style="width:150px">강의 게시기간</th>
                                                        <td colspan="3" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${list.startDate } ~ ${list.expDate }</td>                                                    
                                                    </tr>
                                                    <tr>
                                                        <th scope="row" style="width:150px">강의 수강기간</th>
                                                        <td colspan="3" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${list.tlsnTerm }개월</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">가격</th>
                                                        <td style="width:100px">${list.prc }원</td>
                                                        <th scope="row" style="width:150px">평균 별점</th>
                                                        <td style="width:100px"><i class="fa fa-star-o text-warning" aria-hidden="true"></i>${list.avgStar }</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">수강생 수</th>
                                                        <td colspan="3">${list.studentCount }명</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                            
                            

                            <!-- 더보기 누르면 나중에 버튼 숨기거나 접기버튼으로 전환하기-->
                            <div class="row justify-content-center mt-3 mb-3" id="listPlus">
                                <button class="btn btn-outline-danger" id="plusBtn" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                    더보기
                                </button>
                            </div>

                            <div class="collapse" id="collapseExample">
                                <!-- 강의 하나-->
                            <c:forEach items="${cllists}" var="list" varStatus="status" begin="3">
                            <div class="card ml-1 mt-2 mb-3">
                                <div class="card-body ml-1">
                                    <div class="row ml-1">
                                        <div class="col-3 d-flex align-items-center">
                                            <a>
                                                <img src="${list.thumb }" onclick="lectureInfo(${list.ltNo })" class="card-img-left img-thumbnail rounded-circle" style="width: 12rem; height: 12rem;">
                                            </a>
                                        </div>
                                        <div class="col-8 d-flex align-items-center ml-3">
                                            <table class="table" style="table-layout:fixed">
                                                <tbody>
                                                    <tr>
                                                        <th scope="row" style="width:150px">강의제목</th>
                                                        <td colspan="3" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${list.ttl }</td>                                                    
                                                    </tr>
                                                    <tr>
                                                        <th scope="row" style="width:150px">강의 게시기간</th>
                                                        <td colspan="3" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${list.startDate } ~ ${list.expDate }</td>                                                    
                                                    </tr>
                                                    <tr>
                                                        <th scope="row" style="width:150px">강의 수강기간</th>
                                                        <td colspan="3" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${list.tlsnTerm }개월</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">가격</th>
                                                        <td style="width:100px">${list.prc }원</td>
                                                        <th scope="row" style="width:150px">평균 별점</th>
                                                        <td style="width:100px"><i class="fa fa-star-o text-warning" aria-hidden="true"></i>${list.avgStar }</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">수강생 수</th>
                                                        <td colspan="3">${list.studentCount }명</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                            </div>
                            
                            <div class="row justify-content-center mt-3 mb-3" id="listMinus" style="display:none;">
                                <button class="btn btn-outline-danger" id="minusBtn" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                    접기
                                </button>
                            </div>
                            </c:if>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <form id="frm" action="/creator/clLecS">
    	<input class="sendltno" type="hidden" name="ltNo" value="">
    </form>

</body>
<script>
//더보기
$('#plusBtn').on('click', function(){
	$('#listPlus').hide();
	$('#listMinus').show();
})
//접기
$('#minusBtn').on('click', function(){
	$('#listPlus').show();
	$('#listMinus').hide();
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

//상세 페이지 이동
function lectureInfo(e){
	$('.sendltno').val(e);
	$('#frm').submit();
}
</script>
</html>