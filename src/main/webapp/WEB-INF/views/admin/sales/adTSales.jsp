<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
      <!-- 페이지명-->
      <div class="page-breadcrumb">
        <div class="row">
          <div class="col-12 d-flex no-block align-items-center">
            <!-- 페이지명 작성 및 카테고리 작성 -->
            <h4 class="page-title">기간별 매출 통계</h4>
            <div class="ml-auto text-right">
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="/admin/home">home</a></li>
                  <li class="breadcrumb-item active" aria-current="page">기간별 매출 통계</li>
                </ol>
              </nav>
            </div>
          </div>
        </div>
      </div>
      <!-- 페이지명 끝-->

      <!-- 내용 시작 -->
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <!-- 연도별 매출-->
                <div class="col-lg-12 pb-5 pt-3">
                  <h5 class="bg-dark px-3 py-2 mb-0 text-white" style="border-radius: 13px;">연도별 회사 매출</h5>
                  <div class="row mt-4 justify-content-center">
                    <div class="col-lg-8">
                      <div class="w-100 d-flex align-items-center flex-column">
                        <canvas id="myChart" width="10" height="5"></canvas>
                      </div>
                    </div>
                  </div>
                  <div class="row justify-content-center">
                    <div class="col-lg-10">
                      <table class="w-100 text-center border mt-4" border="1">
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
		                      	<span <c:if test="${y.year ne 0 }">class="yearCnt"</c:if>>
		                      		<fmt:formatNumber>${y.cnt }</fmt:formatNumber>
		                      	</span> 개
		                      </td>
                          </c:forEach>
                        </tr>
                        <tr>
                          <td>매출액</td>
                          <c:forEach items="${years }" var="y">
	                          <td>
		                          <span <c:if test="${y.year ne 0 }">class="yearPay"</c:if>>
		                          	<fmt:formatNumber>${y.pay }</fmt:formatNumber>
		                          </span>만 원
	                          </td>
                          </c:forEach>
                        </tr>
                      </table>
                      <div class="row justify-content-end mt-3 w-100">
                        <a href="/admin/yearExcel" class="btn btn-success mr-2">EXCEL다운</a>
                      </div>
                    </div>
                  </div>

                </div>

                <hr class="my-5">

				<!-- 월별 매출 -->
                <div class="col-lg-12 pb-5 pt-3">
                  <h5 class="bg-dark px-3 py-2 mb-0 text-white" style="border-radius: 13px;">월별 회사 매출</h5>
                  <div class="row mt-4 m-3 justify-content-center">
                    <div class="col-lg-8">
                      <div class="row justify-content-end">
                        <select name="" id="monthBox" class="select border px-3 py-2">
	                        <c:forEach begin="${2016}" end="${thisyear }" var="y">
	                          <option value="${y }"<c:if test="${thisyear eq y }">selected="selected"</c:if>>${y }년</option>
	                        </c:forEach>
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="row justify-content-center">
                    <div class="col-lg-8">
                      <div class="w-100 d-flex align-items-center flex-column">
                        <canvas id="myChart2" width="10" height="5"></canvas>
                      </div>
                    </div>
                  </div>

                  <div class="row justify-content-center">
                    <div class="col-lg-10">
                      <table class="w-100 text-center mt-4 table-bordered">
                        <tr>
                          <th></th>
                          <c:forEach items="${months }" var="mon">
	                          <c:if test="${mon.month ne 0 }">
	                          	<th width="7%" class="monthLabel">${mon.month }월</th>
	                          </c:if>
                          </c:forEach>
                          <th width="7%">총 합</th>
                        </tr>
                        <tr>
                          <td>판매량</td>
                          <c:forEach items="${months }" var="mon">
                          	<td>
		                      	<span class="<c:if test="${mon.month ne 0 }">monthCnt</c:if> chartCnt">
		                      		<fmt:formatNumber>${mon.cnt }</fmt:formatNumber>
		                      	</span> 개
		                    </td>
                          </c:forEach>
                        </tr>
                        <tr>
                          <td>매출액</td>
                          <c:forEach items="${months }" var="mon">
                          	<td>
		                    	<span class="<c:if test="${mon.month ne 0 }">monthPay</c:if> chartPay">
		                        	<fmt:formatNumber>${mon.pay }</fmt:formatNumber>
		                        </span>만 원
	                        </td>
                          </c:forEach>
                        </tr>
                      </table>
                      <div class="row justify-content-end mt-3 w-100">
                        <a id="monthExcel" href="/admin/monthExcel?month=${thisyear }" class="btn btn-success mr-2">EXCEL다운</a>
                      </div>
                    </div>
                  </div>
                  
                </div>

                <hr class="my-5">

				<!-- 카테도리별 연별 매출 -->
                <div class="col-lg-12 pb-5">
                  <h5 class="bg-dark px-3 py-2 mb-0 text-white" style="border-radius: 13px;">카테고리별 연도별 매출</h5>
                  <div class="row mt-4 justify-content-center">
                    <div class="col-lg-8">
                      <div class="w-100 d-flex align-items-center flex-column">
                        <canvas id="myChart3" width="10" height="5"></canvas>
                      </div>
                    </div>
                  </div>
                  <div class="row justify-content-center">
                    <div class="col-lg-10">
                      <table class="w-100 mt-4 text-center border" border="1">
                        <tr>
                          <th>매출</th>
                          <c:forEach items="${ctgrYear}" var="ctgr">
                          	<c:if test="${ctgr.year ne 3000}">
	                          	<th class="ctgrYearCnt">${ctgr.year}</th>
                          	</c:if>
                          </c:forEach>
                          <th>총 합</th>
                        </tr>
                        <tr>
                        	<th>음악</th>
                        	<c:forEach items="${ctgrYear}" var="ctgr" varStatus="var">
                          		<td>
                          			<span <c:if test="${not var.last}">class="ctgrYearPay"</c:if> >
                          				<fmt:formatNumber>${ctgr.hc01}</fmt:formatNumber>
                          			</span>
                          		</td>
                          	</c:forEach>
                        </tr>
                        <tr>
                        	<th>요리</th>
                        	<c:forEach items="${ctgrYear}" var="ctgr" varStatus="var">
                          		<td>
                          			<span <c:if test="${not var.last}">class="ctgrYearPay"</c:if> >
                          				<fmt:formatNumber>${ctgr.hc02}</fmt:formatNumber>
                          			</span>
                          		</td>
                          	</c:forEach>
                        </tr>
                        <tr>
                        	<th>건강</th>
                        	<c:forEach items="${ctgrYear}" var="ctgr" varStatus="var">
                          		<td>
                          			<span <c:if test="${not var.last}">class="ctgrYearPay"</c:if> >
                          				<fmt:formatNumber>${ctgr.hc03}</fmt:formatNumber>
                          			</span>
                          		</td>
                          	</c:forEach>
                        </tr>
                        <tr>
                        	<th>아트</th>
                        	<c:forEach items="${ctgrYear}" var="ctgr" varStatus="var">
                          		<td>
                          			<span <c:if test="${not var.last}">class="ctgrYearPay"</c:if> >
                          				<fmt:formatNumber>${ctgr.hc04}</fmt:formatNumber>
                          			</span>
                          		</td>
                          	</c:forEach>
                        </tr>
                        <tr>
                        	<th>외국어</th>
                        	<c:forEach items="${ctgrYear}" var="ctgr" varStatus="var">
                          		<td>
                          			<span <c:if test="${not var.last}">class="ctgrYearPay"</c:if> >
                          				<fmt:formatNumber>${ctgr.hc05}</fmt:formatNumber>
                          			</span>
                          		</td>
                          	</c:forEach>
                        </tr>
                        <tr>
                        	<th>IT/컴퓨터</th>
                        	<c:forEach items="${ctgrYear}" var="ctgr" varStatus="var">
                          		<td>
                          			<span <c:if test="${not var.last}">class="ctgrYearPay"</c:if> >
                          				<fmt:formatNumber>${ctgr.hc06}</fmt:formatNumber>
                          			</span>
                          		</td>
                          	</c:forEach>
                        </tr>
                        <tr>
                        	<th>자기계발</th>
                        	<c:forEach items="${ctgrYear}" var="ctgr" varStatus="var">
                          		<td>
                          			<span <c:if test="${not var.last}">class="ctgrYearPay"</c:if> >
                          				<fmt:formatNumber>${ctgr.hc07}</fmt:formatNumber>
                          			</span>
                          		</td>
                          	</c:forEach>
                        </tr>
                        <tr>
                        	<th>전체</th>
                        	<c:forEach items="${ctgrYear}" var="ctgr">
                          		<td>
                          			<span>${ctgr.pay}</span>
                          		</td>
                          	</c:forEach>
                        </tr>
                      </table>
                      <p class="text-right mt-1 mr-1 font-weight-bold text-muted">단위 : 만 원</p>
                      <div class="row justify-content-end mt-3 w-100">
                        <a href="/admin/yearCtgrExcel" class="btn btn-success mr-1">EXCEL다운</a>
                      </div>
                    </div>
                  </div>
                </div>

                <hr class="my-5">

				<!-- 카테고리별 월별 매출 -->
                <div class="col-lg-12 pb-5">
                  <h5 class="bg-dark px-3 py-2 mb-0 text-white" style="border-radius: 13px;">카테고리별 월별 회사 매출</h5>
                  <div class="row mt-4 m-3 justify-content-center">
                    <div class="col-lg-8">
                      <div class="row justify-content-end">
                        <select id="ctgrMonthBox" class="select border px-3 py-2">
                         <c:forEach begin="${2016}" end="${thisyear }" var="y">
                          <option value="${y }"<c:if test="${thisyear eq y }">selected="selected"</c:if>>${y }년</option>
                        </c:forEach>
                        </select>
                      </div>
                    </div>
                  </div>
  
                  <div class="row justify-content-center">
                    <div class="col-lg-8">
                      <div class="w-100 d-flex align-items-center flex-column">
                        <canvas id="myChart4" width="10" height="5"></canvas>
                      </div>
                    </div>
                  </div>
                  <div class="row justify-content-center">
                    <div class="col-lg-10">
                      <table class="w-100 text-center mt-4 table-bordered">
                          <tr>
                          <th>매출</th>
                          <c:forEach items="${ctgrMonth}" var="ctgr">
                          	<c:if test="${ctgr.month ne 13}">
	                          	<th class="ctgrMonthCnt">${ctgr.month}월</th>
                          	</c:if>
                          </c:forEach>
                          <th>총 합</th>
                        </tr>
                        <tr>
                        	<th>음악</th>
                        	<c:forEach items="${ctgrMonth}" var="ctgr" varStatus="var">
                          		<td>
                          			<span class="<c:if test="${not var.last}">ctgrMonthPay</c:if> ctgrChartPay01">
                          				<fmt:formatNumber>${ctgr.hc01}</fmt:formatNumber>
                          			</span>
                          		</td>
                          	</c:forEach>
                        </tr>
                        <tr>
                        	<th>요리</th>
                        	<c:forEach items="${ctgrMonth}" var="ctgr" varStatus="var">
                          		<td>
                          			<span class="<c:if test="${not var.last}">ctgrMonthPay</c:if> ctgrChartPay02">
                          				<fmt:formatNumber>${ctgr.hc02}</fmt:formatNumber>
                          			</span>
                          		</td>
                          	</c:forEach>
                        </tr>
                        <tr>
                        	<th>건강</th>
                        	<c:forEach items="${ctgrMonth}" var="ctgr" varStatus="var">
                          		<td>
                          			<span class="<c:if test="${not var.last}">ctgrMonthPay</c:if> ctgrChartPay03">
                          				<fmt:formatNumber>${ctgr.hc03}</fmt:formatNumber>
                          			</span>
                          		</td>
                          	</c:forEach>
                        </tr>
                        <tr>
                        	<th>아트</th>
                        	<c:forEach items="${ctgrMonth}" var="ctgr" varStatus="var">
                          		<td>
                          			<span class="<c:if test="${not var.last}">ctgrMonthPay</c:if> ctgrChartPay04">
                          				<fmt:formatNumber>${ctgr.hc04}</fmt:formatNumber>
                          			</span>
                          		</td>
                          	</c:forEach>
                        </tr>
                        <tr>
                        	<th>외국어</th>
                        	<c:forEach items="${ctgrMonth}" var="ctgr" varStatus="var">
                          		<td>
                          			<span class="<c:if test="${not var.last}">ctgrMonthPay</c:if> ctgrChartPay05">
                          				<fmt:formatNumber>${ctgr.hc05}</fmt:formatNumber>
                          			</span>
                          		</td>
                          	</c:forEach>
                        </tr>
                        <tr>
                        	<th>IT/컴퓨터</th>
                        	<c:forEach items="${ctgrMonth}" var="ctgr" varStatus="var">
                          		<td>
                          			<span class="<c:if test="${not var.last}">ctgrMonthPay</c:if> ctgrChartPay06">
                          				<fmt:formatNumber>${ctgr.hc06}</fmt:formatNumber>
                          			</span>
                          		</td>
                          	</c:forEach>
                        </tr>
                        <tr>
                        	<th>자기계발</th>
                        	<c:forEach items="${ctgrMonth}" var="ctgr" varStatus="var">
                          		<td>
                          			<span class="<c:if test="${not var.last}">ctgrMonthPay</c:if> ctgrChartPay07">
                          				<fmt:formatNumber>${ctgr.hc07}</fmt:formatNumber>
                          			</span>
                          		</td>
                          	</c:forEach>
                        </tr>
                        <tr>
                        	<th>전체</th>
                        	<c:forEach items="${ctgrMonth}" var="ctgr">
                          		<td>
                          			<span class="ctgrChartPay">${ctgr.pay}</span>
                          		</td>
                          	</c:forEach>
                        </tr>
                      </table>
                      <p class="text-right mt-1 mr-1 font-weight-bold text-muted">단위 : 만 원</p>
                      <div class="row justify-content-end mt-3 w-100">
                        <a id="monthCtgrExcel" href="/admin/monthCtgrExcel?month=${thisyear }" class="btn btn-success mr-2">EXCEL다운</a>
                      </div>
                    </div>
                  </div>
                </div>

              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- 내용 끝 -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script>
  // 연도별 회사 매출
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
        datasets: [
        	 {
                 type: 'bar',
                 label: '매출액',
                 backgroundColor: 'green',
                 data: yearPay,
               },	
        {
          type: 'line',
          label: '판매량',
          backgroundColor: 'gray',
          data: yearCnt
        }, ]
      },
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        },
      }
    });

    // 월별 회사 매출
    const monthsLabels = [];
  	for(let l of $('.monthLabel')){
  		monthsLabels.push(l.textContent)	
  	}
  	let monthCnt = []
  	for(let l of $('.monthCnt')){
  		monthCnt.push(+l.textContent)	
  	}
  	let monthPay = []
  	for(let l of $('.monthPay')){
  		monthPay.push(+l.textContent.replaceAll(',',''))	
  	}
    const ctx2 = document.getElementById('myChart2').getContext('2d');
    const myChart2 = new Chart(ctx2, {
      type: 'bar',
      data: {
        labels: monthsLabels,
        datasets: [{
          type: 'bar',
          label: '매출액',
          backgroundColor: 'green',
          data: monthPay,
        }, {
          type: 'line',
          label: '판매량',
          data: monthCnt,
          backgroundColor: 'gray'
        }, ]
      },
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        },
      }
    });
    // 값변화
    $('#monthBox').change(()=>{
    	$.ajax({
    		url : '/admin/tsales/monthChange',
    		data : {selectYear: $('#monthBox').val()}
    	})
    	.done((r)=>{
    		monthCnt = [];
    		monthPay = [];
    		r.forEach((obj)=>{
    			monthCnt.push(obj.cnt===null ? 0 : obj.cnt)
    			monthPay.push(obj.pay===null ? 0 : obj.pay)
    		})
    		myChart2.reset();
    		myChart2.data.datasets[0].data = monthCnt;
    		myChart2.data.datasets[1].data = monthPay;
    		myChart2.update();

    		// 테이블값도 바꾸기
    		for(let i = 0; i < monthCnt.length; i++){
    			$('.chartCnt').eq(i)[0].innerText = monthCnt[i]
    			$('.chartPay').eq(i)[0].innerText = monthPay[i]
    		}
    		
    		monthExcel.setAttribute('href','/admin/monthExcel?month='+$('#monthBox').val());
    	})
    })
	
    // 카테고리별 연도별
    const ctgrYearCnt = []
  	for(let l of $('.ctgrYearCnt')){
  		ctgrYearCnt.push(+l.textContent)	
  	}
  	const ctgrYearPay = [];
  	let yearCount = 0;
  	for(var i = 0; i < 7 ; i++){
  		ctgrYearPay[i] = [] 
  		for(let j =0 ; j <= (Number('${thisyear }') - 2016) ; j++){
  			ctgrYearPay[i].push($('.ctgrYearPay').eq(yearCount)[0].textContent.replaceAll(',',''))	
  			yearCount++;
  		}
  	}
    const ctx3 = document.getElementById('myChart3').getContext('2d');
    const myChart3 = new Chart(ctx3, {
      type: 'bar',
      data: {
        labels: yearLabels,
        datasets: [{
        	type: 'bar',
            label: '음악',
            backgroundColor: 'coral',
            data: ctgrYearPay[0]
          },{
            type: 'bar',
            label: '요리',
            backgroundColor: 'powderblue',
            data: ctgrYearPay[1]
          },{
              type: 'bar',
              label: '건강',
              backgroundColor: 'cedetblue',
              data: ctgrYearPay[2]
          },{
              type: 'bar',
              label: '아트',
              backgroundColor: 'darkkhaki',
              data: ctgrYearPay[3]
          }, {
            type: 'bar',
            label: '외국어',
            data: ctgrYearPay[4],
            backgroundColor: 'Darkseagreen'
          },
          {
            type: 'bar',
            label: 'IT/컴퓨터',
            data: ctgrYearPay[5],
            backgroundColor: 'lightgray'
          },
          {
            type: 'bar',
            label: '자기계발',
            data:ctgrYearPay[6],
            backgroundColor: 'pink'
          }
        ]
      },
      options: {
        scales: {
          x: {
            stacked: true
          },
          y: {
            beginAtZero: true,
            stacked: true
          }
        },
      }
    });
 
    const ctgrMonthCnt = []
  	for(let l of $('.ctgrMonthCnt')){
  		ctgrMonthCnt.push(l.textContent);
  	}
  	const ctgrMonthPay = [];
  	let monthCount = 0;
  	for(var i = 0; i < 7 ; i++){
  		ctgrMonthPay[i] = [] 
  		for(let j = 0 ; j < 12 ; j++){
  			ctgrMonthPay[i].push($('.ctgrMonthPay').eq(monthCount)[0].textContent.replaceAll(',',''))	
  			monthCount++;
  		}
  	}
    const ctx4 = document.getElementById('myChart4').getContext('2d');
    const myChart4 = new Chart(ctx4, {
      type: 'bar',
      data: {
        labels: ctgrMonthCnt,
        datasets:  [{
        	type: 'bar',
            label: '음악',
            backgroundColor: 'coral',
            data: ctgrMonthPay[0]
          },{
            type: 'bar',
            label: '요리',
            backgroundColor: 'powderblue',
            data: ctgrMonthPay[1]
          },{
              type: 'bar',
              label: '건강',
              backgroundColor: 'cedetblue',
              data: ctgrMonthPay[2]
          },{
              type: 'bar',
              label: '아트',
              backgroundColor: 'darkkhaki',
              data: ctgrMonthPay[3]
          }, {
            type: 'bar',
            label: '외국어',
            data: ctgrMonthPay[4],
            backgroundColor: 'Darkseagreen'
          },
          {
            type: 'bar',
            label: 'IT/컴퓨터',
            data: ctgrMonthPay[5],
            backgroundColor: 'lightgray'
          },
          {
            type: 'bar',
            label: '자기계발',
            data : ctgrMonthPay[6],
            backgroundColor: 'pink'
          }
        ]
      },
      options: {
        scales: {
          x: {
            stacked: true
          },
          y: {
            beginAtZero: true,
            stacked: true
          }
        },
      }
    });
    
 	// 값변화
    $('#ctgrMonthBox').change(()=>{
    	$.ajax({
    		url : '/admin/tsales/ctgrMonthChange',
    		data : {selectYear: $('#ctgrMonthBox').val()}
    	})
    	.done((r)=>{
    		hc01 = [];
    		hc02 = [];
    		hc03 = [];
    		hc04 = [];
    		hc05 = [];
    		hc06 = [];
    		hc07 = [];
    		pay = [];
    		r.forEach((obj)=>{
    			hc01.push(obj.hc01===null ? 0 : obj.hc01)
    			hc02.push(obj.hc02===null ? 0 : obj.hc02)
    			hc03.push(obj.hc03===null ? 0 : obj.hc03)
    			hc04.push(obj.hc04===null ? 0 : obj.hc04)
    			hc05.push(obj.hc05===null ? 0 : obj.hc05)
    			hc06.push(obj.hc06===null ? 0 : obj.hc06)
    			hc07.push(obj.hc07===null ? 0 : obj.hc07)
    			pay.push(obj.pay===null ? 0 : obj.pay)
    		})
    		myChart4.reset();
    		myChart4.data.datasets[0].data = hc01;
    		myChart4.data.datasets[1].data = hc02;
    		myChart4.data.datasets[2].data = hc03;
    		myChart4.data.datasets[3].data = hc04;
    		myChart4.data.datasets[4].data = hc05;
    		myChart4.data.datasets[5].data = hc06;
    		myChart4.data.datasets[6].data = hc07;
    		myChart4.update();

    		// 테이블값도 바꾸기
    		for(let i = 0; i < pay.length; i++){
    			$('.ctgrChartPay').eq(i)[0].innerText = pay[i];
    			$('.ctgrChartPay01').eq(i)[0].innerText = hc01[i];
    			$('.ctgrChartPay02').eq(i)[0].innerText = hc02[i];
    			$('.ctgrChartPay03').eq(i)[0].innerText = hc03[i];
    			$('.ctgrChartPay04').eq(i)[0].innerText = hc04[i];
    			$('.ctgrChartPay05').eq(i)[0].innerText = hc05[i];
    			$('.ctgrChartPay06').eq(i)[0].innerText = hc06[i];
    			$('.ctgrChartPay07').eq(i)[0].innerText = hc07[i];
    		}
    		
    		monthCtgrExcel.setAttribute('href','/admin/monthCtgrExcel?month='+$('#ctgrMonthBox').val());
    	})
    })
  
  </script>
</body>
</html>