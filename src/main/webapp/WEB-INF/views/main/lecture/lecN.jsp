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

        .modal_close{
            position: absolute;
            right: 20px;
            font-size: 25px; 
            top: 10px;
        }

        .noticeMore:hover{
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
                                            <div class="row mt-2 mb-3" style="border-left:4px solid black">
                                            	<div class="col-lg-12">
                                            	<h5 class="font-weight-bold my-2">크리에이터 소개</h5>
                                                <p class="mt-3" v-html="lecDetails.creIntro"></p>
                                            	</div>
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
                                                <li><a :href="'/lecD?ltNo='+lecDetails.ltNo+'#lec_intro'">강의 소개</a></li>
                                                <li><a :href="'/lecD?ltNo='+lecDetails.ltNo+'#lec_lesson'">커리큘럼</a></li>
                                                <li><a :href="'/lecD?ltNo='+lecDetails.ltNo+'#lec_review'">후기</a></li>
                                                <li><a :href="'/lecD?ltNo='+lecDetails.ltNo+'#lec_kit'">키트</a></li>
                                                <li><a :href="'/lecD?ltNo='+lecDetails.ltNo+'#lec_qna'">질문&답변</a></li>
                                                <li><a href="#">공지사항</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <hr class="mx-4">
                                    <div class="row mx-4">
                                        <div class="col-lg-12">
                                            <h5 class="font-weight-bold my-2">공지사항</h5>
                                            <h4 class="font-weight-bold text-muted my-2 text-center" v-if="noticeList.length == 0">현재 업로드된 공지사항이 없습니다.</h4>
                                            <!-- 반복 -->
                                            <div v-for="notice in noticeList" class="card mt-3">
                                                <div class="card-body">
                                                    <div class="col-lg-12">
                                                        <div>
                                                            <div class="row d-flex justify-content-between">
                                                                <h6 class="font-weight-bold">{{notice.ttl}}</h6>
                                                            <div class="row">
                                                                <p class="mr-2 mb-1 text-muted">조회수 :</p>
                                                                <p class="mr-3 mb-1 text-muted">{{notice.hits}}</p>
                                                            </div>
                                                            </div>
                                                            <div class="row my-3">
                                                                <p v-html="notice.content"></p>
                                                            </div>
                                                            <div v-if="notice.fileList.length != 0" class="row">
                                                                <div class="d-flex align-items-center">
                                                                    <i class="fa fa-download"></i>
                                                                </div>
                                                                <p v-for="file in notice.fileList" class="mb-0 ml-2">
                                                                    <a :href="'/download?phyPath='+file.phyPath"> {{file.filePath}}</a>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="d-flex justify-content-center mt-3" v-if="moreNotice.length > 0">
                                                <span v-on:click="noticeMore" class="noticeMore font-weight-bold">더보기</span>
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
                                                                    <div v-if="lecDetails.kitName != null" class="d-flex justify-content-between">
                                                                        <p>키트가격 :</p>
                                                                        <p class="mb-2">{{commakitPrc}} 원</p>
                                                                    </div>
                                                                    <div class="d-flex justify-content-between">
                                                                        <p>전체 총 가격 : </p> 
                                                                        <p class="mb-4 text-right">{{commaPrc}} 원</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                            	<div class="col-lg-12">
                                                            		<div class="row">
	                                                                	<a :href="'/user/lecP?ltNo='+lecDetails.ltNo" v-bind:class="{'disabled' : id == lecDetails.creId || lecDetails.mySugang == 'Y'}" class="btn btn-danger w-100">결제</a>
                                                            		</div>
                                                            		<div class="row justify-content-end mt-1">
	                                                                	<small v-if="lecDetails.mySugang == 'Y'" class="font-weight-bold text-muted">해당 강의는 이미 수강중입니다.</small>
	                                                                	<small v-if="id == lecDetails.creId" class="font-weight-bold text-muted">본인의 강의는 수강이 불가능합니다.</small>
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
        </section>
    </div>
    
    <script>
                const lecD = Vue.createApp({
            data(){
                return{
                	lecDetails :{},
                	ctgrList : {},
                	noticeList : [],
                	moreNotice : [],
                	id : '',
                }
            },
            computed:{
            	commakitPrc(){
            		if(this.lecDetails.kitName !== null){
	            		return String(this.lecDetails.kitPrc).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            		}else{
            			return '';
            		}
            	},
            	commaPrc(){
            		let val = 0;
            		if(this.lecDetails.kitName !== null){
            			val = Number(this.lecDetails.prc) + Number(this.lecDetails.kitPrc);
            			console.log(val);
            		}else{
            			val = Number(this.lecDetails.prc);
            		}
            		return String(val).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            	}
            },
            methods :{
            	heartClick(){
            		event.stopPropagation() ;
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
                lecReport(){//강의신고
                    let content = $('#lecReport textarea').val();
                    if( content == ''){//빈칸체크
                    	$(event.target).closest('form').find('.lecErr').removeClass('d-none');

                    }else{
                    	if(this.id == null){
                    		alert("강의 신고을 위해 먼저 로그인 하셔야합니다.");
                    		location.href="/customLogin";
                    		return ;
                    	}
                    	if(this.lecDetails.mySugang == 'N'){//수강신청자 여부
                    		alert("강의 신고을 위해 먼저 강의를 신청하셔야 합니다.");
                    		$('#lecReport').modal('hide');
                    		$('#lecReport textarea').val('');
                    		return;
                    	}
                    	console.log(this.lecDetails.mySugang);
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
                changeErr(){//빈칸일 시에 에러문장 보이도록 설정
                    if($(event.target).val() ===''){
                        $(event.target).closest('form').find('.lecErr').removeClass('d-none');
                    }else{
                        $(event.target).closest('form').find('.lecErr').addClass('d-none');
                    }
                },
                noticeMore(){
                	if(this.moreNotice.length > 5){
                		this.noticeList = this.noticeList.concat(this.moreNotice.splice(0,5));
                	}else{
                		this.noticeList = this.noticeList.concat(this.moreNotice);
                		this.moreNotice = [];
                	}
                }
            },
            beforeCreate : function(){
            	fetch('/lectureNotice?ltNo='+'${ltNo}')
                .then(response => response.json())
                .then(result => {
                	this.id = result.id;
                	this.lecDetails = result.lectureDetail;
                	this.ctgrList = result.ctgrList[0];
                	if(result.noticeList != null){
	                	this.noticeList = result.noticeList.splice(0,5);
	                	this.moreNotice = result.noticeList.splice(5);
                	}
                })
            }
            
        })

        const mountLecD = lecD.mount('#lecture_detail');
    </script>
</body>
</html>