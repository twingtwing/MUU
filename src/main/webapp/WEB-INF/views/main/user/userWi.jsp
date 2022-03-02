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
													<th style="width: 300px;">강의사진test</th>
													<th>강의제목</th>
													<th style="width: 120px;">강의비용</th>
													<th>강의상태</th>
												</thead>
												<tbody id="WishList">
													<c:forEach items="${wishlists}" var="wishlist">
														<tr>
															<td class="text-center align-middle"><input
																onclick="FalseCheck(this)" type="checkbox" id="checkbox"
																name="checkbox" class="form-check-input m-0 checkbox"
																type="checkbox" value="${wishlist.ltNo }"></td>
															<td>
																<div class="text-align-last:center">
																	<img src="${wishlist.thumb }" alt="test중"
																		class="rounded" style="height: 150px; width: 300px;">
																</div>
															</td>
															<td class="text-center align-middle">${wishlist.ttl }</td>
															<td class="text-center align-middle">${wishlist.prc}</td>
															<td class="text-center align-middle">${wishlist.ltStCode}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<table style="display: none">
											<thead class="text-center">
												<th style="width: 60px;">체크</th>
												<th style="width: 300px;">강의사진test</th>
												<th>강의제목</th>
												<th style="width: 120px;">강의비용</th>
												<th>강의상태</th>
											</thead>
											<tbody id="sampleTr">
												<tr>
													<td id="check_sam" class="text-center align-middle"><input
														onclick="FalseCheck(this)" type="checkbox" id="checkbox"
														name="checkbox" class="form-check-input m-0 checkbox"
														type="checkbox" value=""></td>
													<td id="img_sam">
														<div class="text-align-last:center">
															<img src="" alt="test중" class="rounded"
																style="height: 150px; width: 300px;">
														</div>
													</td>
													<td id="ttl_sam" class="text-center align-middle">${wishlist.ttl }</td>
													<td id="prc_sam" class="text-center align-middle">${wishlist.prc}</td>
													<td id="code_sam" class="text-center align-middle">${wishlist.ltStCode}</td>
												</tr>
											</tbody>
										</table>
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
									<button type="button" onclick="paymentCheck()" class="site-btn"
										style="padding: 8px 20px;">결제</button>
									<button type="button" onclick="deleteCheck()"
										class="site-btn ml-2" style="padding: 8px 20px;">삭제</button>
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
		const normalPageAjax = (result) => {
			$.ajax({
					url: '/user/userWishListPage',
					data: result,
					contentType: 'application/json;charset=utf-8',
				})
				.done((res) => {
					console.log(res)
					removeAll();
					changePage(res); 
				})
		}
		
		// 페이지네이션
		$('.paging').click((e) => {
			let pageNum = +e.currentTarget.textContent - 1;
			const data = {page : pageNum, id : '${username}'};
			normalPageAjax(data);
			$(document.querySelectorAll('.product__pagination>a')).removeClass('current-page');
			$(e.currentTarget).addClass('current-page');
		});
		
		// 페이지네이션 DOM 조작 함수
		const removeAll = () => {
			$('#WishList').children().remove();
		}
		const changePage = (res) => {
			res.forEach((val) => {
				console.log(val);
					$('#sampleTr #check_sam input').val(val.ltNo);
					$('#sampleTr #img_sam img').attr("src",val.thumb);
					$('#sampleTr #ttl_sam').text(val.ttl);
					$('#sampleTr #intro_sam').text(val.intro);
					$('#sampleTr #prc_sam').text(val.prc+" 원");
					$('#sampleTr #code_sam').text(val.ltStCode);
					$('#WishList').append($('#sampleTr').html());
			})
		}
		
		//check click 이벤트
		function FalseCheck(event){
		$(event).closest('tr').children().last()
		console.log($(event).closest('tr').children().last().text())
		if($(event).closest('tr').children().last().text() != "가능"){
				
			}
		};
		
		//check delete 이벤트
		function deleteCheck(event){
		let header = "${_csrf.headerName}";
		let token = "${_csrf.token}";
		
		let checkboxArr=[]
		/* console.log($('.checkbox').is(':checked')); */
		$("input[name=checkbox]:checked").each(function(){
			let check = $(this).val();
			console.log(check)
			checkboxArr.push(check)
			})
			console.log(checkboxArr);
			console.log(checkboxArr[0]);
		$.ajax({
            type : "post",          
            url : "/user/deleteWishList",     
            //data : JSON.stringify({ltNoArr : checkboxArr}),
            data : {ltNoArr : checkboxArr},
            //dataType: 'json',
            //contentType:'application/json; charset=UTF-8',
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            success : function(res){
            	console.log("성공")
            	location.reload();
            }
        });
	}
		function paymentCheck(event){
			let header = "${_csrf.headerName}";
			let token = "${_csrf.token}";
			let checkboxArr=[];
			const ary = $("input[name=checkbox]:checked");
			
			//each/for 구문 돌려서 for var i of ary $(i).closest('tr').children().last().text() == '불가';
			console.log(ary);
			for(var obj of ary){
			let check = $(obj).closest('tr').children().last().text();
			if(check == "불가"){
					alert($(obj).closest('tr').children().eq(2).text() + " 는 결제 불가능한 강의입니다.");
					obj.checked=false;
					return ;
				}
			}
			$("input[name=checkbox]:checked").each(function(){
				let check = $(this).val();
				checkboxArr.push(check)
				console.log(checkboxArr)
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