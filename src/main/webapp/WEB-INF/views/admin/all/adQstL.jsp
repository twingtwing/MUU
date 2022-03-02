<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    table th,
    table td {
        text-align: center;
        vertical-align: middle;
    }

    .admin_search td,
    .admin_search th {
        padding: 5px;
        text-align: center;
        vertical-align: middle;
    }

    .admin_search th {
        background-color: #eeeeee;
    }
</style>
</head>
<body>
            <!-- 페이지명-->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <!-- 페이지명 작성 및 카테고리 작성 -->
                        <h4 class="page-title">문의글</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">문의글</li>
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
                                            <th width="15%">검색분류</th>
                                            <td width="35%">
                                                <div class="row">
                                                    <div class="col-3">
                                                        <select class="custom-select text-center px-0" style="width: 100px;">
                                                            <option>제목</option>
                                                            <option>내용</option>
                                                            <option>제목 + 내용</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-9 d-flex align-items-center pl-0">
                                                        <input class="ml-1 w-100" type="text" spellcheck="false">
                                                    </div>
                                                </div>
                                            </td>
                                            <th width="15%">처리상태</th>
                                            <td width="35%" class="align-self-center align-middle text-left">
                                                <input type="radio" ondblclick="this.checked=false" class="ml-2" name=""
                                                    id="t" spellcheck="false">
                                                <label for="t" class="mr-3 mb-0">처리</label>
                                                <input type="radio" ondblclick="this.checked=false" name="" id="r"
                                                    spellcheck="false">
                                                <label for="r" class="mb-0">미처리</label>
                                            </td>
                                        </tr>
                                        <tr height="38">
                                            <th>작성자</th>
                                            <td>
                                                <input class="w-100" style="vertical-align: middle;" type="text" spellcheck="false">
                                            </td>
                                            <th>작성일</th>
                                            <td colspan="3" class="text-left">
                                                <div class="row pl-3">
                                                    <div><input type="date"></div>
                                                    <div class="ml-3 mr-3"><i class="fa fa-minus"></i></div>
                                                    <div><input type="date"></div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                    <button class="btn btn-secondary position-absolute"
                                        style="width: 75px; height: 33px; right: 5px; bottom: 19px;">검색</button>
                                </div>
                                <div class="row">
                                    <table class="table table-bordered">
                                        <tr style="background-color: #eeeeee;">
                                            <th width="100px">번호</th>
                                            <th width="150px">작성자</th>
                                            <th>제목</th>
                                            <th width="130px">작성일</th>
                                            <th width="100px">처리상태</th>
                                        </tr>
                                        <tr>
                                            <td>000</td>
                                            <td>익명</td>
                                            <td onclick="location.href='./문의글 상세페이지.html'">문의합니다</td>                                            </td>
                                            <td>2022-02-22</td>
                                            <td>미처리</td>
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
</body>
</html>