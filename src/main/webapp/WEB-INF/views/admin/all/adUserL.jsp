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
                                                        <select class="w-100 py-1 searchType border">
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
                                                <input class="w-100 border py-1 tel" type="text" spellcheck="false">
                                            </td>
                                        </tr>
                                        <tr height="38">
                                            <th>성별</th>
                                            <td class="text-left">
                                            	<input type="radio" value="" class="ml-2" name="gender" id="code_all" spellcheck="false" checked="checked">
                                                <label for="code_all" class="mr-3 mb-0 gender">모두</label>
                                                <input type="radio" value="W" class="ml-2" name="gender" id="code_F" spellcheck="false">
                                                <label for="code_F" class="mr-3 mb-0 gender">여성</label>
                                                <input type="radio" value="M" name="gender" id="code_M" spellcheck="false">
                                                <label for="code_M" class="mb-0 mr-3 gender">남성</label>
                                            </td>
                                        </tr>
                                        <tr height="38">
                                            <th>등급</th>
                                            <td class="text-left">
                                            	<input type="checkbox"id="normal" class="ml-2" spellcheck="false" value="일반" name="grd">
                                                <label for="normal" class="mr-3 mb-0">일반</label>
                                                <input type="checkbox"id="sae" class="ml-2" value="새싹" spellcheck="false"name="grd">
                                                <label for="sae" class="mr-3 mb-0">새싹</label>
                                                <input type="checkbox"id="namu" value="나무" spellcheck="false"name="grd">
                                                <label for="namu" class="mb-0 mr-3">나무</label>
                                                <input type="checkbox"id="kod"spellcheck="false"value="꽃"name="grd">
                                                <label for="kod" class="mb-0">꽃</label>
                                            </td>
                                            <th>상태</th>
                                            <td class="text-left">
                                                <input type="radio" class="ml-2" value="1" name="uStCode" id="code_1" spellcheck="false" checked="checked">
                                                <label for="code_1" class="mr-3 mb-0">활성</label>
                                                <input type="radio" name="uStCode" id="code_2" spellcheck="false" value="0">
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
                                    <thead>
                                        <tr style="background-color: #eeeeee;">
                                            <th>아이디</th>
                                            <th>상태</th>
                                            <th>이름</th>
                                            <th>성별</th>
                                            <th>전화번호</th>
                                            <th>등급</th>
                                            <th>가입날짜</th>
                                        </tr>
                                    </thead>
                                    <tbody class="userListBoard">
                                        <c:forEach items="${users}" var="user">
	                                        <tr>
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
<form action="/admin/userSelect" id="userSelectForm">
<input type="text" name="id" id="userId">
</form>
<script type="text/javascript">
	$('#usersSearch').click(()=>{
		let data = makeSearchData(0);
		ajaxsearch(data);
	})
	
	const makeSearchData = (pageNum)=>{
		let grd = [];		
		for(let g of $('input[name=grd]:checked')){
			grd.push(g.value)
		}
		let gender = $('input[name=gender]:checked').val();
		let ustcode = +$('input[name=uStCode]:checked').val();	
		let data = {
			id: '',
			name: '',
			gender:gender,
			pastDate:$('.pastDate').val(),
			recentDate:$('.recentDate').val(),
			uGrdCodeList: grd,
			uStCode : ustcode,
			page : pageNum,
			tel : $('.tel').val()
		}
		if($('.searchType').val()==='id'){
			data.id = $('.selectBox').val()
		} else {
			data.name = $('.selectBox').val();
		}
		return data;
	}
	
	const ajaxsearch = (d) =>{
		console.log(d);
		$.ajax({
			url:'/admin/userSearch',
			data : JSON.stringify(d),
			contentType : 'application/json;charset=utf-8',
			method : 'POST',
				beforeSend : (xhr) =>{
				      xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				  },
		})
		.done((r)=>{
			removeAll();
			makeRow(r)
		})
	}
	// pagination
	$('.page-link').click((e)=>{
		let pageNum = +e.target.textContent-1;
		let data = makeSearchData(pageNum);
		$('.active').removeClass('active');
		$(e.target).parent().addClass('active');
		ajaxsearch(data);
	})
	
	const makeRow = (list)=>{
		list.forEach((v)=>{
			let tr = $('<tr>')
			if(v.uStCode===0){
				v.uStCode = '비활성'
			} else {
				v.uStCode = '활성'
			}
			if(v.gender==='M'){
				v.gender = '남성'
			} else{
				v.gender = '여성'
			}
			tr.append(
				$('<td>').text(v.id),
				$('<td>').text(v.uStCode),
				$('<td>').text(v.name),
				$('<td>').text(v.gender),
				$('<td>').text(v.tel),
				$('<td>').text(v.uGrdCode),
				$('<td>').text(new Date(v.joinDate).toISOString().slice(0,10))
			)
			$('.userListBoard').append(tr);
		})
	}
	const removeAll = ()=>{
		$('.userListBoard').children().remove();
	}
	
	// select
	$('.userListBoard').click((e)=>{	
		let id = e.target.parentElement.firstElementChild.textContent;
		$('#userId').val(id);
		$('#userSelectForm').submit();
	})
</script>
</body>
</html>