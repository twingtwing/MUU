<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<style>
        .product__item__pic{
            cursor: pointer;
        }
        .section-title h4,.product__sidebar .section-title h5, .product__item__text h5 a
        ,.product__sidebar__comment__item__text h5 a,.primary-btn{
            color: black;
        }


        .product__item__text ul li,.product__sidebar__comment__item__text ul li{
            background-color: rgb(201 175 175) ;
        }

        
        .product__sidebar__view .filter__controls li {
            color: #625454;
        }
        .hero__text .label {
            color: #ffffff;
            background: #000000;
            border-radius: 5px;
        }
        
        .product__sidebar__view .filter__controls li.active {
            color: #ff9494;
        }
        .product__item__pic .view,.product__item__pic .comment,.product__sidebar__view__item .view{
            color: black;
            background-color: white;
            border-radius: 20px;
        }
  </style>
</head>
<body>
	<div id="test">		
		참고하세여.(아 ㅋㅋ참고 하라고)<br>
		관리자아이디: admin123@naver.com / 비밀번호 : 관리자<br>
		유저아이디 : user123@naver.com / 비밀번호 : 정혜윤<br>
				
		<security:authorize access="isAuthenticated()">
		<security:authentication property="principal.username" var="username"/>
		</security:authorize>
		<a href="creator/creLectureReview">크리에이터리뷰페이지(임시)</a>	
		<h5> 사용자 아이디: ${username }</h5>
		<h5><security:authorize access="isAnonymous()">
			넌 비회원이야
		</security:authorize> </h5>
		<security:authorize access="hasAuthority('A01')">관리자만 볼 수 있는 글자</security:authorize>
		<security:authorize access="hasAuthority('A02')">유저만 볼 수 있는 글자</security:authorize>
		<security:authorize access="hasAuthority('A03')">크리에이터만 볼 수 있는 글자</security:authorize>
		
			<a href="/creS">크리에이터 정보 >></a>
			<a href="/lecI">강의 등록 >></a>
		
		<a href="/creS">크리에이터 정보 >></a>
		<a href="/lecI">강의 등록 >></a>
		<a href="/creator/cLecNL">공지사항</a>
		<a href="/creator/cLecNS">상세</a><br>
		<a href="/creator/cLecNI">등록</a>
		<a href="/creator/cLecNU">수정</a>

		<a href="/creator/cLecQ">질답</a>
		<a href="/creator/creLectureReview">크리에이터 리뷰</a>
		<a href="/creator/creS">크리에이터 정보 >></a>
		<a href="/creator/lecI">강의 등록 >></a>
		<a href="/creator/cLecNL">공지사항</a>
		<a href="/creator/cLecNS">상세</a><br>
		<a href="/creator/cLecNI">등록</a>
		<a href="/creator/cLecNU">수정</a>
		<a href="/creator/cLecQ">질답</a><br>
		<a href="excel">엑셀다운로드</a>
	
	</div>
    <!-- slide benner -->
    <section class="hero">
        <div class="container">
            <div class="hero__slider owl-carousel">
                <div class="hero__items set-bg" data-setbg="/resources/img/blog/blog-1.jpg">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <div class="label font-weight-bold py-2">상위 · 하위</div>
                                <h2>Fate / Stay Night: Unlimited Blade Works</h2>
                                <p></p>
                                <a href="#"><span>Go Now</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hero__items set-bg" data-setbg="/resources/img/hero/hero-1.jpg">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <div class="label font-weight-bold py-2">상위 · 하위</div>
                                <h2>Fate / Stay Night: Unlimited Blade Works</h2>
                                <p></p>
                                <a href="#"><span>Go Now</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hero__items set-bg" data-setbg="/resources/img/hero/hero-1.jpg">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <div class="label font-weight-bold py-2">상위 · 하위</div>
                                <h2>Fate / Stay Night: Unlimited Blade Works</h2>
                                <p></p>
                                <a href="#"><span>Go Now</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- slide benner End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="trending__product">
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <div class="section-title">
                                    <h4>이번주 HOT🔥</h4>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="/resources/img/trending/trend-1.jpg">
                                        <div class="comment"><i class="fa fa-comments"></i> 11</div>
                                        <div class="view">
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star-o text-danger"></i>
                                        </div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>상위</li>
                                            <li>하위</li>
                                        </ul>
                                        <h5><a href="#">직장인 위스키 클래스</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="/resources/img/trending/trend-2.jpg">
                                        <div class="comment"><i class="fa fa-comments"></i> 11</div>
                                        <div class="view">
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star-o text-danger"></i>
                                        </div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>상위</li>
                                            <li>하위</li>
                                        </ul>
                                        <h5><a href="#">Gintama Movie 2: Kanketsu-hen - Yorozuya yo Eien</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="/resources/img/trending/trend-3.jpg">
                                        <div class="comment"><i class="fa fa-comments"></i> 11</div>
                                        <div class="view">
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star-o text-danger"></i>
                                        </div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>상위</li>
                                            <li>하위</li>
                                        </ul>
                                        <h5><a href="#">Shingeki no Kyojin Season 3 Part 2</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="/resources/img/trending/trend-4.jpg">
                                        <div class="comment"><i class="fa fa-comments"></i> 11</div>
                                        <div class="view">
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star-o text-danger"></i>
                                        </div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>상위</li>
                                            <li>하위</li>
                                        </ul>
                                        <h5><a href="#">Fullmetal Alchemist: Brotherhood</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="/resources/img/trending/trend-5.jpg">
                                        <div class="comment"><i class="fa fa-comments"></i> 11</div>
                                        <div class="view">
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star-o text-danger"></i>
                                        </div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>상위</li>
                                            <li>하위</li>
                                        </ul>
                                        <h5><a href="#">Shiratorizawa Gakuen Koukou</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="/resources/img/trending/trend-6.jpg">
                                        <div class="comment"><i class="fa fa-comments"></i> 11</div>
                                        <div class="view">
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star-o text-danger"></i>
                                        </div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>상위</li>
                                            <li>하위</li>
                                        </ul>
                                        <h5><a href="#">Code Geass: Hangyaku no Lelouch R2</a></h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="popular__product">
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <div class="section-title">
                                    <h4>주간 BEST 카테고리 ??🥇</h4>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <div class="btn__all">
                                    <a href="#" class="primary-btn">View All <span class="arrow_right"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="/resources/img/popular/popular-1.jpg">
                                        <div class="comment"><i class="fa fa-comments"></i> 11</div>
                                        <div class="view">
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star-o text-danger"></i>
                                        </div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>상위</li>
                                            <li>하위</li>
                                        </ul>
                                        <h5><a href="#">Sen to Chihiro no Kamikakushi</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="/resources/img/popular/popular-2.jpg">
                                        <div class="comment"><i class="fa fa-comments"></i> 11</div>
                                        <div class="view">
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star-o text-danger"></i>
                                        </div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>상위</li>
                                            <li>하위</li>
                                        </ul>
                                        <h5><a href="#">Kizumonogatari III: Reiket su-hen</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="/resources/img/popular/popular-3.jpg">
                                        <div class="comment"><i class="fa fa-comments"></i> 11</div>
                                        <div class="view">
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star-o text-danger"></i>
                                        </div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>상위</li>
                                            <li>하위</li>
                                        </ul>
                                        <h5><a href="#">Shirogane Tamashii hen Kouhan sen</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="/resources/img/popular/popular-4.jpg">
                                        <div class="comment"><i class="fa fa-comments"></i> 11</div>
                                        <div class="view">
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star-o text-danger"></i>
                                        </div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>상위</li>
                                            <li>하위</li>
                                        </ul>
                                        <h5><a href="#">Rurouni Kenshin: Meiji Kenkaku Romantan</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="/resources/img/popular/popular-5.jpg">
                                        <div class="comment"><i class="fa fa-comments"></i> 11</div>
                                        <div class="view">
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star-o text-danger"></i>
                                        </div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>상위</li>
                                            <li>하위</li>
                                        </ul>
                                        <h5><a href="#">Mushishi Zoku Shou 2nd Season</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="/resources/img/popular/popular-6.jpg">
                                        <div class="comment"><i class="fa fa-comments"></i> 11</div>
                                        <div class="view">
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star-o text-danger"></i>
                                        </div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>상위</li>
                                            <li>하위</li>
                                        </ul>
                                        <h5><a href="#">Monogatari Series: Second Season</a></h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="recent__product">
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <div class="section-title">
                                    <h4>월간 BEST 카테고리??🏆</h4>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <div class="btn__all">
                                    <a href="#" class="primary-btn">View All <span class="arrow_right"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="/resources/img/recent/recent-1.jpg">
                                        <div class="comment"><i class="fa fa-comments"></i> 11</div>
                                        <div class="view">
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star-o text-danger"></i>
                                        </div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>상위</li>
                                            <li>하위</li>
                                        </ul>
                                        <h5><a href="#">Great Teacher Onizuka</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="/resources/img/recent/recent-2.jpg">
                                        <div class="comment"><i class="fa fa-comments"></i> 11</div>
                                        <div class="view">
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star-o text-danger"></i>
                                        </div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>상위</li>
                                            <li>하위</li>
                                        </ul>
                                        <h5><a href="#">Fate/stay night Movie: Heaven's Feel - II. Lost</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="/resources/img/recent/recent-3.jpg">
                                        <div class="comment"><i class="fa fa-comments"></i> 11</div>
                                        <div class="view">
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star-o text-danger"></i>
                                        </div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>상위</li>
                                            <li>하위</li>
                                        </ul>
                                        <h5><a href="#">Mushishi Zoku Shou: Suzu no Shizuku</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="/resources/img/recent/recent-4.jpg">
                                        <div class="comment"><i class="fa fa-comments"></i> 11</div>
                                        <div class="view">
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star-o text-danger"></i>
                                        </div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>상위</li>
                                            <li>하위</li>
                                        </ul>
                                        <h5><a href="#">Fate/Zero 2nd Season</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="/resources/img/recent/recent-5.jpg">
                                        <div class="comment"><i class="fa fa-comments"></i> 11</div>
                                        <div class="view">
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star-o text-danger"></i>
                                        </div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>상위</li>
                                            <li>하위</li>
                                        </ul>
                                        <h5><a href="#">Kizumonogatari II: Nekket su-hen</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="/resources/img/recent/recent-6.jpg">
                                        <div class="comment"><i class="fa fa-comments"></i> 11</div>
                                        <div class="view">
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star-o text-danger"></i>
                                        </div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>상위</li>
                                            <li>하위</li>
                                        </ul>
                                        <h5><a href="#">The Seven Deadly Sins: Wrath of the Gods</a></h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-8">
                    <div class="product__sidebar">
                        <div class="product__sidebar__view">
                            <div class="section-title">
                                <h5>BEST TOP 3✨</h5>
                            </div>
                            <ul class="filter__controls">
                                <li data-filter="*"></li>
                                <li class="active" data-filter=".day">Day</li>
                                <li data-filter=".week">Week</li>
                                <li data-filter=".month">Month</li>
                            </ul>
                            <div class="filter__gallery filter_really d-none">
                                <div class="product__sidebar__view__item set-bg mix month" data-setbg="/resources/img/sidebar/tv-1.jpg">
                                    <div class="view">
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star-o text-danger"></i>
                                        </div>
                                    <h5><a href="#">The Seven Deadly Sins: Wrath of the Gods</a></h5>
                                </div>
                                <div class="product__sidebar__view__item set-bg mix week" data-setbg="/resources/img/sidebar/tv-2.jpg">
                                    <div class="view">
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star-o text-danger"></i>
                                        </div>
                                    <h5><a href="#">Boruto: Naruto next generations</a></h5>
                                </div>
                                <div class="product__sidebar__view__item set-bg mix day" data-setbg="/resources/img/sidebar/tv-3.jpg">
                                    <div class="view">
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star-o text-danger"></i>
                                        </div>
                                    <h5><a href="#">Fate stay night unlimited blade works</a></h5>
                                </div>
                                <div class="product__sidebar__view__item set-bg mix month" data-setbg="/resources/img/sidebar/tv-4.jpg">
                                    <div class="view">
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star-o text-danger"></i>
                                        </div>
                                    <h5><a href="#">Fate/stay night: Heaven's Feel I. presage flower</a></h5>
                                </div>
                                <div class="product__sidebar__view__item set-bg mix week" data-setbg="/resources/img/sidebar/tv-5.jpg">
                                    <div class="view">
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star-o text-danger"></i>
                                        </div>
                                    <h5><a href="#">Sword art online alicization war of underworld</a></h5>
                                </div>
                                <div class="product__sidebar__view__item set-bg mix day" data-setbg="/resources/img/sidebar/tv-1.jpg">
                                    <div class="view">
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star-o text-danger"></i>
                                        </div>
                                    <h5><a href="#">Fate stay night unlimited blade works</a></h5>
                                </div>
                                <div class="product__sidebar__view__item set-bg mix month" data-setbg="/resources/img/sidebar/tv-2.jpg">
                                    <div class="view">
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star-o text-danger"></i>
                                        </div>
                                    <h5><a href="#">Fate/stay night: Heaven's Feel I. presage flower</a></h5>
                                </div>
                                <div class="product__sidebar__view__item set-bg mix week" data-setbg="/resources/img/sidebar/tv-3.jpg">
                                    <div class="view">
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star-o text-danger"></i>
                                        </div>
                                    <h5><a href="#">Sword art online alicization war of underworld</a></h5>
                                </div>
                                <div class="product__sidebar__view__item set-bg mix day" data-setbg="/resources/img/sidebar/tv-4.jpg">
                                    <div class="view">
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star text-danger"></i>
                                            <i class="fa fa-star-o text-danger"></i>
                                        </div>
                                    <h5><a href="#">Fate stay night unlimited blade works</a></h5>
                                </div>
                            </div>
                            <div class="filter__gallery filter_fake">
                                <div class="product__sidebar__view__item set-bg mix day" data-setbg="/resources/img/sidebar/tv-3.jpg">
                                    <div class="view">
                                        <i class="fa fa-star text-danger"></i>
                                        <i class="fa fa-star text-danger"></i>
                                        <i class="fa fa-star text-danger"></i>
                                        <i class="fa fa-star text-danger"></i>
                                        <i class="fa fa-star-o text-danger"></i>
                                    </div>
                                    <h5><a href="#">Fate stay night unlimited blade works</a></h5>
                                </div>
                                <div class="product__sidebar__view__item set-bg mix day" data-setbg="/resources/img/sidebar/tv-1.jpg">
                                    <div class="view">
                                        <i class="fa fa-star text-danger"></i>
                                        <i class="fa fa-star text-danger"></i>
                                        <i class="fa fa-star text-danger"></i>
                                        <i class="fa fa-star text-danger"></i>
                                        <i class="fa fa-star-o text-danger"></i>
                                    </div>
                                    <h5><a href="#">Fate stay night unlimited blade works</a></h5>
                                </div>
                                <div class="product__sidebar__view__item set-bg mix day" data-setbg="/resources/img/sidebar/tv-4.jpg">
                                    <div class="view">
                                        <i class="fa fa-star text-danger"></i>
                                        <i class="fa fa-star text-danger"></i>
                                        <i class="fa fa-star text-danger"></i>
                                        <i class="fa fa-star text-danger"></i>
                                        <i class="fa fa-star-o text-danger"></i>
                                    </div>
                                    <h5><a href="#">Fate stay night unlimited blade works</a></h5>
                                </div>
                            </div>
                        </div>
                        <div class="product__sidebar__comment">
                            <div class="section-title">
                                <h5>New 강의</h5>
                            </div>
                            <div class="product__sidebar__comment__item">
                                <div class="product__sidebar__comment__item__pic">
                                    <img src="/resources/img/sidebar/comment-1.jpg" alt="">
                                </div>
                                <div class="product__sidebar__comment__item__text">
                                    <ul>
                                        <li>상위</li>
                                        <li>하위</li>
                                    </ul>
                                    <h5><a href="#">The Seven Deadly Sins: Wrath of the Gods</a></h5>
                                    <span><i class="fa fa-comments"></i> 19.141 reviews</span>
                                    <span>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-o"></i>
                                        4 star
                                    </span>
                                </div>
                            </div>
                            <div class="product__sidebar__comment__item">
                                <div class="product__sidebar__comment__item__pic">
                                    <img src="/resources/img/sidebar/comment-2.jpg" alt="">
                                </div>
                                <div class="product__sidebar__comment__item__text">
                                    <ul>
                                        <li>상위</li>
                                        <li>하위</li>
                                    </ul>
                                    <h5><a href="#">Shirogane Tamashii hen Kouhan sen</a></h5>
                                    <span><i class="fa fa-comments"></i> 19.141 reviews</span>
                                    <span>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-o"></i>
                                        4 star
                                    </span>
                                </div>
                            </div>
                            <div class="product__sidebar__comment__item">
                                <div class="product__sidebar__comment__item__pic">
                                    <img src="/resources/img/sidebar/comment-3.jpg" alt="">
                                </div>
                                <div class="product__sidebar__comment__item__text">
                                    <ul>
                                        <li>상위</li>
                                        <li>하위</li>
                                    </ul>
                                    <h5><a href="#">Kizumonogatari III: Reiket su-hen</a></h5>
                                    <span><i class="fa fa-comments"></i> 19.141 reviews</span>
                                    <span>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-o"></i>
                                        4 star
                                    </span>
                                </div>
                            </div>
                            <div class="product__sidebar__comment__item">
                                <div class="product__sidebar__comment__item__pic">
                                    <img src="/resources/img/sidebar/comment-4.jpg" alt="">
                                </div>
                                <div class="product__sidebar__comment__item__text">
                                    <ul>
                                        <li>상위</li>
                                        <li>하위</li>
                                    </ul>
                                    <h5><a href="#">Monogatari Series: Second Season</a></h5>
                                    <span><i class="fa fa-comments"></i> 19.141 reviews</span>
                                    <span>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-o"></i>
                                        4 star
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->

    <script>
        $('.filter__controls li').on('click',function(){
            if($('.filter_really').hasClass('d-none')){
                $('.filter_fake').addClass('d-none');
                $('.filter_really').removeClass('d-none');
            }
        })
    </script>
</body>
</html>