<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        <a href="#" class="text-dark font-weight-bold"><i class="fa fa-home"></i> Home</a>
                        <a href="#" class="text-dark font-weight-bold"> 내 강의 목록</a>
                        <span>신청한 강의</span>
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
                                <a class="list-link" href="#">크리에이터 정보</a>
                            </li>
                            <p class="list-group-item border-bottom-0 mb-0 align-items-center d-flex mylist">내 강의 목록</p>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex pl-40" style="height: 35px;">
                                <a class="list-link active" href="#">&nbsp;&nbsp;- 신청한 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                                <a class="list-link" href="#">&nbsp;&nbsp;- 열린 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                                <a class="list-link" href="#">&nbsp;&nbsp;- 종료된 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                                <a class="list-link" href="#">&nbsp;&nbsp;- 신고된 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                                <a class="list-link" href="#">강의등록</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                                <a class="list-link" href="#">매출내역</a>
                            </li>
                            <li class="list-group-item align-items-center d-flex" style="height: 55px;">
                                <a class="list-link" href="#">환불 요청 내역</a>
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
                        <h5 class="mx-4 my-4 font-weight-bold">강의제목 : <strong class="text-danger">집에서 배우는...</strong></h5>
                        <h5 class="mx-4 my-3 font-weight-bold">신청상태 : <strong class="text-danger">미처리</strong></h5>
                        
                        <!-- 신청 상태 / 상태, 반려사유 가져오기(색처리)-->
                        <div class="row col-12">
                            <div class="col-12 text-right align-items-right">
                                <button class="btn btn-outline-secondary" type="button" onclick="location.href='#';">강의정보수정</button>
                                &nbsp;&nbsp;&nbsp;
                                <button class="btn btn-outline-info"  type="button">영상 관리</button>
                                &nbsp;&nbsp;&nbsp;
                                <button class="btn btn-outline-danger" type="button">재신청</button>
                            </div>
                        </div>

                        <!--썸네일, 강의 소개 / 사진, 소개글 가져오기-->
                        <div class="row col-12 justify-content-center my-4">
                            <h5 class="font-weight-bold text-danger">강의 정보</h5>
                        </div>
                        <div class="row col-12 mt-3 mb-5">
                            <div class="col-4 text-center" style="border-right: 5px solid grey">
                                <img src="img/live/live-1.jpg" class="card-img-left img-thumbnail rounded-circle" style="width: 12rem; height: 12rem;">
                            </div>
                            <div class="col-8">
                                <div class="col-12 mt-2">
                                    <p>
                                        강의소개---
                                        집에서도 쉽게 배울수 있는..
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
                                    <img src="img/blog/blog-1.jpg" style="object-fit: cover; width: 100%; height: 500px;" alt="강의 이미지 1">
                                </div>
                                <div class="col-lg-4 p-0">
                                    <img src="img/blog/blog-2.jpg" class="pb-2" style="object-fit: cover; width: 100%; height: 250px;" alt="강의 이미지 2`">
                                    <img src="img/blog/blog-3.jpg" style="object-fit: cover; width: 100%; height: 250px;" alt="강의 이미지 3">
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
                                            <td>---</td>
                                            <th>강의게시기간</th>
                                            <td>---</td>
                                        </tr>
                                        <tr>
                                            <th>강의수강기간</th>
                                            <td>---</td>
                                            <th>강의만료날짜</th>
                                            <td>---</td>
                                        </tr>
                                        <tr>
                                            <th>강의가격</th>
                                            <td>---</td>
                                            <th>키트가격</th>
                                            <td>---</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-3">
                                <h5 class="font-weight-bold mb-2">태그</h5>
                                <!-- 태그 반복문 등록-->
                                <div>
                                    <span class="badge bg-dark px-2 py-1 mr-1">태그1</span>
                                    <span class="badge bg-dark px-2 py-1 mr-1">태그2</span>
                                    <span class="badge bg-dark px-2 py-1 mr-1">태그3</span>
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
                                    <h6 class="font-weight-bold">키트 명</h6>
                                </div>
                                <div class="row mt-3" style="border-left: 4px solid grey">
                                    <p class="mb-0 ml-3 my-1">
                                        해당 키트는 본 수업에 필요하오니 꼭 구매하세요
                                    </p>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="row align-self-end">
                                    <p class="mb-0">키트 가격 : 200000</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</body>
</html>