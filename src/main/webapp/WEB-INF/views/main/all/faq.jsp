<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
   <meta charset="UTF-8">
   <style type="text/css">
      .card-body {
         border: none;
      }
      .more_link{
      	color: black;
      }
      .more_link:hover{
      	text-decoration: underline;
      	color: red;
      	cursor: pointer;
      }
   </style>
</head>

<body>
   <section class="normal-breadcrumb set-bg" data-setbg="resources/img/hero/hero-1.jpg">
      <div class="container">
         <div class="row">
            <div class="col-lg-12 text-center">
               <div class="normal__breadcrumb__text">
                  <h2>고객 센터</h2>
                  <p>자주 묻는 질문</p>
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
                  <span>자주묻는질문</span>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- 카테고리 끝-->

   <!-- body 의 body-->
   <section class="blog spad" id="faqSelectList">
      <div class="container">
         <div class="col-lg-12">
            <div class="row ml-2">
               <h3 class="font-weight-bold text-dark">F A Q</h3>
            </div>
            <div class="row py-5">
               <div class="col-lg-12">
                  <!-- Nav tabs 머리시작-->
                  <ul class="nav nav-tabs nav-fill" role="tablist">
                     <li class="nav-item" role="presentation" id="head">
                     	<a class="nav-link active text-danger" id="lecture-tab" data-toggle="tab" href="#lecture" role="tab" aria-controls="lecture" aria-selected="true">강의</a>
                     </li>
                     <li class="nav-item" role="presentation" id="head">
                     	<a class="nav-link text-danger" id="delivery-tab" data-toggle="tab" href="#delivery" role="tab" aria-controls="delivery" aria-selected="false">배송</a>
                     </li>
                     <li class="nav-item" role="presentation" id="head">
                     	<a class="nav-link text-danger" id="payment-tab" data-toggle="tab" href="#payment" role="tab" aria-controls="payment" aria-selected="false">결제</a>
                     </li>
                     <li class="nav-item" role="presentation" id="head">
                     	<a class="nav-link text-danger" id="infomation-tab" data-toggle="tab" href="#infomation" role="tab" aria-controls="infomation" aria-selected="false">회원정보/보안</a>
                     </li>
                     <li class="nav-item" role="presentation" id="head">
                     	<a class="nav-link text-danger" id="bug-tab" data-toggle="tab" href="#bug" role="tab" aria-controls="bug" aria-selected="false">오류</a>
                     </li>
                     <li class="nav-item" role="presentation" id="head">
                     	<a class="nav-link text-danger" id="event-tab" data-toggle="tab" href="#event" role="tab" aria-controls="event" aria-selected="false">환불</a>
                      </li>
                  </ul>
                  <!-- Nav tabs 머리끝-->
                  <!-- Tab 내용 -->
                  <div class="tab-content" id="tabid">
                     <div class="tab-pane active" id="lecture" role="tabpanel" aria-labelledby="lecture-tab">
                        <div class="accordion" id="accordionExample">
                           <div class="card border-0" v-for="(faq,index) in faqMore[0]">
                              <div class="card-header" id="headingOne">
                                 <h2 class="mb-0">
                                    <button class="btn btn-link btn-block text-left text-danger" type="button" data-toggle="collapse" :data-target="faq.target2" aria-expanded="false" :aria-controls="faq.target">Q{{index+1}}.{{faq.qcontent}}</button>
                                 </h2>
                              </div>
                              <div :id="faq.target" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                                 <div class="card-body">
                                    A{{index+1}}.{{faq.acontent}}
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="row justify-content-center mt-3">
                        	<div class="more_link" v-if="faqs[0].length != 0" v-on:click="more(0)">더보기</div>
                        </div>
                     </div>
                     <div class="tab-pane" id="delivery" role="tabpanel" aria-labelledby="delivery-tab">
                        <div class="accordion" id="accordionExample">
                           <div class="card border-0" v-for="(faq,index) in faqMore[1]">
                              <div class="card-header" id="headingOne">
                                 <h2 class="mb-0">
                                    <button class="btn btn-link btn-block text-left text-danger" type="button" data-toggle="collapse" :data-target="faq.target2" aria-expanded="false" :aria-controls="faq.target">Q{{index+1}}.{{faq.qcontent}}</button>
                                 </h2>
                              </div>
                              <div :id="faq.target" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                                 <div class="card-body">
                                    A{{index+1}}.{{faq.acontent}}
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="row justify-content-center mt-3">
                        	<a href="" class="more_link" v-if="faqs[1].length != 0" v-on:click="more(1)">더보기</a>
                        </div>
                     </div>
                     <div class="tab-pane" id="payment" role="tabpanel" aria-labelledby="payment-tab">
                        <div class="accordion" id="accordionExample">
                           <div class="card border-0" v-for="(faq,index) in faqMore[2]">
                              <div class="card-header" id="headingOne">
                                 <h2 class="mb-0">
                                    <button class="btn btn-link btn-block text-left text-danger" type="button" data-toggle="collapse" :data-target="faq.target2" aria-expanded="false" :aria-controls="faq.target">Q{{index+1}}.{{faq.qcontent}}</button>
                                 </h2>
                              </div>
                              <div :id="faq.target" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                                 <div class="card-body">
                                    A{{index+1}}.{{faq.acontent}}
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="row justify-content-center mt-3">
                        	<div href="" class="more_link" v-if="faqs[2].length != 0" v-on:click="more(2)">더보기</div>
                        </div>
                     </div>
                     <div class="tab-pane" id="infomation" role="tabpanel" aria-labelledby="infomation-tab">
                        <div class="accordion" id="accordionExample">
                           <div class="card border-0" v-for="(faq,index) in faqMore[3]">
                              <div class="card-header" id="headingOne">
                                 <h2 class="mb-0">
                                    <button class="btn btn-link btn-block text-left text-danger" type="button" data-toggle="collapse" :data-target="faq.target2" aria-expanded="false" :aria-controls="faq.target">Q{{index+1}}.{{faq.qcontent}}</button>
                                 </h2>
                              </div>
                              <div :id="faq.target" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                                 <div class="card-body">
                                    A{{index+1}}.{{faq.acontent}}
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="row justify-content-center mt-3">
                        	<div href="" class="more_link" v-if="faqs[3].length != 0" v-on:click="more(3)">더보기</div>
                        </div>
                     </div>
                     <div class="tab-pane" id="bug" role="tabpanel" aria-labelledby="bug-tab">
                        <div class="accordion" id="accordionExample">
                           <div class="card border-0" v-for="(faq,index) in faqMore[4]">
                              <div class="card-header" id="headingOne">
                                 <h2 class="mb-0">
                                    <button class="btn btn-link btn-block text-left text-danger" type="button" data-toggle="collapse" :data-target="faq.target2" aria-expanded="false" :aria-controls="faq.target">Q{{index+1}}.{{faq.qcontent}}</button>
                                 </h2>
                              </div>
                              <div :id="faq.target" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                                 <div class="card-body">
                                    A{{index+1}}.{{faq.acontent}}
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="row justify-content-center mt-3">
                        	<div href="" class="more_link" v-if="faqs[4].length != 0" v-on:click="more(4)">더보기</div>
                        </div>
                     </div>
                     <div class="tab-pane" id="event" role="tabpanel" aria-labelledby="event-tab">
                        <div class="accordion" id="accordionExample">
                           <div class="card border-0" v-for="(faq,index) in faqMore[5]">
                              <div class="card-header" id="headingOne">
                                 <h2 class="mb-0">
                                    <button class="btn btn-link btn-block text-left text-danger" type="button" data-toggle="collapse" :data-target="faq.target2" aria-expanded="false" :aria-controls="faq.target">Q{{index+1}}.{{faq.qcontent}}</button>
                                 </h2>
                              </div>
                              <div :id="faq.target" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                                 <div class="card-body">
                                    A{{index+1}}.{{faq.acontent}}
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="row justify-content-center mt-3">
                        	<div href="" class="more_link" v-if="faqs[5].length != 0" v-on:click="more(5)">더보기</div>
                        </div>
                     </div>
                  </div>
                  <!--Tab 내용 끝-->
               </div>
            </div>
            <!-- Example split danger button -->
            <div class="d-flex justify-content-center">
               <button type="submit" class="site-btn" onclick="history.go(-1);">뒤로가기</button>
            </div>
         </div>
      </div>
   </section>
   <script>
      let header = "${_csrf.headerName}";
      let token = "${_csrf.token}";

      const faq = Vue.createApp({
         data() {
            return {
               faqs: [],
               faqMore : [],
            }
         },
         computed: {

         },
         methods: {
            more(num) {
            	this.faqMore[num] = this.faqMore[num].concat(this.faqs[num][0]);
            	this.faqs[num].splice(0,1);
            }
         },
         beforeCreate: function () {
            $.ajax({
                  url: 'faqSelectList',
                  type: 'post',
                  datatype: 'json',
                  beforeSend: function (xhr) {
                     xhr.setRequestHeader(header, token);
                  }

               })
               .done(result => {
            	  for(var i =0; i< 6; i++){
            		  this.faqs[i] = [];
            	  }
                  for (var faq of result) {
                     faq.target = 'collapse_' + Math.trunc((Math.random() * 1000));
                     faq.target2 = '#' + faq.target;
                     for (var i = 1; i <= 6; i++) {
						 if(faq.ctgr.indexOf(i) !== -1){
							this.faqs[i-1].push(faq);
						 }	                 
					 }
                  }
                  for(var i = 0; i < this.faqs.length; i++){
                	  let count = 0 ;
                	  const arys = this.faqs[i];
                	  this.faqs[i] = [];
                	  this.faqs[i][count] = [];
                	  for(var j = 0; j < arys.length; j++){
                		  this.faqs[i][count].push(arys[j]);
                		  if((j+1)%5 === 0 && j !==1){
                			  count ++ ;
                			  this.faqs[i][count] = [];
                		  }
                	  }
                	  this.faqMore[i] = this.faqs[i][0];
                	  this.faqs[i].splice(0,1);
                  }
               });

         }
      })
      //mount vue
      const mountedFaq = faq.mount('#faqSelectList');
   </script>

   <script type="text/javascript">
      $(document).click(function (e) {
         if (!$(e.target).is('.card-body')) {
            $('.collapse').collapse('hide');
         }
      });
   </script>
</body>

</html>