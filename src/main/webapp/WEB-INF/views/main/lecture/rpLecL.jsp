<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        <a href="#" class="text-dark font-weight-bold"><i class="fa fa-home"></i> Home</a>
                        <a href="#" class="text-dark font-weight-bold"> 내 강의 목록</a>
                        <span>신고된 강의</span>
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
                                <a class="list-link" href="#">크리에이터 정보</a>
                            </li>
                            <p class="list-group-item border-bottom-0 mb-0 align-items-center d-flex mylist">내 강의 목록</p>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex pl-40" style="height: 35px;">
                                <a class="list-link" href="#">&nbsp;&nbsp;- 신청한 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                                <a class="list-link" href="#">&nbsp;&nbsp;- 열린 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                                <a class="list-link" href="#">&nbsp;&nbsp;- 종료된 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                                <a class="list-link active" href="#">&nbsp;&nbsp;- 신고된 강의</a>
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
                                신고된 강의
                            </h5>
                            <!-- 강의 하나-->
                            <div class="card ml-1 mt-2 mb-3">
                                <div class="card-body ml-1">
                                    <div class="row ml-1">
                                        <div class="col-3 d-flex align-items-center">
                                            <a href="https://www.naver.com">
                                                <img src="img/dog/boxer.jpeg" class="card-img-left img-thumbnail rounded-circle" style="width: 12rem; height: 12rem;">
                                            </a>
                                        </div>
                                        <div class="col-8 d-flex align-items-center ml-3">
                                            <table class="table" style="table-layout:fixed">
                                                <tbody>
                                                    <tr>
                                                        <th scope="row" style="width:150px">강의제목</th>
                                                        <td colspan="3" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">집에서 하는 나다라나다라나다라나라다가가가가가가가가가가가가가</td>                                                    
                                                    </tr>
                                                    <tr>
                                                        <th scope="row" style="width:150px">강의 게시기간</th>
                                                        <td colspan="3" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">2022.02.01 ~ 2023.01.31</td>                                                    
                                                    </tr>
                                                    <tr>
                                                        <th scope="row" style="width:150px">강의 수강기간</th>
                                                        <td colspan="3" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">1개월</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">가격</th>
                                                        <td style="width:100px">5만원</td>
                                                        <th scope="row" style="width:150px">평균 별점</th>
                                                        <td style="width:100px"><i class="fa fa-star-o text-warning" aria-hidden="true"></i>4.5</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">수강생 수</th>
                                                        <td colspan="3">12명</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="text-right align-items-right">
                                        <span class="font-weight-bold">처리상태&nbsp;&nbsp;:&nbsp;</span>
                                        <input readonly type="text" class="text-success" style="border:none; width:60px;" value="검토중" spellcheck="false">
                                    </div>
                                </div>
                            </div>
                            
                            <div class="card ml-1 mt-2 mb-3">
                                <div class="card-body ml-1">
                                    <div class="row ml-1">
                                        <div class="col-3 d-flex align-items-center">
                                            <a href="https://www.naver.com">
                                                <img src="img/dog/boxer.jpeg" class="card-img-left img-thumbnail rounded-circle" style="width: 12rem; height: 12rem;">
                                            </a>
                                        </div>
                                        <div class="col-8 d-flex align-items-center ml-3">
                                            <table class="table" style="table-layout:fixed">
                                                <tbody>
                                                    <tr>
                                                        <th scope="row" style="width:150px">강의제목</th>
                                                        <td colspan="3" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">집에서 하는 나다라나다라나다라나라다가가가가가가가가가가가가가</td>                                                    
                                                    </tr>
                                                    <tr>
                                                        <th scope="row" style="width:150px">강의 게시기간</th>
                                                        <td colspan="3" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">2022.02.01 ~ 2023.01.31</td>                                                    
                                                    </tr>
                                                    <tr>
                                                        <th scope="row" style="width:150px">강의 수강기간</th>
                                                        <td colspan="3" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">1개월</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">가격</th>
                                                        <td style="width:100px">5만원</td>
                                                        <th scope="row" style="width:150px">평균 별점</th>
                                                        <td style="width:100px"><i class="fa fa-star-o text-warning" aria-hidden="true"></i>4.5</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">수강생 수</th>
                                                        <td colspan="3">12명</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="text-right align-items-right">
                                        <span class="font-weight-bold">처리상태&nbsp;&nbsp;:&nbsp;</span>
                                        <input readonly type="text" class="text-danger" style="border:none; width:60px;" value="미처리" spellcheck="false">
                                    </div>
                                </div>
                            </div>

                            <div class="card ml-1 mt-2 mb-3">
                                <div class="card-body ml-1">
                                    <div class="row ml-1">
                                        <div class="col-3 d-flex align-items-center">
                                            <a href="https://www.naver.com">
                                                <img src="img/dog/boxer.jpeg" class="card-img-left img-thumbnail rounded-circle" style="width: 12rem; height: 12rem;">
                                            </a>
                                        </div>
                                        <div class="col-8 d-flex align-items-center ml-3">
                                            <table class="table" style="table-layout:fixed">
                                                <tbody>
                                                    <tr>
                                                        <th scope="row" style="width:150px">강의제목</th>
                                                        <td colspan="3" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">집에서 하는 나다라나다라나다라나라다가가가가가가가가가가가가가</td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">강의게시기간</th>
                                                        <td style="width:100px">12</td>
                                                        <th scope="row" style="width:150px">강의수강기간</th>
                                                        <td style="width:100px">1</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">가격</th>
                                                        <td colspan="3">50000원</td>
                                                    
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="text-right align-items-right">
                                        <span class="font-weight-bold">처리상태&nbsp;&nbsp;:&nbsp;</span>
                                        <input readonly type="text" class="text-danger" style="border:none; width:60px;" value="미처리" spellcheck="false">
                                    </div>
                                </div>
                            </div>

                            <!-- 더보기 누르면 나중에 버튼 숨기거나 접기버튼으로 전환하기-->
                            <div class="row justify-content-center mt-3 mb-3">
                                <button class="btn btn-outline-danger" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                    더보기
                                </button>
                            </div>

                            <div class="collapse" id="collapseExample">
                                <div class="card ml-1 mt-2 mb-3">
                                <div class="card-body ml-1">
                                    <div class="row ml-1">
                                        <div class="col-3 d-flex align-items-center">
                                            <a href="https://www.naver.com">
                                                <img src="img/dog/boxer.jpeg" class="card-img-left img-thumbnail rounded-circle" style="width: 12rem; height: 12rem;">
                                            </a>
                                        </div>
                                        <div class="col-8 d-flex align-items-center ml-3">
                                            <table class="table" style="table-layout:fixed">
                                                <tbody>
                                                    <tr>
                                                        <th scope="row" style="width:150px">강의제목</th>
                                                        <td colspan="3" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">집에서 하는 나다라나다라나다라나라다가가가가가가가가가가가가가</td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">강의게시기간</th>
                                                        <td style="width:100px">12</td>
                                                        <th scope="row" style="width:150px">강의수강기간</th>
                                                        <td style="width:100px">1</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">가격</th>
                                                        <td colspan="3">50000원</td>
                                                    
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="text-right align-items-right">
                                        <span class="font-weight-bold">처리상태&nbsp;&nbsp;:&nbsp;</span>
                                        <input readonly type="text" class="text-danger" style="border:none; width:60px;" value="미처리" spellcheck="false">
                                    </div>
                                </div>
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