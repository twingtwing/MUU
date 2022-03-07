<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
        .creatorListBoard tr{
        cursor: pointer;
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
                                                <input class="w-100 border py-1 tel" type="text" spellcheck="false" value="${search.tel }">
                                            </td>
                                        </tr>
                                        <tr height="38">
                                            <th>성별</th>
                                            <td class="text-left">
                                            	<input type="radio" value="" class="ml-2" name="gender" id="code_all" spellcheck="false" <c:if test="${empty search.gender}">checked="checked"</c:if>>
                                                <label for="code_all" class="mr-3 mb-0 gender">모두</label>
                                                <input type="radio" value="W" class="ml-2" name="gender" id="code_F" spellcheck="false"<c:if test="${search.gender eq 'W'}">checked="checked"</c:if>>
                                                <label for="code_F" class="mr-3 mb-0 gender">여성</label>
                                                <input type="radio" value="M" name="gender" id="code_M" spellcheck="false" <c:if test="${search.gender eq 'M'}">checked="checked"</c:if>>
                                                <label for="code_M" class="mb-0 mr-3 gender">남성</label>
                                            </td>
                                        </tr>
                                        <tr height="38">
                                            <th>등급</th>
                                            <td class="text-left">
                                            <c:if test="${empty search.creGrdCodeList }">  
                                            	<input type="checkbox"id="family" class="ml-2" spellcheck="false" value="Family" name="grd">
                                                <label for="family" class="mr-3 mb-0">Family</label>
                                                <input type="checkbox"id="vip" class="ml-2" value="VIP" spellcheck="false"name="grd">
                                                <label for="vip" class="mr-3 mb-0">VIP</label>
                                                <input type="checkbox"id="vvip" value="VVIP" spellcheck="false"name="grd">
                                                <label for="vvip" class="mb-0 mr-3">VVIP</label>
                                            </c:if>
                                            <c:if test="${not empty search.creGrdCodeList }">
                                            	<c:forEach items="${search.creGrdCodeList }" var="g">
                                            	<input type="checkbox"id="${g }" class="ml-2" spellcheck="false" value="${g }" name="grd" checked="checked">                                     	
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
                                                <input type="date" class="border py-1 pastDate" value="${search.pastDate }">
                                                <i class="fas fa-minus mx-2"></i>
                                                <input type="date" class="border py-1 recentDate" value="${search.recentDate }">
                                            </td>
                                        </tr>
                                    </table>
                                    <button class="btn btn-secondary position-absolute" style="width: 75px; height: 33px; right: 5px; bottom: 19px;" id="creSearch">검색</button>
                                </div>
                                
                                <div class="row">
                                    <table class="table table-bordered">
                                    <thead>
                                        <tr style="background-color: #eeeeee;">
                                            <th width="100px">아이디</th>
                                            <th width="100px">상태</th>
                                            <th>이름</th>
                                            <th width="100px">성별</th>
                                            <th>전화번호</th>
                                            <th width="110px">등급</th>
                                            <th width="130px">가입날짜</th>
                                        </tr>
                                    </thead>
                                        <!--크리에이터 정보 가져오기-->
                                        <tbody class="creatorListBoard">
                                        <c:forEach items="${creators }" var="c">
                                        <tr>
                                            <td>${c.id }</td>
                                            <td>
                                            <c:if test="${c.uStCode eq 1}">
                                            	활성
                                            </c:if>
                                            <c:if test="${c.uStCode eq 0}">
                                            	비활성
                                            </c:if>
                                            </td>
                                            <td>${c.name }</td>
                                            <td>
                                            <c:if test="${c.gender eq 'W'}">
                                            	여성
                                            </c:if>
                                            <c:if test="${c.gender eq 'M'}">
                                            	남성
                                            </c:if>
                                            </td>
                                            <td>${c.tel }</td>
                                            <td>${c.creGrdCode }</td>
                                            <td>${c.joinDate }</td>
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

            <!-- 바디 끝 -->
<form action="/admin/creatorSelect" id="creatorSelectForm">
<input type="hidden" name="id" id="creatorId">
</form>  
<form action="/admin/adCreatorSearch" id="searchForm">
<input type="hidden" name="id" value="">
<input type="hidden" name="name" value="">
<input type="hidden" name="gender" value="">
<input type="hidden" name="pastDate" value=null>
<input type="hidden" name="recentDate" value=null>
<input type="hidden" name="uStCode" value="">
<input type="hidden" name="page" value="">
<input type="hidden" name="tel" value="">
</form>      
<script>
const makeSearchData = (pageNum)=>{
	for(let g of $('input[name=grd]:checked')){
		$('#searchForm').append(
			$('<input>').attr('type','hidden').attr('name','creGrdCodeList').val(g.value)		
		)
	}
	if($('input[name=grd]:checked').length===0){
		$('#searchForm').append(
				$('<input>').attr('type','hidden').attr('name','creGrdCodeList').val('Family'),
				$('<input>').attr('type','hidden').attr('name','creGrdCodeList').val('VIP'),
				$('<input>').attr('type','hidden').attr('name','creGrdCodeList').val('VVIP')
			)
	}
	let gender = $('input[name=gender]:checked').val();
	let creStCode = +$('input[name=uStCode]:checked').val();	
	if($('.searchType').val()==='id'){
		$('#searchForm>input[name=id]').val($('.selectBox').val());
	} else {
		$('#searchForm>input[name=name]').val($('.selectBox').val());
	}
	$('#searchForm>input[name=gender]').val(gender)
	let future = new Date();
	future = new Date(future.setDate(future.getDate()+1)).toISOString().slice(0,10);
	!$('.pastDate').val() ? $('#searchForm>input[name=pastDate]').val('2016-01-01') : $('#searchForm>input[name=pastDate]').val($('.pastDate').val())
	!$('.recentDate').val() ? $('#searchForm>input[name=recentDate]').val(future) : $('#searchForm>input[name=recentDate]').val($('.recentDate').val())
	$('#searchForm>input[name=uStCode]').val(creStCode);
	$('#searchForm>input[name=page]').val(pageNum)
	$('#searchForm>input[name=tel]').val($('.tel').val())
}
		$('.creatorListBoard').click((e)=>{
			let id =e.target.parentElement.firstElementChild.textContent;
			$('#creatorId').val(id);
			$('#creatorSelectForm').submit();
		})
	
	// pagination
	$('.page-item').click((e)=>{
		let pageNum = e.currentTarget.dataset.num;
		makeSearchData(pageNum);
		$('#searchForm').submit();
	})
		
	$('#creSearch').click(()=>{
		makeSearchData(1);
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
	
</script>         
</body>
</html>