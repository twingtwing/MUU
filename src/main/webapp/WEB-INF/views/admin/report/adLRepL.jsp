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
        .w-50 {
            width: 49%!important;
        }
                
        element.style {
            width: 70px;
            height: 34px;
            right: 18px;
            bottom: 23px;
        }
        #ct{
            width: 100%!important;
        }

        td:nth-child(3){
            text-align: left;
        }

    </style>
</head>
<body>
            <!-- 페이지명-->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <!-- 페이지명 작성 및 카테고리 작성 -->
                        <h4 class="page-title">강의신고</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">강의신고</li>
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
                                            <th width = "15%">신고자 ID</th>
                                            <td width = "35%">
                                                <input class="w-100" type="text" spellcheck="false" ondblclick="this.checked=false"> 
                                            </td>
                                            <th width = "15%">크리에이터</th>
                                            <td width = "35%">
                                                <input class="w-100" type="text" spellcheck="false" ondblclick="this.checked=false">
                                            </td>
                                            
                                        </tr>
                                        <tr height="38">
                                            <th>강의명</th>
                                            <td>
                                                <input class="w-100" type="text" spellcheck="false" ondblclick="this.checked=false">
                                            </td>
                                            <th>신고유형</th>
                                            <td>
                                                <select name="카테" id="ct">
                                                    <option value="부적절">부적절한콘텐츠</option>
                                                    <option value="피싱">피싱또는스펨</option>
                                                    <option value="기타">기타</option>
                                                </select>
                                            </td>
                                            
                                        </tr>
                                        <tr height="38">
                                            <th>신고날짜</th>
                                            <td class="text-left">
                                                <input class="w-30" type="date" spellcheck="false" id="haq" ondblclick="this.checked=false">
                                                <i class="fas fa-minus mx-1"></i>
                                                <input class="w-30" type="date" spellcheck="false" id="haq1" ondblclick="this.checked=false">
                                            </td>
                                            <th>처리상태</th>
                                            <td class="text-left">
                                                <input type="radio" class="ml-2" name="" id="t" spellcheck="false" ondblclick="this.checked=false">
                                                <label for="t" class="mr-3 mb-0">처리</label>
                                                <input type="radio" name="" id="r" spellcheck="false" ondblclick="this.checked=false">
                                                <label for="r" class="mb-0">미처리</label>
                                            </td>
                                        </tr>
                                    </table>
                                    <button class="btn btn-secondary position-absolute" style="width: 70px; height: 33px; right: 5px; bottom: 19px;">검색</button>
                                </div>
                                <div class="row">
                                    <table class="table table-bordered">
                                        <thead>

                                            <tr style="background-color: #eeeeee;">
                                                <th style="width: 100px;">번호</th>
                                                <th style="width: 150px;">신고유형</th>
                                                <th style="width: 130px;">크리에이터</th>
                                                <th >강의명</th>
                                                <th style="width: 130px;">신고자</th>
                                                <th style="width: 120px;">신고날짜</th>
                                                <th style="width: 100px;">상태</th>
                                                
                                            </tr>
                                        </thead>
                                    <tbody id="mo" onclick="location.href='강의신고상세.html'">
                                        <tr>
                                            <td>1</td>
                                            <td>부적절한 콘텐츠</td>
                                            <td>짭이커</td>
                                            <td>너도 할수있다 첼린저</td>
                                            <td>박ㅇㅇ</td>
                                            <td>2022-02-23</td>
                                            <td>처리</td>
                                        </tr>
                                    </tbody>
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
           
</body>
</html>