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
    </style>
</head>
<body>
            <!-- 바디 시작 -->

            <!-- 페이지명-->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <!-- 페이지명 작성 및 카테고리 작성 -->
                        <h4 class="page-title">크리에이터 관리</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">크리에이터 관리</li>
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
                                            <th width="15%">검색 분류</th>
                                            <td width="35%">
                                                <div class="d-flex">
                                                    <div class="col-3">
                                                        <select class="w-100">
                                                            <option id="" value="id">아이디</option>
                                                            <option id="" value="name">이름</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-9">
                                                        <input class="w-100" type="text" id="incheck" spellcheck="false">
                                                    </div>
                                                </div>
                                            </td>
                                            <th width="15%">주소</th>
                                            <td width="35%">
                                                <input class="w-100" type="text" id="addr" spellcheck="false">
                                            </td>
                                        </tr>
                                        <tr height="38">
                                            <th>가입 날짜</th>
                                            <td class="text-left">
                                                <input class="" id="firstJdate" type="date" spellcheck="false">
                                                <i class="fas fa-minus mx-1"></i>
                                                <input class="" id="lastJdate" type="date" spellcheck="false">
                                            </td>
                                            <th>등급</th>
                                            <td class="text-left">
                                                <input type="radio" class="ml-2" name="grade" id="radioF" value="family" ondblclick="this.checked = false">
                                                <label for="radioF" class="mr-3 mb-0">Family</label>
                                                <input type="radio" name="grade" id="radioV" value="VIP" ondblclick="this.checked = false">
                                                <label for="radioV" class="mr-3 mb-0">VIP</label>
                                                <input type="radio" name="grade" id="radioVV" value="VVIP" ondblclick="this.checked = false">
                                                <label for="radioVV" class="mb-0">VVIP</label>
                                            </td>
                                        </tr>
                                    </table>
                                    <button class="btn btn-secondary position-absolute" style="width: 75px; height: 33px; right: 5px; bottom: 19px;">검색</button>
                                </div>
                                
                                <div class="row">
                                    <table class="table table-bordered">
                                        <tr style="background-color: #eeeeee;">
                                            <th width="100px">번호</th>
                                            <th width="150px">아이디</th>
                                            <th width="150px">이름</th>
                                            <th>주소</th>
                                            <th width="110px">등급</th>
                                            <th width="130px">가입날짜</th>
                                        </tr>
                                        <!--크리에이터 정보 가져오기-->
                                        <tr>
                                            <td>dfdsf</td>
                                            <td>dfdsf</td>
                                            <td>dfdsf</td>
                                            <td>dfdsf</td>
                                            <td>dfdsf</td>
                                            <td>0000-00-00</td>
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
	
	 
	
	</script>         
</body>
</html>