<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">사이트 주요 분석</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/admin/home">Home</a></li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Sales Cards  -->
                <!-- ============================================================== -->
                <div class="row">
                    <!-- Column -->
                </div>
                <!-- ============================================================== -->
                <!-- Sales chart -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-md-flex align-items-center">
                                    <div>
                                        <h4 class="card-title">최근 일주일 매출</h4>
                                        <h5 class="card-subtitle">판매량 및 매출액</h5>
                                    </div>
                                </div>
                                <div class="row d-flex align-items-center">
                                    <!-- column -->
                                    <div class="col-lg-7">
                                        <div class="flot-chart">
                                            <canvas id="recent7days" width="10" height="5"></canvas>
                                        </div>
                                        <div>
                                        	<p class="text-muted text-right font-weight-bold">( 판매량 단위 : 만 원 )</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-5">
                                        <div class="row">
                                        <c:forEach items="${home.countList }" var="c" varStatus="var">
                                            <div class="col-6 mb-2" style="height: 110px;">
                                                <div class="bg-dark p-10 text-white h-100 d-flex align-items-center justify-content-center">
                                                    <div class="text-center">
                                                    	<c:if test="${var.index eq 0 }"><i class="fa fa-cart-plus m-0 font-16"></i></c:if>
                                                    	<c:if test="${var.index eq 1 }"><i class="fa fa-plus m-0 m-b-5 font-16"></i></c:if>
                                                    	<c:if test="${var.index eq 2 }"><i class="fa fa-globe m-0 m-b-5 font-16"></i></c:if>
                                                    	<c:if test="${var.index eq 3 }"><i class="fa fa-user m-0 m-b-5 font-16"></i></c:if>
                                                    	<c:if test="${var.index eq 4 }"><i class="fa fa-table m-0 m-b-5 font-16"></i></c:if>
			                                            <c:if test="${var.index eq 5 }"><i class="fa fa-tag m-0 font-16"></i></c:if>
                                                        <h5 class="mb-0 ">${c.cnt }</h5>
                                                        <small class="font-light">${c.tableName }</small>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        </div>
                                    </div>
                                    <!-- column -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="chat-box scrollable">
                                    <h4 class="card-title">크리에이터 매출 TOP3</h4>
                                    <h5 class="card-subtitle">최근 1년 기준</h5>
                                    <!--크리에이터 프로필-->
                                    <c:forEach begin="0" end="2" items="${home.creatorTop3 }" var="c">
                                    <div class="d-flex flex-row comment-row m-t-0 align-items-center">
                                        <div class="p-2"><img src="${c.pht }" alt="user" width="50" height="50"
                                                class="rounded-circle"></div>
                                        <div class="comment-text w-100">
                                            <h6 class="font-medium">${c.name } ( ${c.creId } )</h6>
                                            <div>매출액: <fmt:formatNumber>${c.pay }</fmt:formatNumber>원 ( 수수료 제외 ) 
                                            </div>
                                        </div>
                                    </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <!-- Card -->
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">역대 인기 강의 TOP 3</h4>
                                <h5 class="card-subtitle">가장 사랑받았던 강의들</h5>
                                <div class="chat-box scrollable">
                                    <!--강의-->
                                    <c:forEach begin="0" end="2" items="${home.lectureTop3 }" var="l">
                                    <div class="d-flex flex-row comment-row m-t-0 align-items-center">
                                        <div class="p-2"><img src="${l.thumb }" alt="강의썸네일" width="70"
                                                height="50" class="rounded c"></div>
                                        <div class="comment-text w-100">
                                            <h6 class="font-medium m-0">${l.ttl }</h6>
                                            <span>크리에이터 : <strong>${l.name }</strong></span>
                                        </div>
                                    </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <!-- column -->
                    <div class="col-lg-6">
                        <!-- Card -->
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">올해 매출 한번에 보기</h4>
                                <canvas id="thisyear" width="10" height="5"></canvas>
                            </div>
                        </div>
                        
                        
                    </div>
                    <!-- column -->

                    <div class="col-lg-6">
                        <!-- card -->
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">성별 / 연령별 회원 통계</h4>
                                <canvas id="gender"></canvas>
                            </div>
                        </div>
                    </div>
                </div>

            <!-- ============================================================== -->
            <!-- Recent comment and chats -->
            <!-- ============================================================== -->
            </div>            
              
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
	    let cnt7 = []; 
	    let pay7 = [];
	    let day7= [];
	    $.ajax({
	    	url : '/admin/recent7Chart',
	    	dataType : 'json',
	    	async : false,
	    })
	    .done((r)=>{
		    r.forEach((v)=>{
		    	day7.push(v.day)
		    	cnt7.push(v.cnt)
		    	pay7.push(v.pay)
		    })
	    })    		
        // 최근 일주일
        const recent7daysId = document.getElementById('recent7days').getContext('2d');
        const recent7days = new Chart(recent7daysId, {
            type: 'bar',
            data: {
                labels: day7,
                datasets: [{
                    type: 'line',
                    label: '판매량',
                    backgroundColor: 'seagreen',
                    borderColor : 'seagreen',
                    data: cnt7,
                }, {
                    type: 'bar',
                    label: '매출액',
                    data: pay7,
                    backgroundColor: 'gray',
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
		
        
        // 최근 1년
        let yearcnt = []; 
	    let yearpay = [];
        $.ajax({
        	url: '/admin/salesThisyear',
        	async:false,
        	dataType : 'json'
        })
        .done((r)=>{
        	r.forEach((v)=>{
        		yearcnt.push(v.cnt);
        		yearpay.push(v.pay);
        	})
        })
        const thisyearId = document.getElementById('thisyear').getContext('2d');
        const thisyear = new Chart(thisyearId, {
            type: 'bar',
            data: {
                labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                datasets: [
                	{
                        type: 'line',
                        label: '판매량',
                        data: yearcnt,
                        backgroundColor: 'black',
                        borderColor : 'darkgreen',
                        yAxisID : 'leftY'
                    },{
                    type: 'bar',
                    label: '매출액',
                    backgroundColor: 'green',
                    data: yearpay,
                    yAxisID : 'rightY'
                },]
            },
            options: {
                scales: {
                	yAxes: [{
                        id : 'leftY',
                        type : 'linear',
                        position : 'left'
                    }, {
                        id:'rightY',
                        type : 'bar',
                        position : 'right'
                    }],
                },
            }
        });

     	// 성별 유저 통계
        let woman = []; 
	    let man = [];
        $.ajax({
        	url: '/admin/genderList',
        	async:false,
        	dataType : 'json'
        })
        .done((r)=>{
        	r.forEach((v)=>{
        		woman.push(v.woman);
        		man.push(v.man);
        	})
        })
        
        // 성별, 연령별
        const genderId = document.getElementById('gender').getContext('2d');
        const gender = new Chart(genderId, {
            type: 'bar',
            data: {
                labels: ['10대 이하', '20대', '30대', '40대', '50대', '60대 이상'],
                datasets: [{
                    type: 'bar',
                    label: '남성',
                    backgroundColor: 'lavender',
                    data: man
                }, {
                    type: 'bar',
                    label: '여성',
                    data: woman,
                    backgroundColor: 'teal'
                }, ]
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