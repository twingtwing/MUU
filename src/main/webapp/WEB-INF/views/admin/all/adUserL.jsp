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
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
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
                                <div class="row position-relative">
                                    <table class="admin_search table table-bordered">
                                        <tr height="38">
                                            <th width="15%">검색분류</th>
                                            <td width="35%">
                                                <div class="d-flex">
                                                    <div class="col-3 d-flex align-items-center">
                                                        <select class="w-100 py-1 searchType">
                                                            <option value="id" selected>아이디</option>
                                                            <option value="name">이름</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-9">
                                                        <input class="w-100 border py-1 selectBox" type="text" spellcheck="false">
                                                    </div>
                                                </div>
                                            </td>
                                            <th width="15%">전화번호</th>
                                            <td width="35%">
                                                <input class="w-100 border py-1 addr" type="text" spellcheck="false">
                                            </td>
                                        </tr>
                                        <tr height="38">
                                            <th>생년월일</th>
											<td>
                                                <input class="w-100 border py-1" type="text" spellcheck="false">
                                            </td>
                                            <th>성별</th>
                                            <td class="text-left">
                                                <input type="checkbox" class="ml-2" name="" id="code_F" spellcheck="false">
                                                <label for="code_F" class="mr-3 mb-0">여자</label>
                                                <input type="checkbox" name="" id="code_M" spellcheck="false">
                                                <label for="code_M" class="mb-0 mr-3">남자</label>
                                            </td>
                                        </tr>
                                        <tr height="38">
                                            <th>등급</th>
                                            <td class="text-left">
                                            	<input type="checkbox" class="ml-2" id="normal" spellcheck="false" value="일반">
                                                <label for="normal" class="mr-3 mb-0">일반</label>
                                                <input type="checkbox" class="ml-2" value="새싹" id="sae" spellcheck="false">
                                                <label for="sae" class="mr-3 mb-0">새싹</label>
                                                <input type="checkbox"id="namu"value="나무" spellcheck="false">
                                                <label for="namu" class="mb-0 mr-3">나무</label>
                                                <input type="checkbox"spellcheck="false"value="꽃" id="flower">
                                                <label for="kod" class="mb-0">꽃</label>
                                            </td>
                                            <th>상태</th>
                                            <td class="text-left">
                                                <input type="checkbox" class="ml-2" name="" id="code_1" spellcheck="false">
                                                <label for="code_1" class="mr-3 mb-0">활성</label>
                                                <input type="checkbox" name="" id="code_2" spellcheck="false">
                                                <label for="code_2" class="mb-0 mr-3">비활성</label>
                                            </td>
                                        </tr>
                                        <tr height="38">
                                            <th>가입날짜</th>
                                            <td class="d-flex border-0 align-items-center">
                                                <input type="date" class="border py-1 pastDate">
                                                <i class="fas fa-minus mx-2"></i>
                                                <input type="date" class="border py-1 recentDate">
                                            </td>
                                        </tr>
                                    </table>
                                    <button class="btn btn-secondary position-absolute" style="width: 75px; height: 33px; right: 5px; bottom: 22px;" id="usersSearch">검색</button>
                                </div>
                                <div class="row">
                                    <table class="table table-bordered">
                                        <tr style="background-color: #eeeeee;">
                                            <th width="100px">번호</th>
                                            <th>상태</th>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>성별</th>
                                            <th>전화번호</th>
                                            <th>등급</th>
                                            <th>가입날짜</th>
                                        </tr>
                                        <c:forEach items="${users}" var="user">
	                                        <tr>
	                                            <td>${user.id }</td>
	                                            <td>${user.name }</td>
	                                            <td>${user.addr } ${user.detaAddr }</td>
	                                            <td>${user.uGrdCode }</td>
	                                            <td><fmt:formatNumber>${user.point }</fmt:formatNumber>원</td>
	                                            <td>${user.joinDate }</td>
	                                        </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                                <div class="row d-flex justify-content-center position-relative">
                                    <div class="dataTables_paginate paging_simple_numbers" id="zero_config_paginate">
                                        <ul class="pagination">
                                        	<c:if test="${pages.currPage ne 1 }">
                                            <li class="paginate_button page-item previous"
                                                id="zero_config_previous">
                                            <a href="#" aria-controls="zero_config" data-dt-idx="0" tabindex="0" class="page-link">
                                            <i class="mdi mdi-chevron-double-left"></i></a></li>
                                        	</c:if>
                                        	<c:forEach begin="${pages.startPage }" end="${pages.endPage }" var="page">
                                            <li class="paginate_button page-item <c:if test="${pages.currPage eq page}">active</c:if>"><a href="#"
                                                    aria-controls="zero_config" data-dt-idx="1" tabindex="0"
                                                    class="page-link">${page }</a></li>
                                        	</c:forEach>
                                        	<c:if test="${pages.currRange ne pages.pageCnt}">
                                            <li class="paginate_button page-item next" id="zero_config_next"><a href="#"
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

<script type="text/javascript">
	let grade = [];
	for(let g of $('input:checkbox')){
		grade.push(g)
	}
	$('#usersSearch').click(()=>{
		let filtered = [];
		filtered = grade.filter((v)=>{
			return v.checked
		})
		let data = {id:'',name:'',addr:$('.addr').val(),pastDate:$('.pastDate').val(),recentDate:$('.recentDate').val(),uGrdCode:filtered,
			page : 0}
		ajaxsearch(data);
	})
	const ajaxsearch = (d) =>{
		$.ajax({
			url:'/admin/userSearch',
			data : d,
		})
		.done((r)=>{
			console.log(r)
		})
	}
	// pagination
	$('.page-link').click((e)=>{
		
	})
</script>
</body>
</html>