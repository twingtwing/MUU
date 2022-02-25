<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.dropdown li {
	padding: 0.5rem 0;
}
.dropdown-menu {
	margin-left: 10rem;
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
										<li class="dropdown-submenu"><a href="#"
											class="dropdown-toggle" data-toggle="dropdown" role="button"
											aria-haspopup="true" aria-expanded="false"><span
												class="nav-label">음악</span></a>
											<ul class="dropdown-menu">
												<li><a href="#">클래식</a></li>
												<li><a href="#">재즈</a></li>
												<li><a href="#">락</a></li>
												<li><a href="#">힙합/랩</a></li>
												<li><a href="#">타악기</a></li>
												<li><a href="#">기타/베이스</a></li>
												<li><a href="#">동양음악</a></li>
												<li><a href="#">보컬</a></li>
												<li><a href="#">작사/작곡</a></li>
											</ul></li>
										<li class="dropdown-submenu"><a href="#"
											class="dropdown-toggle" data-toggle="dropdown" role="button"
											aria-haspopup="true" aria-expanded="false"><span
												class="nav-label">요리</span></a>
											<ul class="dropdown-menu">
												<li><a href="#">양식</a></li>
												<li><a href="#">동양식</a></li>
												<li><a href="#">간편요리</a></li>
												<li><a href="#">코스요리</a></li>
												<li><a href="#">가정식</a></li>
												<li><a href="#">베이킹</a></li>
											</ul></li>
										<li class="dropdown-submenu"><a href="#"
											class="dropdown-toggle" data-toggle="dropdown" role="button"
											aria-haspopup="true" aria-expanded="false"><span
												class="nav-label">건강</span></a>
											<ul class="dropdown-menu">
												<li><a href="#">홈 트레이닝</a></li>
												<li><a href="#">필라테스</a></li>
												<li><a href="#">요가</a></li>
												<li><a href="#">헬스</a></li>
												<li><a href="#">정신건강</a></li>
												<li><a href="#">테라피</a></li>
											</ul></li>
										<li class="dropdown-submenu"><a href="#"
											class="dropdown-toggle" data-toggle="dropdown" role="button"
											aria-haspopup="true" aria-expanded="false"><span
												class="nav-label">아트</span></a>
											<ul class="dropdown-menu">
												<li><a href="#">2D/애니메이션</a></li>
												<li><a href="#">드로잉</a></li>
												<li><a href="#">수채화</a></li>
												<li><a href="#">유화</a></li>
												<li><a href="#">동양화</a></li>
												<li><a href="#">판화</a></li>
												<li><a href="#">공예</a></li>
												<li><a href="#">사진</a></li>
												<li><a href="#">메이크업/분장</a></li>
											</ul></li>
										<li class="dropdown-submenu"><a href="#"
											class="dropdown-toggle" data-toggle="dropdown" role="button"
											aria-haspopup="true" aria-expanded="false"><span
												class="nav-label">IT/컴퓨터</span></a>
											<ul class="dropdown-menu">
												<li><a href="#">Java</a></li>
												<li><a href="#">Python</a></li>
												<li><a href="#">C/C++/C#</a></li>
												<li><a href="#">웹 프로그래밍</a></li>
												<li><a href="#">Unity</a></li>
												<li><a href="#">영상편집</a></li>
												<li><a href="#">Photoshop/Illustrator</a></li>
												<li><a href="#">3D 모델링</a></li>
												<li><a href="#">기타</a></li>
											</ul></li>
										<li class="dropdown-submenu"><a href="#"
											class="dropdown-toggle" data-toggle="dropdown" role="button"
											aria-haspopup="true" aria-expanded="false"><span
												class="nav-label">외국어</span></a>
											<ul class="dropdown-menu">
												<li><a href="#">영어</a></li>
												<li><a href="#">일본어</a></li>
												<li><a href="#">중국어</a></li>
												<li><a href="#">스페인어</a></li>
												<li><a href="#">포르투갈어</a></li>
												<li><a href="#">아랍어</a></li>
												<li><a href="#">러시아어</a></li>
											</ul></li>
										<li class="dropdown-submenu"><a href="#"
											class="dropdown-toggle" data-toggle="dropdown" role="button"
											aria-haspopup="true" aria-expanded="false"><span
												class="nav-label">자기계발</span></a>
											<ul class="dropdown-menu">
												<li><a href="#">부동산</a></li>
												<li><a href="#">주식</a></li>
												<li><a href="#">면접/자소서</a></li>
												<li><a href="#">SNS/블로그</a></li>
												<li><a href="#">기타</a></li>
											</ul></li>
									</ul></li>
								<li><a href="#">고객센터<span class="arrow_carrot-down"></span></a>
									<ul class="dropdown">
										<li><a href="/boardL">공지사항</a></li>
										<li><a href="/faq">자주묻는질문</a></li>
										<li><a href="/qna">문의글</a></li>
										<li><a href="/refundRule">환불정책</a></li>
									</ul>
								</li>

								<li><a href="#">크리에이터 등록</a></li>
								<security:authorize access="hasAuthority('A03')">
									<li><a href="/creator/creS">크리에이터 페이지</a></li>
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
	</script>
</body>
</html>