<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.list-link {
      color: black;
    }
            
    .list-link.active{
      font-weight: bold;
      color: #e53637;
    }
    
    td>img {
      width: 25px;
      margin: 0 5px;
    }

    div>button {
      margin: 1rem;
    }

    td,
    th {
      padding: 5px;
    }

    .info td,
    .info th {
      padding: 0.5rem 1.5rem;
      padding-top: 1rem;
    }

    .UserGradeInfo,
    .CreGradeInfo {
      z-index: 1;
      background-color: white;
      display: flex;
      justify-content: center;
      position: absolute;
      top: 1rem;
      left: 4rem;
      padding: 1rem;
      display: none;
    }

    .CreGradeInfo {
      top: 20rem;
    }

    .show {
      display: inline-block;
    }

    .small {
      font-size: 0.8rem;
      color: gray;
    }

    .modal {
      margin-top: 10rem;
    }

    /*여기서부터는 페이지마다 다른 부분*/
    .thumbnail>img,
    .thumbnail>h5 {
      /*width: 272px;*/
      width: 100%;
      /*
        width 100%를 주면 화면이 쪼그라들어도 이미지 배치가 유지되는데,
        캐러셀에서 다음 슬라이드로 넘어갈 때 크기조정이 안됨.

        반면 width 고정값을 주면 다음 슬라이드로 넘어가도 크기가 유지되지면
        화면이 쪼그라들면 잘려서 선택하기가 힘들어짐.
      */
      cursor: pointer;
      margin-bottom: 1rem;
    }
    .thumbnail>h5{
      height: 3rem;
    }
    .thumbnail>div{
      margin-bottom: 3rem;
    }

    .thumbnail>img {
      height: 220px;
      margin-top: 1.5rem;
      border-radius: 20px;
    }
    .thumbnail {
      height: 50%;
    }
    .endclass img{
      filter: grayscale();
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
            <h2>마이페이지</h2>
            <p>수강목록</p>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- 배너끝 -->
  
  <section class="blog spad">
    <div class="container">
      <div class="row">
        <div class="col-lg-2">
          <div class="row mr-2" style="width:160px">
            <ul class="list-group w-100">
              <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                <a class="list-link" href="#">내 정보</a>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                <!-- 해당 상위카테고리 일때, active가 보여야함 => 자바스크립트 혹은 c:if구문으로 해결해야함 -->
                <a class="list-link active" href="#">내 강의리스트</a>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                <a class="list-link" href="./박정욱_위시리스트.html">위시 리스트</a>
              </li>
              <li class="list-group-item align-items-center d-flex" style="height: 55px;">
                <a class="list-link" href="./박정욱_유저결제내역.html">결제내역</a>
              </li>
            </ul>
          </div>
        </div>
        
        <div class="col-lg-10">
          <div class="row ml-2">
            <h3 class="font-weight-bold"><i class="fa fa-bookmark text-danger" aria-hidden="true"></i>&nbsp;내 강의리스트</h3>
          </div>
          <hr class="font-weight-bold">
          <div class="row py-3">
            <div class="col-lg-12">
              <div class="card">
                <div class="card-body">
                  <!-- 수강 중인 강의 -->
                  <div class="row col-lg-12 mt-3 ml-1">
                    <h5 class="font-weight-bold "><i class="fa fa-hashtag text-danger"></i> 수강 중인 강의</h5>
                  </div>

                  <div class="row col-lg-12">
                    <!-- carousel start-->
                    <div class="mb-3 classlist carousel slide" id="slide" data-ride="carousel">
                      <div class="carousel-inner">
                        <div class="carousel-item active">
                          <div class="d-flex">
                            <div class="thumbnail mx-3">
                              <img src="/resources/img/hero/hero-1.jpg" alt="" onclick="selectLecture(1)">
                              <h5 class="px-3 font-weight-bold font-weight-bold" onclick="selectLecture(1)">제로부터 시작하는 피아노 클래스 넘버원</h5>
                              <div class="bg-secondary w-100 small position-relative">☺
                                <div class="w-75 bg-danger position-absolute text-white pl-1" style="top:0px;">75%</div>
                              </div>
                            </div>
                            <div class="thumbnail mx-3">
                              <img src="/resources/img/sidebar/tv-4.jpg" alt="">
                              <h5 class="px-3 font-weight-bold">제로부터 시작하는 피아노 클래스 넘버원</h5>
                              <div class="bg-secondary w-100 small position-relative">☺
                                <div class="w-25 bg-danger position-absolute text-white pl-1" style="top:0px;">25%</div>
                              </div>
                            </div>
                            <div class="thumbnail mx-3">
                              <img src="/resources/img/sidebar/tv-3.jpg" alt="">
                              <h5 class="px-3 font-weight-bold">소드 아트 온라인 클래스</h5>
                              <div class="bg-secondary w-100 small position-relative">☺
                                <div class="w-25 bg-danger position-absolute text-white pl-1" style="top:0px;">25%</div>
                              </div>
                            </div>
                          </div> <!-- thumbnails first list end -->
                        </div> <!-- carousel item active end-->
          
                        <div class="carousel-item">
                          <div class="d-flex">
                            <div class="thumbnail mx-3">
                              <img src="/resources/img/profile.png" alt="">
                              <h5 class="px-3 font-weight-bold">제로부터 시작하는 피아노 클래스 넘버원</h5>
                              <div class="bg-secondary w-100 small position-relative">☺
                                <div class="w-75 bg-danger position-absolute text-white pl-1" style="top:0px;">75%</div>
                              </div>
                            </div>
                          </div>
                        </div> <!-- carousel item -->
                      </div> <!-- carousel inner end-->
                      <a href="#slide" class="carousel-control-prev " role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                      </a>
                      <a class="carousel-control-next" href="#slide" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                      </a>
                    </div> <!-- carousel end-->
                  </div>
                  <hr class="font-weight-bold mb-3">

                  <div class="row col-lg-12 mt-3 ml-1">
                    <h5 class="font-weight-bold "><i class="fa fa-hashtag text-danger"></i> 수강 만료 강의</h5>
                  </div>

                  <!-- 수강 만료 강의-->
                  <div class="row col-lg-12">
                    <div class="my-3 mb-5 classlist endclass carousel slide" id="slide2" data-ride="carousel">
                      <div class="carousel-inner">
                        <div class="carousel-item active">
                          <div class="d-flex">
                            <div class="thumbnail mx-3">
                              <img src="/resources/img/recent/recent-3.jpg" alt="">
                              <h5 class="px-3 font-weight-bold">제로부터 시작하는 피아노 클래스 넘버원</h5>
                            </div>
                            <div class="thumbnail mx-3">
                              <img src="/resources/img/sidebar/tv-4.jpg" alt="">
                              <h5 class="px-3 font-weight-bold">제로부터 시작하는 피아노 클래스 넘버원</h5>
                            </div>
                            <div class="thumbnail mx-3">
                              <img src="/resources/img/sidebar/tv-3.jpg" alt="">
                              <h5 class="px-3 font-weight-bold">제로부터 시작하는 피아노 클래스 넘버원</h5>
                            </div>
                          </div> <!-- thumbnails first list end -->
                        </div> <!-- carousel item active end-->
          
                        <div class="carousel-item">
                          <div class="d-flex">
                            <div class="thumbnail mx-3">
                              <img src="img/profile.png" alt="">
                              <h5 class="px-3 font-weight-bold">제로부터 시작하는 피아노 클래스 넘버원</h5>
                            </div>
                          </div>
                        </div> <!-- carousel item -->
                      </div> <!-- carousel inner end-->
                      <a href="#slide2" class="carousel-control-prev" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                      </a>
                      <a class="carousel-control-next" href="#slide2" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                      </a>
                    </div> <!-- carousel end-->
                  </div>
                  <!--card body end-->
                </div><!--card body end-->
              </div><!-- card end-->
            </div>
          </div>
        </div>
        
      </div>
    </div><!--container end-->
  </section>
  
  <script>
    const selectLecture = (number) => {
      console.log(number);
      location.href = "./강의상세페이지.html";
    }

      //mouseover 이벤트 : 사이드바 css변경
    $('.list-group .list-group-item').on('mouseover',function(){
      $(this).css('background-color','#e53637');
      $(this).find('.list-link').css('color','#ffffff');
    })

      //mouseover 이벤트 : 사이드바 css변경
    $('.list-group .list-group-item').on('mouseout',function(){
      $(this).css('background-color','#ffffff');
      $(this).find('.list-link').css('color','#000000');
      $(this).find('.list-link.active').css('color','#e53637');
    })
  </script>
</body>
</html>