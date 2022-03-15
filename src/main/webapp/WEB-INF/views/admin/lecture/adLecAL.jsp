<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
		table tr, table td {
			text-align: center;
			vertical-align: middle;
		}
		
		.admin_search td, .admin_search th {
			text-align: center;
			vertical-align: middle;
			padding: 5px;
		}
		
		.admin_search th {
			background-color: #eeeeee;
		}
		
		#ho:hover{
		        background-color:#f5f5f5;
		        }
		
		.clickstyle:hover{
			cursor: pointer;
			text-decoration: underline;
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
				<h4 class="page-title">강의관리</h4>
				<div class="ml-auto text-right">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/admin/home">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">강의등록</li>
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
						<form action='/admin/adLecAL' id='searchForm' method='get'>
							<div class="row position-relative">
								<table class="admin_search table table-bordered">
									<tr height="38">
										<th width="15%">크리에이터</th>
										<td width="35%">
											<div class="d-flex">
												<div class="col-3">
													<select class="w-100" id="searchTypeLecture" onchange="changeSelect()">
														<option id="creId" value="creId" <c:if test="${empty search.name }"> selected="selected"</c:if>>아이디</option>
														<option id="name" value="name"<c:if test="${not empty search.name }"> selected="selected"</c:if>>이름</option>
													</select>
												</div>
												<div class="col-9">
													<input class="w-100" type="text" id="incheck" spellcheck="false"
													<c:if test="${empty search.name }">name="creId"</c:if>
													<c:if test="${not empty search.creId }">value="${search.creId }"</c:if>
                                        			<c:if test="${not empty search.name }">name="name" value="${search.name }"</c:if>
													>
												</div>
											</div>
										</td>
										<th width="15%">강의명</th>
										<td width="35%">
											<input id="ttl" name="ttl" class="w-100 border" type="text" spellcheck="false" value="${search.ttl }">
										</td>
									</tr>
									<tr height="38">
										<th>등록 신청 날짜</th>
										<td>
											<div class="d-flex border-0 align-items-center">
												<input id="start" name="start" type="date" class="border w-30" value="${search.start }"> 
												<i class="fas fa-minus mx-2"></i> 
												<input id="end" name="end" type="date" class="border w-30" value="${search.end }">
											</div>
										</td>
										<th>처리상태</th>
										<td class="text-left">
											<input type="radio" id="rpsAll" class="ml-2" name="ltStCode" spellcheck="false" ondblclick="this.checked=false" value=""
                                            <c:if test ="${search.ltStCode eq ''}">checked="checked" </c:if>>
                                                <label for="rpsAll" class="mr-3 mb-0" >전체</label>
                                                <input type="radio" id="rps02" class="ml-2" name="ltStCode" spellcheck="false" ondblclick="this.checked=false" value="L02"
                                                <c:if test ="${search.ltStCode eq 'L02'}">checked="checked" </c:if>>
                                                <label for="rps02" class="mr-3 mb-0" >등록 대기</label>
                                                <input type="radio" id="rps01" name="ltStCode" spellcheck="false" ondblclick="this.checked=false" value="L07"
                                                <c:if test ="${search.ltStCode eq 'L07'}">checked="checked" </c:if>>
                                                <label for="rps01" class="mb-0">등록 거부</label>	
										</td>
									</tr>
									<tr height="38">
										<th>카테고리</th>
										<td class="d-flex border-0" colspan="3">
											<select name="" id=upCtgrTypeLecture onchange="upCtgrChangeSelect()"
												class="border w-100">
													<option value=""
													<c:if test="${empty search.upCtgr}">selected="selected"</c:if>
	                                            	>전체(상위 카테고리)</option>
													<option value="요리"<c:if test="${search.upCtgr eq '요리'}">selected="selected"</c:if>
													>요리</option>
													<option value="건강"<c:if test="${search.upCtgr eq '건강'}">selected="selected"</c:if>
													>건강</option>
													<option value="아트"<c:if test="${search.upCtgr eq '아트'}">selected="selected"</c:if>
													>아트</option>
													<option value="IT/컴퓨터"<c:if test="${search.upCtgr eq 'IT/컴퓨터'}">selected="selected"</c:if>>IT/컴퓨터</option>
													<option value="외국어"<c:if test="${search.upCtgr eq '외국어'}">selected="selected"</c:if>>외국어</option>
													<option value="자기계발"<c:if test="${search.upCtgr eq '자기계발'}">selected="selected"</c:if>>자기계발</option>
													</select> 
													<select name="" id="downCtgrTypeLecture" onchange="downCtgrChangeSelect()" class="border w-100">
													<option value="">전체(하위 카테고리)</option>
											</select>
											<input type="hidden" id=upCtgrCheck value='${search.upCtgr}' name='upCtgr'>
											<input type="hidden" id=downCtgrCheck value='${search.downCtgr}' name='downCtgr'>
										 	<button type="button" class="btn bg-white border position-absolute" style="width: 75px; height: 33px; right: 85px; bottom: 19px;" id="resetAll">초기화</button>
										</td>
									</tr>
								</table>
								<button class="btn btn-secondary position-absolute" style="width: 75px; height: 33px; right: 5px; bottom: 19px;"
									id="but" type="button">검색</button>
							</div>
							<input type="hidden" name="searchFlag" id="searchFlag" value="${search.searchFlag }">
	                        <input type="hidden" name="orderColumn" value="${search.orderColumn }">
							<input type="hidden" name="orderBy" value="${search.orderBy }">
							<input type='hidden' name='pageNum' value='${pageMaker.lvo.pageNum }'>
							<input type='hidden' name='amount' value='${pageMaker.lvo.amount }'>
						</form>
						<div class="row">
							<table class="table table-bordered">
								<tr style="background-color: #eeeeee;">
									<th width="130px" data-col="lt_no">
										강의번호
										<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'lt_no' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
									</th>
									<th width="250px" data-col="up_ctgr">
										카테고리
										<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'up_ctgr' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
									</th>
									<th width="150px" data-col="cre_id">
										ID
										<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'cre_id' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
									</th>
									<th width="150px" data-col="name">
										이름
										<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'name' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
									</th>
									<th data-col="ttl">
										강의명
										<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'ttl' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
									</th>
									<th width="150px" data-col="req_date">
										강의 등록일
										<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'req_date' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
									</th>
									<th width="120px" data-col="lt_st_code">
										처리상태
										<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'lt_st_code' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
									</th>
								</tr>
								<c:if test="${empty llists }">
								<td colspan="7" >
									<div class="d-flex justify-content-center">해당되는 데이터가 존재하지 않습니다.</div>
								</td>
								</c:if>
								<c:if test="${not empty llists }">
								<c:forEach items="${llists }" var="llist">
									<tr id="ho">
										<td>${llist.ltNo }</td>
										<td>
										<span>${llist.upCtgr }</span>
										<i class="fas fa-angle-right mx-1"></i>
										<span>${llist.downCtgr }</span>
										</td>
										<td>${llist.creId }</td>
										<td>${llist.name }</td>
										<td class="clickstyle" onclick="location.href='/admin/adLecAS?ltNo=${llist.ltNo }'">${llist.ttl }</td>
										<td>${llist.reqDate }</td>
										<c:if test="${llist.ltStCode eq 'L02'}">
											<td>강의등록대기</td>
										</c:if>
										<c:if test="${llist.ltStCode eq 'L07'}">
											<td>강의등록거부</td>
										</c:if>
									</tr>
								</c:forEach>
								</c:if>
							</table>
						</div>
						<div class="row d-flex justify-content-center position-relative">
							<div class="dataTables_paginate paging_simple_numbers"
								id="zero_config_paginate">
								<ul class="pagination">
									<c:if test="${pageMaker.prev }">
										<li class="paginate_button page-item previous"
											id="zero_config_previous"><a
											href=" ${pageMaker.startpage -1 }"
											aria-controls="zero_config" data-dt-idx="0" tabindex="0"
											class="page-link"> <i class="mdi mdi-chevron-double-left"></i>previous
										</a></li>
									</c:if>
									<c:forEach var="num" begin="${pageMaker.startpage }"
										end="${pageMaker.endpage }">
										<li
											class="paginate_button page-item  ${pageMaker.lvo.pageNum == num? 'active':'' }">
											<a href="${num}" aria-controls="zero_config"
											data-dt-idx="${num}" tabindex="0" class="page-link">${num}</a>
										</li>
									</c:forEach>
									<c:if test="${pageMaker.next }">
										<li class="paginate_button page-item next"
											id="zero_config_next"><a href="${pageMaker.endPage +1 }"
											aria-controls="zero_config" data-dt-idx="6" tabindex="0"
											class="page-link"> <i
												class="mdi mdi-chevron-double-right"> </i>next
										</a></li>
									</c:if>
								</ul>
							</div>
						</div>
						<div class="position-absolute" style="right: 10px; bottom: 35px">
							<button class="btn btn-danger">PDF다운</button>
							<button class="btn btn-success" id="excel">EXCEL다운</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 내용 끝 -->
	</div>

	<!-- 바디 끝 -->
	<script>
		const 종류 = {
		 '음악' : ['클래식','재즈/락','힙합/랩','기타/베이스','동양','보컬','기타'],
		 '요리': ['한식','양식','일식','중식','베이킹','가정식','기타'],
		 '건강': ['홈 트레이닝','필라테스','요가','정신건강','기타'],
		 '아트': ['2D/애니메이션','드로잉','수채화/유화','동양화','사진','메이크업/분장','기타'],
		 'IT/컴퓨터': ['Java','Python','C언어','웹 프로그래밍','Unity','Photoshop/Illustrator','기타'],
		 '외국어': ['영어','일본어','중국어','스페인어','아랍어','러시아어','기타'],
		 '자기계발': ['부동산','주식','면접/자소서','SNS/블로그','기타'],
		 }
		
		 $('#downCtgrTypeLecture')
		 $('#upCtgrTypeLecture').change(()=>{
			 $('#downCtgrTypeLecture>option:not(:eq(0))').remove();
			 let upper = $('#upCtgrTypeLecture option:selected').text();
			 종류[upper].forEach((v)=>{
			 $('#downCtgrTypeLecture').append(
			 $('<option>').val(v).text(v)
		 			)
		 		})
		 })
		 
		 //검색 후 하위카테고리 값 남기기
		if('${search.upCtgr}' != ''){
		 	for( obj of 종류['${search.upCtgr}']){
          		$('#downCtgrTypeLecture').append($('<option>').val(obj).text(obj))
       		}	 
       	  	$('#downCtgrTypeLecture').val('${search.downCtgr}'); 
		 }
		 
			$('#but').click((e)=>{
				e.preventDefault();
				
				$('#searchFlag').val('Y');
				$('#searchForm').find("input[name='pageNum']").val(1);
				$('#searchForm').submit();
			})			 
		
		//검색 초기화
		$('#resetAll').click(()=>{
			$('#searchFlag').val('');
			$('#searchTypeLecture').val('creId');
			$('#incheck').attr('name','creId').val('');
			$('#ttl').val('');
			$('#upCtgrTypeLecture').val('');
			$('#downCtgrTypeLecture').val('');
			$('#downCtgrTypeLecture>option:not(:eq(0))').remove();
			$('#upCtgrCheck').val('');
			$('#downCtgrCheck').val('');
			$('#rpsAll').prop('checked','checked');
			$('#start').val(null);	
			$('#end').val(null);
		})
		
		$('.fa-caret-down').click((e)=>{
			$(e.currentTarget).toggleClass('fa-rotate-180')
			$('#searchForm>input[name=orderColumn]').val(e.currentTarget.parentElement.dataset.col)
			$('#searchForm>input[name=orderBy]').val('asc');
			
			if($('#searchFlag').val() !== 'Y'){
				$('#resetAll').click();
			}
			$('#searchForm').submit();
		})
		
		$('.fa-rotate-180').click((e)=>{
			$(e.currentTarget).toggleClass('fa-rotate-180')
			$('#searchForm>input[name=orderColumn]').val(e.currentTarget.parentElement.dataset.col)
			$('#searchForm>input[name=orderBy]').val('desc');
			
			if($('#searchFlag').val() !== 'Y'){
				$('#resetAll').click();
			}
			$('#searchForm').submit();
		})	

		//페이징 처리
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			if($('#searchFlag').val() !== 'Y'){
				$('#resetAll').click();
			}
			
			$('#searchForm').find("input[name='pageNum']").val($(this).attr("href"));
		    $('#searchForm').submit();
		});

		function changeSelect() {
			let searchTypeLecture = $("#searchTypeLecture option:selected").val();
			console.log(searchTypeLecture)
			document.getElementById('incheck').setAttribute('name', searchTypeLecture);
		}
		
		function upCtgrChangeSelect() {
			let upCtgrTypeLecture = $("#upCtgrTypeLecture option:selected").val();
			console.log(upCtgrTypeLecture)
			document.getElementById('upCtgrCheck').setAttribute('value', upCtgrTypeLecture);
		}
		function downCtgrChangeSelect() {
			let downCtgrTypeLecture = $("#downCtgrTypeLecture option:selected").val();
			console.log(downCtgrTypeLecture)
			document.getElementById('downCtgrCheck').setAttribute('value', downCtgrTypeLecture);
		}
		
		//엑셀 다운로드
		$('#excel').click(()=>{
			/* makeSearchData(1); */
			$('#searchForm').attr('action','/admin/adminLectureRegExcel');
			$('#searchForm').submit();
			$('#searchForm').attr('action','/admin/adLecAL');
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
</body>
</html>