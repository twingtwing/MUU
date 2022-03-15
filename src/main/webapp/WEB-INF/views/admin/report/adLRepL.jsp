<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<style>
#mod:hover{
background-color:#f5f5f5;
}
</style>
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

        .fa-caret-down{
        	cursor: pointer;
        	float: right;
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
                                    <li class="breadcrumb-item"><a href="/admin/home">Home</a></li>
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
                                <form action = '/admin/adLRepL' id='ser' method= 'get'>
                                <div class="row position-relative">
                                    <table class="admin_search table table-bordered">
                                        <tr height="38">
                                            <th width = "15%">신고자 ID</th>
                                            <td width = "35%">
                                                <input id="reporter" class="w-100" type="text" value="${search.reporter }" name = "reporter" spellcheck="false" ondblclick="this.checked=false"> 
                                            </td>
                                            
                                            <th width = "15%">크리에이터</th>
                                            <td width = "35%">
                                                <input id="creid" class="w-100" type="text" value ="${search.creid }"  name="creid" spellcheck="false" ondblclick="this.checked=false">
                                            </td>
                                            
                                        </tr>
                                        <tr height="38">
                                            <th>강의명</th>
                                            <td>
                                                <input id="ttl" name="ttl" value = "${search.ttl }" class="w-100" type="text" spellcheck="false" ondblclick="this.checked=false">
                                            </td>
                                            <th>신고유형</th>
                                            <td>
                                                <select name="type" id="ct" >
                                                	<option value="" <c:if test="${ empty search.type }"> selected="selected"</c:if>>전체</option>
                                                    <option value="RPT01"<c:if test="${ search.type eq 'RPT01' }"> selected="selected"</c:if>>부적절한콘텐츠</option>
                                                    <option value="RPT02" <c:if test="${ search.type eq 'RPT02' }"> selected="selected"</c:if>>피싱또는스펨</option>
                                                    <option value="RPT03" <c:if test="${ search.type eq 'RPT03' }"> selected="selected"</c:if>>기타</option>
                                                </select>
                                            </td>
                                            
                                        </tr>
                                        <tr height="38">
                                            <th>신고날짜</th>
                                            <td class="text-left">
                                                <input id="start" class="w-30" value="${search.start }" type="date" spellcheck="false" id="haq" name="start" ondblclick="this.checked=false" >
                                                <i class="fas fa-minus mx-1"></i>
                                                <input id="end" class="w-30" type="date" spellcheck="false" id="haq1" value="${search.end }" name="end" ondblclick="this.checked=false">
                                            </td>
                                            <th>신고상태</th>
                                            <td class="text-left">
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
                                                <button type="button" class="btn bg-white border position-absolute" style="width: 75px; height: 33px; right: 85px; bottom: 19px;" id="resetAll">초기화</button>
                                            </td>
                                        </tr>
                                    </table>
                                    <button id="serachBtn" class="btn btn-secondary position-absolute" style="width: 70px; height: 33px; right: 5px; bottom: 19px;">검색</button>
                                </div>
                                <input type="hidden" name="searchFlag" id="searchFlag" value="${search.searchFlag }">
	                            <input type="hidden" name="orderColumn" value="${search.orderColumn }">
								<input type="hidden" name="orderBy" value="${search.orderBy}">
	                            <input type = 'hidden' name = 'pageNum' value = '${pageMaker.vot.pageNum }'>
	                            <input type = 'hidden' name = 'amount' value = '${pageMaker.vot.amount }'>
                                </form>
                                <div class="row">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr style="background-color: #eeeeee;">
                                                <th data-col="rp_no" style="width: 100px;">
                                                	번호
                                                	<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'rp_no' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
                                                </th>
                                                <th data-col="type" style="width: 150px;">
                                                	신고유형
                                                	<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'type' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
                                                </th>
                                                <th data-col="cre_id" style="width: 130px;">
                                                	크리에이터
                                                	<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'cre_id' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
                                                </th>
                                                <th data-col="ttl" >
                                                	강의명
                                                	<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'ttl' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
                                                </th>
                                                <th data-col="reporter" style="width: 130px;">
                                                	신고자
                                                	<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'reporter' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
                                                </th>
                                                <th data-col="rp_date" style="width: 120px;">
                                                	신고날짜
                                                	<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'rp_date' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
                                                </th>
                                                <th data-col="rp_st_code" style="width: 100px;">
                                                	신고상태
                                                	<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'rp_st_code' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
                                                </th>
                                                <th data-col="lt_st_code" style="width: 100px;">
                                                	강의상태
                                                	<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'lt_st_code' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
                                                </th>
                                            </tr>
                                        </thead>
                                    <tbody id="mo" onmouseover = "setCursor(this,'pointer')">
                                   		<c:forEach items = "${list }" var = "list">
                                        <tr id="mod" onclick="location.href='/admin/adLRepS?rpNo=${list.rpNo }'">
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
                                            <td>${list.creid }</td>
                                            <td>${list.ttl }</td>
                                            <td>${list.reporter }</td>
                                            <td>${list.rpdate }</td>
                                            <c:if test = "${list.rpStCode eq 'RPS01' }">
	                                        	<td>미처리</td>
	                                            <td><i class="fas fa-minus mr-0"></i></td>
	                                        </c:if>
	                                        <c:if test="${list.rpStCode eq 'RPS02' }">
	                                        	<td>처리</td>
	                                            <c:if test = "${list.ltStCode ne 'L04' and list.ltStCode ne 'L06' }">
		                                            <td>정상강의</td>
		                                        </c:if>
		                                        <c:if test = "${list.ltStCode eq 'L04' }">
		                                        	<td>수정전</td>
		                                        </c:if>
		                                        <c:if test = "${list.ltStCode eq 'L06' }">
		                                        	<td>수정후</td>
		                                        </c:if>
	                                       </c:if>
	                                       <c:if test="${list.rpStCode eq 'RPS03' }">
	                                            <td>반려</td>
	                                            <td><i class="fas fa-minus"></i></td>
	                                       </c:if>
                                        </tr>
                                    </c:forEach>
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
                                        <button id="excel" class="btn btn-success">EXCEL다운</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 내용 끝 -->
           
</body>

<script type="text/javascript">
	$('#resetAll').click(()=>{
		$('#searchFlag').val('');
		$('#reporter').val('');
		$('#creid').val('');
		$('#ttl').val('');
		$('#ct').val('');
		$('#start').val(null);	
		$('#end').val(null);
		$('#rpsAll').prop('checked','checked');
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
	
	function setCursor(str,str2){
	    str.style.cursor = str2;
	}
	$('#excel').on('click',()=>{
		console.log('hi')
		$('#ser').attr('action','/admin/reportcl');
		$('#ser').submit();
	    $('#ser').attr('action','/admin/adLRepL');
	})
	//가입날짜 시작날짜/마지막날짜 disable
    $('#start').on('change', function(){
        let pastDate = $('#start').val();
        $('#end').attr('min', pastDate);
    })
    
    $('#end').on('change', function(){
        let recentDate = $('#end').val();
        $('#start').attr('max', recentDate);
    })
    
    $(function(){
    	let date = new Date();
    	let today = date.toISOString().substring(0, 10);
    	$('#start').attr('max', today);
    	$('#end').attr('max', today);
    })
</script>
</html>