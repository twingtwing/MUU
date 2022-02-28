<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #cctgr li {
      cursor: pointer;

    }

    .list-link {
      color: black;
    }

    .list-link.active {
      font-weight: bold;
      color: #e53637;

    }

    .fa-star,.fa-star-o {
      color: var(--warning);
    }

    .report,
    .rv {
      cursor: pointer;
    }

    .rv {

      height: 10rem;
    }

    #wrmodal {
      margin-top: 8rem;
    }
    #stars .gr{
      color: gray;
      cursor: pointer;
    }
    .wrbox{
      height: 20rem;
    }
    #span .selected {
      color: var(--danger)
    }
  </style>
</head>
<body>
 <!-- 배너 시작-->
  <section class="normal-breadcrumb set-bg" data-setbg="/resources/img/normal-breadcrumb.jpg">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <div class="normal__breadcrumb__text">
            <h2>내 강의리스트</h2>
            <p>리뷰 & 별점</p>
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
            <a href="#"><i class="fa fa-home"></i> 홈</a>
            <a href="#">마이페이지</a>
            <a href="#">내 강의리스트</a>
            <span>리뷰 & 별점</span>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 카테고리 끝-->
  
  <section class="blog spad" style="margin : 0 10vw;">
    <div class="container">
      <div class="row">
        <div class="col-lg-2">
          <div class="row mr-2" style="width:160px">
            <ul class="list-group w-100" id="cctgr">
              <li class="list-group-item border-bottom-0 align-items-center d-flex justify-content-center" style="height: 75px;">
                <a class="list-link" href="#">
                  <div class="row">
                    <div class="col-lg-4 justify-content-center align-items-center d-flex">
                      <imo style="font-size:25px;">🚀</imo>
                    </div>
                    <div class="col-lg-8 pr-0 pl-0 align-items-center d-flex">
                      <p class="font-weight-bold mb-0">&nbsp;&nbsp;&nbsp;&nbsp;GO TO<br>강의 리스트</p>
                    </div>
                  </div>
                </a>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                <!-- 해당 상위카테고리 일때, active가 보여야함 => 자바스크립트 혹은 c:if구문으로 해결해야함 -->
                <a class="list-link" href="#">수업 목록</a>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                <a class="list-link" href="./박정욱_위시리스트.html">공지사항</a>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                <a class="list-link" href="./박정욱_위시리스트.html">질문 & 답변</a>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                <a class="list-link active" href="./박정욱_위시리스트.html">리뷰 & 별점</a>
              </li>
              <li class="list-group-item align-items-center d-flex" style="height: 55px;">
                <a class="list-link" href="./박정욱_유저결제내역.html">환불</a>
              </li>
            </ul>
          </div>
        </div>
        
        <div class="col-lg-10">
          <div class="row col-lg-12 ml-2">
            <h3 class="font-weight-bold"><i class="fa fa-retweet text-danger" aria-hidden="true"></i>&nbsp;수강 중 - 리뷰 & 별점</h3>
          </div>
          <hr class="font-weight-bold"> 
          <div class="col-lg-12 px-0 mb-3">
            <div class="card w-100">
              <div class="card-body">
                <div class="row">
                  <div class="col-3">
                    <img class="rounded" src="/img/blog/blog-1.jpg" alt="" style="object-fit: cover; width: 100%; height: 150px;">
                  </div>
                  <div class="col-9 d-flex align-items-center">
                    <div class="w-100">
                      <h3 class="font-weight-bold pb-3">강의명</h3>
                      <div class="progress mt-3">
                        <div class="progress-bar bg-danger" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:70%">
                          70%
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="card" style="position: relative;">
            <div class="card-body">
              <div class="row mt-4 col-12 justify-content-center">
                <h5 class="font-weight-bold">수강 리뷰( <span class="fas fa-star"></span><span> 4.3</span> / 5 )</h5>
              </div>
              
              <div class="row col-12 justify-content-between mt-4 pr-4 mx-3">
                <button class="btn btn-warning py-2 px-4 font-weight-bold text-white" id="wr">작성</button>
                <div class="row mr-4">
                  <div>
                    <select class="border px-4">
                      <option value="">제목</option>
                      <option value="">내용</option>
                      <option value="">작성자ID</option>
                    </select>
                  </div>
                  <input type="text" class="border" spellcheck="false" placeholder="검색...">
                  <button type="button" class="border px-4 mr-4">검색</button>
                </div>
              </div>

              <div class="row col-12 justify-content-center">
                <!--  card 사실 유저페이지랑 거의 똑같음 -->
                <div class="col-6 mt-3">
                  <div class="bg-light border rounded d-flex flex-column align-items-center p-3 mx-3 mb-3 rv">
                    <div class="d-flex justify-content-between w-100 mb-2 px-1">
                      <span>
                        <span>abc@naver.com</span>
                        <span class="fas fa-star"></span>
                        <span class="fas fa-star"></span>
                        <span class="fas fa-star"></span>
                        <span class="fas fa-star"></span>
                        <span class="fa fa-star-o"></span>
                      </span>
                      <span>
                        <span>2022.02.02</span><i class="fa fa-ban report text-danger ml-2" aria-hidden="true"></i>
                      </span>
                    </div>
                    <div class="bg-white h-25 w-100 h-100 rounded p-2">
                      아주 좋았어요 덕분에 지식이 많아졋어요
                    </div>
                  </div>
                </div>
                <div class="col-6 mt-3">
                  <div class="bg-light border rounded d-flex flex-column align-items-center p-3 mx-3 mb-3 rv">
                    <div class="d-flex justify-content-between w-100 mb-2 px-1">
                      <span>
                        <span>abc@naver.com</span>
                        <span class="fas fa-star"></span>
                        <span class="fas fa-star"></span>
                        <span class="fas fa-star"></span>
                        <span class="fas fa-star"></span>
                        <span class="fa fa-star-o"></span>
                      </span>
                      <span>
                        <span>2022.02.02</span><i class="fa fa-ban report text-danger ml-2" aria-hidden="true"></i>
                      </span>
                    </div>
                    <div class="bg-white h-25 w-100 h-100 rounded p-2">
                      아주 좋았어요 덕분에 지식이 많아졋어요
                    </div>
                  </div>
                </div>
                <div class="col-6 mt-3">
                  <div class="bg-light border rounded d-flex flex-column align-items-center p-3 mx-3 mb-3 rv">
                    <div class="d-flex justify-content-between w-100 mb-2 px-1">
                      <span>
                        <span>abc@naver.com</span>
                        <span class="fas fa-star"></span>
                        <span class="fas fa-star"></span>
                        <span class="fas fa-star"></span>
                        <span class="fas fa-star"></span>
                        <span class="fa fa-star-o"></span>
                      </span>
                      <span>
                        <span>2022.02.02</span><i class="fa fa-ban report text-danger ml-2" aria-hidden="true"></i>
                      </span>
                    </div>
                    <div class="bg-white h-25 w-100 h-100 rounded p-2">
                      아주 좋았어요 덕분에 지식이 많아졋어요
                    </div>
                  </div>
                </div>
                <div class="col-6 mt-3">
                  <div class="bg-light border rounded d-flex flex-column align-items-center p-3 mx-3 mb-3 rv">
                    <div class="d-flex justify-content-between w-100 mb-2 px-1">
                      <span>
                        <span>abc@naver.com</span>
                        <span class="fas fa-star"></span>
                        <span class="fas fa-star"></span>
                        <span class="fas fa-star"></span>
                        <span class="fas fa-star"></span>
                        <span class="fa fa-star-o"></span>
                      </span>
                      <span>
                        <span>2022.02.02</span><i class="fa fa-ban report text-danger ml-2" aria-hidden="true"></i>
                      </span>
                    </div>
                    <div class="bg-white h-25 w-100 h-100 rounded p-2">
                      아주 좋았어요 덕분에 지식이 많아졋어요
                    </div>
                  </div>
                </div>
                <div class="col-6 mt-3">
                  <div class="bg-light border rounded d-flex flex-column align-items-center p-3 mx-3 mb-3 rv">
                    <div class="d-flex justify-content-between w-100 mb-2 px-1">
                      <span>
                        <span>abc@naver.com</span>
                        <span class="fas fa-star"></span>
                        <span class="fas fa-star"></span>
                        <span class="fas fa-star"></span>
                        <span class="fas fa-star"></span>
                        <span class="fa fa-star-o"></span>
                      </span>
                      <span>
                        <span>2022.02.02</span><i class="fa fa-ban report text-danger ml-2" aria-hidden="true"></i>
                      </span>
                    </div>
                    <div class="bg-white h-25 w-100 h-100 rounded p-2">
                      아주 좋았어요 덕분에 지식이 많아졋어요
                    </div>
                  </div>
                </div>
                <div class="col-6 mt-3">
                  <div class="bg-light border rounded d-flex flex-column align-items-center p-3 mx-3 mb-3 rv">
                    <div class="d-flex justify-content-between w-100 mb-2 px-1">
                      <span>
                        <span>abc@naver.com</span>
                        <span class="fas fa-star"></span>
                        <span class="fas fa-star"></span>
                        <span class="fas fa-star"></span>
                        <span class="fas fa-star"></span>
                        <span class="fa fa-star-o"></span>
                      </span>
                      <span>
                        <span>2022.02.02</span><i class="fa fa-ban report text-danger ml-2" aria-hidden="true"></i>
                      </span>
                    </div>
                    <div class="bg-white h-25 w-100 h-100 rounded p-2">
                      아주 좋았어요 덕분에 지식이 많아졋어요
                    </div>
                  </div>
                </div>
                
              </div>  
            </div>
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
                  <div class="modal_close position-absolute" style="right: 10px; top: 10px;" data-dismiss="modal">
                    <i class="icon_close" style="font-size: 30px;"></i>
                  </div>
              </div>
              <div class="modal-body border-bottom-0">
                  <div class="col-lg-12">
                      <p class="font-weight-bold">신고 대상</p>
                      <div class="row d-flex justify-content-center mb-3 border px-2 pt-4 pb-2">
                          <div class="col-lg-12 px-0">
                            여기에 리뷰내용그대로 들어가야함
                          </div>
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
  
  <!--작성 모달-->
  <div class="modal" id="wrmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog " role="document">
      <div class="modal-content p-3">
        <div align="right">
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">X</span>
          </button>
        </div>

        <h2 class="modal-body text-center w-100" id="stars">
          <span class="fas fa-star gr" data-num="0"></span>
          <span class="fas fa-star gr" data-num="1"></span>
          <span class="fas fa-star gr" data-num="2"></span>
          <span class="fas fa-star gr" data-num="3"></span>
          <span class="fas fa-star gr" data-num="4"></span>
        </h2>
        <textarea spellcheck="false" class="m-5 p-3 bg-white border wrbox" placeholder="리뷰를 작성해주세요"></textarea>
        <div class="d-flex justify-content-center align-items-center">
          <button class="btn border mx-2" id="modalY" href="#">작성</button>
          <button class="btn border mx-2" type="button" data-dismiss="modal">취소</button>
        </div>

      </div>
    </div>
  </div>
  
  <script>
    $('.report').click((e)=>{
      $('#revReport').modal('show')
      // 누른 rpno 가져와서 ajax
    })

    $('.rv').click((e) => {
      // 글이 긴 경우 ...로 표시되고 클릭하면 다 보이게
    })
    $('#wr').click(() => {
      $('#wrmodal').modal('show')
    })
    $('#stars>span').mouseover((e)=>{
      const num = +e.currentTarget.dataset.num+1
      const st = document.querySelectorAll('#stars>span');
      for(let i=0; i<num; i++){
        $(st[i]).css('color','var(--warning)')
      }
    })
    const getgray = () =>{
      $('#stars .gr').css('color','gray')
    }
    $('#stars').mouseout(getgray)
    $('#stars>span').click((e)=>{
      const num = +e.currentTarget.dataset.num+1;
      const st = document.querySelectorAll('#stars>span');
      for(let i=0; i<num; i++){
        $(st[i]).removeClass('gr');
        $(st[i]).addClass('selected');
      }
    })
    $('#modalY').click((e)=>{
      // ajax insert
      const point = +e.currentTarget.dataset.num+1; // 얘를 점수로 넣으면됨
    })

    //mouseover 이벤트 : 사이드바 css변경
      $('#cctgr  .list-group-item:not(.mylist)').on('mouseover',function(){
        $(this).css('background-color','#e53637');
        $(this).find('.list-link').css('color','#ffffff');
        $(this).find('p').css('color','#ffffff');
    })

    //mouseover 이벤트 : 사이드바 css변경
    $('#cctgr  .list-group-item:not(.mylist)').on('mouseout',function(){
        $(this).css('background-color','#ffffff');
        $(this).find('.list-link').css('color','#000000');
        $(this).find('p').css('color','#000000');
        $(this).find('.list-link.active').css('color','#e53637'); 
    })
  </script>
</body>
</html>