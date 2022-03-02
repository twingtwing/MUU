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
        input{
            vertical-align: middle;
            margin-right:5px;
        }
    </style>
</head>
<body>
            <!-- 바디 시작 -->

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
                                    <li class="breadcrumb-item active" aria-current="page">공지사항</li>
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
                                            <th><a class="crTab" href="강의관리.html" onclick="">키트</a></th>
                                            <th><a class="crTab" href="강의관리.html" onclick="">후기</a></th>
                                            <th><a class="crTab" href="강의관리.html" onclick="">질문/답변</a></th>
                                            <th><a class="crTab active" href="강의관리.html" onclick="">공지사항</a></th>
                                        </tr>
                                    </table>
                                </div>

                                <hr class="font-weight-bold">

                                <div class="row mb-3" style="background-color: #eeeeee;">
                                    <div class="col-12">
                                        <div class="card m-3">
                                            <div class="card-body">
                                                <!-- 여기서부터 작성 -->
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="row p-2" style="background-color: #eeeeee; border-bottom: 1px solid black; border-top: 2px solid black;">
                                                            <h5 class="mb-0">제목</h5>
                                                            <h5 class="mb-0 ml-2" style="font-weight: 500;">{{공지사항}}</h5>
                                                        </div>
                                                        <div class="row justify-content-between p-2" style="background-color: #eeeeee; border-bottom: 2px solid black;">
                                                            <div class="row">
                                                                <h6 class="mb-0 ml-2 pl-1">번호</h6>
                                                                <h6 class="mb-0 ml-2" style="font-weight: 500;">{{000}}</h6>
                                                            </div>
                                                            <div class="row">
                                                                <div class="row mr-1">
                                                                    <h6 class="mb-0">작성일자</h6>
                                                                    <h6 class="mb-0 ml-2" style="font-weight: 500;">{{0000-00-00}}</h6>
                                                                </div>
                                                                <div class="row mx-2">
                                                                    <h6 class="mb-0">조회수</h6>
                                                                    <h6 class="mb-0 ml-2" style="font-weight: 500;">{{000}}</h6>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="card">
                                                        <div class="card-body" style="height: 50vh;">
                                                            {{카드안에 카드바디가 존재하는거임}}
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row mb-2">
                                                    <div class="col-lg-12">
                                                        <div class="row p-2 w-100" style="background-color: #eeeeee; border-bottom: 1px solid black; border-top: 1px solid black;">
                                                            <h6 class="mb-0"><i class="fa fa-download"></i></h6>
                                                            <h6 class="mb-0 ml-2" style="font-weight: 500;"><a href="" class="text-dark">{{첨부파일데스}}</a></h6>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <button type="button" class="btn btn-secondary" onclick="history.go(-1);">뒤로가기</button>
                                                </div>
                                                    
                                                <!-- <div class="mr-4">
                                                    <button type="button" class="btn btn-secondary" onclick="location.href='./공지사항 수정 페이지.html'";>수정</button>
                                                    <button type="button" class="btn btn-secondary" onclick="javascript:btn();">삭제</button>
                                                </div> -->
                                                
                                            </div>
                                        </div>
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