<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
        .w-30 {
            width: 23%!important;
        }
        element.style {
            width: 70px;
            height: 34px;
            right: 18px;
            bottom: 23px;
        }
        .w-50{
            width: 47%!important;
        }
        label {
            display: inline-block;
            margin-bottom: 0.5rem;
            margin-right: 3erm;
            margin-right: 5%;
            
        }
		#mod:hover{
			background-color:#f5f5f5;
		}
        .fa-caret-down{
        	cursor: pointer;
        	float: right;
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
                        <h4 class="page-title">리뷰신고</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/admin/home">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">리뷰신고</li>
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
                                <form action = '/admin/adRRepL' id='ser' method= 'get'>
	                                <div class="row position-relative">
	                                    <table class="admin_search table table-bordered">
	                                    	
	                                        <tr height="38">
	                                            <th width="15%">ID</th>
	                                            <td width="35%">
	                                                <div class="d-flex">
	                                                    <div class="col-3 row align-items-center">
	                                                        <select class="w-100" id="sel" onchange="chsel()">
		                                                        <option value="reporter"<c:if test="${empty search.creid}">selected="selected"</c:if>>신고자</option>
		                                                        <option value="creid" <c:if test="${not empty search.creid}">selected="selected"</c:if>>크리에이터</option>
		                                                    </select>
	                                                    </div>
	                                                    <div class="col-9">
	                                                        <input id="inp" class="w-100" type="text" spellcheck="false"  
	                                                        <c:if test="${empty search.creid}">name = "reporter"</c:if>
	                                                        <c:if test="${not empty search.reporter}">value = ${search.reporter }</c:if>
	                                                        <c:if test="${not empty search.creid}">name = "creid" value = ${search.creid }</c:if>
	                                                        >
	                                                    </div>
	                                                </div>
	                                            </td>
	                                            <th width="15%" id="ttt">신고유형</th>
	                                            <td width="35%" class="text-left">
	                                                 <select name="type" class="w-100" id="ct" >
	                                                 	<option value="" <c:if test="${ empty search.type }"> selected="selected"</c:if>>전체</option>
	                                                    <option value="RPT01"<c:if test="${ search.type eq 'RPT01' }"> selected="selected"</c:if>>부적절한콘텐츠</option>
	                                                    <option value="RPT02" <c:if test="${ search.type eq 'RPT02' }"> selected="selected"</c:if>>피싱또는스펨</option>
	                                                    <option value="RPT03" <c:if test="${ search.type eq 'RPT03' }"> selected="selected"</c:if>>기타</option>
	                                                </select>
	                                            </td>
	                                        </tr>
	                                        <tr height="38">
	                                            <th>신고당한 리뷰</th>
	                                            <td class="text-left">
	                                                <input id="recontent" class="w-100" type="text" spellcheck="false" name="recontent" value ="${search.recontent }">
	                                            </td>
	                                            <th>처리상태</th>
	                                            <td colspan="3" class="text-left">
	                                                <div class="d-flex align-items-center">
		                                                <input type="radio" id="rpsAll" class="ml-2" name="rpStCode" spellcheck="false" ondblclick="this.checked=false" value=""
		                                                <c:if test ="${search.rpStCode eq ''}">checked="checked" </c:if>>
		                                                <label for="rpsAll" class="mr-3 mb-0" >전체</label>
		                                                <input type="radio" id="rps02" class="ml-2" name="rpStCode" spellcheck="false" ondblclick="this.checked=false" value="RPS02"
		                                                <c:if test ="${search.rpStCode eq 'RPS02'}">checked="checked" </c:if>>
		                                                <label for="rps02" class="mr-3 mb-0" >처리</label>
		                                                <input type="radio" id="rps01" name="rpStCode" spellcheck="false" ondblclick="this.checked=false" value="RPS01"
		                                                <c:if test ="${search.rpStCode eq 'RPS01'}">checked="checked" </c:if>>
		                                                <label for="rps01" class="mb-0">미처리</label>
		                                                 <input type="radio" id="rps03" name="rpStCode" spellcheck="false" ondblclick="this.checked=false" value="RPS03"
		                                                 <c:if test ="${search.rpStCode eq 'RPS03'}">checked="checked" </c:if>>
		                                                <label for="rps03" class="mb-0">반려</label>
	                                                </div>
	                                            </td>
	                                        </tr>
	                                        <tr height="38">
	                                            <th>강의명</th>
	                                            <td class="text-left" >
	                                                <input id="ttl" class="w-100" type="text" spellcheck="false" name="ttl" value = "${search.ttl }">
	                                            </td>
	                                            <th>신고날짜</th>
	                                            <td class="text-left">
	                                                <input class="w-30" type="date" spellcheck="false" id="haq" name="start" value = "${search.start }">
	                                                <i class="fas fa-minus"></i>
	                                                <input class="w-30" type="date" spellcheck="false" id="haq1" name="end"  value = "${search.end }">
	                                            </td>
	                                        </tr>
	                                        <tr height="38">
	                                            <th>별점</th>
	                                            <td colspan="3" class="text-left">
	                                                <div class="d-flex align-items-center">
	                                                    <input type="radio" value="1" id="1" name=star ondblclick="this.checked=false"
	                                                    	 <c:if test ="${search.star eq '1'}">checked="checked" </c:if>
	                                                    >
	                                                    <label for="1" class="mb-0 ml-1 mr-2">
	                                                        <i class="fa fa-star text-warning mr-0"></i>
	                                                    </label>
	                                                    <input type="radio" value="2" id="2" name=star ondblclick="this.checked=false"
	                                                    	 <c:if test ="${search.star eq '2'}">checked="checked" </c:if>
	                                                    >
	                                                    <label for="2" class="mb-0 ml-1 mr-2">
	                                                        <i class="fa fa-star text-warning mr-0"></i>
	                                                        <i class="fa fa-star text-warning mr-0"></i>
	                                                    </label>
	                                                    <input type="radio" value="3" id="3" name=star ondblclick="this.checked=false"
	                                                    	 <c:if test ="${search.star eq '3'}">checked="checked" </c:if>
	                                                    >
	                                                    <label for="3" class="mb-0 ml-1 mr-2">
	                                                        <i class="fa fa-star text-warning mr-0"></i>
	                                                        <i class="fa fa-star text-warning mr-0"></i>
	                                                        <i class="fa fa-star text-warning mr-0"></i>
	                                                    </label>
	                                                    <input type="radio" value="4" id="4" name=star ondblclick="this.checked=false"
	                                                    	 <c:if test ="${search.star eq '4'}">checked="checked" </c:if>
	                                                    >
	                                                    <label for="4" class="mb-0 ml-1 mr-2">
	                                                        <i class="fa fa-star text-warning mr-0"></i>
	                                                        <i class="fa fa-star text-warning mr-0"></i>
	                                                        <i class="fa fa-star text-warning mr-0"></i>
	                                                        <i class="fa fa-star text-warning mr-0"></i>
	                                                    </label>
	                                                    <input type="radio" value="5" id="5" name=star ondblclick="this.checked=false"
	                                                    	 <c:if test ="${search.star eq '5'}">checked="checked" </c:if>
	                                                    >
	                                                    <label for="5" class="mb-0 ml-1 mr-2">
	                                                        <i class="fa fa-star text-warning mr-0"></i>
	                                                        <i class="fa fa-star text-warning mr-0"></i>
	                                                        <i class="fa fa-star text-warning mr-0"></i>
	                                                        <i class="fa fa-star text-warning mr-0"></i>
	                                                        <i class="fa fa-star text-warning mr-0"></i>
	                                                    </label>
	                                                   <button type="button" class="btn bg-white border position-absolute" style="width: 75px; height: 33px; right: 85px; bottom: 19px;" id="resetAll">초기화</button>
	                                                </div>
	                                            </td>
	                                        </tr>
	                                    </table>
                                    	<button id="serachBtn" class="btn btn-secondary position-absolute" style="width: 70px; height: 33px; right: 5px; bottom: 19px;" type="submit">검색</button>
                                	</div>
                                	<input type="hidden" name="searchFlag" id="searchFlag" value="${search.searchFlag }">
		                            <input type="hidden" name="orderColumn" value="${search.orderColumn }">
									<input type="hidden" name="orderBy" value="${search.orderBy}">
		                            <input type = 'hidden' name = 'pageNum' value = '${pageMaker.vot.pageNum }'>
		                            <input type = 'hidden' name = 'amount' value = '${pageMaker.vot.amount }'>
                                </form>
                                <div class="row">
                                    <table class="table table-bordered" >
                                        <thead>
                                            <tr style="background-color: #eeeeee;">
                                                <th data-col="rp_no" style="width: 7%;">
                                                	번호
                                                	<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'rp_no' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
                                                </th>
                                                <th data-col="type" style="width: 10%;">
                                                	신고유형
                                                	<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'type' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
                                                </th>
                                                <th data-col="cre_id" style="width: 10%;">
                                                	크리에이터
                                                	<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'cre_id' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
                                                </th>
                                                <th data-col="ttl">
                                                	강의명
                                                	<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'ttl' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
                                                </th>
                                                <th data-col="reporter" style="width: 10%;">
                                                	신고자
                                                	<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'reporter' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
                                                </th>
                                                <th data-col="recontent">
                                                	신고당한 리뷰
                                                	<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'recontent' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
                                                </th>
                                                <th data-col="rp_date" style="width: 10%;">
                                                	신고날짜
                                                	<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'rp_date' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
                                                </th>
                                                <th data-col="rp_st_code" style="width: 10%;">
                                                	신고상태
                                                	<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'rp_st_code' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody id="mo"  onmouseover = "setCursor(this,'pointer')">
                                        <c:if test="${empty list }">
                                        	<tr >
                                        		<td class="font-weight-bold py-4" colspan="8">데이터가 없습니다.</td>
                                        	</tr>
                                        </c:if>
                                        <c:if test="${ not empty list }">
	                                        <c:forEach items = "${list }" var = "list">
	                                            <tr id="mod" onclick="location.href='/admin/adRRepS?rpNo=${list.rpNo }'">
	                                                <td>${list.rpNo }</td>
	                                                <td>
	                                                   <c:if test="${list.type eq 'RPT01' }">
		                                                부적절한 컨텐츠
		                                                </c:if>
		                                                <c:if test="${list.type eq 'RPT02' }">
		                                                피싱또는 스팸
		                                                </c:if>
		                                                <c:if test="${list.type eq 'RPT03' }">
		                                                기타
		                                                </c:if>
	                                                </td>
	                                                <td>${list.creid }</td>
	                                                <td>${list.ttl }</td>
	                                                <td>${list.reporter }</td>
	                                                <td>${list.recontent }</td>
	                                                <td>${list.rpdate }</td>
	                                                <td>
		                                                <c:if test = "${list.rpStCode eq 'RPS01' }">
			                                            	미처리
			                                            </c:if>
			                                            <c:if test="${list.rpStCode eq 'RPS02' }">
			                                            	 신고 처리
			                                            </c:if>
			                                            <c:if test="${list.rpStCode eq 'RPS03' }">
			                                            	 신고 반려
			                                            </c:if>
	                                                </td>
	                                            </tr>
	                                        </c:forEach>
                                        </c:if>
                                        </tbody>
                                    </table>
                                </div>
                                
                                <div class="row d-flex justify-content-center position-relative">
                                    <div class="dataTables_paginate paging_simple_numbers" id="zero_config_paginate">
                                        <ul class="pagination">
                                        <c:if test = "${pageMaker.prev }">
                                            <li class="paginate_button page-item previous"
                                                id="zero_config_previous"><a href=" ${pageMaker.startpage }" aria-controls="zero_config"
                                                    data-dt-idx="0" tabindex="0" class="page-link"><i class="mdi mdi-chevron-double-left"></i>previous</a></li>
												                                         
                                          </c:if>
                                            
                                     	<c:forEach var = "num" begin = "${pageMaker.startpage }" end = "${pageMaker.endpage}">
                                     	<li class = "paginate_button page-item  ${pageMaker.vot.pageNum == num? 'active':'' }">
                                     	<a href="${num}"aria-controls="zero_config" data-dt-idx="${num}" tabindex="0"class="page-link">${num}</a>
                                     	</li>
                                     	</c:forEach>
                                            
                                            <c:if test = "${pageMaker.next }">
                                            <li class="paginate_button page-item next" id="zero_config_next"><a href="${pageMaker.endPage +1 }"
                                                    aria-controls="zero_config" data-dt-idx="6" tabindex="0"
                                                    class="page-link"><i class="mdi mdi-chevron-double-right"></i>next</a></li>
                                        	</c:if>
                                        </ul>
                                    </div>
                                    <div class="position-absolute" style="right: 1px;">
                                        <button id="execl" class="btn btn-success">EXCEL다운</button>
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
<script type="text/javascript">
	$('#resetAll').click(()=>{
		$('#searchFlag').val('');
		$('#sel').val('reporter');
		$('#inp').attr('name','reporter').val('');
		$('#recontent').val('');
		$('#ct').val('');
		$('#ttl').val('');
		$('#haq').val(null);	
		$('#haq1').val(null);
		$('#rpsAll').prop('checked','checked');
		$('input[name=star]').prop('checked',null);
	})
	
	$(".paginate_button a").on("click" , function(e) {
		e.preventDefault();
		if($('#searchFlag').val() !== 'Y'){
			$('#resetAll').click();
		}
		
		$('#ser').find("input[name='pageNum']").val($(this).attr("href"));
		$('#ser').submit();
	});

	$('.fa-caret-down').click((e)=>{
		$(e.currentTarget).toggleClass('fa-rotate-180')
		$('#ser>input[name=orderColumn]').val(e.currentTarget.parentElement.dataset.col)
		$('#ser>input[name=orderBy]').val('asc');
		
		if($('#searchFlag').val() !== 'Y'){
			$('#resetAll').click();
		}
		$('#ser').submit();
	})
	
	$('.fa-rotate-180').click((e)=>{
		$(e.currentTarget).toggleClass('fa-rotate-180')
		$('#ser>input[name=orderColumn]').val(e.currentTarget.parentElement.dataset.col)
		$('#ser>input[name=orderBy]').val('desc');
		
		if($('#searchFlag').val() !== 'Y'){
			$('#resetAll').click();
		}
		$('#ser').submit();
	})		

	$('#serachBtn').click((e)=>{
		e.preventDefault();
		
		$('#searchFlag').val('Y');
		$('#ser').find("input[name='pageNum']").val(1);
		$('#ser').submit();
	})	
	
	function chsel() {
		var sel = $("#sel option:selected").val();
		document.getElementById('inp').setAttribute('name',sel);
	}
	
    function setCursor(str,str2){
        str.style.cursor = str2;
    }
    
    $('#execl').on('click',()=>{
    	console.log('hi')
    	$('#ser').attr('action','/admin/reportc');
    	$('#ser').submit();
        $('#ser').attr('action','/admin/adRRepL');
    })
 
</script>
</html>