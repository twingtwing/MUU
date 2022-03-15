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
								<li><a href="/lecS">카테고리<span class="arrow_carrot-down"></span></a>
									<ul class="dropdown">
										<li class="dropdown-submenu">
											<a href="/lecS?upCtgr=HC01" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
												<span class="nav-label">음악</span>
											</a>
											<ul class="dropdown-menu">
												<li><a href="/lecS?upCtgr=HC01&downCtgr=LC01">클래식</a></li>
												<li><a href="/lecS?upCtgr=HC01&downCtgr=LC02">재즈/락</a></li>
												<li><a href="/lecS?upCtgr=HC01&downCtgr=LC03">힙합/랩</a></li>
												<li><a href="/lecS?upCtgr=HC01&downCtgr=LC04">기타/베이스</a></li>
												<li><a href="/lecS?upCtgr=HC01&downCtgr=LC05">동양</a></li>
												<li><a href="/lecS?upCtgr=HC01&downCtgr=LC06">보컬</a></li>
												<li><a href="/lecS?upCtgr=HC01&downCtgr=LC07">기타</a></li>
											</ul></li>
										<li class="dropdown-submenu"><a href="/lecS?upCtgr=HC02"
											class="dropdown-toggle" data-toggle="dropdown" role="button"
											aria-haspopup="true" aria-expanded="false"><span
												class="nav-label">요리</span></a>
											<ul class="dropdown-menu">
												<li><a href="/lecS?upCtgr=HC02&downCtgr=LC08">한식</a></li>
												<li><a href="/lecS?upCtgr=HC02&downCtgr=LC09">양식</a></li>
												<li><a href="/lecS?upCtgr=HC02&downCtgr=LC10">일식</a></li>
												<li><a href="/lecS?upCtgr=HC02&downCtgr=LC11">중식</a></li>
												<li><a href="/lecS?upCtgr=HC02&downCtgr=LC12">베이킹</a></li>
												<li><a href="/lecS?upCtgr=HC02&downCtgr=LC13">가정식</a></li>
												<li><a href="/lecS?upCtgr=HC02&downCtgr=LC14">기타</a></li>
											</ul></li>
										<li class="dropdown-submenu"><a href="/lecS?upCtgr=HC03"
											class="dropdown-toggle" data-toggle="dropdown" role="button"
											aria-haspopup="true" aria-expanded="false"><span
												class="nav-label">건강</span></a>
											<ul class="dropdown-menu">
												<li><a href="/lecS?upCtgr=HC03&downCtgr=LC15">홈 트레이닝</a></li>
												<li><a href="/lecS?upCtgr=HC03&downCtgr=LC16">필라테스</a></li>
												<li><a href="/lecS?upCtgr=HC03&downCtgr=LC17">요가</a></li>
												<li><a href="/lecS?upCtgr=HC03&downCtgr=LC18">헬스</a></li>
												<li><a href="/lecS?upCtgr=HC03&downCtgr=LC19">정신건강</a></li>
												<li><a href="/lecS?upCtgr=HC03&downCtgr=LC20">기타</a></li>
											</ul></li>
										<li class="dropdown-submenu"><a href="/lecS?upCtgr=HC04"
											class="dropdown-toggle" data-toggle="dropdown" role="button"
											aria-haspopup="true" aria-expanded="false"><span
												class="nav-label">아트</span></a>
											<ul class="dropdown-menu">
												<li><a href="/lecS?upCtgr=HC04&downCtgr=LC21">2D/애니메이션</a></li>
												<li><a href="/lecS?upCtgr=HC04&downCtgr=LC22">드로잉</a></li>
												<li><a href="/lecS?upCtgr=HC04&downCtgr=LC23">수채화/유화</a></li>
												<li><a href="/lecS?upCtgr=HC04&downCtgr=LC24">동양화</a></li>
												<li><a href="/lecS?upCtgr=HC04&downCtgr=LC25">사진</a></li>
												<li><a href="/lecS?upCtgr=HC04&downCtgr=LC26">메이크업/분장</a></li>
												<li><a href="/lecS?upCtgr=HC04&downCtgr=LC27">기타</a></li>
											</ul></li>
										<li class="dropdown-submenu"><a href="/lecS?upCtgr=HC05"
											class="dropdown-toggle" data-toggle="dropdown" role="button"
											aria-haspopup="true" aria-expanded="false"><span
												class="nav-label">IT/컴퓨터</span></a>
											<ul class="dropdown-menu">
												<li><a href="/lecS?upCtgr=HC05&downCtgr=LC28">Java</a></li>
												<li><a href="/lecS?upCtgr=HC05&downCtgr=LC29">Python</a></li>
												<li><a href="/lecS?upCtgr=HC05&downCtgr=LC30">C언어</a></li>
												<li><a href="/lecS?upCtgr=HC05&downCtgr=LC31">웹 프로그래밍</a></li>
												<li><a href="/lecS?upCtgr=HC05&downCtgr=LC32">Unity</a></li>
												<li><a href="/lecS?upCtgr=HC05&downCtgr=LC33">Photoshop/Illustrator</a></li>
												<li><a href="/lecS?upCtgr=HC05&downCtgr=LC34">기타</a></li>
											</ul></li>
										<li class="dropdown-submenu"><a href="/lecS?upCtgr=HC06"
											class="dropdown-toggle" data-toggle="dropdown" role="button"
											aria-haspopup="true" aria-expanded="false"><span
												class="nav-label">외국어</span></a>
											<ul class="dropdown-menu">
												<li><a href="/lecS?upCtgr=HC06&downCtgr=LC35">영어</a></li>
												<li><a href="/lecS?upCtgr=HC06&downCtgr=LC36">일본어</a></li>
												<li><a href="/lecS?upCtgr=HC06&downCtgr=LC37">중국어</a></li>
												<li><a href="/lecS?upCtgr=HC06&downCtgr=LC38">스페인어</a></li>
												<li><a href="/lecS?upCtgr=HC06&downCtgr=LC39">아랍어</a></li>
												<li><a href="/lecS?upCtgr=HC06&downCtgr=LC40">러시아어</a></li>
												<li><a href="/lecS?upCtgr=HC06&downCtgr=LC41">기타</a></li>
											</ul></li>
										<li class="dropdown-submenu"><a href="/lecS?upCtgr=HC07"
											class="dropdown-toggle" data-toggle="dropdown" role="button"
											aria-haspopup="true" aria-expanded="false"><span
												class="nav-label">자기계발</span></a>
											<ul class="dropdown-menu">
												<li><a href="/lecS?upCtgr=HC07&downCtgr=LC42">부동산</a></li>
												<li><a href="/lecS?upCtgr=HC07&downCtgr=LC43">주식</a></li>
												<li><a href="/lecS?upCtgr=HC07&downCtgr=LC44">면접/자소서</a></li>
												<li><a href="/lecS?upCtgr=HC07&downCtgr=LC45">SNS/블로그</a></li>
												<li><a href="/lecS?upCtgr=HC07&downCtgr=LC46">기타</a></li>
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
									<li><a href="/user/creatorRegister">크리에이터 등록</a></li>
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
							<a href="/admin/home" class="font-weight-bold text-danger">관리자 페이지로</a>
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