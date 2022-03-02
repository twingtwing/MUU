<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <style>
        .list-group > .list-group-item:hover,.tag-span:hover,.modal_close:hover,#lecture_search .card-title:hover,.card-img-top{
            cursor: pointer;
        }

        .list-link {
            color: black;
        }
        
        .list-link.active{
            font-weight: bold;
            color: #e53637;
        }

        .tag-span{
            border-radius: 16px;
        }

        #tag_modal .modal-body{
            height: 20vh;
        }

        .modal_close{
            position: absolute;
            right: 20px;
            font-size: 25px; 
            top: 10px;
        }

        .card-body>.card-title{
            width: 210px;
            white-space: nowrap;
            overflow: hidden;
            display: block;
            text-overflow:ellipsis;
        }

        .card-title a:hover{
            text-decoration: underline;
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

    </style>
</head>
<body>

    <!-- 배너 시작-->
    <section class="normal-breadcrumb set-bg" data-setbg="/resources/img//normal-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>강의</h2>
                        <p>우리는 여러분의 자기개발을 언제 지원합니다!!</p>
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
                        <span>강의</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 카테고리 끝-->

    <!-- body 의 body-->
    <section id="lecture_search" class="blog spad">
        <div class="container">
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-2">
                        <div class="row mr-2">
                            <ul class="list-group w-100">
                                <!-- 해당 상위카테고리 일때, active가 보여야함 => 자바스크립트 혹은 jstl if구문으로 해결해야함 -->
                                <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                                    <a class="list-link" v-bind:class="{'active' : upCtgr == ''}" href="/lecS">전체</a>
                                </li>
                                <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                                    <a class="list-link" v-bind:class="{'active' : upCtgr == 'HC01'}" href="/lecS?upCtgr=HC01">음악</a>
                                </li>
                                <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                                    <a class="list-link" v-bind:class="{'active' : upCtgr == 'HC02'}" href="/lecS?upCtgr=HC02">요리</a>
                                </li>
                                <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                                    <a class="list-link" v-bind:class="{'active' : upCtgr == 'HC03'}" href="/lecS?upCtgr=HC03">건강</a>
                                </li>
                                <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                                    <a class="list-link" v-bind:class="{'active' : upCtgr == 'HC04'}" href="/lecS?upCtgr=HC04">아트</a>
                                </li>
                                <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                                    <a class="list-link" v-bind:class="{'active' : upCtgr == 'HC05'}" href="/lecS?upCtgr=HC05">IT/컴퓨터</a>
                                </li>
                                <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                                    <a class="list-link" v-bind:class="{'active' : upCtgr == 'HC06'}" href="/lecS?upCtgr=HC06">외국어</a>
                                </li>
                                <li class="list-group-item align-items-center d-flex" style="height: 55px;">
                                    <a class="list-link" v-bind:class="{'active' : upCtgr == 'HC07'}" href="/lecS?upCtgr=HC07">자기계발</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-10">
                        <div class="product__page__title mb-0 mt-3">
                            <div class="row d-flex justify-content-between">
                                <div class="section-title mb-0 ml-3">
                                    <h5 v-if="ctgr.length === 1" class="text-dark">전체</h5>
                                    <h5 v-if="ctgr.length > 1" class="text-dark">{{ctgr[1].upName}}</h5>
                                </div>
                                <div class="blog__details__form pt-0 mr-3">
                                    <form onsubmit="return false">  
                                        <div class="row mr-2">
                                            <input v-model="searchTTL" class="border mb-0" style="height: 35px; width: 170px" type="text" placeholder="제목 검색..." spellcheck = false>
                                            <a v-on:click="lecSearch" class="btn btn-outline-secondary" style="height: 35px;"><i class="icon_search"></i></a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <hr class="mt-2">
                        <div class="row ml-2">
                            <div class="col-lg-10">
                                <div class="row">
                                    <!-- 선택 O : active 선택 x : active없음 => java-script혹은 jstl-->
                                    <a v-for="list in ctgrList" :href="list.href" class="btn btn-outline-danger mx-2" v-bind:class="{'active' : downCtgr == list.ctgrId}">{{list.name}}</a>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <button type="button" data-toggle="modal" data-target="#tag_modal" class="btn btn-outline-secondary"><i class="icon_tag"></i> 태그 검색</button>
                            </div>
                        </div>
                        <div class="row py-3">
                            <div class="col-lg-12">
                                <div class="row my-2">
                                    <!-- 카드 시작 -->
                                    <div v-for="(lecture,index) in lectures" class="card mx-2 mb-3 relative">
                                        <div class="stage">
                                            <div v-on:click="heartClick(index)" v-bind:class="{'is-active' : lecture.wash == 'Y'}" class="heart"></div>
                                        </div>
                                        <!-- 사진 나중에 넣어야함 -->
                                        <img v-on:click="lecDetail(index)" class="card-img-top" style="width: 250px; height: 300px;" src="/resources/img/trending/trend-1.jpg" alt="강의 이미지">
                                        <div class="card-body">
                                            <p class="card-subtitle mb-1 text-muted">{{lecture.name}}</p>
                                            <h5 v-on:click="lecDetail(index)" class="card-title mb-1 text-dark font-weight-bold">{{lecture.ttl}}</h5>
                                            <div class="row">
                                                <div class="col-lg-5">
                                                    <p class="card-text text-muted mb-1"><i class="icon_heart_alt" style="color: pink;"></i> {{lecture.wCount}}</p>
                                                </div>
                                                <div class="col-lg-7 d-flex justify-content-end">
                                                    <p class="card-text text-muted mb-1">
                                                        <i v-for="index in lecture.star" class="icon_star" style="color: #ebeb00;"></i>
                                                        <i v-for="index in 5 - lecture.star" class="icon_star_alt" style="color: #ebeb00;"></i>
                                                        ({{lecture.rCount}})
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="row d-flex justify-content-end mx-1">
                                                <h6 class="card-title mb-0">{{lecture.prc + lecture.kitPrc}}원</h6>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 카드 끝 -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- tag 모달창 -->
        <div class="modal fade" id="tag_modal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content" style="border-radius: 30px;">
                    <div class="modal-header border-bottom-0 d-flex justify-content-center" style="position: relative;">
                        <h6 class="font-weight-bold mt-2"><i class="icon_tag"></i> 태그 검색</h6>
                        <div class="modal_close" data-dismiss="modal" v-on:click="modalClose"><i class="icon_close"></i></div>
                    </div>
                    <div class="modal-body border-bottom-0">
                        <div class="col-lg-12">
                            <div v-on:click="tagSelected" id="tag_list" class="row justify-content-center mx-2">
                                <span v-for="tag in tagList" :data-id="tag.tagId" class="btn btn-outline-danger tag-span mx-1 my-2">{{tag.tagName}}</span>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer border-top-0 mt-5 mb-2">
                        <div class="col-lg-12">
                            <div class="row d-flex justify-content-center">
                                <p id="tag" class="text-muted d-none">태그를 선택해주세요!!</p>
                            </div>
                            <div class="row d-flex justify-content-center">
                                <button v-on:click="tagSearch" type="button" class="btn btn-outline-secondary mr-2">태그검색</button>
                                <button v-on:click="modalClose" type="button" class="btn btn-outline-secondary" data-dismiss="modal">검색취소</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>

    <!-- body 의 body 끝 -->
    <!-- body 끝 -->

    <script>

        //Vue
        //db에서 가져와야하는건 다 vue로 해야함
        const lec = Vue.createApp({
            data(){
                return{
                    ttl : '',
                    originLectures : [],
                    lectures : [],
                    ctgr : [],
                    upCtgr : '',
                    downCtgr : '',
                    searchTTL :'',
                    tagList : [
                    	{ tagId : 'LT01', tagName :'일본'},
                    	{ tagId : 'LT02', tagName :'프랑스'},
                    	{ tagId : 'LT03', tagName :'이탈리아'},
                    	{ tagId : 'LT04', tagName :'중국'},
                    	{ tagId : 'LT05', tagName :'동남아'},
                    	{ tagId : 'LT06', tagName :'인도'},
                    	{ tagId : 'LT07', tagName :'스케치'},
                    	{ tagId : 'LT08', tagName :'감성'},
                    	{ tagId : 'LT09', tagName :'레트로'},
                    	{ tagId : 'LT010', tagName :'인디'},
                    	{ tagId : 'LT011', tagName :'오리엔탈'},
                    	{ tagId : 'LT012', tagName :'SWAG'},
                    	{ tagId : 'LT013', tagName :'자취생'},
                    	{ tagId : 'LT014', tagName :'호텔'},
                    	{ tagId : 'LT015', tagName :'집밥'},
                    	{ tagId : 'LT016', tagName :'운동'},
                    	{ tagId : 'LT017', tagName :'힐링'},
                    	{ tagId : 'LT018', tagName :'감성샷'},
                    	{ tagId : 'LT019', tagName :'인생샷'},
                    	{ tagId : 'LT020', tagName :'여행'}
                    ]
                }
            },
            computed : {
                ctgrList(){
                	this.ctgr.unshift({ctgrId:"",name:"전체",upCtgr:this.upCtgr});
                	for(var obj of this.ctgr){
                		obj.href = '/lecS?upCtgr='+obj.upCtgr+'&downCtgr='+obj.ctgrId;
                	}
                	return this.ctgr;
                }
            },
            methods : {
               lecSearch(){
                   this.lectures = this.originLectures.filter(obj => obj.ttl.indexOf(this.searchTTL)!== -1)
                },
                lecDetail(index){
                	location.href ="/lecD?ltNo="+this.lectures[index].ltNo;
                },
                tagSelected(){
                    if(event.target.nodeName ==='SPAN'){
                        event.target.classList.toggle('active');
                    }
                },
                modalClose(){
                	$('#tag_list .active').removeClass("active");
                },
                tagSearch(){
                    if($('#tag_list .active').length !=0 ){
                        $('#tag').addClass('d-none');
                        //tag를 값만 가져와서 배열로 만듦
                        const tags = $('#tag_list .active').map(function(idx,val){
                            return $(val).attr('data-id');
                        });
                        
                        
                        this.lectures = this.originLectures.filter(obj =>{
                        	let result = false;
                        	for(var one of tags){
                       			 if(obj.tag1 === null){
                       			 }else if(obj.tag1.indexOf(one)!==-1){
	                        		 result = true;
	                        		 break;
	                        	 }
                       			 
                       			if(obj.tag2 === null){
                      			 }else if(obj.tag2.indexOf(one)!==-1){
	                        		 result = true;
	                        		 break;
	                        	 }
                       			
                       			if(obj.tag3 === null){
                      			 }else if(obj.tag3.indexOf(one)!==-1){
	                        		 result = true;
	                        		 break;
	                        	 }
	                        	 
                        	}
                        	return result;
                        });

                        $('#tag_modal').modal('hide');
                        this.modalClose();
                        
                    }else {
                        $('#tag').removeClass('d-none');
                    }
                },
                heartClick(index){
            		let header = "${_csrf.headerName}";
            		let token = "${_csrf.token}";
                    let ltNo = this.lectures[index].ltNo;
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
                			xhr.setRequestHeader(header, token);
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
            beforeCreate : function(){
            	let path = '/lectureList?upCtgr='+'${upCtgr}'+'&downCtgr='+'${downCtgr}';

                fetch(path)
                .then(response => response.json())
                .then(result => {
                	this.originLectures = this.lectures = result.lectureList;
                	this.ctgr = result.ctgrList;
                	this.upCtgr = result.upCtgr;
                	this.downCtgr = result.downCtgr;
                });
            }

        })

        const mountedLec = lec.mount('#lecture_search');

        //mouseover 이벤트 : 사이드바 css변경
        $('.list-group > .list-group-item').on('mouseover',function(){
            $(this).css('background-color','#e53637');
            $(this).find('.list-link').css('color','#ffffff');
        })

        //mouseover 이벤트 : 사이드바 css변경
        $('.list-group > .list-group-item').on('mouseout',function(){
            $(this).css('background-color','#ffffff');
            if($(this).find('.list-link').hasClass('active')){
                $(this).find('.list-link').css('color','#e53637');
            }else{
                $(this).find('.list-link').css('color','#000000');
            }
        })

    </script>

</body>
</html>