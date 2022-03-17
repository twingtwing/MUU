<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
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
    </style>
</head>
<body>
	<!-- 배너 시작-->
    <section class="normal-breadcrumb set-bg" data-setbg="/resources/img/normal-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>크리에이터 정보</h2>
                        <p></p>
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
                        <a href="/Home" class="text-dark font-weight-bold"><i class="fa fa-home"></i> Home</a>
                        <span>크리에이터 정보</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 카테고리 끝-->

    <!-- body 의 body-->
    <!-- 크리에이터 정보 -->
    <section class="blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="row mr-2" style="width:160px">
                        <ul class="list-group w-100" id="cctgr">
                            <!-- 해당 상위카테고리 일때, active가 보여야함 => 자바스크립트 혹은 jstl if구문으로 해결해야함 -->
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                                <a class="list-link active" href="/creator/creS">크리에이터 정보</a>
                            </li>
                            <p class="list-group-item border-bottom-0 mb-0 align-items-center d-flex mylist">내 강의 목록</p>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex pl-40" style="height: 35px;">
                                <a class="list-link" href="/creator/rLecL">&nbsp;&nbsp;- 신청한 강의</a>
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
                        <h3 class="font-weight-bold"><i class="fa fa-address-card-o text-danger" aria-hidden="true"></i>&nbsp;크리에이터 정보</h3>
                    </div>
                    <hr class="font-weight-bold">
                    <div class="row d-flex justify-content-center align-items-center py-3" style="height: 55vh;">
                        <div class="card py-4 px-5" style="border: 2px solid #212529;">
                            <div class="card-body mb-3 ml-1">
                                <div class="row mb-3 ml-1">
                                    <div class="d-flex align-items-center">
                                        <img src="${photo }" class="img-thumbnail rounded-circle" style="width: 12rem; height: 12rem;">
                                    </div>
                                    <ul class="list-group list-group-flush ml-3">
                                        <li class="list-group-item font-weight-bold">이름 : ${name }</li>
                                        <li class="list-group-item font-weight-bold">
                                            소개 : ${creIntro }
                                        </li>
                                    </ul>
                                </div>
                                <div class="row justify-content-center">
                                    <button class="btn btn-outline-danger" onclick="location.href='/creator/creUp'">정보 수정</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
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
 

</script>
	
</body>

</html>