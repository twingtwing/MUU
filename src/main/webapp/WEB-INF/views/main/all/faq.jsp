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
   </style>
</head>

<body>
   <section class="normal-breadcrumb set-bg" data-setbg="resources/img/hero/hero-1.jpg">
      <div class="container">
         <div class="row">
            <div class="col-lg-12 text-center">
               <div class="normal__breadcrumb__text">
                  <h2>페이지명</h2>
                  <p>상세페이지명</p>
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
                  <a href="#" class="text-dark font-weight-bold"><i class="fa fa-home "></i> Home</a> <a href="#"
                     class="text-dark font-weight-bold">Contact</a> <span>자주묻는질문</span>
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
                     <li class="nav-item" role="presentation" id="head"><a class="nav-link active text-danger"
                           id="lecture-tab" data-toggle="tab" href="#lecture" role="tab" aria-controls="lecture"
                           aria-selected="true">강의</a></li>
                     <li class="nav-item" role="presentation" id="head"><a class="nav-link text-danger"
                           id="delivery-tab" data-toggle="tab" href="#delivery" role="tab" aria-controls="delivery"
                           aria-selected="false">배송</a></li>
                     <li class="nav-item" role="presentation" id="head"><a class="nav-link text-danger" id="payment-tab"
                           data-toggle="tab" href="#payment" role="tab" aria-controls="payment"
                           aria-selected="false">결제</a></li>
                     <li class="nav-item" role="presentation" id="head"><a class="nav-link text-danger"
                           id="infomation-tab" data-toggle="tab" href="#infomation" role="tab"
                           aria-controls="infomation" aria-selected="false">아이디정보/보안</a></li>
                     <li class="nav-item" role="presentation" id="head"><a class="nav-link text-danger" id="bug-tab"
                           data-toggle="tab" href="#bug" role="tab" aria-controls="bug" aria-selected="false">오류</a>
                     </li>
                     <li class="nav-item" role="presentation" id="head"><a class="nav-link text-danger" id="event-tab"
                           data-toggle="tab" href="#event" role="tab" aria-controls="event"
                           aria-selected="false">이벤트</a></li>
                  </ul>
                  <!-- Nav tabs 머리끝-->
                  <!-- Tab 내용 -->
                  <div class="tab-content" id="tabid">
                     <div class="tab-pane active" id="lecture" role="tabpanel" aria-labelledby="lecture-tab">
                        <div class="accordion" id="accordionExample">
                           <div class="card border-0" v-for="(faq,index) in faqs">
                              <div v-if="faq.fstcode=='F01'">
                                 <div v-if="faq.ctgr=='CQ03'">
                                    <div class="card-header" id="headingOne">
                                       <h2 id="colla" class="mb-0">
                                          <button class="btn btn-link btn-block text-left text-danger" type="button"
                                             data-toggle="collapse" :data-target="faq.target2" aria-expanded="false"
                                             :aria-controls="faq.target">Q{{index}}.{{faq.qcontent}}</button>
                                       </h2>
                                    </div>
                                    <div :id="faq.target" class="collapse" aria-labelledby="headingOne"
                                       data-parent="#accordionExample">
                                       <div class="card-body">
                                          <div v-if="faq.length >= 5">출력물이 없었네 ㅋㅋ</div>
                                          <div v-else>이거 5개씩 보이게 하게 만들어야 하는데 제가 능력이 모자라서 힘들듯
                                             일단 문의글로 넘어갑니다.</div>
                                          A{{index}}.{{faq.acontent}}
                                          <div>더보기를 페이징처리해야하고 ajax가 아닌 form으로 보내야함 pasing vo객체</div>
                                       </div>
                                    </div>
                                    <div>
                                       <button v-on:click="more">더보기</button>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="tab-pane" id="delivery" role="tabpanel" aria-labelledby="delivery-tab">
                        <div class="accordion" id="accordionExample">
                           <div class="card border-0" v-for="(faq,index) in faqs">
                              <div v-if="faq.fstcode=='F01'">
                                 <div v-if="faq.ctgr=='CQ02'">
                                    <div class="card-header" id="headingOne">
                                       <h2 class="mb-0">
                                          <button class="btn btn-link btn-block text-left text-danger" type="button"
                                             data-toggle="collapse" :data-target="faq.target2" aria-expanded="false"
                                             :aria-controls="faq.target">Q{{index}}.{{faq.qcontent}}</button>
                                       </h2>
                                    </div>
                                    <div :id="faq.target" class="collapse" aria-labelledby="headingOne"
                                       data-parent="#accordionExample">
                                       <div class="card-body">
                                          A{{index}}.{{faq.acontent}}
                                          <div>더보기를 페이징처리해야하고 ajax가 아닌 form으로 보내야함 pasing vo객체</div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="tab-pane" id="payment" role="tabpanel" aria-labelledby="payment-tab">
                        <div class="accordion" id="accordionExample">
                           <div class="card border-0" v-for="(faq,index) in faqs">
                              <div v-if="faq.fstcode=='F01'">
                                 <div v-if="faq.ctgr=='CQ01'">
                                    <div class="card-header" id="headingOne">
                                       <h2 class="mb-0">
                                          <button class="btn btn-link btn-block text-left text-danger" type="button"
                                             data-toggle="collapse" :data-target="faq.target2" aria-expanded="false"
                                             :aria-controls="faq.target">Q{{index}}.{{faq.qcontent}}</button>
                                       </h2>
                                    </div>
                                    <div :id="faq.target" class="collapse" aria-labelledby="headingOne"
                                       data-parent="#accordionExample">
                                       <div class="card-body">
                                          A{{index}}.{{faq.acontent}}
                                          <div>더보기를 페이징처리해야하고 ajax가 아닌 form으로 보내야함 pasing vo객체</div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="tab-pane" id="infomation" role="tabpanel" aria-labelledby="infomation-tab">
                        <div class="accordion" id="accordionExample">
                           <div class="card border-0" v-for="(faq,index) in faqs">
                              <div v-if="faq.fstcode=='F01'">
                                 <div v-if="faq.ctgr=='CQ04'">
                                    <div class="card-header" id="headingOne">
                                       <h2 class="mb-0">
                                          <button class="btn btn-link btn-block text-left text-danger" type="button"
                                             data-toggle="collapse" :data-target="faq.target2" aria-expanded="false"
                                             :aria-controls="faq.target">Q{{index}}.{{faq.qcontent}}</button>
                                       </h2>
                                    </div>
                                    <div :id="faq.target" class="collapse" aria-labelledby="headingOne"
                                       data-parent="#accordionExample">
                                       <div class="card-body">
                                          A{{index}}.{{faq.acontent}}
                                          <div>더보기를 페이징처리해야하고 ajax가 아닌 form으로 보내야함 pasing vo객체</div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="tab-pane" id="bug" role="tabpanel" aria-labelledby="bug-tab">
                        <div class="accordion" id="accordionExample">
                           <div class="card border-0" v-for="(faq,index) in faqs">
                              <div v-if="faq.fstcode=='F01'">
                                 <div v-if="faq.ctgr=='CQ05'">
                                    <div class="card-header" id="headingOne">
                                       <h2 class="mb-0">
                                          <button class="btn btn-link btn-block text-left text-danger" type="button"
                                             data-toggle="collapse" :data-target="faq.target2" aria-expanded="false"
                                             :aria-controls="faq.target">Q{{index}}.{{faq.qcontent}}</button>
                                       </h2>
                                    </div>
                                    <div :id="faq.target" class="collapse" aria-labelledby="headingOne"
                                       data-parent="#accordionExample">
                                       <div class="card-body">
                                          A{{index}}.{{faq.acontent}}
                                          <div>더보기를 페이징처리해야하고 ajax가 아닌 form으로 보내야함 pasing vo객체</div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="tab-pane" id="event" role="tabpanel" aria-labelledby="event-tab">
                        <div class="accordion" id="accordionExample">
                           <div class="card border-0" v-for="(faq,index) in faqs">
                              <div v-if="faq.fstcode=='F01'">
                                 <div v-if="faq.ctgr=='CQ06'">
                                    <div class="card-header" id="headingOne">
                                       <h2 class="mb-0">
                                          <button class="btn btn-link btn-block text-left text-danger" type="button"
                                             data-toggle="collapse" :data-target="faq.target2" aria-expanded="false"
                                             :aria-controls="faq.target">Q{{index}}.{{faq.qcontent}}</button>
                                       </h2>
                                    </div>
                                    <div :id="faq.target" class="collapse" aria-labelledby="headingOne"
                                       data-parent="#accordionExample">
                                       <div class="card-body">
                                          A{{index}}.{{faq.acontent}}
                                          <div>더보기를 페이징처리해야하고 ajax가 아닌 form으로 보내야함 pasing vo객체</div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
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
               five: [],
               morePost: 0,
            }
         },
         computed: {

         },
         methods: {
            more() {}
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
                  this.faqs = result;
                  let five = [];
                  for (let faq of this.faqs) {
                     faq.target = 'collapse' + Math.trunc((Math.random() * 100));
                     faq.target2 = '#' + faq.target;
                     for (i = 0; i < result.length; i += 5) {
                        five.push(result.slice(i, i + 5));
                       
                     }
                  }
                  console.log(five)
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