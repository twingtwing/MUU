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

        .fa-ban:hover,.fa-heart:hover{
            cursor: pointer;
        }

        .qna_collapse{
            color: black;
        }

        .qna_collapse:hover{
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
                            <a href="#" class="text-dark font-weight-bold"><i class="fa fa-home"></i> Home</a>
                            <a href="#" class="text-dark font-weight-bold">강의</a>
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
                            <img src="/resources/img/blog/blog-1.jpg" style="object-fit: cover; width: 100%; height: 500px;" alt="강의 이미지 1">
                        </div>
                        <div class="col-lg-4 p-0">
                            <img src="/resources/img/blog/blog-2.jpg" class="pb-2" style="object-fit: cover; width: 100%; height: 250px;" alt="강의 이미지 2`">
                            <img src="/resources/img/blog/blog-3.jpg" style="object-fit: cover; width: 100%; height: 250px;" alt="강의 이미지 3">
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
                                                    <img class="rounded-circle" src="/resources/img/blog/blog-4.jpg" alt="크리에이터이미지" style="width: 75px;">
                                                    <div class="d-flex align-items-center ml-3">
                                                        <h5 class="mb-0">{{lecDetails.name}}</h5>
                                                    </div>
                                                </div>
                                                <div class="d-flex align-items-center">
                                                    <i class="fa fa-plus"></i>
                                                     <a href="/creD">
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
                                                <li><a href="/lecN">공지사항</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <hr class="mx-4">
                                    <div class="row">
                                        <div class="col-lg-12 px-5 mx-4">
                                            <div id="lec_intro" class="row">
                                                <div class="col-lg-12">
                                                    <h5 class="font-weight-bold my-2">강의소개</h5>
                                                    <p class="mx-2 py-2">{{lecDetails.intro}}</p>
                                                    <h6 class="font-weight-bold mb-2 mx-4">&lt; OT영상 &gt;</h6>
                                                    <video class="mx-3" src="resourecs/videos/1.mp4"></video>
                                                    <!-- lesson영상 가장 처음꺼 쓰면 됨 -->
                                                </div>
                                            </div>
                                            <hr>
                                            <div id="lec_lesson" class="row">
                                                <div class="col-lg-12">
                                                    <div class="my-2 row mx-0">
                                                        <h5 class="font-weight-bold">커리큘럼</h5>
                                                        <p class="ml-2">총 {{lecDetails.lessons.length}}개</p>
                                                    </div>
                                                    <div class="row mx-2">
                                                        <table class="table border-bottom border-left border-right">
                                                            <tbody>
                                                                <tr v-for="(lesson,index) in lecDetails.lessons">
                                                                    <td> {{index+1}}. {{lesson.ttl}}</td>
                                                                    <td width="15%">{{lesson.time}}분</td>
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
                                                        <p class="mb-0">후기 총점 : ?점</p>
                                                        <p class="ml-2 mb-0">후기 갯수 : {{lecDetails.reviews.length}}개</p>
                                                    </div>
                                                    <!-- 후기 이미 작성했으면 보이면 안됨 -->
                                                    <div class="row mx-3">
                                                        <div class="blog__details__form mb-4 pt-0 w-100">
                                                            <form onsubmit="return false">  
                                                                <div class="row mr-2 position-relative">
                                                                    <textarea v-on:change="changeErr" class="border mb-0" rows="10" spellcheck="false"  placeholder="리뷰작성..."></textarea>
                                                                    <button v-on:click="reviewInsert" class="btn btn-secondary position-absolute" style="bottom: 12px; right: 12px;">등록</button>
                                                                </div>
                                                                <div class="d-flex justify-content-end">
                                                                    <p class="lecErr d-none text-danger mb-0 mr-2">내용을 꼭 적어주셔야합니다.</p>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <!-- 후기 이미 작성한 경우-->
                                                    <div class="row mx-2 mb-3">
                                                        <div class="col-lg-12 px-0">
                                                            <div class="row mx-2">
                                                                <div class="col-lg-12 px-0">
                                                                    <div>
                                                                        <div class="row mx-0">
                                                                            <div class="col-lg-2">
                                                                                <img class="rounded-circle" src="/resources/img/anime/details-pic.jpg" alt="프로필 사진" style="width: 50px; height: 50px;">
                                                                            </div>
                                                                            <div class="col-lg-9">
                                                                                <p class="mb-0">내 이름</p>
                                                                                <div>
                                                                                    <i class="fa fa-star text-warning"></i>
                                                                                    <i class="fa fa-star text-warning"></i>
                                                                                    <i class="fa fa-star text-warning"></i>
                                                                                    <i class="fa fa-star-o text-warning"></i>
                                                                                    <i class="fa fa-star-o text-warning"></i>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row mx-3 my-2 pt-1">
                                                                            후기 내용
                                                                        </div>
                                                                    </div>
                                                                    <div class="row mx-0 d-flex justify-content-end">
                                                                        <button class="btn btn-secondary mr-2" style="bottom: 45px; right: 12px;">수정</button>
                                                                        <button class="btn btn-secondary" style="bottom: 45px; right: 12px;">삭제</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- 남의 후기 다 보여줌-->
                                                    <div v-for="review in lecDetails.reviews" class="row mx-2 mb-3">
                                                        <div class="col-lg-12 px-0">
                                                            <div class="row mx-2">
                                                                <div class="col-lg-12 px-0">
                                                                    <div class="revCopy">
                                                                        <div class="row mx-0">
                                                                            <div class="col-lg-2">
                                                                                <img class="rounded-circle" src="/resources/img/anime/details-pic.jpg" alt="프로필 사진" style="width: 50px; height: 50px;">
                                                                            </div>
                                                                            <div class="col-lg-9">
                                                                                <p class="mb-0">{{review.name}}</p>
                                                                                <div>
                                                                                    <i v-for="index in review.star" class="fa fa-star text-warning"></i>
                                                                                    <i v-for="index in 5-review.star" class="fa fa-star-o text-warning"></i>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row mx-3 my-2 pt-1">
                                                                            {{review.content}}
                                                                        </div>
                                                                    </div>
                                                                    <div class="row mx-0 d-flex justify-content-end">
                                                                        <!-- 비회원일경우 보이면 안됨 -->
                                                                        <button v-on:click="revCopy" data-toggle="modal" data-target="#revReport" class="btn btn-secondary" style="bottom: 45px; right: 12px;">신고</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div v-if="lecDetails.reviews.length > 0" class="row d-flex justify-content-center">
                                                        <span v-on:click="revMore" v-if="lecDetails.reviews[0].count > 5" class="revMore">더보기</span>
                                                    </div>
                                                    <!-- 더보기버튼 -->
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
                                                    <div class="blog__details__form pt-2 mx-3 w-100">
                                                        <form onsubmit="return false">  
                                                            <div class="row mr-2 position-relative">
                                                                <textarea class="border" name="" id=""rows="10" spellcheck="false"></textarea>
                                                                <button class="btn btn-secondary position-absolute" style="bottom: 45px; right: 12px;">등록</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                    <div class="row mx-0 mb-3">
                                                        <div class="col-lg-12">
                                                            <!-- 반복 -->
                                                            <div class="row mx-0">
                                                                <div class="col-lg-12">
                                                                    <div v-for="(qna,index) in lecDetails.Qnas" class="mb-5">
                                                                        <div>
                                                                            <p>Q. <a class="qna_collapse text-dark" data-toggle="collapse" :href="`#qna_${index}`" >{{qna.name}}</a></p>
                                                                            <p class="mx-2">{{qna.qContent}}</p>
                                                                            <div class="d-flex justify-content-end">
                                                                                <button class="btn btn-secondary" style="bottom: 45px; right: 12px;">삭제</button>
                                                                            </div>
                                                                        </div>
                                                                        <div class="collapse" :id="`qna_${index}`">
                                                                            <p>A. {{lecDetails.name}}</p>
                                                                            <p class="mx-2">{{qna.aContnet}}</p>
                                                                        </div>
                                                                    </div>
                                                                    <div v-if="lecDetails.Qnas.length > 0" class="row d-flex justify-content-center">
                                                                        <span v-on:click="qnaMore" v-if="lecDetails.Qnas[0].count > 5" class="qnaMore">더보기</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- 더보기 버튼 -->
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
                                                                <p>{{lecDetails.upCtgr}} · {{lecDetails.downCtgr}}</p>
                                                            </div>
                                                            <div class="row pl-2">
                                                                <h5 class="font-weight-bold">{{lecDetails.ttl}}</h5>
                                                            </div>
                                                            <div class="row mt-3">
                                                                <div class="col-lg-12 px-2">
                                                                    <div class="d-flex justify-content-between">
                                                                        <p>키트가격 :</p>
                                                                        <p class="mb-2">{{lecDetails.kitPrc}} 원</p>
                                                                    </div>
                                                                    <div class="d-flex justify-content-between">
                                                                        <p>전체 총 가격 : </p> 
                                                                        <p class="mb-4 text-right">{{lecDetails.prc}} 원</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <button onclick="location.href='/lecP'" class="btn btn-danger w-100">구매</button>
                                                            </div>
                                                            <div class="row mt-2 d-flex justify-content-end pr-2">
                                                                <p class="heart"><i v-bind:class="[lecDetails.wash ? 'text-danger':'text-muted']" v-on:click="heartClick" class="fa fa-heart mr-1"></i> 찜</p>
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
                        <div class="modal-body border-bottom-0">
                            <div class="col-lg-12">
                                <div class="row d-flex justify-content-center mb-3">
                                    <h5>강의 : <strong>{{lecDetails.ttl}}</strong></h5>
                                </div>
                                <div class="row product__page__title d-flex justify-content-center mb-0">
                                    <div class="product__page__filter">
                                        <p class="text-dark">신고 유형 :</p>
                                        <select class="ctgr" style="display: none;">
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
                                    <div v-for="(lesson,index) in lecDetails.lessons" class="mr-2 lesson_check">
                                        <input type="radio" name="num" :id="[index]" :value="[index]" spellcheck="false" ondblclick="this.checked=false">
                                        <label :for="[index]" class="ml-1 mb-0">{{index}}편</label>
                                    </div>
                                </div>
                                <div class="row d-flex justify-content-end mb-3">
                                    <div class="row mr-2">
                                        <div class="d-flex align-items-center mr-1">
                                            <i class="fa fa-exclamation-circle  text-muted"></i>
                                        </div>
                                        <p class="mb-0 text-muted">신고는 수업1개 만 가능합니다.</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="blog__details__form pt-0 w-100">
                                        <form onsubmit="return false">  
                                            <div class="row ml-0 mr-1">
                                                <textarea v-on:change="changeErr" class="mb-0 border content" rows="10" spellcheck="false"></textarea>
                                            </div>
                                            <div class="d-flex justify-content-end">
                                                <p class="lecErr d-none text-danger mb-0 mr-2">신고 내용을 꼭 적어주셔야합니다.</p>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer border-top-0">
                            <button v-on:click="lecReport" type="button" class="btn btn-outline-secondary mr-2">신고</button>
                            <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
                        </div>
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
                        <div class="modal-body border-bottom-0">
                            <div class="col-lg-12">
                                <p class="font-weight-bold">신고 대상</p>
                                <div class="row d-flex justify-content-center mb-3 border px-2 pt-4 pb-2">
                                    <div class="report_object col-lg-12 px-0"></div>
                                </div>
                                <div class="row product__page__title ml-1 mb-0">
                                    <div class="product__page__filter">
                                        <p class="text-dark font-weight-bold">신고 유형 :</p>
                                        <select class="ctgr" style="display: none;">
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
                                        <form onsubmit="return false">  
                                            <div class="row ml-0 mr-1">
                                                <textarea v-on:change="changeErr" class="mb-0 border content" rows="10" spellcheck="false"></textarea>
                                            </div>
                                            <div class="d-flex justify-content-end">
                                                <p class="lecErr d-none text-danger mb-0 mr-2">신고 내용을 꼭 적어주셔야합니다.</p>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer border-top-0">
                            <button v-on:click="revReport" type="button" class="btn btn-outline-secondary mr-2">신고</button>
                            <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
                        </div>
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
                    revNum : 1,
                    qnaNum : 1,
                    lecDetails :{}
                }
            },
            methods :{
                heartClick(){//워시리스트 추가 혹은 삭제
                    if($(event.target).hasClass('text-muted')){
                        console.log('추가');
                        //추가 fetch
                    }else{
                        console.log('삭제');
                        //삭제 fetch
                    }
                    $(event.target).toggleClass('text-muted');
                    $(event.target).toggleClass('text-danger');
                    
                },
                reviewInsert(){//리뷰등록
                    if($(event.target).closest('div').find('textarea').val() != ''){
                        console.log($(event.target).closest('div').find('textarea').val());
                    }
                },
                revCopy(){//모달창에 신고대상 리뷰 복사
                    let copy = $($(event.target).closest('div.col-lg-12').find('.revCopy')).clone();
                    $('.report_object').html(copy);
                },
                revReport(){//리뷰신고
                    //빈칸체크
                    if($('#lecReport #content').val() != ''){
                        console.log($('#revReport .ctgr').val()); //신고카테고리
                        console.log($('#revReport .content').val()); //신고내용

                        //fetch
                        //결과 : 신고성공알람과 모달창이 닫아져야함

                    }
                },
                revMore(){
                    //this.lecDetails.reviews[0].count
                    if(this.revNum < (this.lecDetails.reviews[0].count)/5){
                        this.revNum ++;
                        //fetch 후에 push
                        this.lecDetails.reviews.push(
                            {name:'이름3',content:'내용3',star:1,count:7},
                            {name:'이름4',content:'내용4',star:2,count:7}
                            );
                        if(!(this.revNum < (this.lecDetails.reviews[0].count)/5)){
                            $('.revMore').addClass('d-none')
                        }
                    }
                },
                qnaMore(){
                    if(this.qnaNum < (this.lecDetails.Qnas[0].count)/5){
                        this.qnaNum ++;
                        //fetch 후에 push
                        this.lecDetails.Qnas.push(
                            {qnaNo:6, name:'작성자6',qContent:'질문6',aContnet:'답변6',count:7},
                            {qnaNo:7, name:'작성자7',qContent:'질문7',aContnet:'답변7',count:7}
                        );
                        if(!(this.qnaNum < (this.lecDetails.Qnas[0].count)/5)){
                            $('.qnaMore').addClass('d-none')
                        }
                    }
                },
                lecReport(){//강의신고
                    //빈칸체크
                    if($('#lecReport #content').val() != ''){
                        console.log($('#lecReport .ctgr').val()); //신고카테고리
                        console.log($('#lecReport input[name="num"]').val()); //신고수업
                        console.log($('#lecReport .content').val()); //신고내용

                        //fetch
                        //결과 : 신고성공알람과 모달창이 닫아져야함

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
            beforeMount : function(){
            	console.log('${ltNo}');
                /*
                beforeCreate

                fetch("../전부가져오기")
                .then(response => response.json())
                .then(result => {this.lecDetails = result;})
                */
                //찜 여부와 갯수?
                this.lecDetails = {
                    id:'id',//cre_id로 변경
                    name :'크리에이터 이름',
                    creIntro : '크리에이터 소개',
                    ttl:'강의이름들어감',
                    intro : '강의 소개!!',
                    upCtgr : '카테고리번호?',
                    downCtgr : '상세번호?',
                    prc : '총합 더해야함',
                    kitName : '키트 이름',
                    kitIntro : '키트 소개',
                    kitPrc : '키트가격',
                    wash : true,
                    lessons :[
                        {ttl : '강의 1편',time:'30'},
                        {ttl : '강의 2편',time:'30'},
                        {ttl : '강의 3편',time:'30'},
                        {ttl : '강의 4편',time:'60'}
                    ],
                    // 내 리뷰만 따로 갖고 오거나
                    //내 리뷰만 가장 위로 order by해서 가져와야함
                    //다른사람 리뷰는 5개씩 들고오기
                    reviews : [
                        // count에 리뷰 총 갯수 나와야함
                        {name:'이름1',content:'내용',star:3,count:7},
                        {name:'이름1',content:'내용',star:3,count:7},
                        {name:'이름1',content:'내용',star:3,count:7},
                        {name:'이름1',content:'내용',star:3,count:7},
                        {name:'이름2',content:'내용2',star:4,count:7}
                    ],
                    Qnas : [
                        // count에 질문답변 총 갯수 나와야함
                        {qnaNo:1, name:'작성자1',qContent:'질문1',aContnet:'답변1',count:7},
                        {qnaNo:2, name:'작성자2',qContent:'질문2',aContnet:'답변2',count:7},
                        {qnaNo:1, name:'작성자1',qContent:'질문1',aContnet:'답변1',count:7},
                        {qnaNo:2, name:'작성자2',qContent:'질문2',aContnet:'답변2',count:7},
                        {qnaNo:3, name:'작성자3',qContent:'질문3',aContnet:'답변3',count:7}
                    ]
                };
            }
            
        });

        const mountLecD = lecD.mount('#lecture_detail');
    </script>
</body>
</html>