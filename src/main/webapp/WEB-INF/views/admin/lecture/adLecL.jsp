<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                                <form action="/admin/adLecL" id="searchForm">
                                <div class="row position-relative">
                                    <table class="admin_search table table-bordered">
                                        <tr height="38">
                                            <th width="15%">제목</th>
                                            <td width="35%">
                                                <input class="w-100" type="text" id="incheck" spellcheck="false" name="ttl" value="">
                                            </td>
                                            <th width="15%">카테고리</th>
                                            <td width="35%">
                                                <div class="d-flex">
                                                    <!--상세 / 데이터필요-->
                                                    <select name="upCtgr" id="ctgr" class="border w-50">
                                                        <option value="">전체(상위 카테고리)</option>
                                                        <option value="HC01">음악</option>
                                                        <option value="HC02">요리</option>
                                                        <option value="HC03">건강</option>
                                                        <option value="HC04">아트</option>
                                                        <option value="HC05">IT/컴퓨터</option>
                                                        <option value="HC06">외국어</option>
                                                        <option value="HC07">자기계발</option>
                                                    </select>
                                                    <!--상세 하나에 대한 하부 / 데이터-->
                                                    <select name="downCtgr" id="downctgr" class="border w-50" disabled>
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
                                                        <select class="w-100 searchBox">
                                                        <option value="id">아이디</option>
                                                        <option value="name">이름</option>
                                                    </select>
                                                    </div>
                                                    <div class="col-9">
                                                        <input class="w-100 searchKey" type="text" spellcheck="false">
                                                    </div>
                                                </div>
                                            </td>
                                            <th>강의 게시 날짜</th>
                                            <td class="text-left">
                                            	<input class="w-30" type="date" spellcheck="false" id="firstJdate" name="pastDate">
                                                <i class="fas fa-minus mx-1"></i>
                                                <input class="w-30" type="date" spellcheck="false" id="lastJdate" name="recentDate">
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
                                                <input type="checkbox" class="ml-2" name="ltStCodeList" id="code_1" spellcheck="false">
                                                <label for="code_1" class="mr-3 mb-0">등록됨</label>
                                                <input type="checkbox" class="ml-2" name="ltStCodeList" id="code_2" spellcheck="false">
                                                <label for="code_2" class="mr-3 mb-0">등록 대기</label>
                                                <input type="checkbox" class="ml-2" name="ltStCodeList" id="code_3" spellcheck="false">
                                                <label for="code_3" class="mr-3 mb-0">만료/정지</label>
                                                <input type="checkbox" class="ml-2" name="ltStCodeList" id="code_4" spellcheck="false">
                                                <label for="code_4" class="mr-3 mb-0">임시저장됨</label>
                                            </td>
                                        </tr>
                                        

                                    </table>
                                    <button type="button" id="searchBtn" class="btn btn-secondary position-absolute" style="width: 75px; height: 33px; right: 5px; bottom: 19px;">검색</button>
                                </div>
                                </form>
                                <div class="row">
                                    <table class="table table-bordered">
                                        <tr style="background-color: #eeeeee;">
                                            <th style="width:90px;">번호</th>
                                            <th style="width: 200px;">카테고리</th>
                                            <th>강의명</th>
                                            <th style="width:110px;">ID</th>
                                            <th style="width:110px;">이름</th>
                                            <th style="width:120px;">강의등록(신청)날짜</th>
                                            <th style="width:110px;">수강료</th>
                                            <th style="width:130px;">강의별점</th>
                                            <th style="width:130px;">상태</th>
                                        </tr>
                                        <!--강의 정보 가져와서 데이터 뿌리기 / 기본 강의소개페이지로 이동-->
                                        <c:forEach items="${lectures}" var="l">
                                        <tr data-ltno = "${l.ltNo}">
                                        	<td>${l.ltNo }</td>
                                        	<td>${l.upCtgr } > ${l.downCtgr }</td>	
                                        	<td>${l.ttl }</td>
                                        	<td>${l.creId }</td>
                                        	<td>${l.name }</td>
                                        	<td>${l.reqDate }</td>
                                        	<td>${l.prc }</td>
                                        	<td><i class="fa fa-star text-warning mr-0"></i> 
                                        	<c:if test="${l.star eq 0 }">
                                        		리뷰없음
                                        	</c:if>
                                        	<c:if test="${l.star ne 0 }">
                                        	${l.star }
                                        	</c:if>
                                        	</td>
                                        	<td>${l.ltStCode }</td>
                                        </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                                <div class="row d-flex justify-content-center position-relative">
                                    <div class="dataTables_paginate paging_simple_numbers" id="zero_config_paginate">
                                        <ul class="pagination">
                                            <li class="paginate_button page-item previous"
                                                id="zero_config_previous"><a href="#" aria-controls="zero_config"
                                                    data-dt-idx="0" tabindex="0" class="page-link"><i class="mdi mdi-chevron-double-left"></i></a></li>
                                            <c:forEach begin="${p.startPage }" end="${endPage }">
                                            <li class="paginate_button page-item active"><a href="#"
                                                    aria-controls="zero_config" data-dt-idx="1" tabindex="0"
                                                    class="page-link">${p.currPage }</a></li>
                                            </c:forEach>
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
	$('#searchBtn').click((e)=>{
		if($('.searchBox').val()==='id'){
			$('.searchKey').attr('name','creId');
		} else {
			$('.searchKey').attr('name','name');
		}
		if(!$('#firstJdate').val()){
			$('#firstJdate').val('2016-01-01');
		}
		if(!$('#lastJdate').val()){
			let today = new Date();
			today.setDate(today.getDate()+1);
			$('#lastJdate').val(new Date(today).toISOString().slice(0,10));
		}
		$('#searchForm').submit();
	})

    //가입날짜 시작날짜/마지막날짜 disable
    $('#firstJdate').change(function(){
        let firstJdate = $('#firstJdate').val();
        $('#lastJdate').attr('min', firstJdate);
    })
    
    $('#lastJdate').change(function(){
        let lastJdate = $('#lastJdate').val();
        $('#firstJdate').attr('max', lastJdate);
    })

    //카테고리 셀박
    // 나중에 고치기
    const category = {
        '음악' : ['클래식','재즈','락','힙합/랩','타악기','기타/베이스','동양음악','보컬','작사/작곡'],
        '요리': ['양식','동양식','간편요리','코스요리','가정식','베이킹'],
        '건강': ['홈트레이닝','필라테스','요가','정신건강','테라피'],
        '아트': ['2D/애니메이션','드로잉','수채화','유화','동양화','판화','공예','사진','메이크업/분장'],
        'IT/컴퓨터': ['Java','Python','C/C++/C#','웹 프로그래밍','Unity','영상편집','Photoshop/Illustrator','3D모델링','기타'],
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