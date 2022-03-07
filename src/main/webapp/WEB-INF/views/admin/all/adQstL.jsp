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
                                                        <c:if test="${not empty searchData.ttl }">value="${searchData.ttl }"</c:if> 
                                                        <c:if test="${not empty searchData.content }">value="${searchData.content }"</c:if>
                                                        <c:if test="${not empty searchData.ttlContent }">value="${searchData.ttlContent }"</c:if>
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
                                                <c:if test="${searchData.qstStCode eq 'Q01'}">checked="checked"</c:if>
                                                value="Q01">
                                                <label for="r" class="mb-0 mx-1">답변대기중</label>
                                                <input type="radio" class="ml-2" name="qstStCode" id="t" spellcheck="false"
                                                <c:if test="${searchData.qstStCode eq 'Q02'}">checked="checked"</c:if>
                                                value="Q02">
                                                <label for="t" class="mr-3 mb-0">답변완료</label>
                                            </td>
                                        </tr>
                                        <tr height="38">
                                            <th>작성자</th>
                                            <td>
                                                <input class="w-100 writer border m-0" style="vertical-align: middle;" type="text" 
                                                <c:if test="${not empty searchData.writer}">${searchData.writer }</c:if>
                                                spellcheck="false">
                                            </td>
                                            <th>작성일</th>
                                            <td colspan="3" class="text-left">
                                                <div class="row pl-3">
                                                    <div><input type="date" class="startDate border"
                                                    <c:if test="${not empty searchData.startDate}">value="${searchData.startDate }"</c:if>
                                                    ></div>
                                                    <div class="ml-3 mr-3"><i class="fa fa-minus"></i></div>
                                                    <div><input type="date" class="endDate border"
                                                    <c:if test="${not empty searchData.endDate}">value="${searchData.endDate }"</c:if>
                                                    ></div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                    <button class="btn btn-secondary position-absolute"
                                        style="width: 75px; height: 33px; right: 5px; bottom: 19px;" id="search">검색</button>
                                </div>
                                <div class="row">
                                    <table class="table table-bordered">
                                    <thead>
                                        <tr style="background-color: #eeeeee;">
                                            <th width="100px">번호</th>
                                            <th width="150px">작성자</th>
                                            <th>제목</th>
                                            <th width="130px">작성일</th>
                                            <th width="130px">처리상태</th>
                                        </tr>
                                    </thead>
                                    <tbody class="qstList">
                                    <c:forEach items="${qstList }" var="qst">
                                        <tr>
                                            <td>${qst.qstNo }</td>
                                            <td>${qst.writer }</td>
                                            <td>${qst.ttl }</td> 
                                            <td>${qst.qRegDate }</td>
                                            <td>
                                            	<c:if test="${qst.qstStCode eq 'Q01'}">
                                            		답변대기중
                                            	</c:if>
                                            	<c:if test="${qst.qstStCode eq 'Q02'}">
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
                                        <button class="btn btn-success">EXCEL다운</button>
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
<form action="/admin/qstSearch" id="searchForm">
<input type="hidden" name="ttl" value="">
<input type="hidden" name="content" value="">
<input type="hidden" name="ttlContent" value="">
<input type="hidden" name="writer" value="">
<input type="hidden" name="qstStCode" value="">
<input type="hidden" name="startDate" value=null>
<input type="hidden" name="endDate" value=null>
<input type="hidden" name="page" value="">
</form>
<script type="text/javascript">
$('#search').click(()=>{
	setSearchData(1)
	$('#searchForm').submit();
})
const setSearchData = (pageNum)=>{
	if($('.searchType').val()==='ttl'){
		$('#searchForm>input[name=ttl]').val($('.selectSearch').val())		
	}
	if($('.searchType').val()==='content'){
		$('#searchForm>input[name=content]').val($('.selectSearch').val())		
	}
	if($('.searchType').val()==='ttlContent'){
		$('#searchForm>input[name=ttlContent]').val($('.selectSearch').val())		
	}
	$('#searchForm>input[name=writer]').val($('.writer').val())
	$('#searchForm>input[name=qstStCode]').val($('td>input[type=radio][name=qstStCode]:checked').val())
	let future = new Date();
	future = new Date(future.setDate(future.getDate()+1)).toISOString().slice(0,10);
	!$('.startDate').val() ? $('#searchForm>input[name=startDate]').val('2016-01-01') : $('#searchForm>input[name=startDate]').val($('.startDate').val())
	!$('.endDate').val() ? $('#searchForm>input[name=endDate]').val(future) : $('#searchForm>input[name=endDate]').val($('.endDate').val())
	$('#searchForm>input[name=page]').val(pageNum);
}


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