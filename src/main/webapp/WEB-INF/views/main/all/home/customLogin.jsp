<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.kakao {
	background-color: #F2DC01;
	color: #371A1A;
	font-weight: bold;
}

.naver {
	background-color: #00BF18;
	color: white;
	font-weight: bold;
}

.input__item {
	border-radius: 10px;
	border: 1px solid lightgray;
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



	<!-- Login Section Begin -->
	<section class="login spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="login__form">
                        <!--    
                            <h3>로그인</h3>
                        -->
                        <form action="/login" method="post">
                            <div class="input__item">
                                <input type="text" placeholder="Email address">
                                <span class="icon_mail"></span>
                            </div>
                            <div class="input__item">
                                <input type="text" placeholder="Password">
                                <span class="icon_lock"></span>
                            </div>
                                <button type="submit" class="site-btn">GO</button>
                                <a href="#" style="margin-left: 3rem; color:black;">아이디/비밀번호 찾기</a>
                        </form>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="login__register">
                            <h3>3초만에 가입하기👇</h3>
                        <a href="#" class="primary-btn">회원가입</a>
                    </div>
                </div>
            </div>
            <div class="login__social">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-6">
                        <div class="login__social__links">
                            <span>or</span>
                            <ul>
                                <li><a href="#" class="kakao"><i class="fa fa-facebook"></i>카카오톡으로 시작하기</a></li>
                                <li><a href="#" class="naver"><i class="fa fa-twitter"></i>네이버로 시작하기</a>
                                    <li><a href="#" class="google"><i class="fa fa-google"></i>구글로 시작하기</a></li>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<!-- Login Section End -->
</body>
</html>