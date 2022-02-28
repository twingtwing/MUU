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
                                                    <a v-bind:href="`#?${lecDetails.id}`" class="creater_data">
                                                        <h5 class="mb-0 ml-1">크리에이터 상세 정보</h5>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-lg-12 px-5">
                                            <ul class="lecture_ul">
                                                <li><a href="강의상세.html#lec_intro">강의 소개</a></li>
                                                <li><a href="강의상세.html#lec_lesson">커리큘럼</a></li>
                                                <li><a href="강의상세.html#lec_review">후기</a></li>
                                                <li><a href="강의상세.html#lec_kit">키트</a></li>
                                                <li><a href="강의상세.html#lec_qna">질문&답변</a></li>
                                                <li><a href="#">공지사항</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <hr class="mx-4">
                                    <div class="row mx-4">
                                        <div class="col-lg-12">
                                            <h5 class="font-weight-bold my-2">공지사항</h5>
                                            <!-- 반복 -->
                                            <div v-for="notice in lecDetails.notices" class="card mt-3">
                                                <div class="card-body">
                                                    <div class="col-lg-12">
                                                        <div>
                                                            <div class="row d-flex justify-content-between">
                                                                <h6 class="font-weight-bold">{{notice.ttl}}</h6>
                                                            <div class="row">
                                                                <p class="mr-2">{{notice.ttl}}</p>
                                                                <p class="mr-2">{{notice.hits}}</p>
                                                            </div>
                                                            </div>
                                                            <div class="row my-3">
                                                                <p>{{notice.content}}</p>
                                                            </div>
                                                            <div v-if="notice.files" class="row">
                                                                <div class="d-flex align-items-center">
                                                                    <i class="fa fa-download"></i>
                                                                </div>
                                                                <p v-for="file in notice.files" class="mb-0 ml-2">
                                                                    <a :href="file.phyPath"> {{file.filePath}}</a>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="d-flex justify-content-center mt-3" v-if="lecDetails.notices.length > 0">
                                                <span v-if="lecDetails.notices[0].count > 5" v-on:click="noticeMore" class="noticeMore font-weight-bold">더보기</span>
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
        </section>
    </div>
    
    <script>
                const lecD = Vue.createApp({
            data(){
                return{
                    noticeNum : 1,
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
                },
                noticeMore(){
                    if(this.noticeNum < (this.lecDetails.notices[0].count)/5){
                        this.noticeNum ++;
                        //fetch 후에 push
                        this.lecDetails.notices.push(
                            {
                            wr_date : '2022-01-01',
                            ttl:'제목6', 
                            content : '내용',
                            hits:6,
                            files : [
                                {filePath :'6_1',phyPath :'6_6_1'},
                                {filePath :'6_2',phyPath :'6_6_2'}
                            ],
                            count : 6
                        }
                        );
                        if(!(this.noticeNum < (this.lecDetails.notices[0].count)/5)){
                            $('.noticeMore').addClass('d-none')
                        }
                    }
                }
            },
            beforeMount : function(){
                /*
                beforeCreate

                fetch("../전부가져오기")
                .then(response => response.json())
                .then(result => {this.lecDetails = result;})
                */
                this.lecDetails = {
                    id:'id',
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
                    // 공지사항 5개씩 가져옴 -count 공지사항 총개수
                    // 가져올때 hit올라가야함..?
                    notices : [
                        {
                            wr_date : '2022-01-01',
                            ttl:'제목1', 
                            content : '내용1',
                            hits:1,
                            files : [
                                {filePath :'1_1',phyPath :'1_1_1'},
                                {filePath :'1_2',phyPath :'1_1_2'}
                            ],
                            count : 6
                        },
                        {
                            wr_date : '2022-01-01',
                            ttl:'제목1', 
                            content : '내용1',
                            hits:1,
                            files : [
                                {filePath :'1_1',phyPath :'1_1_1'},
                                {filePath :'1_2',phyPath :'1_1_2'}
                            ],
                            count : 6
                        },
                        {
                            wr_date : '2022-01-01',
                            ttl:'제목1', 
                            content : '내용1',
                            hits:1,
                            files : [
                                {filePath :'1_1',phyPath :'1_1_1'},
                                {filePath :'1_2',phyPath :'1_1_2'}
                            ],
                            count : 6
                        },
                        {
                            wr_date : '2022-01-01',
                            ttl:'제목1', 
                            content : '내용1',
                            hits:1,
                            files : [
                                {filePath :'1_1',phyPath :'1_1_1'},
                                {filePath :'1_2',phyPath :'1_1_2'}
                            ],
                            count : 6
                        },
                        {
                            wr_date : '2022-01-01',
                            ttl:'제목1', 
                            content : '내용1',
                            hits:1,
                            count : 6
                        }
                        
                    ]
                };
            }
            
        })

        const mountLecD = lecD.mount('#lecture_detail');
    </script>
</body>
</html>