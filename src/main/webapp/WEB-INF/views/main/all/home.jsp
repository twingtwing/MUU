<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 style="color:white;"><a href="admin/home">관리자페이지 (임시)</a></h1>
<h5> 사용자 아이디 : <security:authentication property="principal" var="principal.username"/>(비로그인시 아무것도안뜸)</h5>
<h5> 사용자 현재 권한: <security:authentication property="principal"/></h5>
<h5><security:authorize access="isAnonymous()">
	비회원일때
</security:authorize> </h5>
<h5><security:authorize access="hasAuthority('A01')">관리자만 볼 수 있는 글자</security:authorize></h5>
<h5><security:authorize access="hasAuthority('A02')">유저만 볼 수 있는 글자</security:authorize></h5>
<h5><security:authorize access="hasAuthority('A03')">크리에이터만 볼 수 있는 글자</security:authorize></h5>
<h5><security:authorize access="isAuthenticated()">
<form action="/logout" method="post">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}"> <input type="submit" value="로그아웃">
</form>
</security:authorize></h5>
<section class="hero">
        <div class="container">
            <div class="hero__slider owl-carousel">
                <div class="hero__items set-bg" data-setbg="resources/img/hero/hero-1.jpg">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <div class="label">Adventure</div>
                                <h2>Fate / Stay Night: Unlimited Blade Works</h2>
                                <p>After 30 days of travel across the world...</p>
                                <a href="#"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hero__items set-bg" data-setbg="resources/img/hero/hero-1.jpg">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <div class="label">Adventure</div>
                                <h2>Fate / Stay Night: Unlimited Blade Works</h2>
                                <p>몸은 검으로 되어있다 ..</p>
                                <a href="#"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hero__items set-bg" data-setbg="resources/img/hero/hero-1.jpg">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <div class="label">Adventure</div>
                                <h2>Fate / Stay Night: Unlimited Blade Works</h2>
                                <p>토오사카 린은 귀엽다</p>
                                <a href="#"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
</body>
</html>