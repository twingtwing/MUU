<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <style>
        table tr, table td{
            text-align: center;
            vertical-align: middle;
        }
        .admin_search td,.admin_search th{
            text-align: center;
            vertical-align: middle;
            padding: 5px;
        }
        .admin_search th{
            background-color: #eeeeee;
        }
        #firstJdate, #lastJdate{           
            width:200px;
        }
        .crTab {
            color: black;
        }
        .crTab.active{
            font-weight: bold;
            color: orange;
        }
        .tableTab th{
            border:none !important;
        }
        input[name=star]{
            vertical-align: middle;
        }
        .tableTitle{
            margin-left:10px;
            margin-bottom:5px;
            font-weight: bold;
            font-size:large;
        }
    </style>
</head>
<body>
            <!-- 페이지명-->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <!-- 페이지명 작성 및 카테고리 작성 -->
                        <h4 class="page-title">강의 관리</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item"><a href="강의관리.html">강의관리</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">키트</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 페이지명 끝-->
    
            <!-- 내용 시작 -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <!-- 기본 크리에이터 정보 -->
                                <div class="row position-relative">
                                    <table class="admin_search table table-bordered">
                                        <tr height="38">
                                            <th>강의이름</th>
                                            <td>
                                                adsf
                                            </td>
                                            <th>강의별점</th>
                                            <td>
                                                <i class="fa fa-star text-warning"></i>
                                            </td>
                                            <th rowspan="2" >
                                                <img src="assets/images/big/img1.jpg" style="width:70px; height:70px;" alt="">
                                            </th>
                                        </tr>

                                        <tr height="38">
                                            <th>강사정보</th>
                                            <td>
                                                asdf
                                            </td>
                                            <th>위반횟수</th>
                                            <td>
                                                2
                                            </td>
                                        </tr>
                                    </table>
                                </div>

                                <hr class="font-weight-bold">
                                
                                <div class="row" style="margin-top:40px; margin-bottom:0px;">
                                    <table class="table tableTab">
                                        <tr style="background-color: #FCF8E3;">
                                            <th><a class="crTab" href="강의관리.html" onclick="">강의소개</a></th>
                                            <th><a class="crTab" href="강의관리.html" onclick="">유저</a></th>
                                            <th><a class="crTab" href="강의관리.html" onclick="">커리큘럼</a></th>
                                            <th><a class="crTab active" href="강의관리.html" onclick="">키트</a></th>
                                            <th><a class="crTab" href="강의관리.html" onclick="">후기</a></th>
                                            <th><a class="crTab" href="강의관리.html" onclick="">질문/답변</a></th>
                                            <th><a class="crTab" href="강의관리.html" onclick="">공지사항</a></th>
                                        </tr>
                                    </table>
                                </div>

                                <hr class="font-weight-bold">

                                <div class="row">
                                    <div class="tableTitle">
                                        <i class="fa fa-hashtag" aria-hidden="true"></i>키트정보
                                    </div>
                                    <table class="table table-bordered">                                        
                                        <tr style="background-color: #eeeeee;">
                                            <th style="width:90px;">번호</th>
                                            <th>키트명</th>
                                            <th style="width:120px;">키트가격</th>
                                            <th>기타</th>
                                        </tr>
                                        
                                        <tr>
                                            <td>{1}</td>
                                            <td>{카드팩}</td>
                                            <td>{10000}원</td>
                                            <td>{키트설명}</td>
                                        </tr>
                                    </table>
                                </div>

                                <hr class="font-weight-bold">

                                <!--검색페이지-->
                                <div class="row position-relative mt-3">
                                    <div class="tableTitle">
                                        <i class="fa fa-hashtag" aria-hidden="true"></i>배송정보
                                    </div>
                                    <table class="admin_search table table-bordered">
                                        <tr height="38">
                                            <th width="15%">수강생 ID</th>
                                            <td width="35%">
                                                <input class="w-100" type="text" id="incheck" spellcheck="false">
                                            </td>
                                            <th width="15%">배송 상태</th>
                                            <td width="35%">
                                                <select class="w-100 text-center" name="" id="">
                                                    <option value="dAll">전체</option>
                                                    <option value="dIng">배송중</option>
                                                    <option value="dComp">배송완료</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr height="38">
                                            <th>송장번호</th>
                                            <td>
                                                <input class="w-100" type="number" id="incheck" spellcheck="false">
                                            </td>
                                            <th>결제일</th>
                                            <td class="text-left"colspan="3">
                                                <input class="" id="firstJdate" type="date" spellcheck="false"> ~
                                                <input class="" id="lastJdate" type="date" spellcheck="false">
                                            </td>
                                        </tr>
                                    </table>
                                    <button class="btn btn-secondary position-absolute" style="width: 75px; height: 33px; right: 5px; bottom: 19px;">검색</button>
                                </div>

                                <!--검색결과-->
                                <div class="row">
                                    <table class="table table-bordered">                                        
                                        <tr style="background-color: #eeeeee;">
                                            <th style="width:90px;">번호</th>
                                            <th style="width:120px;">유저아이디</th>
                                            <th>결제일</th>
                                            <th>결제금액</th>
                                            <th>송장번호</th>
                                            <th style="width:90px;">배송상태</th>
                                        </tr>

                                        <tr>
                                            <td>{1}</td>
                                            <td>{abc123}}</td>
                                            <td>{2021.10.12}</td>
                                            <td>{100,000}원</td>
                                            <td>{123456798}</td>
                                            <td>{배송중}</td>
                                        </tr>
                                    </table>
                                </div>
                                
                                <div class="row d-flex justify-content-center position-relative">
                                    <div class="dataTables_paginate paging_simple_numbers" id="zero_config_paginate">
                                        <ul class="pagination">
                                            <li class="paginate_button page-item previous"
                                                id="zero_config_previous"><a href="#" aria-controls="zero_config"
                                                    data-dt-idx="0" tabindex="0" class="page-link"><i class="mdi mdi-chevron-double-left"></i></a></li>
                                            <li class="paginate_button page-item active"><a href="#"
                                                    aria-controls="zero_config" data-dt-idx="1" tabindex="0"
                                                    class="page-link">1</a></li>
                                            <li class="paginate_button page-item "><a href="#"
                                                    aria-controls="zero_config" data-dt-idx="2" tabindex="0"
                                                    class="page-link">2</a></li>
                                            <li class="paginate_button page-item "><a href="#"
                                                    aria-controls="zero_config" data-dt-idx="3" tabindex="0"
                                                    class="page-link">3</a></li>
                                            <li class="paginate_button page-item "><a href="#"
                                                    aria-controls="zero_config" data-dt-idx="4" tabindex="0"
                                                    class="page-link">4</a></li>
                                            <li class="paginate_button page-item "><a href="#"
                                                    aria-controls="zero_config" data-dt-idx="5" tabindex="0"
                                                    class="page-link">5</a></li>
                                            <li class="paginate_button page-item "><a href="#"
                                                    aria-controls="zero_config" data-dt-idx="6" tabindex="0"
                                                    class="page-link">6</a></li>
                                            <li class="paginate_button page-item next" id="zero_config_next"><a href="#"
                                                    aria-controls="zero_config" data-dt-idx="7" tabindex="0"
                                                    class="page-link"><i class="mdi mdi-chevron-double-right"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="position-absolute" style="left: 1px;">
                                        <button class="btn btn-light">목록가기</button>
                                    </div>
                                    <div class="position-absolute" style="right: 1px;">
                                        <button class="btn btn-danger">PDF다운</button>
                                        <button class="btn btn-success">EXCEL다운</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 내용 끝 -->


            <!-- 바디 끝 -->
<script>
    //mouseover 이벤트 : 탭 css변경
    $('.crTab').parent().on('mouseover',function(){
        $(this).children().parent().css('background-color','white');
        $(this).children().parent().find('.crTab').css('color','black');
    })

    //mouseover 이벤트 : 탭 css변경
    $('.crTab').parent().on('mouseout',function(){
        $(this).children().parent().css('background-color','#FCF8E3');
        $(this).children().parent().find('.crTab').css('color','#000000');
        $(this).children().parent().find('.crTab.active').css('color','orange');
    })

    //날짜 시작날짜/마지막날짜 disable
    $('#firstJdate').change(function(){
        let firstJdate = $('#firstJdate').val();
        $('#lastJdate').attr('min', firstJdate);
    })
    
    $('#lastJdate').change(function(){
        let lastJdate = $('#lastJdate').val();
        $('#firstJdate').attr('max', lastJdate);
    })
</script>
</body>

</html>