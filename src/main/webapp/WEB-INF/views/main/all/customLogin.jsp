<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.kakao {
	background-color: #F2DC01;
	color: #371A1A;
}

.naver {
	background-color: #00BF18;
} 
 
.google, .naver {
	color: white;
}
.kakao, .naver, .google {
	font-weight: bold;
	width: 10px;
}

.input__item {
	border-radius: 10px;
	border: 1px solid lightgray;
}

.info {
	position: relative;
}

.info>i {
	position: absolute;
	left: 1.2rem;
	top: 1.3rem;
	color: gray;
	font-size: 1.3rem;
}
</style>
</head>
<body>
	<!-- Normal Breadcrumb Begin -->
	<section class="normal-breadcrumb set-bg"
		data-setbg="resources/img/normal-breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="normal__breadcrumb__text">
						<h2>로그인</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Normal Breadcrumb End -->



	<!--login-->
	<section class="login spad">
		<div class="container d-flex justify-content-center">
			<div class="col-lg-5 border p-5">
				<div class="row d-flex justify-content-center my-3">
					<h3 class="font-weight-bold">
						<i class="icon_key text-danger"></i> 로그인
					</h3>
				</div>
				<div class="row d-flex justify-content-center">
					<div class="login__form">
						<!--<h3>로그인</h3>-->
						<form action="/login" method="post">
							<div class="info">
								<input type="text" placeholder="이메일" class="border p-3 px-5 m-1" name="id" spellcheck="false">
								<i class="icon_mail"></i>
							</div>
							<div class="info">
								<input type="password" placeholder="비밀번호" class="border p-3 px-5 m-1" name="pw" spellcheck="false">
								<i class="icon_lock"></i>
							</div>
							<!-- 너 값 없는 놈이야-->
							<div style="text-align: center; font-weight: bold;" class="text-danger d-flex justify-content-center"><c:out value="${error}"/></div>
							<div class="d-flex flex-column">
								<button type="submit" class="site-btn px-5">로그인</button>
								<a href="/forget" style="color: black; text-align: center; margin-top:3px; font-weight: bold;">아이디/비밀번호 찾기</a>
							</div>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						</form>
					</div>
				</div>
				<hr>
				<div class="d-flex justify-content-center mt-5">
					<div class="login__register">
						<span class="small mt-3">계정이 없으신가요?</span>
						<h3 style="color: black;">회원가입 👇</h3>
						<a href="/signupForm" class="primary-btn">회원가입</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Login Section End -->
</body>
</html>