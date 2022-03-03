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
        input[name=star]{
            vertical-align: middle;
        }


        /* tiles에 넣어야함 */
        .page-link{
            color: #837f7f;
        }
        .page-link:hover{
            color: white;
        }
        .page-item.active .page-link{
            background-color: black;
            border-color: black;
        }
        .breadcrumb-item a{
            color: black;
            font-weight: bold;
        }
        .breadcrumb-item.active{
            color: rgb(153, 149, 149);
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
                                    <li class="breadcrumb-item active" aria-current="page">강의 관리</li>
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
                                            <th width="15%">제목</th>
                                            <td width="35%">
                                                <input class="w-100" type="text" id="incheck" spellcheck="false">
                                            </td>
                                            <th width="15%">카테고리</th>
                                            <td width="35%">
                                                <div class="d-flex">
                                                    <!--상세 / 데이터필요-->
                                                    <select name="" id="ctgr" class="border w-50">
                                                        <option value="all">전체(상위 카테고리)</option>
                                                        <option value="">음악</option>
                                                        <option value="">요리</option>
                                                        <option value="">건강</option>
                                                        <option value="">아트</option>
                                                        <option value="">IT/컴퓨터</option>
                                                        <option value="">외국어</option>
                                                        <option value="">자기계발</option>
                                                    </select>
                                                    <!--상세 하나에 대한 하부 / 데이터-->
                                                    <select name="" id="downctgr" class="border w-50" disabled>
                                                        <option value="">전체(하위 카테고리)</option>
                                                    </select>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr height="38">
                                            <th>크리에이터</th>
                                            <td>
                                            	<div class="d-flex">
                                                    <div class="col-3 row align-items-center">
                                                        <select class="w-100">
                                                        <option value="ID">ID</option>
                                                        <option value="이름">이름</option>
                                                    </select>
                                                    </div>
                                                    <div class="col-9">
                                                        <input class="w-100" type="text" spellcheck="false">
                                                    </div>
                                                </div>
                                            </td>
                                            <th>강의 게시 날짜</th>
                                            <td class="text-left">
                                            	<input class="w-30" type="date" spellcheck="false" id="firstJdate">
                                                <i class="fas fa-minus mx-1"></i>
                                                <input class="w-30" type="date" spellcheck="false" id="lastJdate">
                                            </td>
                                        </tr>

                                        <tr height="38">
                                            <th>별점</th>
                                            <td class="text-left">
                                                <input type="radio" value="1" id="1" name=star ondblclick="this.checked=false">
                                                    <label for="1" class="mb-0 ml-1 mr-2">
                                                        <i class="fa fa-star text-warning mr-0"></i>
                                                    </label>
                                                    <input type="radio" value="2" id="2" name=star ondblclick="this.checked=false">
                                                    <label for="2" class="mb-0 ml-1 mr-2">
                                                        <i class="fa fa-star text-warning mr-0"></i>
                                                        <i class="fa fa-star text-warning mr-0"></i>
                                                    </label>
                                                    <input type="radio" value="3" id="3" name=star ondblclick="this.checked=false">
                                                    <label for="3" class="mb-0 ml-1 mr-2">
                                                        <i class="fa fa-star text-warning mr-0"></i>
                                                        <i class="fa fa-star text-warning mr-0"></i>
                                                        <i class="fa fa-star text-warning mr-0"></i>
                                                    </label>
                                                    <input type="radio" value="4" id="4" name=star ondblclick="this.checked=false">
                                                    <label for="4" class="mb-0 ml-1 mr-2">
                                                        <i class="fa fa-star text-warning mr-0"></i>
                                                        <i class="fa fa-star text-warning mr-0"></i>
                                                        <i class="fa fa-star text-warning mr-0"></i>
                                                        <i class="fa fa-star text-warning mr-0"></i>
                                                    </label>
                                                    <input type="radio" value="5" id="5" name=star ondblclick="this.checked=false">
                                                    <label for="5" class="mb-0 ml-1 mr-2">
                                                        <i class="fa fa-star text-warning mr-0"></i>
                                                        <i class="fa fa-star text-warning mr-0"></i>
                                                        <i class="fa fa-star text-warning mr-0"></i>
                                                        <i class="fa fa-star text-warning mr-0"></i>
                                                        <i class="fa fa-star text-warning mr-0"></i>
                                                    </label>
                                            </td>
                                            <th>상태</th>
                                            <td class="text-left">
                                                <input type="checkbox" class="ml-2" name="" id="code_1" spellcheck="false">
                                                <label for="code_1" class="mr-3 mb-0">아직 덜 정함</label>
                                                <!-- 아직 픽수가 안되서 상태 많아지면 SELECT BOX로 할 예정 -->
                                            </td>
                                        </tr>
                                        

                                    </table>
                                    <button class="btn btn-secondary position-absolute" style="width: 75px; height: 33px; right: 5px; bottom: 19px;">검색</button>
                                </div>
                                <div class="row">
                                    <table class="table table-bordered">
                                        <tr style="background-color: #eeeeee;">
                                            <th style="width:90px;">번호</th>
                                            <th style="width: 200px;">카테고리</th>
                                            <th>강의명</th>
                                            <th style="width:110px;">ID</th>
                                            <th style="width:110px;">이름</th>
                                            <th style="width:120px;">강의등록날짜</th>
                                            <th style="width:110px;">강의가격</th>
                                            <th style="width:130px;">강의별점</th>
                                            <th style="width:130px;">상태</th>
                                        </tr>
                                        <!--강의 정보 가져와서 데이터 뿌리기 / 기본 강의소개페이지로 이동-->
                                        <tr>
                                            <td>dfdsf</td>
                                            <td>dfdsf</td>
                                            <td>dfdsf</td>
                                            <td>dfdsf</td>
                                            <td>dfdsf</td>
                                            <td>dfdsf</td>
                                            <td>dfdsf</td>
                                            <td><i class="fa fa-star text-warning mr-0"></i></td>
                                            <td>dfdsf</td>
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

    //가입날짜 시작날짜/마지막날짜 disable
    $('#firstJdate').change(function(){
        let firstJdate = $('#firstJdate').val();
        $('#lastJdate').attr('min', firstJdate);
    })
    
    $('#lastJdate').change(function(){
        let lastJdate = $('#lastJdate').val();
        $('#firstJdate').attr('max', lastJdate);
    })

    //크리에이터 불러오기
    // $(function(){
    //     $.ajax({

    //     })
    // })


    //카테고리 셀박
    const category = {
        '음악' : ['클래식','재즈','락','힙합/랩','타악기','기타/베이스','동양음악','보컬','작사/작곡'],
        '요리': ['양식','동양식','간편요리','코스요리','가정식','베이킹'],
        '건강': ['홈트레이닝','필라테스','요가','정신건강','테라피'],
        '아트': ['2D/애니메이션','드로잉','수채화','유화','동양화','판화','공예','사진','메이크업/분장'],
        'IT/컴퓨터': ['Java','Python','C/C++/C#','웹프로그래밍','Unity','영상편집','Photoshop/Illustrator','3D모델링','기타'],
        '외국어': ['영어','일본어','중국어','스페인어','포르투갈어','아랍어','러시아어'],
        '자기계발': ['부동산','주식','면접/자소서','SNS/블로그','기타'],
    }

    $('#ctgr').change(()=>{
        if($(this).find('option:selected').val() == 'all'){
            $('#downctgr').attr('disabled', true);
        } 
        $('#downctgr').removeAttr('disabled');
        $('#downctgr > option:not(:eq(0))').remove();
        let upper = $('#ctgr option:selected').text();
        category[upper].forEach((v)=>{
                $('#downctgr').append($('<option>').val(v).text(v));
                    
        });
    })



</script>
</body>
</html>