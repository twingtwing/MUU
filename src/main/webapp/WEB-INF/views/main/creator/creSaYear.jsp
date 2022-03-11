<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/creator-menu.css" type="text/css">
</head>
<body>
<!-- 배너 시작-->
  <section class="normal-breadcrumb set-bg" data-setbg="/resources/img/normal-breadcrumb.jpg">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <div class="normal__breadcrumb__text">
            <h2>크리에이터</h2>
            <p>매출 내역</p>
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
                        <span>매출내역</span>
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
                            <!-- 해당 상위카테고리 일때, active가 보여야함 => 자바스크립트 혹은 jstl if구문으로 해결해야함 -->
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                                <a class="list-link" href="/creator/creS">크리에이터 정보</a>
                            </li>
                            <p class="list-group-item border-bottom-0 mb-0 align-items-center d-flex mylist">내 강의 목록</p>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex pl-40" style="height: 35px;">
                                <a class="list-link" href="/creator/rLecL">&nbsp;&nbsp;- 신청한 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                                <a class="list-link" href="/creator/oLecL">&nbsp;&nbsp;- 열린 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                                <a class="list-link" href="/creator/clLecL">&nbsp;&nbsp;- 종료된 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                                <a class="list-link" href="/creator/rpLecL">&nbsp;&nbsp;- 신고된 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                                <a class="list-link" href="/creator/lecI">강의등록</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                                <a class="list-link active" href="/creator/creSaleYear">매출내역</a>
                            </li>
                            <li class="list-group-item align-items-center d-flex" style="height: 55px;">
                                <a class="list-link" href="/creator/creRefund">환불 요청 내역</a>
                            </li>
                        </ul>
                        
                    </div>
                </div>
        <div class="col-lg-10">
          <div class="col-12 ml-2">
            <div class="row col-12">
              <h3 class="font-weight-bold"><i class="fa fa-bar-chart text-danger" aria-hidden="true"></i>&nbsp;매출 내역</h3>
            </div>
            <hr class="font-weight-bold">
            
            <div class="row col-12">
              <div class="menu w-100 d-flex justify-content-between">
                <div>
                   <a href="/creator/creSaleYear"><button class="border mx-1 px-3 py-2  bg-secondary text-white">연도별 매출</button></a>
                  <a href="/creator/creSaleMonth"><button class="border mx-1 px-3 py-2">월별 매출</button></a>
                  <a href="/creator/creSaleLec"><button class="border mx-1 px-3 py-2">강의별 매출</button></a>
                </div>
              </div>
              <hr class="font-weight-bold">
              <div class="col-12 row justify-content-center">
                <div class="row col-11">
                  <div class="w-100 d-flex mt-3">
                    <canvas id="myChart" class="m-3"></canvas>
                  </div>
                </div>
              </div>
            </div>
            <div class="row col-12 justify-content-end mr-1 mb-1">
            	<p class="font-weight-bold text-muted">(단위) 판매량 : 개 / 매출액 : 만 원</p>
            </div>
            <div class="row col-12 mr-5">
              <table class="text-center table">
                <tr>
                  <th width="11%"></th>
                  	<c:forEach items="${years }" var="y">
	                    <c:if test="${y.year ne 0 }">
	                    	<th width="11%" class="yearLabel">${y.year }</th>
	                    </c:if>
	               	    <c:if test="${y.year eq 0 }">
	                    	<th width="12%">총 합</th>
	                	</c:if>
                	</c:forEach>
                </tr>
                <tr>
                	<td>판매량</td>
                    <c:forEach items="${years }" var="y">
		                <td>
		                	<span <c:if test="${y.year ne 0 }">class="yearCnt"</c:if>>${y.cnt }</span>
		           		</td>
                    </c:forEach>
                </tr>
                <tr>
                    <td>매출액</td>
                    <c:forEach items="${years }" var="y">
	                    <td>
		                   	<span <c:if test="${y.year ne 0 }">class="yearPay"</c:if>>${y.pay }</span>
	                	</td>
                	</c:forEach>
              	</tr>
              </table>
            </div>
            <div class="row col-12 mr-5 justify-content-end">
              <button class="border px-3 py-2 bg-danger text-white">PDF 다운</button>
              <a href="/creator/creSaYearExcel" class="border ml-1 mr-5 px-3 py-2 bg-success text-white">EXCEL 다운</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script>
  	const yearLabels = [];
	for(let l of $('.yearLabel')){
		yearLabels.push(l.textContent)	
	}
	const yearCnt = []
	for(let l of $('.yearCnt')){
		yearCnt.push(+l.textContent)	
	}
	const yearPay = []
	for(let l of $('.yearPay')){
		yearPay.push(+l.textContent.replaceAll(',',''))	
	}
    const ctx = document.getElementById('myChart').getContext('2d');
    const myChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: yearLabels,
        datasets: [{
          label : '판매량',
          data : yearCnt,
          backgroundColor: 'gray'
        },{
          label : '매출액',
          data : yearPay
        }]
      },
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });
    
  //mouseover 이벤트 : 사이드바 css변경
    $('#cctgr > .list-group-item:not(.mylist)').on('mouseover',function(){
        $(this).css('background-color','#e53637');
        $(this).find('.list-link').css('color','#ffffff');
    })

    //mouseover 이벤트 : 사이드바 css변경
    $('#cctgr > .list-group-item:not(.mylist)').on('mouseout',function(){
        $(this).css('background-color','#ffffff');
        $(this).find('.list-link').css('color','#000000');
        $(this).find('.list-link.active').css('color','#e53637');
    })

  </script>
</body>
</html>