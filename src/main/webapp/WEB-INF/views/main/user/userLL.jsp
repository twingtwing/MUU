<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
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
      width: 100%;
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
   <!-- 카테고리 시작-->
  <div class="breadcrumb-option">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="breadcrumb__links">
            <a href="/home" class="text-secondary"><i class="fa fa-home"></i> 홈</a>
            <a href="/user/userSelect" class="text-secondary">마이페이지</a>
            <span>내 강의리스트</span>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 카테고리 끝-->
  
  
  <section class="blog spad">
    <div class="container">
      <div class="row">
        <div class="col-lg-2">
          <div class="row mr-2" style="width:160px">
            <ul class="list-group w-100">
              <li class="list-group-item border-bottom-0" style="height: 55px;">
                <a class="list-link" href="/user/userSelect">내 정보</a>
              </li>
              <li class="list-group-item border-bottom-0" style="height: 55px;">
                <a class="list-link active" href="/user/userLectureList">내 강의리스트</a>
              </li>
              <li class="list-group-item border-bottom-0" style="height: 55px;">
                <a class="list-link" href="/user/userWishList">위시 리스트</a>
              </li>
              <li class="list-group-item" style="height: 55px;">
                <a class="list-link" href="/user/userPay">결제내역</a>
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

                  <div class="row col-lg-12 m-0">
                    <!-- carousel start-->
                    <div class="mb-3 classlist carousel slide w-100" id="slide" data-ride="carousel">
                    
                    
                    <!--  outer start -->
                      <div class="carousel-inner">
                      <!-- active start -->
                        <div class="carousel-item active">
                          <div class="d-flex w-100 col-lg-12">
                          <c:forEach items="${sugangList}" var="sugang" begin="0" end="2">
                            <div class="thumbnail col-lg-4">
                              <img src="${sugang.thumb }" alt="" onclick="selectLecture(${sugang.ltNo})">
                              <h5 class="px-3 m-0 font-weight-bold font-weight-bold" onclick="selectLecture(${sugang.ltNo})">${sugang.ttl}</h5>
                              <div class="small text-secondary text-right m-0">진도율 ( ${sugang.progPct}% )</div>
                              <div class="bg-secondary w-100 small position-relative">　
                                <div class="bg-danger position-absolute text-white pl-1" style="top:0px; width:${sugang.progPct}%">　</div>
                              </div>
                            </div>
                          </c:forEach>
                          </div> <!-- thumbnails first list end -->
                        </div> <!-- carousel item active end-->
 						<!-- active end -->
 						
 						
 						<!--inactive -->
 						<c:forEach items="${sugangList}" var="sugang" begin="3" varStatus="st" step="3">
	 						<div class="carousel-item">
		                    <div class="d-flex w-100 col-lg-12">
 							<c:forEach items="${sugangList}" var="innersugang" varStatus="sti" begin="${st.index}" end="${st.index +2 }">
		                         <div class="thumbnail col-lg-4">
		                          <img src="${innersugang.thumb}" alt="" onclick="selectLecture(${innersugang.ltNo})"/>
		                          <h5 class="px-3 font-weight-bold" onclick="selectLecture(${innersugang.ltNo})">${innersugang.ttl}</h5>
		                          <div class="small text-secondary text-right m-0">진도율 ( ${innersugang.progPct}% )</div>
		                          <div class="bg-secondary w-100 small position-relative">
		                           <div class="bg-danger position-absolute text-white pl-1" style="top:0px; width:${innersugang.progPct}%">　</div>
		                          </div>
		                          </div>
	 						</c:forEach>
		                   </div>
	                       </div>
						</c:forEach>                 
                        <!-- inactive end -->                       
                      </div> <!-- carousel inner end-->
                      <!--  outer end 드디어 햇다 !!! -->
                      
                      
                      
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
                  <div class="row col-lg-12 m-0">
                    <div class="my-3 mb-5 classlist endclass carousel slide w-100" id="slide2" data-ride="carousel">
                      <div class="carousel-inner">
                      <!--  active start -->
                        <div class="carousel-item active">
                          <div class="d-flex w-100 col-lg-12">           
                          <c:forEach items="${sugangEndList}" var="sugangend" begin="0" end="2">
                            <div class="thumbnail col-lg-4">
                              <img src="${sugangend.thumb }" alt="">
                              <h5 class="px-3 font-weight-bold font-weight-bold">${sugangend.ttl}</h5>
                            </div>
                          </c:forEach>
                          </div> <!-- thumbnails first list end -->
                        </div> <!-- carousel item active end-->
          				
          				<!-- inactive start -->
          				
          				
          				<c:forEach items="${sugangEndList}" var="sugangend" begin="3" varStatus="st" step="3">
	 						<div class="carousel-item">
		                    <div class="d-flex w-100 col-lg-12">
 							<c:forEach items="${sugangEndList}" var="innersugangend" varStatus="sti" begin="${st.index}" end="${st.index +2 }">
		                         <div class="thumbnail col-lg-4">
		                          <img src="${innersugangend.thumb}" alt="">
		                          <h5 class="px-3 font-weight-bold">${innersugangend.ttl}</h5>
		                          </div>
	 						</c:forEach>
		                   </div>
	                       </div>
						</c:forEach>    
                         <!-- inactive end -->
                         
                         
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
  
  <security:authorize access="isAuthenticated()">
<security:authentication property="principal.username" var="username"/>
</security:authorize>
  <form action="/user/userLectureSelect" method="post" id="lectureSelectForm">
  	<input type="hidden" name="id" value="${username}">
  	<input type="hidden" id="lectureNo" name="ltNo">
  	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
  </form>
  
  <script>
    const selectLecture = (number) => {
      console.log(number);
      $('#lectureNo').val(number);
      $('#lectureSelectForm').submit();
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