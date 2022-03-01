<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
td, th {
	padding: 0.5rem;
}

thead {
	background-color: lightgray;
}

tbody>tr {
	cursor: pointer;
}

.list-link {
	color: black;
}

.list-link.active {
	font-weight: bold;
	color: #e53637;
}

i.fa-heart-o {
	animation: rotate_image 7s linear infinite;
	transform-origin: 50% 50%;
}

@
keyframes rotate_image { 100% {
	transform: rotate(360deg);
}
}
</style>
</head>

<body>
	<section class="normal-breadcrumb set-bg"
		data-setbg="img/normal-breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="normal__breadcrumb__text">
						<h2>마이페이지</h2>
						<p>위시리스트</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 배너끝 -->

	<!-- 카테고리 시작-->
	<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__links">
						<a href="#" class="text-dark font-weight-bold"><i
							class="fa fa-home "></i> Home</a> <a href="#"
							class="text-dark font-weight-bold">마이페이지</a> <span>위시리스트</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 카테고리 끝-->

	<!-- body 의 body-->
	<security:authorize access="isAuthenticated()">
		<security:authentication property="principal.username" var="username" />
	</security:authorize>
	<section class="blog spad">
		<div class="container">
			<div class="row">
				<!-- 사이드 시작 -->
				<div class="col-lg-2">
					<div class="row mr-2" style="width: 160px">
						<ul class="list-group w-100">
							<li
								class="list-group-item border-bottom-0 align-items-center d-flex"
								style="height: 55px;"><a class="list-link" href="#">내
									정보</a></li>
							<li
								class="list-group-item border-bottom-0 align-items-center d-flex"
								style="height: 55px;"><a class="list-link" href="#">내
									강의리스트</a></li>
							<li
								class="list-group-item border-bottom-0 align-items-center d-flex"
								style="height: 55px;">
								<!-- 해당 상위카테고리 일때, active가 보여야함 => 자바스크립트 혹은 c:if구문으로 해결해야함 -->
								<a class="list-link active" href="./userWishList">위시 리스트</a>
							</li>
							<li class="list-group-item align-items-center d-flex"
								style="height: 55px;"><a class="list-link"
								href="./박정욱_유저결제내역.html">결제내역</a></li>
						</ul>
					</div>
				</div>
				<!-- 사이드 끝 -->
				<div class="col-lg-10">
					<div class="row ml-2">
						<h3 class="font-weight-bold">
							<i class="fa fa-heart-o text-danger" aria-hidden="true"></i>&nbsp;위시리스트
						</h3>
					</div>
					<hr class="font-weight-bold">
					<!-- 본편 -->
					<div class="row py-3">
						<div class="col-lg-12">
							<!-- card 시작 -->
							<div class="card w-100" style="height: auto;">
								<div class="card-body position-relative">
									<div>
										<div class="form-check">
											<table class="table border-bottom">
												<thead class="text-center">
													<th style="width: 60px;">체크</th>
													<th style="width: 300px;">강의사진</th>
													<th>강의제목</th>
													<th>강의설명</th>
													<th style="width: 120px;">강의비용</th>
												</thead>
												<tbody id="WishList">
													<c:forEach items="${wishlists}" var="wishlist">
														<tr>
															<td class="text-center align-middle">
															<input type="checkbox" id="checkbox" name="checkbox"
																class="form-check-input m-0" type="checkbox" value="1">
															</td>
															<td>
																<div class="text-align-last:center">
																	<img src="/resources/img/blog/blog-1.jpg" alt=""
																		class="rounded" style="height: 150px; width: 300px;">
																</div>
															</td>
															<td class="text-center align-middle">${wishlist.ttl }</td>
															<td class="text-center align-middle">${wishlist.intro }</td>
															<td class="text-center align-middle">${wishlist.prc}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<div class="product__pagination d-flex justify-content-center">
											<c:if test="${pagination.currRange ne 1}">
												<a><i class="fa fa-angle-double-left"></i></a>
											</c:if>
											<c:forEach begin="${pagination.startPage }"
												end="${pagination.endPage }" var="page">
												<c:choose>
													<c:when test="${page eq pagination.currPage}">
														<a class="current-page paging">${page}</a>
													</c:when>
													<c:otherwise>
														<a class="paging">${page}</a>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<c:if
												test="${pagination.currRange ne pagination.pageCnt && pagination.pageCnt > 0}">
												<a><i class="fa fa-angle-double-right"></i></a>
											</c:if>
										</div>
									</div>
								</div>
								<div class="row position-absolute"
									style="right: 40px; bottom: 20px;">
									<!-- onclick="location.href='./결제창.html'" -->
									<button type="button" class="site-btn"
										style="padding: 8px 20px;">결제</button>
									<button type="button" class="site-btn ml-2"
										style="padding: 8px 20px;">삭제</button>
								</div>
							</div>
							<!-- 본편 끝-->
							<!--card body end-->
						</div>
						<!-- card 끝 -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
		// 일반 페이지네이션 함수
		const normalPageAjax = (data) => {
			$.ajax({
					url: '/user/userWishListPage',
					data: {id : "user123@naver.com"},
					contentType: 'application/json;charset=utf-8',
				})
				.done((res) => {
					$(document.querySelectorAll('.product__pagination>a')).removeClass('current-page');
					removeAll();
					changePage(res);
				})
		}
		// 페이지네이션
		$('.paging').click((e) => {
			let pageNum = +e.currentTarget.textContent - 1;
			const data = {page : pageNum};
			if(!$('#noticeSearchKey').val()){
				normalPageAjax(data);			
			} else {
				const searchData = makeSearchObj();
				searchData.page = pageNum;
				searchPageAjax(searchData);
			}
			/* const data = {ltNo : ${ltno} , page : pageNum}; */
		});
		// 페이지네이션 DOM 조작 함수
		const removeAll = () => {
			$('#WishList').children().remove();
		}
		const changePage = (list) => {
			list.forEach((val) => {
				let tr = $('<tr>').append(
					$('<td>').text("test").attr("text-center align-middle"),
					$('<td>').text("test1").attr("text-center align-middle"),
					$('<td>').text("test2").attr("text-center align-middle"),
					$('<td>').text("test3").attr("text-center align-middle"),
					$('<td>').text("test4").attr("text-center align-middle"));
				$('#WishList').append(tr);
			})
		}

		//mouseover 이벤트 : 사이드바 css변경
		$('#cctgr  .list-group-item:not(.mylist)').on('mouseover', function () {
			$(this).css('background-color', '#e53637');
			$(this).find('.list-link').css('color', '#ffffff');
			$(this).find('p').css('color', '#ffffff');
		})

		//mouseover 이벤트 : 사이드바 css변경
		$('#cctgr  .list-group-item:not(.mylist)').on('mouseout', function () {
			$(this).css('background-color', '#ffffff');
			$(this).find('.list-link').css('color', '#000000');
			$(this).find('p').css('color', '#000000');
			$(this).find('.list-link.active').css('color', '#e53637');
		})
	</script>
</body>

</html>