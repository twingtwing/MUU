<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
      <!-- 바디 시작 -->

      <!-- 페이지명-->
      <div class="page-breadcrumb">
        <div class="row">
          <div class="col-12 d-flex no-block align-items-center">
            <!-- 페이지명 작성 및 카테고리 작성 -->
            <h4 class="page-title">기타 통계</h4>
            <div class="ml-auto text-right">
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">매출</a></li>
                  <li class="breadcrumb-item active" aria-current="page">기타 통계</li>
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
          <div class="col-12">
            <div class="card">
              <div class="card-body">
                <!-- 여기서부터 작성 -->
                <div class="col-lg-12 pb-5 pt-3">
                  <h5 class="bg-dark px-3 py-2 mb-0 text-white" style="border-radius: 13px;">성별 매출 통계</h5>
                  <div class="row mt-4 m-3 justify-content-center">
                    <div class="col-lg-11">
                      <div class="row justify-content-end">
                        <select name="" id="genderBox" class="select border px-3 py-2">
	                        <c:forEach begin="${2016}" end="${thisyear }" var="y">
	                          <option value="${y }"<c:if test="${thisyear eq y }">selected="selected"</c:if>>${y }년</option>
	                        </c:forEach>
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="row justify-content-center">
                    <div class="row col-lg-11">
                      <div class="w-25 d-flex align-self-center flex-column">
                        <!-- 비율 숫자 나와야함 -->
                        <canvas id="gender" width="10" height="5"></canvas>
                      </div>
                      <div class="w-75 align-items-center flex-column">
                        <!-- 비율 숫자 나와야함 -->
                        <canvas id="genderm" width="10" height="5"></canvas>
                      </div>
                    </div>
                    <div class="row col-lg-11 my-2">
                    	<div class="w-25 d-flex justify-content-center">
                     		<h6><i class="fas fa-hashtag mr-2"></i>원 그래프</h6>
                     	</div>
                      	<div class="w-75 d-flex justify-content-center">
                      		<h6><i class="fas fa-hashtag mr-2"></i>월별 막대 그래프</h6>
                      	</div>	
                    </div>
                  </div>
                  <table class="w-100 text-center mt-2 table-bordered">
                    <tr>
                      <th>매출</th>
                      <c:forEach items="${salesGender }" var="gender">
	                  	<c:if test="${gender.month ne 13 }">
	                    	<th width="7%" class="genderLabel">${gender.month }월</th>
	                  	</c:if>
                      </c:forEach>
                   	  <th width="7%">총 합</th>
                    </tr>
                    <tr>
                      <td>여성</td>
                      <c:forEach items="${salesGender }" var="gender" varStatus="var">
                      	<td class="<c:if test="${not var.last }">gender_val</c:if> <c:if test="${var.last }">gender_total</c:if> woman_td" >${gender.woman}</td>
                      </c:forEach>
                    </tr>
                    <tr>
                      <td>남성</td>
                      <c:forEach items="${salesGender }" var="gender" varStatus="var">
                      	<td class="<c:if test="${not var.last }">gender_val</c:if> <c:if test="${var.last }">gender_total</c:if> man_td" >${gender.man}</td>
                      </c:forEach>
                    </tr>
                    <tr>
                    	<td>전체</td>
                    	<c:forEach items="${salesGender }" var="gender">
                    		<td class="gender_pay">${gender.pay }</td> 
                    	</c:forEach>
                    </tr>
                  </table>
                  <div class="row justify-content-end mt-3 w-100">
                    <button class="btn btn-danger mr-2">PDF다운</button>
                    <button class="btn btn-success mr-2">EXCEL다운</button>
                  </div>

                </div>

                <hr>

                <div class="col-lg-12 pb-5 pt-3">
                  <h5 class="bg-dark px-3 py-2 mb-0 text-white" style="border-radius: 13px;">연령별 매출 통계</h5>
                  <div class="row mt-4 m-3 justify-content-center">
                    <div class="col-lg-11">
                      <div class="row justify-content-end">
                        <select name="" id="ageBox" class="select border px-3 py-2">
	                        <c:forEach begin="${2016}" end="${thisyear }" var="y">
	                          <option value="${y }"<c:if test="${thisyear eq y }">selected="selected"</c:if>>${y }년</option>
	                        </c:forEach>
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="row justify-content-center">
                    <div class="row col-lg-11">
                      <div class="w-25 d-flex align-self-center flex-column">
                        <!-- 비율 숫자 나와야함 -->
                        <canvas id="age" width="10" height="5"></canvas>
                      </div>
                      <div class="w-75 align-items-center flex-column">
                        <!-- 비율 숫자 나와야함 -->
                        <canvas id="agem" width="10" height="5"></canvas>
                      </div>
                    </div>
                    <div class="row col-lg-11 my-2">
                    	<div class="w-25 d-flex justify-content-center">
                     		<h6><i class="fas fa-hashtag mr-2"></i>원 그래프</h6>
                     	</div>
                      	<div class="w-75 d-flex justify-content-center">
                      		<h6><i class="fas fa-hashtag mr-2"></i>월별 막대 그래프</h6>
                      	</div>	
                    </div>
                  </div>
                  <table class="w-100 text-center mt-2 table-bordered">
                    <tr>
                      <th>매출</th>
                      <c:forEach items="${salesAge }" var="age">
	                  	<c:if test="${age.month ne 13 }">
	                    	<th width="7%">${age.month }월</th>
	                  	</c:if>
                      </c:forEach>
                   	  <th width="7%">총 합</th>
                    </tr>
                    <tr>
                      <td>10대 이하</td>
                      <c:forEach items="${salesAge }" var="age" varStatus="var">
                      	<td class="<c:if test="${not var.last }">age_val</c:if> <c:if test="${var.last }">age_total</c:if> age_td_1" >${age.age10}</td>
                      </c:forEach>
                    </tr>
                    <tr>
                      <td>20대</td>
                      <c:forEach items="${salesAge }" var="age" varStatus="var">
                      	<td class="<c:if test="${not var.last }">age_val</c:if> <c:if test="${var.last }">age_total</c:if> age_td_2" >${age.age20}</td>
                      </c:forEach>
                    </tr>
                    <tr>
                      <td>30대</td>
                      <c:forEach items="${salesAge }" var="age" varStatus="var">
                      	<td class="<c:if test="${not var.last }">age_val</c:if> <c:if test="${var.last }">age_total</c:if> age_td_3" >${age.age30}</td>
                      </c:forEach>
                    </tr>
                    <tr>
                      <td>40대</td>
                      <c:forEach items="${salesAge }" var="age" varStatus="var">
                      	<td class="<c:if test="${not var.last }">age_val</c:if> <c:if test="${var.last }">age_total</c:if> age_td_4" >${age.age40}</td>
                      </c:forEach>
                    </tr>
                    <tr>
                      <td>50대</td>
                      <c:forEach items="${salesAge }" var="age" varStatus="var">
                      	<td class="<c:if test="${not var.last }">age_val</c:if> <c:if test="${var.last }">age_total</c:if> age_td_5" >${age.age50}</td>
                      </c:forEach>
                    </tr>
                    <tr>
                      <td>60대 이상</td>
                      <c:forEach items="${salesAge }" var="age" varStatus="var">
                      	<td class="<c:if test="${not var.last }">age_val</c:if> <c:if test="${var.last }">age_total</c:if> age_td_6" >${age.age60}</td>
                      </c:forEach>
                    </tr>
                    <tr>
                    	<td>전체</td>
                    	<c:forEach items="${salesAge }" var="age">
                    		<td class="age_pay">${age.pay }</td> 
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
          </div>
        </div>
      </div>
      <!-- 내용 끝 -->

      <!-- 바디 끝 -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script>
  	//성별 매출
  	const genderLabel = [];
  	for(let tag of $('.genderLabel')){
  		genderLabel.push(tag.textContent);
  	}
  	let genderCnt = 0;
  	const genderVal = [];
  	for(var i = 0; i < 2 ; i++){
  		genderVal[i] = [] 
  		for(let j = 0 ; j < 12 ; j++){
  			genderVal[i].push($('.gender_val').eq(genderCnt)[0].textContent.replaceAll(',',''))	
  			genderCnt++;
  		}
  	}
  	
  	
    const genderId = document.getElementById('gender').getContext('2d');
    const gender = new Chart(genderId, {
      type: 'doughnut',
      data: {
        labels: ['남성', '여성'],
        datasets: [{
          label: '매출액',
          backgroundColor: ['powderblue', 'pink'],
          data: [
        	  $('.gender_total').eq(1)[0].textContent, $('.gender_total').eq(0)[0].textContent
          ]
        }, ]
      },
      options: {
        scales: {

        },
      }
    });
    
    $('#genderBox').change(()=>{
    	$.ajax({
    		url : '/admin/adASales/ajaxGender',
    		data : {selectYear: $('#genderBox').val()}
    	})
    	.done((r)=>{
    		woman = [];
    		man = [];
    		pay  = [];
    		r.forEach((obj)=>{
    			woman.push(obj.woman==null ? 0: obj.woman);
    			man.push(obj.man==null ? 0: obj.man);
    			pay.push(obj.pay==null ? 0: obj.pay);
    		})
    		genderm.reset();
    		genderm.data.datasets[0].data = man;
    		genderm.data.datasets[1].data = woman;
    		genderm.update();

    		gender.reset();
    		gender.data.datasets[0].data[0] = man[man.length-1];
    		gender.data.datasets[0].data[1] = woman[woman.length-1]; 
    		gender.update();
    		
    		// 테이블값도 바꾸기
    		for(let i = 0; i < pay.length; i++){
    			$('.gender_pay').eq(i)[0].innerText = pay[i];
    			$('.woman_td').eq(i)[0].innerText = woman[i];
    			$('.man_td').eq(i)[0].innerText = man[i];
    		}
    	})
    })


    const gendermId = document.getElementById('genderm').getContext('2d');
    const genderm = new Chart(gendermId, {
      type: 'bar',
      data: {
        labels: genderLabel,
        datasets: [{
          type: 'bar',
          label: '남성',
          backgroundColor: 'powderblue',
          data: genderVal[1] 
        }, {
          type: 'bar',
          label: '여성',
          data: genderVal[0] ,
          backgroundColor: 'pink'
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
	
    const age_val = [];
    let ageCnt = 0;
    for(var i = 0; i < 6 ; i++){
    	age_val[i] = [] 
  		for(let j = 0 ; j < 12 ; j++){
  			age_val[i].push($('.age_val').eq(ageCnt)[0].textContent.replaceAll(',',''))	
  			ageCnt++;
  		}
  	}
    const age_total=[];
  	for(let l of $('.age_total')){
  		age_total.push(l.textContent);
  	}
  	
    const ageId = document.getElementById('age').getContext('2d');
    const age = new Chart(ageId, {
      type: 'doughnut',
      data: {
        labels: ['10대 이하', '20대','30대','40대','50대','60대 이상'],
        datasets: [{
          label: '매출액',
          backgroundColor: ['powderblue','pink','teal','Lavender','lightgray','tomato'],
          data: age_total
        },]
      },
      options: {
      }
    });


    const agemId = document.getElementById('agem').getContext('2d');
    const agem = new Chart(agemId, {
      type: 'bar',
      data: {
        labels: genderLabel,
        datasets: [{
            type: 'bar',
            label: '10대 이하',
            backgroundColor: 'powderblue',
            data: age_val[0]
          }, {
            type: 'bar',
            label: '20대',
            data: age_val[1],
            backgroundColor: 'pink'
          },
          {
            type: 'bar',
            label: '30대',
            data: age_val[2],
            backgroundColor: 'teal'
          },
          {
            type: 'bar',
            label: '40대',
            data: age_val[3],
            backgroundColor: 'lavender'
          },
          {
            type: 'bar',
            label: '50대',
            data:age_val[4],
            backgroundColor: 'lightgray'
          },
          {
            type: 'bar',
            label: '60대 이상',
            data: age_val[5],
            backgroundColor: 'tomato'
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
    
    $('#ageBox').change(()=>{
    	$.ajax({
    		url : '/admin/adASales/ajaxAge',
    		data : {selectYear: $('#ageBox').val()}
    	})
    	.done((r)=>{
    		age10 = [];
    		age20 = [];
    		age30 = [];
    		age40 = [];
    		age50 = [];
    		age60 = [];
    		pay  = [];
    		r.forEach((obj)=>{
    			age10.push(obj.age10==null ? 0: obj.age10);
    			age20.push(obj.age20==null ? 0: obj.age20);
    			age30.push(obj.age30==null ? 0: obj.age30);
    			age40.push(obj.age40==null ? 0: obj.age40);
    			age50.push(obj.age50==null ? 0: obj.age50);
    			age60.push(obj.age60==null ? 0: obj.age60);
    			pay.push(obj.pay==null ? 0: obj.pay);
    		})
    		agem.reset();
    		agem.data.datasets[0].data = age10;
    		agem.data.datasets[1].data = age20;
    		agem.data.datasets[2].data = age30;
    		agem.data.datasets[3].data = age40;
    		agem.data.datasets[4].data = age50;
    		agem.data.datasets[5].data = age60;
    		agem.update();

    		age.reset();
    		age.data.datasets[0].data[0] = age10[age10.length-1];
    		age.data.datasets[0].data[1] = age20[age20.length-1]; 
    		age.data.datasets[0].data[2] = age30[age30.length-1];
    		age.data.datasets[0].data[3] = age40[age40.length-1]; 
    		age.data.datasets[0].data[4] = age50[age50.length-1];
    		age.data.datasets[0].data[5] = age60[age60.length-1]; 
    		age.update();
    		
    		// 테이블값도 바꾸기
    		for(let i = 0; i < pay.length; i++){
    			$('.age_td_1').eq(i)[0].innerText = age10[i];
    			$('.age_td_2').eq(i)[0].innerText = age20[i];
    			$('.age_td_3').eq(i)[0].innerText = age30[i];
    			$('.age_td_4').eq(i)[0].innerText = age40[i];
    			$('.age_td_5').eq(i)[0].innerText = age50[i];
    			$('.age_td_6').eq(i)[0].innerText = age60[i];
    			$('.age_pay').eq(i)[0].innerText = pay[i];
    		}
    	})
    })
  </script>
</body>
</html>