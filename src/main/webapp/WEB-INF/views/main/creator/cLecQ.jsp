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

        form .nice-select{
            height: 38px;
        }
       
    </style>
</head>
<body>
 <section class="normal-breadcrumb set-bg" data-setbg="/resources/img/normal-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>질문답변</h2>
                        <p>질문답변게시판</p>
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
                    <div class="row col-12 mb-5 ml-3">
                        <!-- 제목 입력 / 제목 가져오기-->
                        <h5 class="mx-4 my-3 font-weight-bold">강의제목 : <strong class="text-danger">집에서 배우는...</strong></h5>

                        <div class="row col-12">
                            <div class="row col-12 mt-3 mb-3 justify-content-around">
                                <!-- 선택 : active -->
                                <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="location.href='rLecS.html'">강의정보</button>
                                <button class="btn btn-outline-secondary lecbtn active" style="width: 150px;" type="button" onclick="location.href='#'">질문&답변</button>
                                <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="location.href='#'">공지사항</button>
                                <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="location.href='#'">리뷰</button>
                                <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="location.href='#'">수강생</button>
                            </div>
                        </div>

                        <div class="row col-12 justify-content-end mt-3 mb-1">
                            <!--여기서 부터임-->
                            <form name="sere" method="post" action="">
                                <div class="row mr-1">
                                    <div>
                                        <select name="sea">
                                            <option value="질문내용">질문내용</option>
                                            <option value="작성자">작성자</option>
                                            <option value="작성일자">작성일자</option>
                                            <option value="답변여부">답변여부</option>
                                        </select>
                                    </div>
                                    <input class="border mb-0 ml-1" style="height: 37px; width: 170px" type="text"
                                        placeholder="검색..." spellcheck=false>
                                    <a href="" class="btn btn-outline-secondary search-a"><i class="icon_search"></i></a>
            
                                </div>
                            </form>
                        </div>
        
                        <div class="row col-12">
                            <table class="table">
                                <thead text align="center" >
                                    <tr class="table-secondary border-top-0">
                                        <!-- ...처리하기 -->
                                        <th>질문내용</th>
                                        <th style="width: 160px;">작성자</th>
                                        <th style="width: 150px;">작성일자</th>
                                        <th style="width: 100px;">답변여부</th>
                                    </tr>
                                </thead>
                                <tbody id="mo" text align="center">
                                    <tr data-toggle="modal" data-target="#exampleModalCenter">
                                        <td>dd</td>
                                        <td>하늘땅아래땅</td>
                                        <td>0000-00-00</td>
                                        <td>처리</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="row col-12 justify-content-center mt-3">
                            <div class="product__pagination">
                                <a href="#"><i class="fa fa-angle-double-left"></i></a>
                                <a href="#" class="current-page">1</a>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <a href="#">4</a>
                                <a href="#">5</a>
                                <a href="#"><i class="fa fa-angle-double-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <!-- click이벤트를 통해서 질문 값을 가지고 와야함
        tr에 따라서 달랴아함 -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header border-bottom-0 d-flex justify-content-center position-relative">
                    <h5 class="font-weight-bold mt-2">답변 작성</h5>
                    <button type="button" class="close position-absolute" data-dismiss="modal" aria-label="Close" style="right: 15px; top: 6px;">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body border-bottom-0 mb-3" id="modal-body">
                    <div class="col-lg-12">
                        <div class="row mb-4 justify-content-between">
                            <div class="col-lg-9 pr-0" style="min-height: 103px;">
                                <div class="w-100 h-100 p-2 d-flex align-items-center" style="border: 1px solid black;">
                                    <p class="mb-0">여기 고객들 질문오는곳여기 고객들 질문오는곳여기 고객들 질문오는곳</p>
                                </div>
                            </div>
                            <div class="col-lg-3 d-flex justify-content-end align-items-end pl-0"> 
                                <div>
                                    <p class="mb-0 text-right">작성자 : <strong>00</strong></p>
                                    <p class="mb-0 text-right">2022-05-05</p>
                                </div>
                            </div>
                        </div>
                        <div class="row justify-content-between mx-1">
                            <div class="align-self-start" style="transform: rotate(180deg);">
                                <i class="arrow_back" style="font-size: 70px;"></i>
                            </div>
                            <textarea name="aw" id="" cols="30" rows="4"></textarea> 
                            <button type="button" class="btn btn-outline-dark">저장</button>
                        </div>
                    </div>
                </div>
            </div>
          </div>
        </div>
    </section>

</body>
<script type="text/javascript">

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