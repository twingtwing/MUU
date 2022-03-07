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
        input[name=star]{
            vertical-align: middle;
        }
        .tableTab th{
            border:none !important;
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
                                    <li class="breadcrumb-item active" aria-current="page">강의소개</li>
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
                                <!-- 여기서부터 작성 -->
                                <div class="row position-relative">
                                    <table class="admin_search table table-bordered">
                                        <tr height="38">
                                            <th>강의이름</th>
                                            <td>
                                                ${lectureInfo.ttl }
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
                                    <table class="table  tableTab">
                                        <tr style="background-color: #FCF8E3;">
                                            <th><a class="crTab active" href="강의관리.html" onclick="">강의소개</a></th>
                                            <th><a class="crTab" href="강의관리.html" onclick="">유저</a></th>
                                            <th><a class="crTab" href="강의관리.html" onclick="">커리큘럼</a></th>
                                            <th><a class="crTab" href="강의관리.html" onclick="">키트</a></th>
                                            <th><a class="crTab" href="강의관리.html" onclick="">후기</a></th>
                                            <th><a class="crTab" href="강의관리.html" onclick="">질문/답변</a></th>
                                            <th><a class="crTab" href="강의관리.html" onclick="">공지사항</a></th>
                                        </tr>
                                    </table>
                                </div>

                                <hr class="font-weight-bold">

                                <div class="row">
                                    <table class="table table-bordered">
                                        <tr style="background-color: #eeeeee;">
                                            <th style="width: 90px;">강의번호</th>
                                            <th>카테고리</th>
                                            <th style="width: 90px;">신고유무</th>
                                            <th style="width: 90px;">키트유무</th>
                                            <th style="width: 130px;">강의등록날짜</th>
                                            <th style="width: 130px;">강의종료기간</th>
                                            <th style="width: 130px;">수업종료기간</th>
                                        </tr>
                                        
                                        <tr>
                                            <td>dfdsf</td>
                                            <td>dfdsf</td>
                                            <td>dfdsf</td>
                                            <td>dfdsf</td>
                                            <td>2021.10.21</td>
                                            <td>dfdsf</td>
                                            <td>dfdsf</td>
                                        </tr>
                                    </table>
                                    <table class="table table-bordered">
                                        <tr style="background-color: #eeeeee;">
                                            <th>강의소개</th>
                                        </tr>
                                        <tr>
                                            <td>강의소개입니다.</td>
                                        </tr>
                                        <tr style="background-color: #eeeeee;">
                                            <th>OT영상</th>
                                        </tr>
                                        <tr>
                                            <td>
                                                <video controls height="240">
                                                    <source src="assets/multimedia/bear.mp4" type="video/mp4">
                                                </video>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                
                                <div class="row">
                                    <button class="btn btn-light" onclick="location.href='/admin/adLecL'">목록가기</button>
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