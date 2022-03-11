<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
    .qstList tr{
    	cursor: pointer;
    }
    #ho:hover{
        background-color:#f5f5f5;
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
                                    <li class="breadcrumb-item"><a href="/admin/home">Home</a></li>
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
                                <form action="/admin/adQstL" id="searchForm">
                                <div class="row position-relative">
                                    <table class="admin_search table table-bordered">
                                        <tr height="38">
                                            <th width="15%">검색분류</th>
                                            <td width="35%">
                                                <div class="row">
                                                    <div class="col-3">
                                                        <select class="custom-select text-center px-0 searchType" style="width: 100px;">
                                                            <option value="ttl"                                                            
                                                        	<c:if test="${not empty searchData.ttl }">selected="selected"</c:if> 
                                                            >제목</option>
                                                            <option value="content"                                                            
                                                        	<c:if test="${not empty searchData.content }">selected="selected"</c:if>
                                                            >내용</option>
                                                            <option value="ttlContent"
                                                        	<c:if test="${not empty searchData.ttlContent }">selected="selected"</c:if>
                                                            >제목 + 내용</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-9 d-flex align-items-center pl-0">
                                                        <input class="ml-1 w-100 border selectSearch" type="text" spellcheck="false" 
                                                        <c:if test="${not empty searchData.ttl }">value="${searchData.ttl }" name="ttl"</c:if> 
                                                        <c:if test="${not empty searchData.content }">value="${searchData.content }" name="content"</c:if>
                                                        <c:if test="${not empty searchData.ttlContent }">value="${searchData.ttlContent }" name="ttlContent"</c:if>
                                                        >
                                                    </div>
                                                </div>
                                            </td>
                                            <th width="15%">처리상태</th>
                                            <td width="35%" class="align-self-center align-middle text-left">
                                            	<input type="radio" name="qstStCode" id="all" spellcheck="false" 
                                            	<c:if test="${empty searchData.qstStCode}">checked="checked"</c:if>
                                            	value="">
                                                <label for="all" class="mb-0 mx-1">모두</label>
                                                <input type="radio" name="qstStCode" id="r" spellcheck="false" 
                                                <c:if test="${searchData.qstStCode eq 'QS01'}">checked="checked"</c:if>
                                                value="QS01">
                                                <label for="r" class="mb-0 mx-1">답변대기중</label>
                                                <input type="radio" class="ml-2" name="qstStCode" id="t" spellcheck="false"
                                                <c:if test="${searchData.qstStCode eq 'QS02'}">checked="checked"</c:if>
                                                value="QS02">
                                                <label for="t" class="mr-3 mb-0">답변완료</label>
                                            </td>
                                        </tr>
                                        <tr height="38">
                                            <th>작성자</th>
                                            <td>
                                                <input class="w-100 writer border m-0" style="vertical-align: middle;" type="text" name="writer"
                                                <c:if test="${not empty searchData.writer}">${searchData.writer }</c:if>
                                                spellcheck="false">
                                            </td>
                                            <th>작성일</th>
                                            <td colspan="3" class="text-left">
                                                <div class="row pl-3">
                                                    <div><input type="date" class="startDate border" name="startDate"
                                                    <c:if test="${not empty searchData.startDate}">value="${searchData.startDate }"</c:if>
                                                    ></div>
                                                    <div class="ml-3 mr-3"><i class="fa fa-minus"></i></div>
                                                    <div><input type="date" class="endDate border" name="endDate"
                                                    <c:if test="${not empty searchData.endDate}">value="${searchData.endDate }"</c:if>
                                                    ></div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                   	<button type="button" class="btn bg-white border position-absolute" style="width: 75px; height: 33px; right: 85px; bottom: 19px;" id="resetAll">초기화</button>
                                    <button type="button" class="btn btn-secondary position-absolute"
                                        style="width: 75px; height: 33px; right: 5px; bottom: 19px;" id="search">검색</button>
                                </div>
                                <input type="hidden" name="page" value="${searchData.page }">
                                <input type="hidden" name="orderColumn" value="${searchData.orderColumn }">
                                <input type="hidden" name="orderBy" value="${searchData.orderBy }">
                                </form>
                                <div class="row">
                                    <table class="table table-bordered">
                                    <thead>
                                        <tr style="background-color: #eeeeee;">
                                            <th width="100px" data-col="qst_no">번호
                                            <i class=
                                            "fa fa-caret-down 
                                            <c:if test="${searchData.orderColumn eq 'qst_no' and searchData.orderBy eq 'asc'}">
                                            fa-rotate-180
                                            </c:if>
                                            "                                            
                                            aria-hidden="true"></i>
                                            </th>
                                            <th width="150px" data-col="writer">작성자
                                            <i class=
                                            "fa fa-caret-down 
                                            <c:if test="${searchData.orderColumn eq 'writer' and searchData.orderBy eq 'asc'}">
                                            fa-rotate-180
                                            </c:if>
                                            "                                            
                                            aria-hidden="true"></i>
                                            </th>
                                            <th data-col="ttl">제목
                                            <i class=
                                            "fa fa-caret-down 
                                            <c:if test="${searchData.orderColumn eq 'ttl' and searchData.orderBy eq 'asc'}">
                                            fa-rotate-180
                                            </c:if>
                                            "                                            
                                            aria-hidden="true"></i>
                                            </th>
                                            <th width="130px" data-col="q_reg_date">작성일
                                            <i class=
                                            "fa fa-caret-down 
                                            <c:if test="${searchData.orderColumn eq 'q_reg_date' and searchData.orderBy eq 'asc'}">
                                            fa-rotate-180
                                            </c:if>
                                            "                                            
                                            aria-hidden="true"></i>
                                            </th>
                                            <th width="130px" data-col="qst_st_code">처리상태
                                            <i class=
                                            "fa fa-caret-down 
                                            <c:if test="${searchData.orderColumn eq 'qst_st_code' and searchData.orderBy eq 'asc'}">
                                            fa-rotate-180
                                            </c:if>
                                            "                                            
                                            aria-hidden="true"></i>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody class="qstList">
                                    <c:forEach items="${qstList }" var="qst">
                                        <tr id = "ho">
                                            <td>${qst.qstNo }</td>
                                            <td>${qst.writer }</td>
                                            <td>${qst.ttl }</td> 
                                            <td>${qst.qRegDate }</td>
                                            <td>
                                            	<c:if test="${qst.qstStCode eq 'QS01'}">
                                            		답변대기중
                                            	</c:if>
                                            	<c:if test="${qst.qstStCode eq 'QS02'}">
                                            		답변완료
                                            	</c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                    </table>
                                </div>
                                <div class="row d-flex justify-content-center position-relative">
                                    <div class="dataTables_paginate paging_simple_numbers" id="zero_config_paginate">
                                        <ul class="pagination">
                                        <c:if test="${pages.currPage ne 1 }">
                                            <li class="paginate_button page-item previous" data-num="${pages.prevPage }"
                                            id="zero_config_previous"><a href="#" aria-controls="zero_config"
                                            data-dt-idx="0" tabindex="0" class="page-link"><i class="mdi mdi-chevron-double-left"></i></a></li>
                                        </c:if>
                                        <c:forEach begin="${pages.startPage }" end="${pages.endPage }" var="p">
                                            <li data-num=${p } class="paginate_button page-item <c:out value="${pages.currPage == p ? 'active' : '' }"/>"><a href="#"
                                                    aria-controls="zero_config" 
                                                    class="page-link">${p }</a></li>
                                        </c:forEach>
                                        <c:if test="${pages.currPage ne pages.pageCnt && pages.pageCnt >0 }">
                                            <li class="paginate_button page-item next" id="zero_config_next" data-num="${pages.nextPage }">
                                            <a href="#"
                                                    aria-controls="zero_config" data-dt-idx="7" tabindex="0"
                                                    class="page-link"><i class="mdi mdi-chevron-double-right"></i></a></li>
                                        </c:if>          
                                        </ul>
                                    </div>
                                    <div class="position-absolute" style="right: 1px;">
                                        <button class="btn btn-danger">PDF다운</button>
                                        <button class="btn btn-success" id="excel">EXCEL다운</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                    <!-- 내용 끝 -->
<form action="/admin/adQstS" id="qstSelectForm">
<input type="hidden" name="qstNo" id="qstNo">
</form>

<script type="text/javascript">
$('#search').click(()=>{
	setSearchData(1)
	$('#searchForm').submit();
})

// 검색 초기화
$('#resetAll').click(()=>{
	$('.selectSearch').val('');
	$('.writer').val('');
	$('.startDate').val(null);	
	$('.endDate').val(null);
	$('#all').prop('checked','checked');
})

$('.fa-caret-down').click((e)=>{
	$(e.currentTarget).toggleClass('fa-rotate-180')
	$('#searchForm input[name=orderColumn]').val(e.currentTarget.parentElement.dataset.col)
	$('#searchForm input[name=orderBy]').val('asc');
	setSearchData($('input[name=page]').val())
	$('#searchForm').submit();
})
$('.fa-rotate-180').click((e)=>{
	$(e.currentTarget).toggleClass('fa-rotate-180')
	$('#searchForm input[name=orderColumn]').val(e.currentTarget.parentElement.dataset.col)
	$('#searchForm input[name=orderBy]').val('desc');
	setSearchData($('input[name=page]').val())
	$('#searchForm').submit();
})

$('#excel').click(()=>{
	makeSearchData(0);
	$('#searchForm').attr('action','/admin/qstExcel');
	$('#searchForm').submit();
	$('#searchForm').attr('action','/admin/adQstL');
})

const setSearchData = (pageNum)=>{
	if($('.searchType').val()==='ttl'){
		$('.selectSearch').attr('name','ttl');		
	}
	if($('.searchType').val()==='content'){
		$('.selectSearch').attr('name','content');
	}
	if($('.searchType').val()==='ttlContent'){
		$('.selectSearch').attr('name','ttlContent');	
	}
	let future = new Date();
	future = new Date(future.setDate(future.getDate()+1)).toISOString().slice(0,10);
	if(!$('.startDate').val()){
		 $('.startDate').val('2016-01-01');			
	}
	if(!$('.endDate').val()){
		$('.endDate').val(future);				
	}
	$('#searchForm>input[name=page]').val(pageNum);
}

// 문의글 선택
$('.qstList').click((e)=>{
	let qstNo = e.target.parentElement.firstElementChild.textContent;
	$('#qstNo').val(qstNo);
	$('#qstSelectForm').submit();
})

$('.page-item').click((e)=>{
	pageNum = +e.currentTarget.dataset.num
	if(pageNum > ${pages.pageCnt}){
		return;
	}
	if(isNaN(pageNum)){
		return;
	}
	console.log(pageNum)
	setSearchData(pageNum);
	$('#searchForm').submit();
})
$('#zero_config_next').click((e)=>{
	setSearchData(${pages.pageCnt});
	$('#searchForm').submit();
})
</script>
</body>
</html>