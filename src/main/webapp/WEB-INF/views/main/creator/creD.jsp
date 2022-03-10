<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <style>
        .creIntro{
            border-left: 5px solid #212529;
            padding-left: 6px;
        }

        .heart {
            width: 100px;
            height: 100px;
            background: url("/resources/img/heart.png") no-repeat;
            background-position: 0 0;
            cursor: pointer;
            transition: background-position 1s steps(28);
            transition-duration: 0s;
        }

        .heart:not(.is-active){
            opacity: 60%;
        }

        .heart.is-active {
            transition-duration: 1s;
            background-position: -2800px 0;
        }

        .stage {
            position: absolute;
            top: 17px;
            right: -81px;
            -webkit-transform: translate(-50%, -50%);
                    transform: translate(-50%, -50%);
        }

        .lec_title:hover{
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <!-- body 시작 -->
    <div id="creater_detail">
        <!-- 배너 시작-->
        <section class="normal-breadcrumb set-bg" data-setbg="/resources/img/normal-breadcrumb.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="normal__breadcrumb__text">
                            <h2>크리에이터 정보</h2>
                            <p>크리에이터 이름</p>
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
                            <a href="/Home" class="text-dark font-weight-bold"><i class="fa fa-home"></i> Home</a>
                            <span>크리에이이터 이름</span>
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
                    <div class="row ml-2 d-flex justify-content-center position-relative">
                        <h3 class="font-weight-bold text-danger">크리에이터 정보</h3>
                        <button onclick="javascript:history.back()" class="btn btn-outline-secondary d-flex align-items-center position-absolute" style="height:35px; border-radius: 20px; left: -20px;">
                            <i class="arrow_left"></i>
                            <small class="mb-0">&nbsp;뒤로가기</small>
                        </button>
                    </div>
                    <div class="row mt-5 pt-3">
                        <div class="col-lg-12">
                            <div class="row mx-5">
                                <div class="col-lg-6 align-self-end">
                                	<div class="d-flex  mb-3">
	                                    <div>
	                                        <h5 class="mb-2">크리에이터 <strong>{{creDetail.name}}</strong>입니다.</h5>
	                                        <p class="mb-1">열린 강의 수 : {{creDetail.openCount}}개</p>
	                                        <p class="mb-1">강의 신고 횟수 : <strong class="text-danger">{{creDetail.reportCount}}</strong>번</p>
	                                        <p class="mb-0">총 강의 수 : {{creDetail.openCount + creDetail.reportCount +creDetail.closeCount}}개</p>
	                                    </div>
	                                    <div class="creIntro ml-3 border-danger">
	                                        <p class="mb-0">{{creDetail.creIntro}}</p>
	                                    </div>
                                	</div>
                                </div>
                                <div class="col-lg-6 pr-5">
                                    <div class="row d-flex justify-content-end">
                                        <div>
                                            <img :src="creDetail.pht" class="rounded-circle" style="width: 150px;height: 150px;">
                                            <div class="row mt-2 d-flex justify-content-center">
                                                <h6 class="text-muted">{{creDetail.name}} ({{creDetail.creId}})</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr class="font-weight-bold">
                    <div class="row py-3">
                        <div class="col-lg-12">
                            <p class="font-weight-bold ml-3"><i class="fa fa-hashtag text-danger"></i> 니님의 강의 <b class="text-danger">LIST</b>&nbsp;({{creDetail.lectureList.length}}개)</p>
                            <div class="row">
                                <div v-for="(lec,index) in creDetail.lectureList" class="col-lg-6 mb-4">
                                    <div class="card" style="border-radius:20px;">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    <img :src="lec.thumb" alt="강의이미지" style="border-radius:20px; width: 200px; height: 180px;">
                                                </div>
                                                <div class="col-lg-8">
                                                    <div class="m-2 h-100 d-flex align-content-between flex-wrap">
                                                        <div class="row position-relative w-100">
                                                            <p class="text-muted mb-0">{{lec.upCtgr}} · {{lec.downCtgr}}</p>
                                                            <div class="stage position-absolute" style="right: -115px; top: 0px;">
                                                                <div v-on:click="heartClick(index)" v-bind:class="{'is-active' : lec.wash == 'Y'}" class="heart"></div>
                                                            </div>
                                                        </div>
                                                        <div class="row mt-2 w-100">
                                                            <h5 class="card-title"><a :href="'lecD?ltNo='+lec.ltNo" class="lec_title text-dark font-weight-bold">{{lec.ttl}}</a></h5>
                                                        </div>
                                                        <div class="row w-100 d-flex justify-content-between">
                                                        	<div class="row pl-3">
	                                                            <p>
	                                                                <i v-for="num in lec.star" class="fa fa-star text-warning"></i>
	                                                                <i v-for="num in 5-lec.star" class="fa fa-star-o text-warning"></i>
	                                                                <small class="text-muted ml-1">{{lec.rCount}}</small>
	                                                            </p>
	                                                            <p class="ml-2">
	                                                            	<i class="fa fa-heart" style="color: #ff949f"></i>
	                                                            	<small class="text-muted ml-1">{{lec.wCount}}</small>
	                                                            </p>
                                                        	</div>
                                                            <h6 class="mb-2">{{lec.prc + lec.kitPrc}}원</h6>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- body 의 body 끝 -->
    </div>
    <!-- body 끝 -->
    <script>
        const creD = Vue.createApp({
            data(){
                return{
                    creDetail : {}
                }
            },
            methods : {
                heartClick(index){
                    let ltNo = this.creDetail.lectureList[index].ltNo;
                    let sum = 0;
                    let wash = '';
                    let heartPath = '';
                    let heart = event.target;
                  	if(heart.classList.contains('is-active')){
                        sum = -1;
                        wash ='N';
                        heartPath = '/user/heartDelete';
                    }else{
                    	sum = 1;
                    	wash ='Y';
                        heartPath = '/user/heartInsert';
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
                    		heart.classList.toggle('is-active');
                        	this.lectures[index].wCount +=sum;
                        	this.lectures[index].wash = wash;
                    	}else{
                    		alert("찜하기 위해 로그인해주세요");
                    		location.href="/customLogin";
                    	}
                    });  
                }
            },
            beforeMount : function(){
            	let id = '${id}';
            	console.log(id)
               fetch("/creDetail?creId="+id)
                .then(response => response.json())
                .then(result => {
                	this.creDetail = result;
                })
            }
        });

        const mountCreD = creD.mount('#creater_detail');

    </script>
</body>
</html>