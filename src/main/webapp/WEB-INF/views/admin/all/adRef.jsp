<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <style>
        table tr,
        table td {
            text-align: center;
            vertical-align: middle;
        }

        .admin_search td,
        .admin_search th {
            padding: 5px;
            vertical-align: middle;
            text-align: center;
        }

        .admin_search th {
            background-color: #eeeeee;
        }

        .name {
            display: inline-block;
            width: 250px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        #amodal:hover{
            text-decoration: underline;
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
                        <h4 class="page-title">환불관리</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">환불관리</li>
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
                                                <div class="d-flex col-12 px-0">
                                                    <div class="col-3 px-0">
                                                        <select class="ml-2 custom-select w-100">
                                                            <option>이름</option>
                                                            <option>아이디</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-9 d-flex align-items-center">
                                                        <input class="w-100" type="text" spellcheck="false">
                                                    </div>
                                                </div>
                                            </td>
                                            <th width="15%">환불처리상태</th>
                                            <td width="35%" class="text-left" colspan="3">
                                                <div class="row d-flex justify-content-start align-middle ml-3 mt-1">
                                                    <input type="radio" ondblclick="this.checked=false" class="ml-2"
                                                        name="" id="t" spellcheck="false">
                                                    <label for="t" class="mr-3 mb-0">처리</label>
                                                    <input type="radio" ondblclick="this.checked=false" name="" id="r"
                                                        spellcheck="false">
                                                    <label for="r" class="mr-3 mb-0">미처리</label>
                                                    <input type="radio" ondblclick="this.checked=false" name="" id="w"
                                                        spellcheck="false">
                                                    <label for="w" class="mb-0">대기중</label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr height="38">
                                            <th>강의명</th>
                                            <td>
                                                <input class="w-100" style="vertical-align: middle;" type="text" spellcheck="false">
                                            </td>
                                            <th>환불사유</th>
                                            <td>
                                                <input class="w-100" style="vertical-align: middle;" type="text" spellcheck="false">
                                            </td>
                                        </tr>
                                        <tr height="38">
                                            <th>작성일</th>
                                            <td colspan="3" class="justify-content-start row border-0">
                                                <div class="row pl-4 d-flex justify-content-center">
                                                    <div><input type="date" class="w-100"></div>
                                                    <div class="ml-3 mr-3"><i class="fa fa-minus"></i></div>
                                                    <div><input type="date" class="w-100"></div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                    <button class="btn btn-secondary position-absolute" style="width: 75px; height: 33px; right: 5px; bottom: 19px;">검색</button>
                                </div>
                                <div class="row">
                                    <table class="table table-bordered table-hover">
                                        <tr style="background-color: #eeeeee;">
                                            <th>번호</th>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th class="w-25">강의명</th>
                                            <th class="w-25">환불사유</th>
                                            <th>환불요청날짜</th>
                                            <th>환불요청</th>
                                            <th>금액</th>
                                        </tr>
                                        <tr>
                                            <td>000</td>
                                            <td>아이디</td>
                                            <td>차범근</td>
                                            <td>
                                                <div class="name">
                                                    <a class="text-secondary text-reset" id="amodal"  data-toggle="modal" href="#exampleModalCenter">
                                                        겁나ㅁㄴㅇㄹㄴㅁㅇㄹㄴㅁㅇsadfsadfsadfsadfsadfㄹㄴㅁㅇㄹ
                                                    </a>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="name">
                                                    겁나ㅁㄴㅇㄹㄴㅁㅇㄹㄴㅁㅇsadfsadfsadfsadfsadfㄹㄴㅁㅇㄹ
                                                </div>
                                            </td>
                                            <td>2022-02-23</td>
                                            <td>대기</td>
                                            <td>250,000</td>
                                        </tr>
                                        <tr>
                                            <td>000</td>
                                            <td>아이디</td>
                                            <td>차범근</td>
                                            <td>
                                                <div class="name">
                                                    <a class="text-secondary text-reset" id="amodal"  data-toggle="modal" href="#exampleModalCenter">
                                                        겁나ㅁㄴㅇㄹㄴㅁㅇㄹㄴㅁㅇsadfsadfsadfsadfsadfㄹㄴㅁㅇㄹ
                                                    </a>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="name">
                                                    겁나ㅁㄴㅇㄹㄴㅁㅇㄹㄴㅁㅇsadfsadfsadfsadfsadfㄹㄴㅁㅇㄹ
                                                </div>
                                            </td>
                                            <td>2022-02-23</td>
                                            <td>승인</td>
                                            <td>250,000</td>
                                        </tr>
                                        <tr>
                                            <td>000</td>
                                            <td>아이디</td>
                                            <td>차범근</td>
                                            <td>
                                                <div class="name">
                                                    <a class="text-secondary text-reset" id="amodal" data-toggle="modal" href="#exampleModalCenter">
                                                        겁나ㅁㄴㅇㄹㄴㅁㅇㄹㄴㅁㅇsadfsadfsadfsadfsadfㄹㄴㅁㅇㄹ
                                                    </a>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="name">
                                                    겁나ㅁㄴㅇㄹㄴㅁㅇㄹㄴㅁㅇsadfsadfsadfsadfsadfㄹㄴㅁㅇㄹ
                                                </div>
                                            </td>
                                            <td>2022-02-23</td>
                                            <td>거부</td>
                                            <td>250,000</td>
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
                    <!-- 내용 끝 -->

                    <!-- 바디 끝 -->
                    <!-- Modal -->
                    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog">
                        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLongTitle">환불관리</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <table class="table">
                                        <tr>
                                            <th style="width: 60px;">번호</th>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>주소</th>
                                            <th style="width: 120px;">환불요청날짜</th>
                                            <th style="width: 100px;">환불상태</th>
                                            <th>금액</th>
                                        </tr>
                                        <tr>
                                            <td>000</td>
                                            <td>아이디</td>
                                            <td>차범번</td>
                                            <td>대구광역시 중구 중랑동 존재하지 않는 곳</td>
                                            <td>2022-02-23</td>
                                            <td>대기중</td>
                                            <td>250,000</td>
                                        </tr>
                                    </table>
                                    <div class="border p-2 d-flex justify-content-center font-weight-bold">환불요청사유</div>
                                    <div class="border p-2 d-flex justify-content-center">더럽게 재미가 없다</div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary">승인</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">거부</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">뒤로가기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</body>
</html>