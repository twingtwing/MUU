<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	padding: 5px;
	vertical-align: middle;
	text-align: center;
}

.admin_search th {
	background-color: #eeeeee;
}

.name {
	display: inline-block;
	width: 250px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

#amodal:hover {
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
				<h4 class="page-title">환불관리</h4>
				<div class="ml-auto text-right">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/admin/home">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">환불관리</li>
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
						<form action='/admin/adRef' id='searchForm' method='get'>
							<div class="row position-relative">
								<table class="admin_search table table-bordered">
									<tr height="38">
										<th width="15%">검색분류</th>
										<td width="35%">
											<div class="d-flex col-12 px-0">
												<div class="col-3 px-0">
													<select class="ml-2 custom-select w-100" id="searchType" onchange="changeSelect()">
														<option value="name"<c:if test="${empty search.id }"> selected="selected"</c:if>>이름</option>
														<option value="id"<c:if test="${not empty search.id }"> selected="selected"</c:if>>아이디</option>
													</select>
												</div>
												<div class="col-9 d-flex align-items-center">
													<input id=input  class="w-100" type="text" spellcheck="false"
													<c:if test="${empty search.name }">name="id"</c:if>
													<c:if test="${not empty search.id }">value="${search.id }"</c:if>
                                                    <c:if test="${not empty search.name }">name="name" value="${search.name}"</c:if>
													>
												</div>
											</div>
										</td>
										<th width="15%">환불처리상태</th>
										<td width="35%" class="text-left" colspan="3">
											<div class="row d-flex justify-content-start align-middle ml-3 mt-1">
												<input type="radio" ondblclick="this.checked=false" name="rfStCode" value="" id="a" spellcheck="false"> 
												<label for="a" class="mb-0">전체</label>
												<input type="radio" ondblclick="this.checked=false" class="ml-2" name="rfStCode" value="RF01" id="t" spellcheck="false"
												<c:if test="${search.rfStCode eq 'RF01'}">checked="checked"</c:if> 
												>
												<label for="t" class="mr-3 mb-0">환불신청대기</label> 
												<input type="radio" ondblclick="this.checked=false" name="rfStCode" value="RF02" id="r" spellcheck="false"
												<c:if test="${search.rfStCode eq 'RF02'}">checked="checked"</c:if> 
												> 
												<label for="r" class="mr-3 mb-0">환불허가</label> 
												<input type="radio" ondblclick="this.checked=false" name="rfStCode" value="RF03" id="w" spellcheck="false"
												<c:if test="${search.rfStCode eq 'RF03'}">checked="checked"</c:if> 
												> 
												<label for="w" class="mb-0">환불거부</label>
											</div>
										</td>
									</tr>
									<tr height="38">
										<th>강의명</th>
										<td>
											<input id="ttl" name="ttl" class="w-100" style="vertical-align: middle;" type="text" spellcheck="false" value="${search.ttl }">
										</td>
										<th>환불사유</th>
										<td>
											<select class="ml-2 custom-select w-100" id="searchTypeRefund" onchange="changeSelectRefund()">
												<option value=""
												<c:if test="${empty search.content}">selected="selected"</c:if>
                                            	>전체</option>
												<option value="강의가 만족스럽지 못함"
												<c:if test="${search.content eq '강의가 만족스럽지 못함'}">selected="selected"</c:if>
                                            	>강의가 만족스럽지 못함</option>
												<option value="터무니 없는 가격"
												<c:if test="${search.content eq '터무니 없는 가격'}">selected="selected"</c:if>
												>터무니 없는 가격</option>
												<option value="결제 실수"
												<c:if test="${search.content eq '결제 실수'}">selected="selected"</c:if>
												>결제 실수</option>
												<option value="단순 변심"
												<c:if test="${search.content eq '단순 변심'}">selected="selected"</c:if>
												>단순 변심</option>
												<option value="친구나 가족 구성원이 내 동의 없이 결제함"
												<c:if test="${search.content eq '친구나 가족 구성원이 내 동의 없이 결제함'}">selected="selected"</c:if>
												>친구나 가족 구성원이 내 동의 없이 결제함</option>
												<%-- <option value=""
												<c:if test="${empty search.content}">selected="selected"</c:if>
												>기타</option> --%>
											</select> 
											<input id=hiddeninput name="content" class="w-100" type="hidden" value=''></td>
									</tr>
									<tr height="38">
										<th>작성일</th>
										<td colspan="3" class="justify-content-start row border-0">
											<div class="row pl-4 d-flex justify-content-center">
												<div>
													<input type="date" id="start" name="start" class="w-100" value="${search.start }">
												</div>
												<div class="ml-3 mr-3">
													<i class="fa fa-minus"></i>
												</div>
												<div>
													<input type="date" id="end" name="end" class="w-100" value="${search.end }">
												</div>
												<button type="button" class="btn bg-white border position-absolute" style="width: 75px; height: 33px; right: 85px; bottom: 19px;" id="resetAll">초기화</button>
											</div>
										</td>
									</tr>
								</table>
								<button class="btn btn-secondary position-absolute"
									style="width: 75px; height: 33px; right: 5px; bottom: 19px;"
									id="but" type="button">검색</button>
							</div>
							<input type="hidden" name="searchFlag" id="searchFlag" value="${search.searchFlag }">
							<input type="hidden" name="orderColumn" value="${search.orderColumn }">
							<input type="hidden" name="orderBy" value="${search.orderBy }">
							<input type='hidden' name='pageNum' value='${pageMaker.rvo.pageNum }'> 
							<input type='hidden' name='amount' value='${pageMaker.rvo.amount }'>
						</form>
						<div class="row">
							<table class="table table-bordered table-hover">
								<thead>
									<tr style="background-color: #eeeeee;">
										<th data-col="r.tlsn_no">
											번호
											<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'r.tlsn_no' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
										</th>
										<th data-col="u.id">
											아이디
											<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'u.id' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
										</th>
										<th data-col="u.name">
											이름
											<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'u.name' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
										</th>
										<th class="w-25" data-col="l.ttl">
											강의명
											<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'l.ttl' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
										</th>
										<th class="w-25" data-col="r.content">
											환불사유
											<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'r.content' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
										</th>
										<th data-col="r.req_date">
											환불요청날짜
											<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'r.req_date' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
										</th>
										<th data-col="r.rf_st_code">
											환불요청
											<i class="fa fa-caret-down <c:if test="${search.orderColumn eq 'r.rf_st_code' and search.orderBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>	
										</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty adminRefundLists }">
										<tr>
											<td colspan="7"><div>지정된 값을 가진 데이터가 없습니다.</div></td>
										</tr>
									</c:if>
									<c:if test="${not empty adminRefundLists }">
										<c:forEach items="${adminRefundLists }" var="adminRefundList">
											<tr>
												<td>${adminRefundList.tlsnNo }</td>
												<td>${adminRefundList.id }</td>
												<td>${adminRefundList.name }</td>
												<td style="display: none;">${adminRefundList.addr }</td>
												<td>
													<div class="name">
														<a class="text-secondary text-reset" id="amodal"
															data-toggle="modal" href="#exampleModalCenter">${adminRefundList.ttl }</a>
													</div>
												</td>
												<td style="display: none;">${adminRefundList.reqDate }</td>
												<c:if test="${adminRefundList.rfStCode eq 'RF01'}">
													<td style="display: none;">환불신청대기</td>
												</c:if>
												<c:if test="${adminRefundList.rfStCode eq 'RF02'}">
													<td style="display: none;">환불허가</td>
												</c:if>
												<c:if test="${adminRefundList.rfStCode eq 'RF03'}">
													<td style="display: none;">환불불가</td>
												</c:if>
												<td style="display: none;"><fmt:formatNumber>${adminRefundList.pay }</fmt:formatNumber>워ㅕㄴ</td>
												<td>
													<div class="name">${adminRefundList.content }</div>
												</td>
												<td style="display: none;">${adminRefundList.addr }</td>
												<td>${adminRefundList.reqDate }</td>
												<c:if test="${adminRefundList.rfStCode eq 'RF01'}">
													<td>환불신청대기</td>
												</c:if>
												<c:if test="${adminRefundList.rfStCode eq 'RF02'}">
													<td>환불허가</td>
												</c:if>
												<c:if test="${adminRefundList.rfStCode eq 'RF03'}">
													<td>환불불가</td>
												</c:if>
												<td style="display: none;">${adminRefundList.point }</td>
												<td style="display: none;">${adminRefundList.usePoint }</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
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
											class="paginate_button page-item  ${pageMaker.rvo.pageNum == num? 'active':'' }">
											<a href="${num}" aria-controls="zero_config"
											data-dt-idx="${num}" tabindex="0" class="page-link">${num}</a>
										</li>
									</c:forEach>
									<c:if test="${pageMaker.next }">
										<li class="paginate_button page-item next"
											id="zero_config_next"><a href="${pageMaker.endPage +1 }"
											aria-controls="zero_config" data-dt-idx="6" tabindex="0"
											class="page-link"><i class="mdi mdi-chevron-double-right"></i>next</a></li>
									</c:if>
								</ul>
							</div>
						</div>
						<div class="position-absolute" style="right: 10px; bottom: 35px">
							<button class="btn btn-success" id="excel">EXCEL다운</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 내용 끝 -->

	<!-- 바디 끝 -->
	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog">
		<div class="modal-dialog modal-lg modal-dialog-centered"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">환불관리</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="table">
						<tr>
							<th>번호</th>
							<th>아이디</th>
							<th>이름</th>
							<th>주소</th>
						</tr>
						<tr id="trIndex">
							<td>번호안들어옴</td>
							<td>아이디안들어옴</td>
							<td>번호안들어옴</td>
							<td>주소안들어옴</td>
						</tr>
						<tr>
							<th>강의제목</th>
							<th>환불요청날짜</th>
							<th>환불상태</th>
							<th>금액</th>
						</tr>
						<tr id=trtwo>
							<td>제목안들어옴</td>
							<td>환불요청날짜안들어옴</td>
							<td>환불상태안들어옴</td>
							<td>금액안들어옴</td>
						</tr>
						<tr>
							<th colspan="4" class="font-weight-bold" style="">환불요청사유</th>
						</tr>
						<tr id="reason">
							<td colspan="4">이거 안들어오고있음</td>
						</tr>
						<tr id="hidden" style="display: none;">
							<td style="display: none;">이거 안들어오고있음</td>
							<td style="display: none;">이거 안들어오고있음</td>
							<td style="display: none;">이거 안들어오고있음</td>
						</tr>
					</table>
					<div class="modal-footer">
						<button id="agree" type="button" class="btn btn-primary">승인</button>
						<button id="disagree" type="button" class="btn btn-secondary">거부</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">뒤로가기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	//엑셀 다운로드
	$('#excel').click(()=>{
		/* makeSearchData(1); */
		$('#searchForm').attr('action','/admin/refundExcel');
		$('#searchForm').submit();
		$('#searchForm').attr('action','/admin/adRef');
	})
	//검색 초기화
		$('#resetAll').click(()=>{
			$('#searchFlag').val('');
			$('#searchType').val('name');
			$('#input').attr('name','id').val('');
			$('#ttl').val('');
			$('#searchTypeRefund').val('');
			$('#a').prop('checked','checked');
			$('#start').val(null);	
			$('#end').val(null);
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
	
	$('#but').click((e)=>{
		e.preventDefault();
				
		$('#searchFlag').val('Y');
		$('#searchForm').find("input[name='pageNum']").val(1);
		$('#searchForm').submit();
	})		
	
	//select value값 처리 함수
	function changeSelect() {
		var searchType = $("#searchType").val();
		document.getElementById('input').setAttribute('name', searchType);
	}
	//환불이유 select value값 처리 함수	
	function changeSelectRefund() {
		var searchTypeRefund = $("#searchTypeRefund").val();
		document.getElementById('hiddeninput').setAttribute('value',
				searchTypeRefund);
	}
	//모달 자리 넣는 함수
	$('#exampleModalCenter').on(
			'show.bs.modal',
			function(e) {
				for (let i = 0; i < $('#trIndex').children().length; i++) {
					var prevData = $(e.relatedTarget).closest('tr').children()
							.eq(i).text();
					if (i < 4) {
						$('#trIndex').children().eq(i).text(prevData);
					}
				}
				for (let i = 0; i < $('#trtwo').children().length; i++) {
					let prevData = $(e.relatedTarget).closest('tr').children()
							.eq(i + 4).text();
					if (i < 4) {
						$('#trtwo').children().eq(i).text(prevData);
					}
				}
				for (let i = 0; i < $('#reason').children().length; i++) {
					let prevData = $(e.relatedTarget).closest('tr').children()
							.eq(i + 8).text();
					if (i < 4) {
						$('#reason').children().eq(i).text(prevData);
					}
				}
				for (let i = 0; i < $('#hidden').children().length; i++) {
					let prevData = $(e.relatedTarget).closest('tr').children()
							.eq(i + 12).text();
					if (i < 4) {
						$('#hidden').children().eq(i).text(prevData);
					}
				}
				$('#agree').attr('click', function() {
					let code = $('#trtwo').children().eq(2).text();
					console.log(code)
					if (code == '환불신청대기') {
						$('#agree').removeAttr("disabled");
					} else {
						$('#agree').attr("disabled", true);
					}
				})
				$('#disagree').attr('click', function() {
					let code = $('#trtwo').children().eq(2).text();
					if (code == '환불신청대기') {
						$('#disagree').removeAttr("disabled");
					} else {
						$('#disagree').attr("disabled", true);
					}
				})
			});

	//모달 버튼 활성화 

	//모달 승인 아작스
	$('#agree').on(
			'click',
			function() {
				let header = "${_csrf.headerName}";
				let token = "${_csrf.token}";
				let pk = $('#trIndex').children().first().text();
				let id = $('#trIndex').children().eq(1).text();
				let point = $('#hidden').children().eq(0).text();
				let usePoint = $('#hidden').children().eq(1).text();
				console.log("p값 : " + pk, "사용한 포인트 : " + usePoint,
						"가지고있는 포인트 : " + point, "아이디 : " + id);
				$.ajax({
					type : "post",
					url : "/admin/adRefUpdate",
					data : {
						tlsnNo : pk,
						usePoint : usePoint,
						Point : point,
						Id : id,
					},
					beforeSend : function(xhr) {
						xhr.setRequestHeader(header, token);
					},
					success : function(map) {
						console.log("성공")
						location.reload();
					}
				})
			})

	$('#disagree').on('click', function() {
		let header = "${_csrf.headerName}";
		let token = "${_csrf.token}";
		let pk = $('#trIndex').children().first().text()
		let code = $('#trtwo').children().eq(2).text();
		$.ajax({
			type : "post",
			url : "/admin/adRefCancleUpdate",
			data : {
				tlsnNo : pk
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(result) {
				console.log("성공")
				location.reload();
			}
		})
	})
</script>
</html>