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

td, th {
	padding: 10px;
}

.admin_search th {
	background-color: #eeeeee;
}

.reclicked {
	display: none;
}

.modal {
	margin-top: 10rem;
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
				<h4 class="page-title">강의관리 (상세)</h4>
				<div class="ml-auto text-right">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/admin/home">Home</a></li>
							<li class="breadcrumb-item"><a href="/admin/adLecAL">강의등록</a></li>
							<li class="breadcrumb-item active" aria-current="page">강의등록(상세)
							</li>
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
						<div class="row">
							<a href="javscript:history.back()"
								class="mb-3 border p-2 text-secondary">뒤로가기</a>
							<table class="table table-bordered mb-5">
								<tr style="background-color: #eeeeee;">
									<th>강의번호</th>
									<th>크리에이터 ID</th>
									<th>강의명</th>
									<th>강의 등록일</th>
									<th>강의 금액</th>
									<th>키트 금액</th>
									<th>카테고리</th>
									<th>처리상태</th>
								</tr>
								<tr>
									<td>${adLecSel.ltNo }</td>
									<td>${adLecSel.creId }</td>
									<td>${adLecSel.ttl }</td>
									<td>${adLecSel.reqDate }</td>
									<td>${adLecSel.prc }</td>
									<td>${adLecSel.kitPrc }</td>
									<td><span>${adLecSel.upCtgr }</span> > <span>${adLecSel.downCtgr }</span>
									</td>
									<td>처리대기중</td>
								</tr>
							</table>
							<h5>강의 소개</h5>
							<div class="border w-100 p-2 mb-5">${adLecSel.intro }</div>
							<h5>수업 소개</h5>
							<table class="table table-bordered mb-5 w-100" id="list">
								<c:forEach items="${lessonList }" var="les">
									<div style="display: none" id="lnsFIle">${les.lsnFile }</div>
									<tr>
										<td colspan="2"><a data-toggle="collapse"
											href="#collapseExample${les.lsnNo }" role="button"
											aria-expanded="false" aria-controls="collapseExample">
												${les.ttl }</a></td>
									</tr>
									<tr>
										<td class="p-0">
											<div class="collapse" id="collapseExample${les.lsnNo }">
												<div class="card card-body d-flex-justify-content-center">
													<video controls width="250">
														<source src="${les.lsnFile }" type="video/webm">
													</video>
												</div>
											</div>
										</td>
									</tr>
									<tr style="display: hidden"></tr>
								</c:forEach>
							</table>

							<h5>키트 여부</h5>
							<div class="mb-5 w-100 d-flex justify-content-center">
								<table class="border mb-5 w-100" border="1">
									<tr>
										<th class="bg-light">강의명</th>
										<td>${adLecSel.ttl }</td>
									</tr>
									<tr>
										<th class="bg-light">키트 금액</th>
										<td><span>${adLecSel.kitPrc }</span>원</td>
									</tr>
									<tr class="bg-light">
										<th colspan="2">키트 설명</th>
									</tr>
									<tr>
										<td colspan="2">${adLecSel.kitIntro }</td>
									</tr>
								</table>
							</div>
							<div
								class="d-flex flex-column align-items-center justify-content-center w-100 mb-3">
								<h4>
									키트 금액 : <span>${adLecSel.kitPrc }</span>원
								</h4>
								<h4>
									강의 금액 : <span>${adLecSel.prc }</span>원
								</h4>
								<h4 class="text-danger">
									합 계 : <span>${adLecSel.prc + adLecSel.kitPrc }</span>원
								</h4>
							</div>
							<div class="d-flex justify-content-center w-100 mb-5">
								<form action="/admin/adLecALOK" method='get' name="ltNo" >
								<input type="hidden" id="ok" name="ltNo" value="${adLecSel.ltNo }">
									<button class="p-3 mx-2 border bg-success font-weight-bold text-white"
										id="ok" type="submit">강의 등록 승인</button>
								</form>
								<form action="/admin/adLecALReject" method='get' name="ltNo" >
								<input type="hidden" id="reject" name="ltNo" value="${adLecSel.ltNo }">
									<button class="p-3 mx-2 border bg-danger font-weight-bold text-white"
										id="reject" type="submit" value="${adLecSel.ltNo }">강의 등록거부</button>
								</form>		
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 내용 끝 -->
	<!-- 바디 끝 -->
	<script>
    $('#reject').click(()=>{
      $('#modal').modal('show');
    })
</script>
</body>
</html>