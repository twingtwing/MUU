<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        <h2>크리에이어 - 공지사항</h2>
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
                        <span>상태에 따라 열렸는지 닫힌강의 열린강의 표시되어야함 </span>
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
                            <li class="list-group-item border-bottom-0 align-items-center d-flex"
                                style="height: 55px;">
                                <a class="list-link" href="#">크리에이터 정보</a>
                            </li>
                            <p class="list-group-item border-bottom-0 mb-0 align-items-center d-flex mylist">내 강의 목록
                            </p>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex pl-40"
                                style="height: 35px;">
                                <a class="list-link" href="#">&nbsp;&nbsp;- 신청한 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex"
                                style="height: 35px;">
                                <a class="list-link active" href="#">&nbsp;&nbsp;- 열린 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex"
                                style="height: 35px;">
                                <a class="list-link" href="#">&nbsp;&nbsp;- 종료된 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex"
                                style="height: 35px;">
                                <a class="list-link" href="#">&nbsp;&nbsp;- 신고된 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex"
                                style="height: 55px;">
                                <a class="list-link" href="#">강의등록</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex"
                                style="height: 55px;">
                                <a class="list-link" href="#">매출내역</a>
                            </li>
                            <li class="list-group-item align-items-center d-flex" style="height: 55px;">
                                <a class="list-link" href="#">환불 요청 내역</a>
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
                                <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="location.href='rLecS.html'">강의정보</button>
                                <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="location.href='#'">질문&답변</button>
                                <button class="btn btn-outline-secondary lecbtn active" style="width: 150px;" type="button" onclick="location.href='#'">공지사항</button>
                                <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="location.href='#'">리뷰</button>
                                <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="location.href='#'">수강생</button>
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
                                    <input class="w-100" type="text" name="" id="" spellcheck="false">
                                </div>
                            </div>
                            <div class="row col-12 justify-content-between bg-light py-2"  style="border-bottom: 2px solid black;">
                                <p class="mb-0">글번호 : 1213</p>
                                <div class="row">
                                    <p class="mb-0">조회수 : 8</p>
                                    <p class="mb-0 ml-2">작성날짜 : 2022-05-05</p>
                                    <!-- 수정안했으면 안해도됨 -->
                                    <p class="mb-0 ml-2 mr-2">수정날짜 : 2022-05-09</p>
                                </div>
                            </div>
                            <div class="row col-12 my-3" style="height: 45vh;">
                                <textarea name="" id="" cols="130" rows="10" spellcheck="false">ㅁㄴㄹㄴㅇㅁㄹㄴㅇㅁㄹㄴㅇㅁㄹㄴㅁㄹㄴㅇㅁㄻ</textarea>
                            </div>
                            <div class="row col-12 bg-light py-2" style="border-top: 2px solid black; border-bottom:2px solid black;">
                                <div class="d-flex align-items-center">
                                    <i class="fa fa-download mr-2"></i>
                                </div>
                                <input type="file" name="" id="" spellcheck="false">
                            </div>
                        </div>
                    </div>
                    
                    <div class="row col-12 ml-1 justify-content-between">
                        <button onclick="history.back()" class="btn btn-outline-secondary">뒤로가기</button>
                        <div class="row mr-4">
                            <!-- 등록하면 list가 아니라 그 수정된 페이지로 이동해야함 -->
                            <button class="btn btn-outline-secondary mr-2">수정</button>
                            <button onclick="location.href='박용호_크리에이터공지선택.html'" class="btn btn-outline-secondary mr-2">취소</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
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
    </script>
</html>