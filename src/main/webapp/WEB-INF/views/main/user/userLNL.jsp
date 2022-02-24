<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
    #cctgr li{
      cursor: pointer;
    }
    .list-link {
      color: black;
    }
            
    .list-link.active{
      font-weight: bold;
      color: #e53637;
    }

    td,th{
      padding: 0.5rem;
    }
    thead{
      background-color: lightgray;
    }
    tbody>tr{
      cursor: pointer;
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
          <p>공지사항</p>
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
          <span>공지사항</span>
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
                <a class="list-link active" href="./박정욱_위시리스트.html">공지사항</a>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                <a class="list-link" href="./박정욱_위시리스트.html">질문 & 답변</a>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                <a class="list-link" href="./박정욱_위시리스트.html">리뷰 & 별점</a>
              </li>
              <li class="list-group-item align-items-center d-flex" style="height: 55px;">
                <a class="list-link" href="./박정욱_유저결제내역.html">환불</a>
              </li>
            </ul>
          </div>
        </div>

        <div class="col-lg-10">
          <div class="row col-lg-12 ml-2">
            <h3 class="font-weight-bold"><i class="fa fa-table text-danger" aria-hidden="true"></i>&nbsp;수강 중 - 공지사항</h3>
          </div>
          <hr class="font-weight-bold">
          <div class="row col-lg-12 py-3">

            <div class="card w-100" style="position: relative;">
              <div class="card-body my-3">
                <div class="col-12 row justify-content-end mb-1">
                  <select class="border px-4">
                    <option value="">제목</option>
                    <option value="">내용</option>
                  </select>
                  <input type="text" class="border">
                  <button type="button" class="border px-4">검색</button>
                </div>

                <div class="col-12 row mb-3">
                  <table class="w-100 list text-center">
                    <thead class="bg-light">
                      <tr>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>파일</th>
                        <th>작성일</th>
                        <th>조회수</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${notices}" var="notice">
                      <tr>
                        <td>${notice.ntNo}</td>
                        <td>${notice.ttl}</td>
                        <td>
                        	<c:if test="${not empty notice.fileNo}">🗎</c:if>
                        </td>
                        <td>${notice.wrDate }</td>
                        <td>${notice.hits }</td>
                      </tr>
                    </c:forEach>
                    <tr>
                        <th>1</th>
                        <th>dd</th>
                        <th></th>
                        <th>2022-05-05</th>
                        <th>5</th>
                      </tr>
                    </tbody>
                  </table>
                </div>

                <div class="product__pagination d-flex justify-content-center">
                  <a href="#"><i class="fa fa-angle-double-left"></i></a>
                  <a href="#" class="current-page">1</a>
                  <a href="#">2</a>
                  <a href="#">3</a>
                  <a href="#">4</a>
                  <a href="#">5</a>
                  <a href="#"><i class="fa fa-angle-double-right"></i></a>
                </div>            
              </div>
              <!--card body end-->
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <form action="/user/userLNS" class="userLNS">
  <input type="hidden" name="ntNo">
  </form>
  <script>
    document.querySelector('tbody>tr').addEventListener('click',(e)=>{
      // 글 선택
      let ntNo = e.currentTarget.firstElementChild.textContent;
      $('.userLNS input').val(ntNo);
      $('.userLNS').submit();
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