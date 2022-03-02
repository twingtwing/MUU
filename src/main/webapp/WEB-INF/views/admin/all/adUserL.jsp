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
    </style>
</head>
<body>
            <!-- 바디 시작 -->

            <!-- 페이지명-->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <!-- 페이지명 작성 및 카테고리 작성 -->
                        <h4 class="page-title">유저 관리</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">유저 관리</li>
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
                                                <div class="d-flex">
                                                    <div class="col-3 d-flex align-items-center">
                                                        <select class="w-100 py-1" name="" id="">
                                                            <option value="id" selected>아이디</option>
                                                            <option value="name">이름</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-9">
                                                        <input class="w-100 border py-1" type="text" spellcheck="false">
                                                    </div>
                                                </div>
                                            </td>
                                            <th width="15%">전화번호</th>
                                            <td width="35%">
                                                <input class="w-100 border py-1" type="text" spellcheck="false">
                                            </td>
                                        </tr>
                                        <tr height="38">
                                            <th>생년월일</th>
											<td>
                                                <input class="w-100 border py-1" type="text" spellcheck="false">
                                            </td>
                                            <th>성별</th>
                                            <td class="text-left">
                                                <input type="checkbox" class="ml-2" name="" id="code_F" spellcheck="false">
                                                <label for="code_F" class="mr-3 mb-0">여자</label>
                                                <input type="checkbox" name="" id="code_M" spellcheck="false">
                                                <label for="code_M" class="mb-0 mr-3">남자</label>
                                            </td>
                                        </tr>
                                        <tr height="38">
                                            <th>등급</th>
                                            <td class="text-left">
                                                <input type="checkbox" class="ml-2" name="" id="sae" spellcheck="false">
                                                <label for="sae" class="mr-3 mb-0">새싹</label>
                                                <input type="checkbox" name="" id="namu" spellcheck="false">
                                                <label for="namu" class="mb-0 mr-3">나무</label>
                                                <input type="checkbox" name="" spellcheck="false" id="kod">
                                                <label for="kod" class="mb-0">꽃</label>
                                            </td>
                                            <th>상태</th>
                                            <td class="text-left">
                                                <input type="checkbox" class="ml-2" name="" id="code_1" spellcheck="false">
                                                <label for="code_1" class="mr-3 mb-0">활성</label>
                                                <input type="checkbox" name="" id="code_2" spellcheck="false">
                                                <label for="code_2" class="mb-0 mr-3">비활성</label>
                                            </td>
                                        </tr>
                                        <tr height="38">
                                            <th>가입날짜</th>
                                            <td colspan="3" class="d-flex border-0 align-items-center">
                                                <input type="date" class="border py-1">
                                                <i class="fas fa-minus mx-2"></i>
                                                <input type="date" class="border py-1">
                                            </td>
                                        </tr>
                                    </table>
                                    <button class="btn btn-secondary position-absolute" style="width: 75px; height: 33px; right: 5px; bottom: 22px;">검색</button>
                                </div>
                                <div class="row">
                                    <table class="table table-bordered">
                                        <tr style="background-color: #eeeeee;">
                                            <th width="100px">번호</th>
                                            <th>상태</th>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>성별</th>
                                            <th>전화번호</th>
                                            <th>등급</th>
                                            <th>가입날짜</th>
                                        </tr>
                                        <tr>
                                        	<td>1</td>
                                            <td>활성</td>
                                            <td>user123@naver.com</td>
                                            <td>정혜윤</td>
                                            <td>성별</td>
                                            <td>000-0000-0000</td>
                                            <td>나무</td>
                                            <td>22/02/02</td>
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