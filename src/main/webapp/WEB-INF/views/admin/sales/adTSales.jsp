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
                  <li class="breadcrumb-item"><a href="#">home</a></li>
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
                <!-- 여기서부터 작성 -->
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
                          <th></th>
                          <c:forEach items="${years }" var="y">
                          <c:if test="${y.year ne 0 }">
                          <th class="yearLabel">${y.year }</th>
                          </c:if>
                          <c:if test="${y.year eq 0 }">
                          <th>총 합</th>
                          </c:if>
                          </c:forEach>
                        </tr>
                        <tr>
                          <td>판매량</td>
                          <c:forEach items="${years }" var="y">
                          <c:if test="${y.year ne 0 }">
                          <td class="yearCnt">
	                          	${y.cnt }
	                       </td>
                          </c:if>
                          <c:if test="${y.year eq 0 || empty y.year}">
							<td>
                          	${y.cnt }
                          </td>
                          </c:if>
                          </c:forEach>
                        </tr>
                        <tr>
                          <td>매출액</td>
                          <c:forEach items="${years }" var="y">
                          <td>
                          <c:if test="${y.year ne 0 }">
	                          <span class="yearPay">
	                          	<fmt:formatNumber>${y.pay }</fmt:formatNumber>
	                          </span>원
                          </c:if>
                          <c:if test="${y.year eq 0 || empty y.year}">
                          	<span>
                          	<fmt:formatNumber>${y.pay }</fmt:formatNumber>
                          	</span>원
                          </c:if>
                          </td>
                          </c:forEach>
                        </tr>
                      </table>
                      <div class="row justify-content-end mt-3 w-100">
                        <button class="btn btn-danger mr-2">PDF다운</button>
                        <button class="btn btn-success mr-2">EXCEL다운</button>
                      </div>
                    </div>
                  </div>

                </div>

                <hr class="my-5">

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
                          <td <c:if test="${mon.month ne 0 }">class="monthCnt"</c:if>>${mon.cnt }</td>
                          </c:forEach>
                        </tr>
                        <tr>
                          <td>매출액</td>
                          <c:forEach items="${months }" var="mon">
                          <td>
                          <c:if test="${mon.month ne 0 }">
	                          <span class="monthPay">
	                          	<fmt:formatNumber>${mon.pay }</fmt:formatNumber>
	                          </span>원
                          </c:if>
                          <c:if test="${mon.month eq 0 || empty mon.month}">
                          	<span>
                          	<fmt:formatNumber>${mon.pay }</fmt:formatNumber>
                          	</span>원
                          </c:if>
                          </td>
                          </c:forEach>
                        </tr>
                      </table>
                      <div class="row justify-content-end mt-3 w-100">
                        <button class="btn btn-danger mr-2">PDF다운</button>
                        <button class="btn btn-success mr-2">EXCEL다운</button>
                      </div>
                    </div>
                  </div>
                  
                </div>

                <hr class="my-5">

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
                          <th>판매량/연도</th>
                          <c:forEach items="${years }" var="y">
                          <c:if test="${y.year ne 0 }">
                          <th>${y.year }</th>
                          </c:if>
                          </c:forEach>
                          <th>총 합</th>
                        </tr>
                        <c:forEach items="${ctgrYear }" var="c">
                        <tr>
                        	<td>
                        	<c:if test="${not empty c.upCtgr && empty c.year }">
                        		${c.upCtgr }
                        	</c:if>
                        	</td>
                        	<td>
                        	모르겠다 ..
                        	</td>
                        </tr>
                        </c:forEach>
                      </table>
                      <div class="row justify-content-end mt-3 w-100">
                        <button class="btn btn-danger mr-2">PDF다운</button>
                        <button class="btn btn-success mr-1">EXCEL다운</button>
                      </div>
                    </div>
                  </div>
                </div>

                <hr class="my-5">

                <div class="col-lg-12 pb-5">
                  <h5 class="bg-dark px-3 py-2 mb-0 text-white" style="border-radius: 13px;">카테고리별 월별 회사 매출</h5>
                  <div class="row mt-4 m-3 justify-content-center">
                    <div class="col-lg-8">
                      <div class="row justify-content-end">
                        <select name="" id="" class="select border px-3 py-2">
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
                          <th></th>
                          <th width="7%">1월</th>
                          <th width="7%">2월</th>
                          <th width="7%">3월</th>
                          <th width="7%">4월</th>
                          <th width="7%">5월</th>
                          <th width="7%">6월</th>
                          <th width="7%">7월</th>
                          <th width="7%">8월</th>
                          <th width="7%">9월</th>
                          <th width="7%">10월</th>
                          <th width="7%">11월</th>
                          <th width="7%">12월</th>
                          <th width="7%">총 합</th>
                        </tr>
                        <tr>
                          <td>판매량</td>
                          <td>5</td>
                          <td>9</td>
                          <td>7</td>
                          <td>12</td>
                          <td>20</td>
                          <td>36</td>
                          <td>28</td>
                          <td>5</td>
                          <td>9</td>
                          <td>7</td>
                          <td>12</td>
                          <td>20</td>
                          <td></td>
                        </tr>
                        <tr>
                          <td>매출액</td>
                          <td>5</td>
                          <td>9</td>
                          <td>7</td>
                          <td>12</td>
                          <td>20</td>
                          <td>36</td>
                          <td>28</td>
                          <td>5</td>
                          <td>9</td>
                          <td>7</td>
                          <td>12</td>
                          <td>20</td>
                          <td></td>
                        </tr>
                      </table>
                      <div class="row justify-content-end mt-3 w-100">
                        <button class="btn btn-danger mr-2">PDF다운</button>
                        <button class="btn btn-success mr-2">EXCEL다운</button>
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
    		// 테이블값도 바꾸기.
    	})
    })
    
    
	
    // 카테고리별 연도별
    const ctgrYearCnt = []
  	for(let l of $('.ctgrYearCnt')){
  		ctgrYearCnt.push(+l.textContent)	
  	}
  	const ctgrYearPay = []
  	for(let l of $('.ctgrYearPay')){
  		ctgrYearPay.push(+l.textContent.replaceAll(',',''))	
  	}
    const ctx3 = document.getElementById('myChart3').getContext('2d');
    const myChart3 = new Chart(ctx3, {
      type: 'bar',
      data: {
        labels: yearLabels,
        datasets: [{
            type: 'bar',
            label: '요리',
            backgroundColor: 'Darkseagreen',
            data: [
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
            ]
          }, {
            type: 'bar',
            label: '아트',
            data: [
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
            ],
            backgroundColor: 'lightgray'
          },
          {
            type: 'bar',
            label: '자기계발',
            data: [
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
            ],
            backgroundColor: 'powderblue'
          },
          {
            type: 'bar',
            label: 'IT, 컴퓨터',
            data: [
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
            ],
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
 
    const ctx4 = document.getElementById('myChart4').getContext('2d');
    const myChart4 = new Chart(ctx4, {
      type: 'bar',
      data: {
        labels: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
        datasets: [{
            type: 'bar',
            label: '요리',
            backgroundColor: 'Darkseagreen',
            data: [
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
            ]
          }, {
            type: 'bar',
            label: '아트',
            data: [
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
            ],
            backgroundColor: 'lightgray'
          },
          {
            type: 'bar',
            label: '자기계발',
            data: [
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
            ],
            backgroundColor: 'powderblue'
          },
          {
            type: 'bar',
            label: 'IT, 컴퓨터',
            data: [
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
            ],
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
  
  </script>
</body>
</html>