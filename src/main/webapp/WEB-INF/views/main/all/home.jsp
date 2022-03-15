<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		관리자아이디: admin123@naver.com / 비밀번호 : 관리자<br>
		유저아이디 : user123@naver.com / 비밀번호 : 정혜윤<br>
		크리에이터아이디 : test111@naver.com / 비밀번호 : 테스트111, gotohell@naver.com / 정혜윤, minicreator@naver.com/정혜윤<br>
			
		<a href="creator/creLectureReview">크리에이터리뷰페이지(임시)</a>	
		<h5> 사용자 아이디: ${username }</h5>
	</div>


	<!-- slide benner -->
	<section class="hero">
		<div class="container">
			<div class="hero__slider owl-carousel">
				<c:forEach items="${random }" var="lec">
					<div class="hero__items set-bg" data-setbg="${lec.thumb }">
						<div class="row">
							<div class="col-lg-6">
								<div class="hero__text">
									<div class="label font-weight-bold py-2">${lec.upCtgr} · ${lec.downCtgr}</div>
									<h2 class="text-dark">${lec.ttl}</h2>
									<p></p>
									<a href="/lecD?ltNo=${lec.ltNo}">
										<span>Go Now</span> 
										<i class="fa fa-angle-right"></i>
									</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	    
	<div id="homeVue">
	    <!-- slide benner End -->
	
		<!-- 여기에 워시리스트 넣을려다가 중복 강의 땜에 오류파티될까봐 일부퍼 빼버림 -->
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
	                        	<!-- 이번주 hot 반복 -->
	                            <div v-for="lec in thisWeekLecture" class="col-lg-4 col-md-6 col-sm-6">
	                                <div class="product__item">
	                                    <div class="product__item__pic border set-bg" :style="'background-image : url('+lec.thumb+');'" :data-setbg="lec.thumb">
	                                        <div class="comment"><i class="fa fa-comments"></i> {{lec.rCount}}</div>
	                                        <div class="view">
	                                            <i v-for="index in lec.star" class="fa fa-star text-danger"></i>
	                                            <i v-for="index in 5-lec.star" class="fa fa-star-o text-danger"></i>
	                                        </div>
	                                    </div>
	                                    <div class="product__item__text">
	                                        <ul>
	                                            <li>{{lec.upCtgr}}</li>
	                                            <li>{{lec.downCtgr}}</li>
	                                        </ul>
	                                        <h5><a :href="'/lecD?ltNo='+lec.ltNo">{{lec.ttl}}</a></h5>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="popular__product">
	                        <div class="row">
	                            <div class="col-lg-8 col-md-8 col-sm-8">
	                                <div class="section-title">
	                                    <h4>주간 BEST 카테고리 <strong class="text-danger">{{bestCtgrLectureWeek[0].upCtgr}}</strong> 🥇</h4>
	                                </div>
	                            </div>
	                            <div class="col-lg-4 col-md-4 col-sm-4">
	                                <div class="btn__all">
	                                    <a :href="'/lecS?upCtgr='+bestCtgrLectureWeek[0].ctgrId" class="primary-btn">View All <span class="arrow_right"></span></a>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="row">
	                        
	                        	<!-- 주간 BEST카테고리 -->
	                            <div v-for="lec in bestCtgrLectureWeek" class="col-lg-4 col-md-6 col-sm-6">
	                                <div class="product__item">
	                                    <div class="product__item__pic border set-bg" :style="'background-image : url('+lec.thumb+');'" :data-setbg="lec.thumb">
	                                        <div class="comment"><i class="fa fa-comments"></i> {{lec.rCount}}</div>
	                                        <div class="view">
	                                            <i v-for="index in lec.star" class="fa fa-star text-danger"></i>
	                                            <i v-for="index in 5-lec.star" class="fa fa-star-o text-danger"></i>
	                                        </div>
	                                    </div>
	                                    <div class="product__item__text">
	                                        <ul>
	                                            <li>{{lec.upCtgr}}</li>
	                                            <li>{{lec.downCtgr}}</li>
	                                        </ul>
	                                        <h5><a :href="'/lecD?ltNo='+lec.ltNo">{{lec.ttl}}</a></h5>
	                                    </div>
	                                </div>
	                            </div>
	                            
	                    	</div>
	                    </div>
	                    <div class="recent__product">
	                        <div class="row">
	                            <div class="col-lg-8 col-md-8 col-sm-8">
	                                <div class="section-title">
	                                    <h4>월간 BEST 카테고리 <strong class="text-danger">{{bestCtgrLectureMonth[0].upCtgr}}</strong> 🏆</h4>
	                                </div>
	                            </div>
	                            <div class="col-lg-4 col-md-4 col-sm-4">
	                                <div class="btn__all">
	                                    <a :href="'/lecS?upCtgr='+bestCtgrLectureMonth[0].ctgrId" class="primary-btn">View All <span class="arrow_right"></span></a>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="row">
	                        
	                        	<!-- 월간 베스트 카테고리 반복 -->
	                            <div v-for="lec in bestCtgrLectureMonth" class="col-lg-4 col-md-6 col-sm-6">
	                                <div class="product__item">
	                                    <div class="product__item__pic border set-bg" :style="'background-image : url('+lec.thumb+');'" :data-setbg="lec.thumb">
	                                        <div class="comment"><i class="fa fa-comments"></i> {{lec.rCount}}</div>
	                                        <div class="view">
	                                            <i v-for="index in lec.star" class="fa fa-star text-danger"></i>
	                                            <i v-for="index in 5-lec.star" class="fa fa-star-o text-danger"></i>
	                                        </div>
	                                    </div>
	                                    <div class="product__item__text">
	                                        <ul>
	                                            <li>{{lec.upCtgr}}</li>
	                                            <li>{{lec.downCtgr}}</li>
	                                        </ul>
	                                        <h5><a :href="'/lecD?ltNo='+lec.ltNo">{{lec.ttl}}</a></h5>
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
	                                <li v-on:click="filterLick" class="active" data-filter="*">ALL</li>
	                                <li v-on:click="filterLick" data-filter=".day">Day</li>
	                                <li v-on:click="filterLick" data-filter=".week">Week</li>
	                                <li v-on:click="filterLick" data-filter=".month">Month</li>
	                            </ul>
	                            
	                            <div class="filter__gallery filter_really">
	                                <div v-for="lec in popularLectureMonth" class="product__sidebar__view__item set-bg mix month" :style="'background-image : url('+lec.thumb+');'" :data-setbg="lec.thumb">
	                                    <div class="view">
	                                            <i v-for="index in lec.star" class="fa fa-star text-danger"></i>
	                                            <i v-for="index in 5-lec.star" class="fa fa-star-o text-danger"></i>
	                                        </div>
	                                    <h5><a :href="'/lecD?ltNo='+lec.ltNo">{{lec.ttl}}</a></h5>
	                                </div>
	                                <div v-for="lec in popularLectureWeek" class="product__sidebar__view__item set-bg mix week" :style="'background-image : url('+lec.thumb+');'" :data-setbg="lec.thumb">
	                                    <div class="view">
	                                            <i v-for="index in lec.star" class="fa fa-star text-danger"></i>
	                                            <i v-for="index in 5-lec.star" class="fa fa-star-o text-danger"></i>
	                                        </div>
	                                    <h5><a :href="'/lecD?ltNo='+lec.ltNo">{{lec.ttl}}</a></h5>
	                                </div>
	                                <div v-for="lec in popularLectureDay" class="product__sidebar__view__item set-bg mix day" :style="'background-image : url('+lec.thumb+');'" :data-setbg="lec.thumb">
	                                    <div class="view">
	                                            <i v-for="index in lec.star" class="fa fa-star text-danger"></i>
	                                            <i v-for="index in 5-lec.star" class="fa fa-star-o text-danger"></i>
	                                        </div>
	                                    <h5><a :href="'/lecD?ltNo='+lec.ltNo">{{lec.ttl}}</a></h5>
	                                </div>
	                            </div>
	                         
	                        </div>
	                        <div class="product__sidebar__comment">
	                            <div class="section-title">
	                                <h5>New 강의</h5>
	                            </div>
	                            
	                            <div v-for="lec in newLecture" class="product__sidebar__comment__item">
	                                <div class="product__sidebar__comment__item__pic">
	                                	<img :src="lec.thumb" width="90" height="130" alt="">
	                                    <!-- <img src="resources/img/sidebar/comment-1.jpg" alt=""> -->
	                                </div>
	                                <div class="product__sidebar__comment__item__text">
	                                    <ul>
	                                        <li>{{lec.upCtgr}}</li>
	                                        <li>{{lec.downCtgr}}</li>
	                                    </ul>
	                                    <h5><a :href="'/lecD?ltNo='+lec.ltNo">{{lec.ttl}}</a></h5>
	                                    <span><i class="fa fa-comments"></i> {{lec.rCount}} reviews</span>
	                                    <span>
	                                    	<i v-for="index in lec.star" class="fa fa-star"></i>
	                                        <i v-for="index in 5-lec.star" class="fa fa-star-o"></i>
	                                        {{lec.star}} star
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
	</div>
	
    <script>
    	const home = Vue.createApp({
    		data(){
    			return {
    				thisWeekLecture : [],
    				bestCtgrLectureWeek: [],
    				bestCtgrLectureMonth: [],
    				newLecture: [],
    				popularLectureDay : [],
    				popularLectureWeek : [],
    				popularLectureMonth : [],
    				randomLecture : []
    			}
    		},
    		methods :{
    			filterLick(){
    				
    				$('.filter__controls li').removeClass('active');
    				$($(event.target)[0]).addClass('active');
			   		
                	if ($('.filter__gallery').length > 0) {
        				var containerEl = document.querySelector('.filter__gallery');
        				var mixer = mixitup(containerEl);
        			}

    			}
    		},
    		beforeCreate : function () {
    			let path = '/homeLecture';
    			fetch(path)
                .then(response => response.json())
                .then(result => {
                	this.thisWeekLecture = result.thisWeekLecture;
                	this.bestCtgrLectureWeek = result.bestCtgrLectureWeek;
                	this.bestCtgrLectureMonth = result.bestCtgrLectureMonth;
                	this.newLecture = result.newLecture;
                	this.popularLectureDay = result.popularLectureDay;
                	this.popularLectureWeek = result.popularLectureWeek;
                	this.popularLectureMonth = result.popularLectureMonth;
                	
                	/* 안되면,,,beforCreate 등 해야함 */
                	$(".loader").fadeOut();
        			$("#preloder").delay(200).fadeOut("slow");

        			$('.set-bg').each(function () {
			            var bg = $(this).data('setbg');
			            console.log($(this))
			            $(this).css('background-image', 'url(' + bg + ')');
			        });
                	
				})
    		}
    	})
    	
    	const homeMounted = home.mount('#homeVue');

    
    </script>
</body>
</html>