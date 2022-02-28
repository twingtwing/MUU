<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.dropdown li {
	padding: 0.5rem 0;
}
.dropdown-menu {
	margin-left: 10rem;
}
.product__pagination a.current-page {
    border: 1px solid #ffc3c3;
 }
 .dropdown-submenu:hover .dropdown-menu {
    display: block;
    margin-top: 0;
}
 .dropdown-menu{
 	left: -6%;
 	top : -10%;
 }
</style>
</head>
<body>
	<header class="header">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-1 p-0">
					<div class="header__logo">
						<a href="/home"> <img src="/resources/img/logo.png" alt="">
						</a>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="header__nav">
						<nav class="header__menu mobile-menu">
							<ul class="d-flex justify-content-center align-items-center">
								<li class="m-0"><a href="/home">홈</a></li>
								<li><a href="#">카테고리<span class="arrow_carrot-down"></span></a>
									<ul class="dropdown">
										<li class="dropdown-submenu">
											<a href="/lecS" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
												<span class="nav-label">음악</span>
											</a>
											<ul class="dropdown-menu">
												<li><a href="/lecS">클래식</a></li>
												<li><a href="/lecS">재즈</a></li>
												<li><a href="/lecS">락</a></li>
												<li><a href="/lecS">힙합/랩</a></li>
												<li><a href="/lecS">타악기</a></li>
												<li><a href="/lecS">기타/베이스</a></li>
												<li><a href="/lecS">동양음악</a></li>
												<li><a href="/lecS">보컬</a></li>
												<li><a href="/lecS">작사/작곡</a></li>
											</ul></li>
										<li class="dropdown-submenu"><a href="/lecS"
											class="dropdown-toggle" data-toggle="dropdown" role="button"
											aria-haspopup="true" aria-expanded="false"><span
												class="nav-label">요리</span></a>
											<ul class="dropdown-menu">
												<li><a href="/lecS">양식</a></li>
												<li><a href="/lecS">동양식</a></li>
												<li><a href="/lecS">간편요리</a></li>
												<li><a href="/lecS">코스요리</a></li>
												<li><a href="/lecS">가정식</a></li>
												<li><a href="/lecS">베이킹</a></li>
											</ul></li>
										<li class="dropdown-submenu"><a href="#"
											class="dropdown-toggle" data-toggle="dropdown" role="button"
											aria-haspopup="true" aria-expanded="false"><span
												class="nav-label">건강</span></a>
											<ul class="dropdown-menu">
												<li><a href="/lecS">홈 트레이닝</a></li>
												<li><a href="/lecS">필라테스</a></li>
												<li><a href="/lecS">요가</a></li>
												<li><a href="/lecS">헬스</a></li>
												<li><a href="/lecS">정신건강</a></li>
												<li><a href="/lecS">테라피</a></li>
											</ul></li>
										<li class="dropdown-submenu"><a href="/lecS"
											class="dropdown-toggle" data-toggle="dropdown" role="button"
											aria-haspopup="true" aria-expanded="false"><span
												class="nav-label">아트</span></a>
											<ul class="dropdown-menu">
												<li><a href="/lecS">2D/애니메이션</a></li>
												<li><a href="/lecS">드로잉</a></li>
												<li><a href="/lecS">수채화</a></li>
												<li><a href="/lecS">유화</a></li>
												<li><a href="/lecS">동양화</a></li>
												<li><a href="/lecS">판화</a></li>
												<li><a href="/lecS">공예</a></li>
												<li><a href="/lecS">사진</a></li>
												<li><a href="/lecS">메이크업/분장</a></li>
											</ul></li>
										<li class="dropdown-submenu"><a href="/lecS"
											class="dropdown-toggle" data-toggle="dropdown" role="button"
											aria-haspopup="true" aria-expanded="false"><span
												class="nav-label">IT/컴퓨터</span></a>
											<ul class="dropdown-menu">
												<li><a href="/lecS">Java</a></li>
												<li><a href="/lecS">Python</a></li>
												<li><a href="/lecS">C/C++/C/lecS</a></li>
												<li><a href="/lecS">웹 프로그래밍</a></li>
												<li><a href="/lecS">Unity</a></li>
												<li><a href="/lecS">영상편집</a></li>
												<li><a href="/lecS">Photoshop/Illustrator</a></li>
												<li><a href="/lecS">3D 모델링</a></li>
												<li><a href="/lecS">기타</a></li>
											</ul></li>
										<li class="dropdown-submenu"><a href="/lecS"
											class="dropdown-toggle" data-toggle="dropdown" role="button"
											aria-haspopup="true" aria-expanded="false"><span
												class="nav-label">외국어</span></a>
											<ul class="dropdown-menu">
												<li><a href="/lecS">영어</a></li>
												<li><a href="/lecS">일본어</a></li>
												<li><a href="/lecS">중국어</a></li>
												<li><a href="/lecS">스페인어</a></li>
												<li><a href="/lecS">포르투갈어</a></li>
												<li><a href="/lecS">아랍어</a></li>
												<li><a href="/lecS">러시아어</a></li>
											</ul></li>
										<li class="dropdown-submenu"><a href="/lecS"
											class="dropdown-toggle" data-toggle="dropdown" role="button"
											aria-haspopup="true" aria-expanded="false"><span
												class="nav-label">자기계발</span></a>
											<ul class="dropdown-menu">
												<li><a href="/lecS">부동산</a></li>
												<li><a href="/lecS">주식</a></li>
												<li><a href="/lecS">면접/자소서</a></li>
												<li><a href="/lecS">SNS/블로그</a></li>
												<li><a href="/lecS">기타</a></li>
											</ul></li>
									</ul></li>
								<li><a href="#">고객센터<span class="arrow_carrot-down"></span></a>
									<ul class="dropdown">
										<li><a href="/boardL">공지사항</a></li>
										<li><a href="/faq">자주묻는질문</a></li>
										<li><a href="/user/qna">문의글</a></li>
										<li><a href="/refundRule">환불정책</a></li>
									</ul>
								</li>
								<security:authorize access="hasAuthority('A02')">
									<li><a href="#">크리에이터 등록</a></li>
									<li><a href="/user/userLectureList" class="text-danger">내 수강목록</a></li>
								</security:authorize>
								<security:authorize access="hasAuthority('A03')">
									<li><a href="/creator/creS" class="text-danger">크리에이터 페이지</a></li>
								</security:authorize>
							</ul>
						</nav>
					</div>
				</div>
				<div class="col-lg-5">
					<div class="header__right d-flex justify-content-end">
						<form action="#" id="searchForm">
							<input type="text" class="border w-75 rounded mx-1"
								placeholder="강의명, 태그로 검색"> <span class="icon_search text-white mx-1 mr-4" id="search"></span>
						</form>

						<security:authorize access="isAnonymous()">
							<a href="/customLogin" class="font-weight-bold mx-1">로그인<span
								class="icon_profile ml-2"></span></a>
						</security:authorize>
						<security:authorize
							access="hasAuthority('A02') or hasAuthority('A03')">
							<a href="/user/userSelect" class="font-weight-bold">마이페이지 <span
								class="icon_profile"></span></a>
						</security:authorize>
						<security:authorize access="hasAuthority('A01')">
							<a href="/admin/home" class="font-weight-bold">관리자 페이지로</a>
						</security:authorize>
						<security:authorize access="isAuthenticated()">
							<form action="/logout" method="post" id="logout">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}">
								<button type="submit"
									style="background-color: #070720; color: white; border: none;">
									<i class="fa fa-sign-out" aria-hidden="true" style="font-size:1.5rem"></i>
								</button>
							</form>
						</security:authorize>
					</div>
				</div>
			</div>
			<div id="mobile-menu-wrap"></div>
		</div>
	</header>
	<script type="text/javascript">
		$('.dropdown-toggle').click(function(){
			location.href = $(event.target).closest('a').attr('href');
		})
	</script>
</body>
</html>