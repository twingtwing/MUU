<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <style>
        .lecture_ul{
            width: 100%;
            display: flex;
            justify-content: space-between;
        }
        .lecture_ul li{
            list-style-type: none;
            display: flex;
        }

        .lecture_ul li a{
            color: black;
        }

        .lecture_ul li a:hover{
            cursor: pointer;
            color: red;
        }

        .fa-ban:hover,.fa-heart:hover, #rev_a:hover{
            cursor: pointer;
        }

        .qna_collapse{
            color: black;
        }

        .qna_collapse:hover, #rev_a:hover{
            text-decoration: underline;
        }

        .modal_close{
            position: absolute;
            right: 20px;
            font-size: 25px; 
            top: 10px;
        }

        .revMore:hover, .qnaMore:hover{
            color: cornflowerblue;
            text-decoration: underline;
            cursor: pointer;
        }
        
        .creater_data:hover h5{
        	font-weight: bold;
        	color: #dc3545;
        }
        
        #stars .gr,#revU .gr{
	      color: gray;
	      cursor: pointer;
	    }
    </style>
</head>
<body>
    <!-- body 시작 -->

    <div id="lecture_detail">
        <!-- 배너 시작-->
        <section class="normal-breadcrumb set-bg" data-setbg="/resources/img/normal-breadcrumb.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="normal__breadcrumb__text">
                            <h2>{{lecDetails.ttl}}</h2>
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
                            <a href="/home" class="text-dark font-weight-bold"><i class="fa fa-home"></i> Home</a>
                            <a href="/lecS" class="text-dark font-weight-bold">강의</a>
                            <span>{{lecDetails.ttl}}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 카테고리 끝-->

        <!-- body 의 body-->
        <section class="blog spad">
            <div class="container">
                <div class="col-lg-12">
                    <div class="row mx-2 mb-4">
                        <div class="col-lg-8 pr-2">
                            <img :src="lecDetails.pht1" style="object-fit: cover; width: 100%; height: 500px;" alt="강의 이미지 1">
                        </div>
                        <div class="col-lg-4 p-0">
                            <img :src="lecDetails.pht2" class="pb-2" style="object-fit: cover; width: 100%; height: 250px;" alt="강의 이미지 2`">
                            <img :src="lecDetails.pht3" style="object-fit: cover; width: 100%; height: 250px;" alt="강의 이미지 3">
                        </div>
                    </div>
                    <hr class="font-weight-bold">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="row">
                                <div class="col-lg-8">
                                    <div class="row mx-5">
                                        <div class="col-lg-12">
                                            <div class="row mt-2 mb-3">
                                                <h5 class="font-weight-bold">{{lecDetails.creIntro}}</h5>
                                            </div>
                                            <div class="row d-flex justify-content-between mb-4">
                                                <div class="row ml-2">
                                                    <img class="rounded-circle" :src="lecDetails.pht" alt="크리에이터이미지" style="width: 75px; height: 75px">
                                                    <div class="d-flex align-items-center ml-3">
                                                        <h5 class="mb-0">{{lecDetails.name}}</h5>
                                                    </div>
                                                </div>
                                                <div class="d-flex align-items-center">
                                                    <i class="fa fa-plus"></i>
                                                     <a :href="'/creD?creId='+lecDetails.creId">
                                                        <h5 class="mb-0 ml-1">크리에이터 상세 정보</h5>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-lg-12 px-5">
                                            <ul class="lecture_ul">
                                                <li><a href="#lec_intro">강의 소개</a></li>
                                                <li><a href="#lec_lesson">커리큘럼</a></li>
                                                <li><a href="#lec_review">후기</a></li>
                                                <li><a href="#lec_kit">키트</a></li>
                                                <li><a href="#lec_qna">질문&답변</a></li>
                                                <li><a :href="'/lecN?ltNo='+lecDetails.ltNo">공지사항</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <hr class="mx-4">
                                    <div class="row">
                                        <div class="col-lg-12 px-5 mx-4">
                                            <div id="lec_intro" class="row">
                                                <div class="col-lg-12">
                                                    <h5 class="font-weight-bold my-2">강의소개</h5>
                                                    <p class="mx-2 mt-3 px-2 py-3" style="border-left:4px solid #dc3545">{{lecDetails.intro}}</p>
                                                    <h6 class="font-weight-bold mb-2 mx-4">&lt; OT영상 &gt;</h6>
                                                    <div v-if="lessonList.length !=0" class="row w-100">
    	                                             	<video controls controlsList="nodownload" style="display:block; width:100%; height: 100%">
		                                                    <source :src="lessonList[0].lsnFile" type="video/mp4">
													    </video>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr>
                                            <div id="lec_lesson" class="row">
                                                <div class="col-lg-12">
                                                    <div class="my-2 row mx-0">
                                                        <h5 class="font-weight-bold">커리큘럼</h5>
                                                        <p class="ml-2">총 {{lessonList .length}}개</p>
                                                    </div>
                                                    <div class="row mx-2">
                                                        <table class="table border-bottom border-left border-right">
                                                            <tbody>
                                                                <tr v-for="(lesson,index) in lessonList">
                                                                    <td width="10%" class="border-right text-center"> {{index+1}}</td>
                                                                    <td class="text-center">{{lesson.ttl}}</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr>
                                            <div id="lec_review" class="row">
                                                <div class="col-lg-12">
                                                    <h5 class="font-weight-bold my-2">후기</h5>
                                                    <div class="row mx-2 mt-3 mb-2">
                                                        <div class="d-flex align-items-center mr-2">
                                                            <i class="fa fa-star text-warning"></i>
                                                        </div>
                                                        <p class="mb-0">별점 평균 : 
                                                        	<i v-for="index in (length !=0 ?Math.round(avgStar/length):0)" class="fa fa-star text-warning"></i>
                                                        	<i v-for="index in 5-(length !=0 ?Math.round(avgStar/length):0)" class="fa fa-star-o text-warning"></i>
                                                        </p>
                                                        <p class="ml-2 mb-0"> 후기 갯수 : {{reviewList != null ? length : 0}}개</p>
                                                    </div>
                                                    <!-- 후기 이미 작성했으면 보이면 안됨 -->
                                                    <div v-if="myReview == null" class="row mx-3">
                                                        <div class="blog__details__form mb-4 pt-0 w-100">
                                                            <form onsubmit="return false">  
                                                                <div class="row mr-2 position-relative">
	                                                                <h5 v-on:mouseout="revOut" class="row text-center w-100 position-absolute" id="stars" style="bottom: 10px; left: 25px;">
															          <span v-on:mouseover="revOver" v-on:click="revClick" class="fas fa-star gr" data-num="0"></span>
															          <span v-on:mouseover="revOver" v-on:click="revClick" class="fas fa-star gr" data-num="1"></span>
															          <span v-on:mouseover="revOver" v-on:click="revClick" class="fas fa-star gr" data-num="2"></span>
															          <span v-on:mouseover="revOver"  v-on:click="revClick" class="fas fa-star gr" data-num="3"></span>
															          <span v-on:mouseover="revOver" v-on:click="revClick" class="fas fa-star gr" data-num="4"></span>
															        </h5>
                                                                    <textarea v-on:change="changeErr" class="border mb-0" rows="10" spellcheck="false"  placeholder="리뷰 작성..."></textarea>
                                                                    <button v-on:click="reviewInsert" class="btn btn-secondary position-absolute" style="bottom: 12px; right: 12px;">등록</button>
                                                                </div>
                                                                <div class="d-flex justify-content-end">
                                                                    <p class="lecErr d-none text-danger mb-0 mr-2">내용을 꼭 적어주셔야합니다.</p>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <!-- 후기 이미 작성한 경우 -->
                                                    <div v-if="myReview != null" class="row mx-2 mb-3">
                                                        <div class="col-lg-12 py-1 px-0" style="border: 0.125rem solid #fdb6b6f5;">
                                                            <div class="row ml-2 mr-1 mt-1">
                                                                <div class="col-lg-12 px-0">
                                                                    <div id="myStar">
                                                                        <div class="row mx-0">
                                                                            <div class="col-lg-1 px-0">
                                                                                <img class="rounded-circle" :src="myReview.pht" alt="프로필 사진" style="width: 50px; height: 50px;">
                                                                            </div>
                                                                            <div class="col-lg-9">
                                                                                <p class="mb-0 font-weight-bold">나</p>
                                                                                <div>
                                                                                    <i v-for="index in myReview.star" class="fa fa-star text-warning"></i>
                                                                                    <i v-for="index in 5-myReview.star" class="fa fa-star-o text-warning"></i>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="revD" class="row mx-3 my-2 pt-1">
                                                                            {{myReview.content}}
                                                                        </div>
                                                                        <div id="revU" class="row mx-3 my-2 pt-1 d-none position-rel position-relative">
                                                                        	<h3 class="row text-center position-absolute" style="bottom: -40px; left: 15px;">
																	        </h3>
                                                                        	<textarea v-on:change="updateErr" rows="3" cols="100">{{myReview.content}}</textarea>
                                                                        	<p class="w-100 text-right text-danger errDiv d-none mb-0">내용을 꼭 적어주셔야합니다.</p>
                                                                        	<input type="hidden" name="num" :value="myReview.rvNo">
                                                                        </div>
                                                                    </div>
                                                                    <div id="backBtn" class="row mx-0 justify-content-end">
                                                                        <button v-on:click="revBack(1)" class="btn btn-secondary mr-1 px-2 py-1" style="bottom: 45px; right: 12px;">수정</button>
                                                                        <button v-on:click="revDelete" class="btn btn-secondary px-2 py-1" style="bottom: 45px; right: 12px;">삭제</button>
                                                                    </div>
                                                                    <div id="upBtn" class="row mx-0 justify-content-end d-none">
                                                                        <button v-on:click="revUpdate" class="btn btn-secondary mr-1 px-2 py-1" style="bottom: 45px; right: 12px;">수정</button>
                                                                        <button v-on:click="revBack(0)" class="btn btn-secondary px-2 py-1" style="bottom: 45px; right: 12px;">취소</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- 남의 후기 다 보여줌-->
                                                    <div v-if="reviewList != null" v-for="review in reviewList " class="row mx-2 mb-3">
                                                        <div v-if="review.myReview == 'N'" class="col-lg-12 py-1 px-0" style="border: 0.125rem solid #afafaf;">
                                                            <div class="row mx-1 mt-2">
                                                                <div class="col-lg-12 px-0">
                                                                    <div class="revCopy">
                                                                        <div class="row mx-0">
                                                                            <div class="col-lg-2 px-0 d-flex justify-content-center">
                                                                                <img class="rounded-circle" :src="review.pht" alt="프로필 사진" style="width: 50px; height: 50px;">
                                                                            </div>
                                                                            <div class="col-lg-9 pl-0">
                                                                                <p class="mb-0">{{review.name}}</p>
                                                                                <div>
                                                                                    <i v-for="index in review.star" class="fa fa-star text-warning"></i>
                                                                                    <i v-for="index in 5-review.star" class="fa fa-star-o text-warning"></i>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div v-if="review.rvCode == 'RE01'" class="row mx-4 my-2 pt-1">
                                                                            {{review.content}}
                                                                        </div>
                                                                        <div v-if="review.rvCode == 'RE02'" class="row mx-4 my-2 pt-1 justify-content-center">
                                                                        	<p class="text-danger font-weight-bold">관리자에 의해 신고 처리된 리뷰입니다.</p>
                                                                        </div>
                                                                        <input type="hidden" name="num" :value="review.rvNo">
                                                                    </div>
                                                                    <div class="row mx-0 d-flex justify-content-end">
                                                                        <a id="rev_a" v-if="review.rvCode == 'RE01'" v-on:click="revCopy" data-toggle="modal" data-target="#revReport" class="text-muted rep_a" style="bottom: 45px; right: 12px;">신고</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div v-if="reviews != null" class="row d-flex justify-content-center">
                                                    	<span v-on:click="revMore"  v-bind:class="{'d-none':this.reviews.length > 3}"  class="revMore">더보기</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr>
                                            <div id="lec_kit" class="row">
                                                <div class="col-lg-12">
                                                    <h5 class="font-weight-bold my-2">키트 소개</h5>
                                                    <p class="mx-2">{{lecDetails.kitName}}</p>
                                                    <div class="mx-4 pl-2" style="border-left: 5px solid #070720;">
                                                        <p>{{lecDetails.kitIntro}}</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr>
                                            <div id="lec_qna" class="row">
                                                <div class="col-lg-12">
                                                    <h5 class="font-weight-bold my-2">질문 & 답변</h5>
                                                    <div class="blog__details__form pt-2 mx-3 mb-4 w-100">
                                                        <form onsubmit="return false">  
                                                            <div class="row mr-2 position-relative">
                                                                <textarea v-on:change="changeErr" class="border mb-0" name="" id=""rows="10" spellcheck="false"></textarea>
                                                                <button v-on:click="qnaInsert" class="btn btn-secondary position-absolute" style="bottom: 5px; right: 5px;">등록</button>
                                                            </div>
                                                            <div class="d-flex justify-content-end">
                                                                <p class="lecErr d-none text-danger mb-0 mr-2">내용을 꼭 적어주셔야합니다.</p>
                                                            </div>
                                                        </form>
                                                    </div>
                                                    <div class="row mx-0 mb-3">
                                                        <div class="col-lg-12">
                                                            <!-- 반복 내질문 상단 노출할려고 했는데 생각 보다 값이 많아서 안함-->
                                                            <div class="row mx-0">
                                                                <div class="col-lg-12">
                                                                    <div v-for="(qna , index) in qnaList " class="py-1 px-2 mb-5" style="border: 0.15rem solid #afafaf; border-radius: 15px;">
                                                                        <div class="qnaBox">
                                                                        	<div class="row col-12 justify-content-between pr-0">
	                                                                            <p class="font-weight-bold">Q. 
	                                                                            	<a class="qna_collapse text-dark" data-toggle="collapse" :href="'#collapse_' + index" >{{qna.name}}</a>
	                                                                            </p>
	                                                                        	<span v-if="qna.qnaStCode == 'Q01'" class="text-primary mt-1 font-weight-bold">미답변</span>
	                                                                        	<span v-if="qna.qnaStCode == 'Q02'" class="text-danger mt-1 font-weight-bold">답변완료</span>
                                                                        	</div>
                                                                            <p class="mx-2 qnaP">{{qna.qContent}}</p>
                                                                            <textarea v-on:change="updateErr" class="d-none w-100" rows="3">{{qna.qContent}}</textarea>
                                                                            <p class="text-right text-danger errDiv d-none mb-0">내용을 꼭 적어주셔야합니다.</p>
                                                                            <div v-if="qna.myQna =='Y'" class="row mx-0 justify-content-end upDiv">
                                                                            	<button v-if="qna.qnaStCode =='Q01'" class="btn btn-secondary mr-1 px-2 py-1" v-on:click="qnaUpt(1)" style="bottom: 45px; right: 12px;">수정</button>
                                                                                <button v-if="qna.qnaStCode =='Q01'" class="btn btn-secondary px-2 py-1" v-on:click="qnaDel(index)" style="bottom: 45px; right: 12px;">삭제</button>
                                                                            </div>
                                                                            <div class="row mx-0 justify-content-end d-none downDiv">
                                                                            	<button class="btn btn-secondary mr-1 px-2 py-1" v-on:click="qnaUpdate(index)" style="bottom: 45px; right: 12px;">수정</button>
                                                                                <button class="btn btn-secondary px-2 py-1" v-on:click="qnaUpt(-1)" style="bottom: 45px; right: 12px;">취소</button>
                                                                            </div>
                                                                        </div>
                                                                        <div v-if="qna.qnaStCode == 'Q02'" class="collapse" :id="'collapse_' + index">
                                                                            <p class="font-weight-bold">A. {{lecDetails.name}}</p>
                                                                            <p class="mx-2">{{qna.aContent}}</p>
                                                                        </div>
                                                                    </div>
                                                                    <div v-if="qnas != null" class="row d-flex justify-content-center">
                                                                        <span v-on:click="qnaMore"  v-bind:class="{'d-none':this.qnas.length > 5}"  class="qnaMore">더보기</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr class="mt-0">
                                                </div>
                                            </div>
                                        </div>
                                    </div>                            
                                </div>
                                <div class="col-lg-4 position-relative">
                                    <div class="col sticky-top" style="z-index: 10;">
                                        <div class="card" style="border:2px solid #212529; border-radius: 20px;">
                                            <div class="card-body">
                                                <div class="col-lg-12">
                                                    <div class="row">
                                                        <div class="col-lg-12 mt-1">
                                                            <div class="row pl-2">
                                                                <p>{{ctgrList.upName}} · {{ctgrList.name}}</p>
                                                            </div>
                                                            <div class="row pl-2">
                                                                <h5 class="font-weight-bold">{{lecDetails.ttl}}</h5>
                                                            </div>
                                                            <div class="row mt-3">
                                                                <div class="col-lg-12 px-2">
                                                                    <div v-if="lecDetails.kitName !=''" class="d-flex justify-content-between">
                                                                        <p>키트가격 :</p>
                                                                        <p class="mb-2">{{lecDetails.kitPrc}} 원</p>
                                                                    </div>
                                                                    <div class="d-flex justify-content-between">
                                                                        <p>전체 총 가격 : </p> 
                                                                        <p class="mb-4 text-right">{{lecDetails.prc + lecDetails.kitPrc}} 원</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                            	<div class="col-lg-12">
                                                            		<div class="row">
	                                                                	<a :href="'/user/lecP?ltNo='+lecDetails.ltNo" v-bind:class="{'disabled' : lecDetails.mySugang == 'Y'}" class="btn btn-danger w-100">결제</a>
                                                            		</div>
                                                            		<div class="row justify-content-end mt-1">
	                                                                	<small v-if="lecDetails.mySugang == 'Y'" class="font-weight-bold text-muted">해당 강의는 이미 수강중입니다.</small>
                                                            		</div>
                                                            	</div>
                                                            </div>
                                                            <div class="row mt-2 d-flex justify-content-end pr-2">
                                                                <p class="heart"><i v-bind:class="[lecDetails.wash=='Y' ? 'text-danger':'text-muted']" v-on:click="heartClick" class="fa fa-heart mr-1"></i> {{lecDetails.wCount}}</p>
                                                                <!-- 강의 신청한적없으면 신고안됨 -->
                                                                <p class="ml-3" data-toggle="modal" data-target="#lecReport"><i class="fa fa-ban text-muted mr-1"></i>신고</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>    
                                        </div>
                                        <div class="row d-flex justify-content-end mr-2 mt-2">
                                            <button class="btn btn-outline-dark" onclick="javascropt:history.back()">뒤로 가기</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 강의 신고 모달창 -->
            <div class="modal fade" id="lecReport" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header d-flex justify-content-center border-bottom-0" style="position: relative;">
                            <h5 class="font-weight-bold mt-2 text-danger">강의신고</h5>
                            <div class="modal_close" data-dismiss="modal"><i class="icon_close"></i></div>
                        </div>
                        <form id="rptLecFrm">
	                        <div class="modal-body border-bottom-0">
	                            <div class="col-lg-12">
	                                <div class="row d-flex justify-content-center mb-3">
	                                    <h5>강의 : <strong>{{lecDetails.ttl}}</strong></h5>
	                                </div>
	                                <div class="row product__page__title d-flex justify-content-center mb-0">
	                                    <div class="product__page__filter">
	                                        <p class="text-dark">신고 유형 :</p>
	                                        <select class="type" name="type" style="display: none;">
	                                            <option value="RPT01">부적절한 콘텐츠</option>
	                                            <option value="RPT02">피싱 또는 스팸</option>
	                                            <option value="RPT03">기타</option>
	                                        </select>
	                                        <div class="nice-select" tabindex="0">
	                                            <span class="current">부적절한 콘텐츠</span>
	                                            <ul class="list">
	                                                <li data-value="RPT01" class="option selected focus">부적절한 콘텐츠</li>
	                                                <li data-value="RPT02" class="option">피싱 또는 스팸</li>
	                                                <li data-value="RPT03" class="option">기타</li>
	                                            </ul>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="row d-flex justify-content-center">
	                                    <div v-for="(lesson,index) in lessonList" class="mr-2 lesson_check">
	                                        <input type="radio" name="num" :id="index+1" :value="index+1" spellcheck="false" ondblclick="this.checked=false">
	                                        <label :for="index+1" class="ml-1 mb-0">{{index + 1}}편</label>
	                                    </div>
	                                </div>
	                                <div class="row d-flex justify-content-end mb-3">
	                                    <div class="row mr-2">
	                                        <div class="d-flex align-items-center mr-1">
	                                            <i class="fa fa-exclamation-circle text-muted"></i>
	                                        </div>
	                                        <p class="mb-0 text-muted">신고는 수업1개 만 가능합니다.</p>
	                                    </div>
	                                </div>
	                                <div class="row">
	                                    <div class="blog__details__form pt-0 w-100">
	                                    	<div class="row ml-0 mr-1">
	                                        	<textarea v-on:change="changeErr" class="mb-0 border" name="content" cols="50" rows="8" spellcheck="false"></textarea>
	                                        </div>
	                                        <div class="d-flex justify-content-end">
	                                        	<p class="lecErr d-none text-danger mb-0 mr-2">신고 내용을 꼭 적어주셔야합니다.</p>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                            <input type="hidden" name="ltNo" value="${ltNo}">
	                        </div>
	                        <div class="modal-footer border-top-0">
	                            <button v-on:click="lecReport" type="button" class="btn btn-outline-secondary mr-2">신고</button>
	                            <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
	                        </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- 리뷰 신고 모달창 -->
            <div class="modal fade" id="revReport" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header d-flex justify-content-center border-bottom-0" style="position: relative;">
                            <h5 class="font-weight-bold mt-2 text-danger">리뷰신고</h5>
                            <div class="modal_close" data-dismiss="modal"><i class="icon_close"></i></div>
                        </div>
                        <form id="revRepFrm">
                        	<input type="hidden" name="ltNo" :value="lecDetails.ltNo">
	                        <div class="modal-body border-bottom-0">
	                            <div class="col-lg-12">
	                                <p class="font-weight-bold">신고 대상</p>
	                                <div class="row d-flex justify-content-center mb-3 border px-2 pt-4 pb-2">
	                                    <div class="report_object col-lg-11 px-0"></div>
	                                </div>
	                                <div class="row product__page__title ml-1 mb-0">
	                                    <div class="product__page__filter">
	                                        <p class="text-dark font-weight-bold">신고 유형 :</p>
	                                        <select class="type" name="type" style="display: none;">
	                                            <option value="RPT01">부적절한 콘텐츠</option>
	                                            <option value="RPT02">피싱 또는 스팸</option>
	                                            <option value="RPT03">기타</option>
	                                        </select>
	                                        <div class="nice-select" tabindex="0">
	                                            <span class="current">부적절한 콘텐츠</span>
	                                            <ul class="list">
	                                                <li data-value="RPT01" class="option selected focus">부적절한 콘텐츠</li>
	                                                <li data-value="RPT02" class="option">피싱 또는 스팸</li>
	                                                <li data-value="RPT03" class="option">기타</li>
	                                            </ul>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="row">
	                                    <div class="blog__details__form pt-0 w-100">
	                                        <div class="row ml-0 mr-1">
	                                            <textarea v-on:change="changeErr" name="content" class="mb-0 border content" rows="5" cols="50" spellcheck="false"></textarea>
	                                        </div>
	                                        <div class="d-flex justify-content-end">
	                                            <p class="lecErr d-none text-danger mb-0 mr-2">신고 내용을 꼭 적어주셔야합니다.</p>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="modal-footer border-top-0">
	                            <button v-on:click="revReport" type="button" class="btn btn-outline-secondary mr-2">신고</button>
	                            <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
	                        </div>
                        </form>
                    </div>
                </div>
            </div>

        </section>

    </div>
    <!-- body 의 body 끝 -->
    <!-- body 끝 -->
    <script>
        const lecD = Vue.createApp({
            data(){
                return{
                    lecDetails :{},
                    lessonList :[],
                    ctgrList : {},
                    reviews :[],
                    qnas :[],
                    reviewList :[],
                    qnaList :[],
                    myReview : null,
                    avgStar : 0,
                    length : 0
                }
            },
            computed:{
            	collapseId(no){
            		console.log(no);
            		return "collapse_"+ no;
            	},
            	collapseHref(no){
            		return "collapse_"+ no;
            	}
            },
            methods :{
            	brChg(val){
            		let resultVal = val;
            		resultVal = resultVal.replace(/\r\n/ig,'<br>');
            		resultVal = resultVal.replace(/\\n/ig,'<br>');
            		resultVal = resultVal.replace(/\n/ig,'<br>');
            		return resultVal;
            	},
            	updateErr(){
            		if($(event.target).val() ===''){
                        $(event.target).closest('div').find('.errDiv').removeClass('d-none');
                    }else{
                        $(event.target).closest('div').find('.errDiv').addClass('d-none');
                    }
            	},
            	qnaUpdate(index){
            		let path = $(event.target).closest('.qnaBox');
            		let content = $(event.target).closest('.qnaBox').find('textarea').val();
            		if(content == ''){
            			$(event.target).closest('.qnaBox').find('.errDiv').removeClass('d-none');
            		}else{
            			$(event.target).closest('.qnaBox').find('.errDiv').addClass('d-none');
            			 content = this.brChg(content);
	            		 $.ajax({
	            			url : '/user/updateMyqna',
	            			data : {qnaNo : this.qnaList[index].qnaNo, qContent : content },
	            			type : 'post',
	            			beforeSend : (xhr) =>{
	            			      xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            			},
	            		})
	            		.done(()=>{
		            		this.qnaList[index].qContent = content;
		            		path.find('.qnaP').removeClass('d-none');
		            		path.find('.upDiv').removeClass('d-none');
		            		path.find('textarea').addClass('d-none');
		            		path.find('.downDiv').addClass('d-none');
	            		}); 
            		}
            	},
            	qnaUpt(index){
            		if(index == 1){//text창 보여줌
            			$(event.target).closest('.qnaBox').find('.qnaP').addClass('d-none');
            			$(event.target).closest('.qnaBox').find('.upDiv').addClass('d-none');
            			$(event.target).closest('.qnaBox').find('textarea').removeClass('d-none');
            			$(event.target).closest('.qnaBox').find('.downDiv').removeClass('d-none');
            		}else if(index == -1){//text창 없앰
            			$(event.target).closest('.qnaBox').find('.qnaP').removeClass('d-none');
            			$(event.target).closest('.qnaBox').find('.upDiv').removeClass('d-none');
            			$(event.target).closest('.qnaBox').find('textarea').val($(event.target).closest('.qnaBox').find('.qnaP').text());
            			$(event.target).closest('.qnaBox').find('textarea').addClass('d-none');
            			$(event.target).closest('.qnaBox').find('.downDiv').addClass('d-none');
            		}
            	},
            	qnaDel(index){
            		let qnaNo = this.qnaList[index].qnaNo;
            		console.log(qnaNo);
            		$.ajax({
            			url : '/user/deleteMyqna',
            			data : {qnaNo : qnaNo},
            			type : 'post',
            			beforeSend : (xhr) =>{
            			      xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            			},
            		})
            		.done(()=>{
	            		this.qnaList.splice(index,1);
            		}) 
            	},
            	revBack(num){//수정으로 변경
            		if(num ==0){//춰소
            			$('#revU').addClass('d-none');
            			$('#revD').removeClass('d-none');
            			$('#upBtn').addClass('d-none');
            			$('#backBtn').removeClass('d-none');
            			$('#revU h3').empty();
            			$('#revU textarea').val();
            		}else if(num ==1){//수정 보여주기
            			$('#revU').removeClass('d-none');
            			$('#revD').addClass('d-none');
            			$('#upBtn').removeClass('d-none');
            			$('#backBtn').addClass('d-none');
                        for(var i =0 ; i < this.myReview.star; i++){
                        	$('#revU h3').append('<i class="fa fa-star text-warning" data-num="'+ i +'"></i>');
                        }
                        for(var i = this.myReview.star ; i < 5; i++){
                        	$('#revU h3').append('<i class="fa fa-star gr" data-num="'+ i +'"></i>');
                        }
                        $('#myStar h3 i').mouseover((e)=>{
                            const num = +e.currentTarget.dataset.num+1
                            const st = document.querySelectorAll('#myStar h3 i');
                            for(let i=0; i<num; i++){
                              $(st[i]).css('color','var(--warning)')
                            }
                          })
                          
                          $('#myStar h3').mouseout(()=>{
                        	  $('#myStar .gr').css('color','gray')
                          })
                          
                          $('#myStar h3 i').click((e)=>{
                            const num = +e.currentTarget.dataset.num+1;
                            const st = document.querySelectorAll('#myStar h3 i');
                            
                 	      	if($(e.target).hasClass("text-warning")){
                              //star 삭제
                       		  let num = $("#myStar h3 .text-warning").length -1;
                       		  let index = $("#myStar h3 .text-warning").index($(e.target));
                       		  for(var i = num; i >= index; i--){
                       			  $("#myStar h3 i").eq(i).removeClass("text-warning");
                       			  $("#myStar h3 i").eq(i).addClass("gr");
                        	  }
                        	 }else{
                        		//star 추가
                	            for(let i=0; i<num; i++){
                	              $(st[i]).removeClass('gr');
                	              $(st[i]).addClass('text-warning');
                	            }
                        	 }
                          })
            		}
            	},
            	revUpdate(){//리뷰수정
            		let content = $('#revU textarea').val();
            		if(content == ''){
            			$('#revU .errDiv').removeClass('d-none');
            		}else{
            			$('#revU .errDiv').addClass('d-none');       
            			content = this.brChg(content);
	            		$.ajax({
	            	  		url : '/user/updateReview',
	            	  		type : 'post',
	        	  	    	beforeSend : (xhr) =>{
	        	  			  xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        	  			},
	        	  			data : {
	        	  				rvNo : $('#revU input').val(), 
	        	  				content: content, 
	        	  				star: $('#revU h3 .text-warning').length
	        	  			}
	            	  	})
	            	  	.done(()=>{
	            	  		alert('해당 리뷰가 수정되었습니다.');
	            	  		this.avgStar = this.avgStar - this.myReview.star + $('#revU h3 .text-warning').length;
	            	  		this.myReview.content = $('#revU textarea').val();
	            	  		this.myReview.star = $('#revU h3 .text-warning').length;
	            	  		$('#revU').addClass('d-none');
	            			$('#revD').removeClass('d-none');
	            			$('#upBtn').addClass('d-none');
	            			$('#backBtn').removeClass('d-none');
	            			$('#revU h3').empty();
	            			$('#revU textarea').val();
	            	  	})
            		}
            	},
            	revDelete(){//리뷰삭제
            	 	$.ajax({
                		url : '/user/deleteReview',
                		data : {rvNo : $('#revU input').val()},
                		type : 'post',
                		beforeSend : (xhr) =>{
                		      xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                		  	},
                	})
                	.done(()=>{
            	  		alert('해당 리뷰가 삭제되었습니다.');
            	  		this.length -=1;
            	  		this.avgStar -= this.myReview.star;
            	  		this.myReview=null;
            	  	})   
            	},
            	revOver(e){
            		const num = +e.currentTarget.dataset.num+1
    	            const st = document.querySelectorAll('#stars>span');
    	            for(let i=0; i<num; i++){
    	              $(st[i]).css('color','var(--warning)')
    	            }
            	},
            	revOut(){
            		$('#stars .gr').css('color','gray')
            	},
            	revClick(e){
            		const num = +e.currentTarget.dataset.num+1;
    	            const st = document.querySelectorAll('#stars>span');
    	            
    	 	      	if($(e.target).hasClass("selected")){
    	              //star 삭제
    	       		  let num = $("#stars .selected").length -1;
    	       		  let index = $("#stars .selected").index($(e.target));
    	       		  console.log(num);
    	       		  console.log(index);
    	       		  for(var i = num; i >= index; i--){
    	       			  $("#stars>span").eq(i).removeClass("selected");
    	       			  $("#stars>span").eq(i).addClass("gr");
    	        	  }
    	        	 }else{
    	        		//star 추가
    		            for(let i=0; i<num; i++){
    		              $(st[i]).removeClass('gr');
    		              $(st[i]).addClass('selected');
    		            }
    	        	 }         		
            	},
                heartClick(){
                    let ltNo = this.lecDetails.ltNo;
                    let sum = 0;
                    let wash = '';
                    let heartPath = '';
                    let heart = event.target;
                    console.log(ltNo);
                  	if(this.lecDetails.wash == 'N'){
                    	console.log('추가');
                    	sum = 1;
                    	wash ='Y';
                        heartPath = '/user/heartInsert';
                    }else{
                  		console.log('삭제');
                        sum = -1;
                        wash ='N';
                        heartPath = '/user/heartDelete';
                    }
                    $.ajax({
                    	url : heartPath,
                    	type : "POST",
                    	data :{
                    		ltNo: ltNo,
                    	},
                    	beforeSend: function(xhr) {
                			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                		}
                    })
                    .done((result)=> {
                    	if(result == 'Y'){
                        	this.lecDetails.wCount +=sum;
                        	this.lecDetails.wash = wash;
                    	}else{
                    		alert("찜하기 위해 로그인해주세요");
                    		location.href="/customLogin";
                    	}
                    });   
                },
                reviewInsert(){//리뷰등록
                	let content = $(event.target).closest('div').find('textarea').val()
                    if(content == ''){
                    	$(event.target).closest('form').find('.lecErr').removeClass('d-none');
                    }else{
                    	if(this.lecDetails.mySugang == 'N'){
                    		alert("리뷰 작성을 위해 먼저 강의를 신청하셔야 합니다.");
                    		return;
                    	}
                    	content = this.brChg(content);
                    	$.ajax({
                    	  url : '/user/userLRWrite',
                      	  data : {writer : '', ltNo : '${ltNo}', star: $('.fas.selected').length, content: content},
                      	  type : 'post',
                      	  beforeSend : (xhr) =>{
                  		      xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                  		  }
                    	})
                    	.done((result)=> {
                        	if(result == 'ok'){
                        		alert('리뷰가 등록되었습니다.');
                        		location.href ="/lecD?ltNo="+'${ltNo}'
                        	}
                        }); 
                    }
                },
                qnaInsert(){//질문 등록
                	let content = $(event.target).closest('div').find('textarea').val()
                    if(content == ''){
                    	$(event.target).closest('form').find('.lecErr').removeClass('d-none');
                    }else{
                    	if(this.lecDetails.mySugang == 'N'){
                    		alert("질문 작성을 위해 먼저 강의를 신청하셔야 합니다.");
                    		return;
                    	}
                    	content = this.brChg(content);
                    	$.ajax({
                            url: '/user/userInsertLQ',
                            data: {
                                qContent: content,
                                ltNo: '${ltNo}'
                            },
                            method: 'post',
                            beforeSend: (xhr) => {
                              xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                            },
                        })
                        .done((r) => {
                        	alert('질문이 등록되었습니다.');
                    		location.href ="/lecD?ltNo="+'${ltNo}'
                        })
                    }
                },
                lecReport(){//강의신고
                    let content = $('#lecReport textarea').val();
                    if( content == ''){//빈칸체크
                    	$(event.target).closest('form').find('.lecErr').removeClass('d-none');

                    }else{
                    	if(this.lecDetails.mySugang == 'N'){//수강신청자 여부
                    		alert("강의 신고을 위해 먼저 강의를 신청하셔야 합니다.");
                    		$('#lecReport').modal('hide');
                    		$('#lecReport textarea').val('');
                    		return;
                    	}
                    	$('#lecReport textarea').val(this.brChg($('#lecReport textarea').val()));
                    	$.ajax({
                            url: '/user/insertLecReport',
                            data: $('#rptLecFrm').serialize(),
                            method: 'post',
                            beforeSend: (xhr) => {
                              xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                            },
                        })
                        .done((r) => {
                        	$('#lecReport').modal('hide');
                    		$('#lecReport textarea').val('');
                        	alert("해당 강의를 신고하셨습니다.");
                        })
                    }
                },
                revReport(){//리뷰신고
                    if($('#revReport textarea').val() != ''){//빈칸체크
                    	$('#revReport textarea').val(this.brChg($('#revReport textarea').val()));
                    	$.ajax({
                    		url : '/user/reportReview',
                    		data: $('#revRepFrm').serialize(),
                    		method: 'post',
                    		beforeSend: (xhr) => {
                                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                            }
                    	})
                    	.done((r)=>{
                    		console.log(r);
                    		if(r){
								alert("리뷰를 신고하기 전에 로그인하셔야 합니다.");
								location.href="/customLogin";
                    		}else{
	                    		$('#revReport').modal('hide');
	                    		$('#revReport textarea').val('');
	                        	alert("해당 리뷰를 신고하셨습니다.");
                    		}
                    	})

                    }else{
                    	$(event.target).closest('form').find('.lecErr').removeClass('d-none');
                    }
                },
                revCopy(){//모달창에 신고대상 리뷰 복사
                    $('.report_object').html($($(event.target).closest('div.col-lg-12').find('.revCopy')).html());
                },
                revMore(){
                	if(this.reviews !=null){
	                	if(this.reviews.length > 3){
	                		for (var i = 0; i < 3; i++) {
		                        this.reviewList.push(this.reviews[i]);
							}
	                		this.reviews = this.reviews.slice(3);
	                	}else{
	                		this.reviewList = this.reviewList.concat(this.reviews);
	                		this.reviews = null;
	                	}
                	}else{
                		this.reviewList = null;
                	}
                },
                qnaMore(){
                	if(this.qnas !=null){
	                	if(this.qnas.length > 5){
	                		for (var i = 0; i < 5; i++) {
		                        this.qnaList.push(this.qnas[i]);
							}
	                		this.qnas = this.qnas.slice(5);
	                	}else{
	                		this.qnaList = this.qnaList.concat(this.qnas);
	                		this.qnas = null;
	                	}
                	}else{
                		this.qnaList = [];
                	}
                },
                changeErr(){//빈칸일 시에 에러문장 보이도록 설정
                    if($(event.target).val() ===''){
                        $(event.target).closest('form').find('.lecErr').removeClass('d-none');
                    }else{
                        $(event.target).closest('form').find('.lecErr').addClass('d-none');
                    }
                }
            },
             beforeCreate : function(){
                fetch('/lectureDetail?ltNo='+'${ltNo}')
                .then(response => response.json())
                .then(result => {
                	this.lecDetails = result.lectureDetail;
                	this.lessonList = result.lessonList;
                	
                	this.qnas = result.ltQnaList;
                	this.qnaMore();
                	
                	this.ctgrList = result.ctgrList[0];
                	
                	this.length = result.reviewList.length;
                	if(result.reviewList != null){
	                	for(var i = 0; i < result.reviewList.length; i++){
	                		console.log(result.reviewList[i].star)
	                		this.avgStar = this.avgStar + result.reviewList[i].star;
	            			if(result.reviewList[i].myReview =='Y'){
	            				this.myReview = result.reviewList[i];
	            			 	result.reviewList.splice(i,1);
	            			 	i--;
	            			}
	            		}
                	} 
                	this.reviews = result.reviewList;
                	this.revMore(); 
                })
            } 
            
        });

        const mountLecD = lecD.mount('#lecture_detail');
    </script>
</body>
</html>