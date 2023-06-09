<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
        }

        .admin_search th {
            background-color: #eeeeee;
        }
        
        
        #ho:hover{
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
                        <h4 class="page-title">공지사항</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/admin/home">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">공지사항</li>
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
                                <form action='/admin/adBadLi' id='ser' method='get'>
	                                <div class="row position-relative">
	                                    <table class="admin_search table table-bordered">
	                                        <tr height="38">
	                                            <th style="width: 15%" class="align-middle" >검색분류</th>
	                                            <td style="width: 35%">
	                                                <div class="row">
	                                                    <div class="col-3">
	                                                        <select class="custom-select text-center p-0" id="sel" onchange="chsel()" style="height: 27px;width: 100px;">
	                                                            <option value ="ttl"
	                                                            <c:if test="${not empty search.ttl }"> selected="selected"</c:if>
	                                                            >제목</option>
	                                                            <option value = "content" <c:if test="${not empty search.content }"> selected="selected"</c:if>
	                                                            >내용
	                                                            
	                                                            </option>
	                                                            <option value = "mix" <c:if test="${not empty search.mix }"> selected="selected"</c:if>>제목 + 내용</option>
	                                                        </select>
	                                                    </div>
	                                                    <div class="col-9 d-flex align-items-center pl-0">
	                                                        <input id="inp" class="ml-1 w-100" type="text" name ="ttl" spellcheck="false" 
	                                     					<c:if test="${not empty search.ttl }">value="${search.ttl }"</c:if>
	                                     					<c:if test="${not empty search.content }">value="${search.content }"</c:if>
	                                     					<c:if test="${not empty search.mix }">value="${search.mix }"</c:if>>
	                                                    </div>
	                                                </div>
	                                            </td>
	                                            <th class="align-middle">등록일</th>
	                                            <td class="text-left align-middle">
	                                                <div class="row pl-4 d-flex justify-content-start">
	                                                    <input type="date" id="start" name = "start" value = "${search.start }">
	                                                    <div class="mx-2 d-flex align-self-center justify-content-center"><i class="fa fa-minus m-0"></i></div>
	                                                    <input type="date" id="end" name = 'end' value  = "${search.end }">
	                                                	<button type="button" class="btn bg-white border position-absolute" style="width: 75px; height: 33px; right: 85px; bottom: 19px;" id="resetAll">초기화</button>
	                                                </div>
	                                            </td>
	                                        </tr>
	                                    </table>
	                                    <button id="but"  type = "button" class="btn btn-secondary position-absolute" style="width: 75px; height: 33px; right: 5px; bottom: 19px;">검색</button>
	                                </div>
	                                <input type="hidden" name="searchFlag" id="searchFlag" value="${search.searchFlag }">
	                                <input type="hidden" name="orderColumn" value="${search.orderColumn }">
									<input type="hidden" name="orderBy" value="${search.orderBy }">
	                                <input type = 'hidden' name = 'pageNum' value = '${pageMaker.vo.pageNum }'>
	                                <input type = 'hidden' name = 'amount' value = '${pageMaker.vo.amount }'>
                                </form>
                                <div class="row">
                                    <table class="table table-bordered">
                                    	<thead>
                                        <tr style="background-color: #eeeeee;">
                                            <th data-col="b_no" width="100px">
                                            	번호
                                            	<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'b_no' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
                                            </th>
                                            <th data-col="ttl" class="d-flex justify-content-center">
                                            	제목
                                            	<i class="fa fa-caret-down ml-1 <c:if test="${search.orderColumn eq 'ttl' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
                                            </th>
                                            <th data-col="wr_date" width="150px">
                                            	작성일
                                            	<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'wr_date' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
                                            </th>
                                            <th width="130px">첨부파일</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:if test="${empty list }">
                                        	<tr>
                                        		<td colspan="6" class="py-5 font-weight-bold">검색 결과 데이터가 없습니다.</td>
                                        	</tr>
                                        </c:if>
                                        <c:if test="${not empty list }">
	                                        <c:forEach items ="${list }" var="board">
		                                        <tr id="ho" class="boardSelect" data-no="${board.getBNo() }" onmouseover = "setCursor(this,'pointer')">
		                                            <td>${board.getBNo() }</td>
		                                            <td class="text-left">${board.ttl}</td>
		                                            <td>${board.wrDate }</td>
		                                            <td>
		                                            	<c:if test="${board.fileNo eq -1}">
		                                            		<i class="fas fa-minus mr-0"></i>
		                                            	</c:if>
		                                            	<c:if test="${board.fileNo ne -1}">
		                                            		<i class="fas fa-download mr-0"></i>
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
                                                id="zero_config_previous"><a href=" ${pageMaker.startpage -1 }" aria-controls="zero_config"
                                                    data-dt-idx="0" tabindex="0" class="page-link"><i class="mdi mdi-chevron-double-left"></i>previous</a></li>
												                                         
                                          </c:if>
                                            
                                     	<c:forEach var = "num" begin = "${pageMaker.startpage }" end = "${pageMaker.endpage }">
                                     	<li class = "paginate_button page-item  ${pageMaker.vo.pageNum == num? 'active':'' }">
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
                                        <button class="btn btn-dark" onclick="location.href='/admin/adBadl'">글 등록</button>
										<button type="button" class="btn btn-success" id="excel">EXCEL다운</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 내용 끝 -->

                <!-- 바디 끝 -->

            </div>
            <!-- End Page wrapper -->
</body>
<script type="text/javascript">
	//검색 초기화
	$('#resetAll').click(()=>{
		$('#searchFlag').val('');
		$('#sel').val('ttl');
		$('#inp').attr('name','ttl').val('');
		$('#start').val(null);	
		$('#end').val(null);
	})
	
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
	
	$('#but').click((e)=>{
		e.preventDefault();
		
		$('#searchFlag').val('Y');
		$('#ser').find("input[name='pageNum']").val(1);
		$('#ser').submit();
	})	
	
	$("table .boardSelect").on('click',function(){
		location.href="/admin/adBadS?bNo="+$(this).attr('data-no');
	})
	
	$(".paginate_button a").on("click" , function(e) {
		e.preventDefault();
		if($('#searchFlag').val() !== 'Y'){
			$('#resetAll').click();
		}
		
		$('#ser').find("input[name='pageNum']").val($(this).attr("href"));
		$('#ser').submit();
	});

	function chsel(){
		var ssel = $("#sel option:selected").val();
		document.getElementById( 'inp' ).setAttribute( 'name', ssel);
	}
	function setCursor(str,str2){
        str.style.cursor = str2;
    }
	
	$('#excel').on('click',()=>{
		console.log('hi')
		$('#ser').attr('action','/admin/adBadexcel');
		$('#ser').submit();
	    $('#ser').attr('action','/admin/adBadLi');
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