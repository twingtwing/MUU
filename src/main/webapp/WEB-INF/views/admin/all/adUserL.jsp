<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
        .userListBoard>tr{
        	cursor: pointer;
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
                        <h4 class="page-title">유저 관리</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/admin/home">Home</a></li>
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
                                <form action="/admin/adUserL" id="searchForm">
                                <div class="row position-relative">
                                    <table class="admin_search table table-bordered">
                                        <tr height="38">
                                            <th width="15%">검색분류</th>
                                            <td width="35%">
                                                <div class="d-flex">
                                                    <div class="col-3 d-flex align-items-center">
                                                        <select class="w-100 py-1 searchType border">
                                                             <option value="id"<c:if test="${not empty search.id }"> selected="selected"</c:if>>아이디</option>
                                                            <option value="name"<c:if test="${not empty search.name }"> selected="selected"</c:if>>이름</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-9">
                                                        <input class="w-100 border py-1 selectBox" type="text" spellcheck="false"
                                                        <c:if test="${not empty search.id }">value="${search.id }"</c:if>
                                                        <c:if test="${not empty search.name }">value="${search.name }"</c:if>
                                                        >
                                                    </div>
                                                </div>
                                            </td>
                                            <th width="15%">전화번호</th>
                                            <td width="35%">
                                                <input class="w-100 border py-1 tel" type="text" spellcheck="false"
                                                value="${search.tel }" name="tel">
                                            </td>
                                        </tr>
                                        <tr height="38">
                                            <th>성별</th>
                                            <td class="text-left">
                                            	<input type="radio" value="" class="ml-2" name="gender" id="code_all" spellcheck="false" 
                                            	<c:if test="${empty search.gender}">checked="checked"</c:if>
                                            	>
                                                <label for="code_all" class="mr-3 mb-0 gender">모두</label>
                                                <input type="radio" value="W" class="ml-2" name="gender" id="code_F" spellcheck="false"
                                                <c:if test="${search.gender eq 'W'}">checked="checked"</c:if>
                                                >
                                                <label for="code_F" class="mr-3 mb-0 gender">여성</label>
                                                <input type="radio" value="M" name="gender" id="code_M" spellcheck="false"
                                                <c:if test="${search.gender eq 'M'}">checked="checked"</c:if>
                                                >
                                                <label for="code_M" class="mb-0 mr-3 gender">남성</label>
                                            </td>
                                        </tr>
                                        <tr height="38">
                                            <th>등급</th>
                                            <td class="text-left">
                                            	<c:if test="${empty search.uGrdCodeList }">                                           	
	                                            	<input type="checkbox"id="normal" class="ml-2" spellcheck="false" value="일반" name="uGrdCodeList" >
	                                                <label for="normal" class="mr-3 mb-0">일반</label>
	                                                <input type="checkbox"id="sae" class="ml-2" value="새싹" spellcheck="false"name="uGrdCodeList">
	                                                <label for="sae" class="mr-3 mb-0">새싹</label>
	                                                <input type="checkbox"id="namu" value="나무" spellcheck="false"name="uGrdCodeList">
	                                                <label for="namu" class="mb-0 mr-3">나무</label>
	                                                <input type="checkbox"id="kod"spellcheck="false"value="꽃"name="uGrdCodeList">
	                                                <label for="kod" class="mb-0">꽃</label>
                                            	</c:if>
                                            	<c:if test="${not empty search.uGrdCodeList }">
	                                            	<c:forEach items="${grd}" var="g" varStatus="var">
		                                            	<input type="checkbox"id="${g }" class="ml-2" spellcheck="false" value="${g }" name="uGrdCodeList" 
		                                            	<c:forEach items="${search.uGrdCodeList}" var="u">
		                                            		<c:if test="${u eq g }">checked="checked"</c:if>                                   	
		                                            	</c:forEach>>  
		                                                <label for="${g }" class="mr-3 mb-0">${g }</label>
	                                            	</c:forEach>      
                                            	</c:if>
                                            </td>
                                            <th>상태</th>
                                            <td class="text-left">
                                                <input type="radio" class="ml-2" value="1" name="uStCode" id="code_1" spellcheck="false" 
                                                <c:if test="${search.uStCode eq 1 || empty search.uStCode}"> checked="checked"</c:if>>
                                                <label for="code_1" class="mr-3 mb-0">활성</label>
                                                <input type="radio" name="uStCode" id="code_2" spellcheck="false" value="0"
                                                <c:if test="${search.uStCode eq 0}"> checked="checked"</c:if>>
                                                <label for="code_2" class="mb-0 mr-3">비활성</label>
                                            </td>
                                        </tr>
                                        <tr height="38">
                                            <th>가입날짜</th>
                                            <td class="d-flex border-0 align-items-center">
                                                <input type="date" class="border py-1 pastDate" value="${search.pastDate }" name="pastDate">
                                                <i class="fas fa-minus mx-2"></i>
                                                <input type="date" class="border py-1 recentDate" value="${search.recentDate }" name="recentDate">
			                                    <button type="button" class="btn bg-white border position-absolute" style="width: 75px; height: 33px; right: 85px; bottom: 19px;" id="resetAll">초기화</button>
                                            </td>
                                        </tr>
                                    </table>
                                    <button type="button" class="btn btn-secondary position-absolute" style="width: 75px; height: 33px; right: 5px; bottom: 22px;" id="usersSearch">검색</button>
                                </div>
                                <input type="hidden" name="page" value="${search.page }">
								<input type="hidden" name="orderColumn" value="${search.orderColumn }">
								<input type="hidden" name="orderBy" value="${search.orderBy }">
                                </form>
                                <div class="row">
                                    <table class="table table-bordered">
                                    <thead>
                                        <tr style="background-color: #eeeeee; text-align: center;" >
                                            <th data-col="id">아이디
                                            <i class=
                                            "fa fa-caret-down 
                                            <c:if test="${search.orderColumn eq 'id' and search.orderBy eq 'asc'}">
                                            fa-rotate-180
                                            </c:if>
                                            "                                            
                                            aria-hidden="true"></i>
                                            </th>
                                            <th data-col="u_st_code">상태
                                            <i class=
                                            "fa fa-caret-down 
                                            <c:if test="${search.orderColumn eq 'u_st_code' and search.orderBy eq 'asc'}">
                                            fa-rotate-180
                                            </c:if>
                                            "                                            
                                            aria-hidden="true"></i>
                                            </th>
                                            <th data-col="name">이름
                                            <i class=
                                            "fa fa-caret-down 
                                            <c:if test="${search.orderColumn eq 'name' and search.orderBy eq 'asc'}">
                                            fa-rotate-180
                                            </c:if>
                                            "                                            
                                            aria-hidden="true"></i>
                                            </th>
                                            <th data-col="gender">성별
                                            <i class=
                                            "fa fa-caret-down 
                                            <c:if test="${search.orderColumn eq 'gender' and search.orderBy eq 'asc'}">
                                            fa-rotate-180
                                            </c:if>
                                            "                                            
                                            aria-hidden="true"></i>
                                            </th>
                                            <th data-col="tel">전화번호
                                            <i class=
                                            "fa fa-caret-down 
                                            <c:if test="${search.orderColumn eq 'tel' and search.orderBy eq 'asc'}">
                                            fa-rotate-180
                                            </c:if>
                                            "                                            
                                            aria-hidden="true"></i>
                                            </th>
                                            <th data-col="u_grd_code">등급
                                            <i class=
                                            "fa fa-caret-down 
                                            <c:if test="${search.orderColumn eq 'u_grd_code' and search.orderBy eq 'asc'}">
                                            fa-rotate-180
                                            </c:if>
                                            "                                            
                                            aria-hidden="true"></i>
                                            </th>
                                            <th data-col="join_date">가입날짜
                                            <i class=
                                            "fa fa-caret-down 
                                            <c:if test="${search.orderColumn eq 'join_date' and search.orderBy eq 'asc'}">
                                            fa-rotate-180
                                            </c:if>
                                            "                                            
                                            aria-hidden="true"></i>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody class="userListBoard">
                                    	<c:if test="${empty users }">
                                        <tr>
                                        <td colspan="7">
                                        검색 결과가 없습니다.</td></tr>
                                        </c:if>
                                        <c:forEach items="${users}" var="user">
	                                        <tr id="ho">
	                                            <td>${user.id }</td>
	                                            <td>
	                                            	<c:if test="${user.uStCode eq 1 }">
	                                            		활성	
	                                            	</c:if>
	                                            	<c:if test="${user.uStCode eq 0 }">
	                                            		비활성
	                                            	</c:if>
	                                            </td>
	                                            <td>${user.name }</td>
	                                            <td>
	                                            	<c:if test="${user.gender eq 'M' }">
	                                            		남성
	                                            	</c:if>
	                                            	<c:if test="${user.gender eq 'W' }">
	                                            		여성
	                                            	</c:if>
	                                            </td>
	                                            <td>${user.tel }</td>
	                                            <td>${user.uGrdCode }</td>
	                                            <td>${user.joinDate }</td>
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
                                        <button class="btn btn-danger" id="pdf">PDF다운</button>
                                        <button class="btn btn-success" id="excel">EXCEL다운</button>
                                    </div>
                                </div>
                            </div>
                        </div>
            
                    </div>
                </div>
            </div>
            <!-- 내용 끝 -->
<form action="/admin/userSelect" id="userSelectForm">
<input type="hidden" name="id" id="userId">
</form>

<script type="text/javascript">
// 엑셀 다운
$('#excel').click(()=>{
	makeSearchData(1);
	$('#searchForm').attr('action','/admin/userExcel');
	$('#searchForm').submit();
	$('#searchForm').attr('action','/admin/adUserL');
})

$('#pdf').click(()=>{
	makeSearchData(1);
	$('#searchForm').attr('action','/admin/usersReport');
	$('#searchForm').submit();
	$('#searchForm').attr('action','/admin/adUserL');
})

// 검색 초기화
$('#resetAll').click(()=>{
	$('.selectBox').val('');
	$('.tel').val('');
	$('#searchForm .pastDate').val(null);	
	$('#searchForm .recentDate').val(null);
	$('#code_all').prop('checked','checked');
	$('#code_1').prop('checked','checked');
	$('input[name=uGrdCodeList]').prop('checked',null);
})


$('.fa-caret-down').click((e)=>{
	$(e.currentTarget).toggleClass('fa-rotate-180')
	$('#searchForm>input[name=orderColumn]').val(e.currentTarget.parentElement.dataset.col)
	$('#searchForm>input[name=orderBy]').val('asc');
	makeSearchData($('input[name=page]').val())
	$('#searchForm').submit();
})
$('.fa-rotate-180').click((e)=>{
	$(e.currentTarget).toggleClass('fa-rotate-180')
	$('#searchForm>input[name=orderColumn]').val(e.currentTarget.parentElement.dataset.col)
	$('#searchForm>input[name=orderBy]').val('desc');
	makeSearchData($('input[name=page]').val())
	$('#searchForm').submit();
})



// 검색
$('#usersSearch').click(()=>{
	makeSearchData(1);
	$('#searchForm').submit();
})
	
	const makeSearchData = (pageNum)=>{
		if($('.searchType').val()==='id'){
			$('.selectBox').attr('name','id');
			$('#searchForm input[name=id]').val($('.selectBox').val());
		} else {
			$('.selectBox').attr('name','name');
			$('#searchForm input[name=name]').val($('.selectBox').val());
		}
		let future = new Date();
		future = new Date(future.setDate(future.getDate()+1)).toISOString().slice(0,10);
		if(!$('.pastDate').val()){
		 $('#searchForm .pastDate').val('2016-01-01');			
		}
		if(!$('.recentDate').val()){
		 $('#searchForm .recentDate').val(future);				
		}
		$('#searchForm input[name=page]').val(pageNum);
	}
	
	
	// pagination
	$('.page-item').click((e)=>{
		let pageNum = e.currentTarget.dataset.num;
		makeSearchData(pageNum);
		$('#searchForm').submit();
	})
	
	// select
	$('.userListBoard').click((e)=>{	
		let id = e.target.parentElement.firstElementChild.textContent;
		$('#userId').val(id);
		$('#userSelectForm').submit();
	})
</script>
</body>
</html>