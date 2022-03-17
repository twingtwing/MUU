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
td, th {
	padding: 0.5rem;
}

thead {
	background-color: lightgray;
}

tbody > tr {
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

@keyframes rotate_image { 100% {
	transform: rotate(360deg);
}

</style>
</head>

<body>
	<section class="normal-breadcrumb set-bg"
		data-setbg="/resources/img/normal-breadcrumb.jpg">
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
						<a href="/home" class="text-dark font-weight-bold"><i class="fa fa-home"></i>Home</a> 
						<a href="/user/userSelect" class="text-dark font-weight-bold">마이페이지</a> 
						<span>위시리스트</span>
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
                    <div class="row mr-2" style="width:160px">
                      <ul class="list-group w-100">
                        <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                          <a class="list-link" href="/user/userSelect">내 정보</a>
                        </li>
                        <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                          <a class="list-link" href="/user/userLectureList">내 강의리스트</a>
                        </li>
                        <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                          <a class="list-link active" href="/user/userWishList">위시 리스트</a>
                        </li>
                        <li class="list-group-item align-items-center d-flex" style="height: 55px;">
                          <a class="list-link" href="/user/userPay">결제내역</a>
                        </li>
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
												<tr>
													<th style="width: 60px;">체크</th>
													<th style="width: 300px;">강의사진</th>
													<th class="w-25">강의제목</th>
													<th style="width: 120px;">강의비용</th>
													<th style="width: 88px">강의상태</th>
												</tr>
												</thead>
												<tbody id="WishList">
												<c:if test="${empty wishlists}">
													<tr>
														<td colspan="5" class="text-center align-middle">위시리스트가 없습니다.</td>
													</tr>
												</c:if>
												<c:forEach items="${wishlists}" var="wishlist">
														<tr>
															<td id="ltNo" class="text-center align-middle">
																<input onclick="FalseCheck(this)" type="checkbox" id="checkbox" 
																name="checkbox" class="form-check-input m-0 checkbox" type="checkbox" value="${wishlist.ltNo }">
																</td>
															<td>
																<div class="text-align-last:center">
																	<img src="${wishlist.thumb }" alt="test중"
																		class="rounded" style="height: 150px; width: 300px;">
																</div>
															</td>
															<td class="text-center align-middle moveLecture">
																<div style="display: inline-block; width: 250px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${wishlist.ttl }</div>
															</td>
															<td class="text-right align-middle"><fmt:formatNumber>${wishlist.prc}</fmt:formatNumber>원</td>
															<c:if test="${wishlist.tlsnStCode eq 'SU01' && wishlist.ltStCode eq '가능'}">
																<td class="text-center align-middle">결제
															</c:if>
															<c:if test="${wishlist.tlsnStCode eq 'SU01' && wishlist.ltStCode eq '불가'}">
																<td class="text-center align-middle">결제
															</c:if>
															<c:if test="${empty wishlist.tlsnStCode && wishlist.ltStCode eq '가능'}">
																<td class="text-center align-middle">가능
															</c:if>
															<c:if test="${empty wishlist.tlsnStCode && wishlist.ltStCode eq '불가'}">
																<td class="text-center align-middle">불가
															</c:if>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
								<div class="row position-absolute" style="right: 40px; bottom: -1px">
									<!-- onclick="location.href='./결제창.html'" -->
									<button type="button" onclick="paymentCheck()" class="site-btn" style="padding: 8px 20px;">결제</button>
									<button type="button" onclick="deleteCheck()" class="site-btn ml-2" style="padding: 8px 20px;">삭제</button>
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
		 $('.moveLecture').click((e)=>{
		  let ltNo = $(e.target).closest('tr').find('input').val()
		  console.log($(e.target).closest('tr').find('input'))
	      console.log(ltNo + "값들고 가냐?")
 	      location.href="/lecD?ltNo="+ltNo;
	    });
	
		//check click 이벤트
		function FalseCheck(event){
		$(event).closest('tr').children().last()
		console.log($(event).closest('tr').children().last().text().trim())
		if($(event).closest('tr').children().last().text().trim() != "가능"){
				
			}
		};
		
		//check delete 이벤트
		function deleteCheck(event){
		let header = "${_csrf.headerName}";
		let token = "${_csrf.token}";
		
		let checkboxArr=[]
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
            },
            error:function(){
				alert("위시리스트에서 하나라도 체크해야 합니다.");        	
            }
        });
	}
		function paymentCheck(event){
			console.log(event);
			let header = "${_csrf.headerName}";
			let token = "${_csrf.token}";
			let checkboxArr=[];
			
			
			//each/for 구문 돌려서 for var i of ary $(i).closest('tr').children().last().text() == '불가';
			const ary = $("input[name=checkbox]:checked");
			for(var i of ary){
				console.log($(ary[0]).closest('tr').children().eq(2).text().trim());
				if(ary.length == 0){
					alert("위시리스트에서 하나라도 체크해야 합니다.")
					return;
				}
				
				if(ary.length > 1){
					alert("워시리스트에서 결제는 1개씩만 가능합니다.");
					ary[0].checked=false;
					return;
				}
				
				if($(ary[0]).closest('tr').children().last().text().trim() == "불가"){
					alert($(ary[0]).closest('tr').children().eq(2).text().trim() + "는 결제 불가능한 강의입니다.");
					ary[0].checked=false;
					return ;
				}
				
				if($(ary[0]).closest('tr').children().last().text().trim() == "결제"){
					alert($(ary[0]).closest('tr').children().eq(2).text().trim() + "는 이미 결제한 강의입니다.");
					ary[0].checked=false;
					return ;
				}
				
				//잘 도착하는지 테스트
				location.href="/user/lecP?ltNo="+$(ary[0]).val();
				}
		}

		//mouseover 이벤트 : 사이드바 css변경
	    $('.list-group .list-group-item:not(.mylist)').on('mouseover',function(){
	      $(this).css('background-color','#e53637');
	      $(this).find('.list-link').css('color','#ffffff');
	    })

	      //mouseover 이벤트 : 사이드바 css변경
	    $('.list-group .list-group-item:not(.mylist)').on('mouseout',function(){
	      $(this).css('background-color','#ffffff');
	      $(this).find('.list-link').css('color','#000000');
	      $(this).find('.list-link.active').css('color','#e53637');
	    })
	</script>
</body>

</html>