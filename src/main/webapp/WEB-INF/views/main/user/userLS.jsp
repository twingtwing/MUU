<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #cctgr>li {
      cursor: pointer;

    }
    .list-link {
      color: black;
    }
            
    .list-link.active{
      font-weight: bold;
      color: #e53637;
    }

    .card ol>li{
      list-style-type: decimal-leading-zero;
      cursor: pointer;
    }
    .card ol>li, .card ul>li{
      margin: 0.5rem;
      padding: 0.5rem;
    }
    .card ol>li:hover{
      background-color: lightgray;
      border-radius: 10px;
      font-weight: bold;
      transition: all 0.3s;
    }
    .card ul>li{
      list-style: none;
    }
  </style>
</head>
<body>
<security:authorize access="isAuthenticated()">
<security:authentication property="principal.username" var="username"/>
</security:authorize>
<!-- 배너 시작-->
  <section class="normal-breadcrumb set-bg" data-setbg="/resources/img/normal-breadcrumb.jpg">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <div class="normal__breadcrumb__text">
            <h2>내 강의리스트</h2>
            <p>수업 목록</p>
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
            <span>수업 목록</span>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 카테고리 끝-->

  <!-- body 의 body-->
  <section class="blog spad">
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
                <a class="list-link active" href="#">수업 목록</a>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                <a class="list-link listmenu" data-url="/user/userLNL" href="#">공지사항</a>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                <a class="list-link listmenu" data-url="/user/userLQ" href="#">질문 & 답변</a>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                <a class="list-link listmenu" data-url="/user/userLR" href="#">리뷰 & 별점</a>
              </li>
              <li class="list-group-item align-items-center d-flex" style="height: 55px;">
                <a class="list-link listmenu" data-url="/user/userRefund" href="#">환불</a>
              </li>
            </ul>
          </div>
        </div>
        
        <div class="col-lg-10">
          <div class="row col-lg-12 ml-2">
            <h3 class="font-weight-bold"><i class="fa fa-book text-danger" aria-hidden="true"></i>&nbsp;수강 중 - 수업 목록</h3>
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
          
          
          <div class="row col-lg-12 py-3">
            <div class="card w-100" style="position: relative;">
              <div class="card-body d-flex">
                <div class="bg-light w-75 p-3 d-flex justify-content-between align-items-center">
                  <ol class="ml-5" id="lsnlist">
                    <c:forEach items="${lessonList}" var="lesson" varStatus="st">
                    <li class="${lesson.lsnNo}">${lesson.ttl}
	                    <c:if test="${st.index eq 0 }">                    
	                    <span class="bg-primary text-white small p-1 rounded mx-3">무료 (OT)</span>
	                    </c:if>
                    </li>
                    </c:forEach>
                  </ol>
                  <ul>
                  <c:forEach items="${lessonList}" var="lesson">
                    <li class="">${lesson.regDate}</li>
                    </c:forEach>
                  </ul>
                </div>
                <div class="bg-light w-25 p-3">
                  <ul>
	                 <li class="position-relative h-100" style="background-color: lightgray;">　
	                    <!-- for each로 prog_pct 숫자를 width에 넣음 -->
	                 <div class="bg-success h-100 position-absolute" style="top:0; left:0; width:72%">　</div>
	               </li>                  
                  </ul>
                </div>
              </div>
              <!--card body end-->
            </div>
            <!-- card end-->
          </div>
        </div>
      </div> 
    </div>
  </section>
  <!-- body 의 body 끝 -->
  <form action="/user/userLW" method="post" id="watchForm" target="_blank">
  	<input type="hidden" name="ltNo" class="ltnoInput">
  	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
  </form>
  <form action="" id="move">
  	<input type="hidden" name="ltNo" value="${sugang.ltNo}">
  	<input type="hidden" name="id" value="${username}">
  </form>
  <!-- body 끝 -->
  <script type="text/javascript">
  $('.listmenu').click((e)=>{
	  let url = e.currentTarget.dataset.url;
	  $('#move').attr('action',url);
	  $('#move').submit();
  })
  
  
  // 강의시청
  $('#lsnlist>li').click((e)=>{
	  let num = e.currentTarget.className;
	  $('#watchForm>.ltnoInput').val(num);
	  $('#watchForm').submit();
  })
  </script>
</body>
</html>