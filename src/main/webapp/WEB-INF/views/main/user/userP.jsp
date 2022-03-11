<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <style>
    td,
    th {
      text-align: center;
    }

    thead {
      background-color: lightgray;
    }



    .list-link {
      color: black;
    }
        
    .list-link.active{
      font-weight: bold;
      color: #e53637;
    }

    .hided{
    	display: none;
    }
    .more {
    	cursor: pointer;
    }
  </style>

</head>
<body>
  <!-- body 시작 -->
<!-- 배너 시작-->
    <section class="normal-breadcrumb set-bg" data-setbg="/resources/img/normal-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>마이페이지</h2>
                        <p>결제 내역</p>
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
            <a href="/home" class="text-dark font-weight-bold"><i class="fa fa-home"></i>Home</a>
            <a href="/user/userSelect" class="text-dark font-weight-bold">마이페이지</a>
            <span>결제내역</span>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 카테고리 끝-->
    <!-- body 의 body-->
    <section class="blog spad" >
        <div class="container">
            <div class="row">
                 <!-- 사이드 시작 -->
                <div class="col-lg-2">
                    <div class="row mr-2" style="width:160px">
                      <ul class="list-group w-100">
                        <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                            <!-- 해당 상위카테고리 일때, active가 보여야함 => 자바스크립트 혹은 c:if구문으로 해결해야함 -->
                          <a class="list-link" href="/user/userSelect">내 정보</a>
                        </li>
                        <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                          <a class="list-link" href="/user/userLectureList">내 강의리스트</a>
                        </li>
                        <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                          <a class="list-link" href="/user/userWishList">위시 리스트</a>
                        </li>
                        <li class="list-group-item align-items-center d-flex" style="height: 55px;">
                          <a class="list-link active" href="/user/userPay">결제내역</a>
                        </li>
                      </ul>
                    </div>
                </div>
        <div class="col-lg-10">
          <div class="row ml-2">
            <h3 class="font-weight-bold"><i class="fa fa-money text-danger" aria-hidden="true"></i>&nbsp;결제내역 ( 총 ${payCnt }건 )</h3>
          </div>
          <hr class="font-weight-bold">
          <div class="row py-3">
            <!-- 본편-->
            <div class="col-lg-12">
              <div class="card" style="height: auto;">
                <div class="card-body">
                  <div class="row">
                    <div class="col-lg-12">
                      <div class="row mt-2">
                        <div class="col-lg-12 d-flex justify-content-between mx-2">
                          <h5 class="font-weight-bold mb-2 text-dark"><i class="fa fa-truck text-danger"></i> 배송현황</h5>
                          <div class="align-items-bottom">
                            <p class="mb-0 text-danger mr-3" style="font-size: 10px;">*배송과 관련된 문제는 사이트에서 책임지지 않습니다.</p>
                            <p class="mb-0 text-danger mr-3" style="font-size: 10px;">*구매 확정 시 적립금이 지급되며, 환불이나 교환은 일체 불가능합니다.</p>

                          </div>
                        </div>
                      </div>
                      <div>
                        <!-- 카드 반복 시작-->
                        <!-- 배송현황에는 구매확정이 안된 데이터들만 보이게 합니다. -->
                        <c:forEach items="${delInfo }" var="del">
                        <div class="card" style="border-radius: 10px;">
                          <div class="card-body">
                            <div class="row">
                              <div class="col-lg-12">
                                <div class="row">
                                  <div class="col-lg-10">
                                    <div class="row mx-1">
                                      <h5 class="font-weight-bold mb-3 mt-1">${del.ttl }</h5>
                                    </div>
                                    <div class="row mx-1 justify-content-between mb-2">
                                        <p class="mb-0">${del.kitName} ( <fmt:formatNumber> ${del.kitPrc } </fmt:formatNumber>원 )</p>
                                        <p class="mb-0">${del.kitIntro }</p> 
                                        <p class="mb-0">운송장번호 : ${del.shipNum }</p>
                                    </div>
                                    <div class="row mx-1">
                                      <p class="mb-0 font-weight-bold">진행상황</p>
                                      
                                      <c:if test="${del.shipStCode eq 'D01' }">
                                      <div class="progress-bar ml-5 bg-secondary rounded position-relative" role="progressbar" style="width: 60%;" aria-valuenow="50%" aria-valuemin="0" aria-valuemax="100">
                                      배송 시작
                                      </div>
                                      </c:if>
                                      
                                      <c:if test="${del.shipStCode eq 'D02' }">
                                      <div class="progress-bar ml-5 bg-success rounded position-relative" role="progressbar" style="width: 60%;" aria-valuenow="50%" aria-valuemin="0" aria-valuemax="100">
                                      배송 중
                                      </div>
                                      </c:if>
                                      
                                      <c:if test="${del.shipStCode eq 'D04' }">
                                      <div class="progress-bar ml-5 bg-danger rounded position-relative" role="progressbar" style="width: 60%;" aria-valuenow="50%" aria-valuemin="0" aria-valuemax="100">
                                      배송 실패
                                      </div>
                                      </c:if>
                                      
                                      <c:if test="${del.shipStCode eq 'D05' }">
                                      <div class="progress-bar ml-5 bg-warning rounded" role="progressbar" style="width: 60%;" aria-valuenow="50%" aria-valuemin="0" aria-valuemax="100">
                                      반송 신청됨</div>
                                      </c:if>
                                      <c:if test="${del.shipStCode eq 'D06' }">
                                      <div class="progress-bar ml-5 bg-danger rounded" role="progressbar" style="width: 60%;" aria-valuenow="50%" aria-valuemin="0" aria-valuemax="100">
                                      반송 거부됨</div>
                                      </c:if>
                                      
                                    </div>
                                  </div>
                                  <div class="col-lg-2 align-self-end">
                                    <button type="button" class="site-btn mb-2 confirmBtn" style="padding: 10px 20px;"data-tlsnno="${del.tlsnNo }" >구매확정</button>
                                    <button type="button" class="site-btn refundBtn" style="padding: 10px 20px;"data-tlsnno="${del.tlsnNo }">반송신청</button>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        </c:forEach>
                        <!-- 카드 반복 끝 -->
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-12">
                      <div class="mt-5 mb-2 d-flex justify-content-end">
                        <div class="form-group mb-0">
                          <div class="input-group date" id="datetimepicker1" data-target-input="nearest">
                            <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker1" id="date1">
                            <div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
                              <div class="input-group-text">
                                <i class="fa fa-calendar"></i></div>
                            </div>
                          </div>
                        </div>
                        <div class="mx-3 align-self-center">
                          <h5 class="mb-0">-</h5>
                        </div>
                        <div class="form-group mb-0">
                          <div class="input-group date" id="datetimepicker2" data-target-input="nearest">
                          <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker2" id="date2">
                            <div class="input-group-append" data-target="#datetimepicker2" data-toggle="datetimepicker">
                              <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <table class="table border-bottom">
                        <thead class="text-center">
                        <tr>
                          <th class="text-center align-middle" style="width:200px">강의사진</th>
                          <th class="text-center align-middle">강의제목</th>
                          <th class="text-center align-middle">수강료<br><span class="small">(키트 가격은 지불액에 포함됨)</span></th>
                          <th class="text-center align-middle">구매날짜</th>
                          <th class="text-center align-middle">만료날짜</th>
                          <th class="text-center align-middle">상태</th>
                        </tr>
                        </thead>
                        <tbody class="myPayList"> 
                        <c:forEach items="${payInfo }" var="pay" varStatus="st">   
                          <tr <c:if test="${st.count > 4 }">class="hided"</c:if>>
                            <td class="p-0">
                              <div class="text-align-last:center">
                                  <img src="${pay.thumb }" alt="" class="rounded" style="height: 150px; width: 200px;">
                              </div>
                            </td>
                            <td class="text-center align-middle">
                                ${pay.ttl }
                            </td>
                            <td class="text-center align-middle">
                                <fmt:formatNumber>${pay.pay }</fmt:formatNumber><br>
                                <c:if test="${not empty pay.kitPrc }">
                                <span class="small">( 키트 가격 : <fmt:formatNumber>${pay.kitPrc }</fmt:formatNumber>원 )</span>
                                </c:if>
                            </td>
                            <td class="text-center align-middle">${pay.regDate }</td>
                            <td class="text-center align-middle">${pay.expDate }</td>
                            <td class="text-center align-middle">
                            <c:if test="${pay.rfStCode eq 'RF01'}">
                                <span class="text-danger">환불 신청 대기</span>
                            </c:if>
                            <c:if test="${pay.rfStCode eq 'RF02'}">
                                <span class="text-success">환불 완료</span>
                            </c:if>
                            <c:if test="${pay.rfStCode eq 'RF03'}">
                                <span class="text-danger">환불 거부됨</span>
                            </c:if>
                            </td>
                          </tr>
                          </c:forEach>   
                        </tbody>
                      </table>
                    <div class="more text-center">더보기</div>            
                  </div>
                </div>
              </div>
              <!-- 본편 끝-->
              <!--card body end-->
            </div>
            <!-- card end-->
          </div>
        </div>
      </div>
    </div>
    </div>
  </section>
  <!-- body 의 body 끝 -->
  <!-- body 끝 -->
  <script type="text/javascript">
    $(function () {
      $('#datetimepicker1').datetimepicker({
        format: 'YYYY-MM-DD'
      });
      $('#datetimepicker2').datetimepicker({
    	format: 'YYYY-MM-DD',
        useCurrent: false
      });
      $("#datetimepicker1").on("change.datetimepicker", function (e) {
        $('#datetimepicker2').datetimepicker('minDate', e.date);
      });
      $("#datetimepicker2").on("change.datetimepicker", function (e) {
        $('#datetimepicker1').datetimepicker('maxDate', e.date);
      });
    });

    // 더보기
    $('.more').click(()=>{
    	let cards = document.querySelectorAll('.hided');
    	for(let i=0; i<6; i++){
    		if(cards[i]){
    		cards[i].classList.remove('hided');    			
    		}
    		console.log(cards[i])
    	}
    })
    
    
    // 구매확정 or 반송신청
    const shipStateUpdate = (data,msg,node)=>{
    	$.ajax({
    		url: '/user/userSugangConfirm',
    		type : 'post',
    		data : data,
    		beforeSend : (xhr) =>{
			      xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
    	})
    	.done(()=>{
    		window.alert(msg)
    		if(data.shipStCode==='D03'){	
		    	node.remove();    		
	    	} else if(data.shipStCode==='D05'){
	    		$(node).addClass('bg-warning');
	    		$(node).text('반송 신청됨')
	    	}
    	})
    }
    
    $('.confirmBtn').click((e)=>{
    	let num = e.currentTarget.dataset.tlsnno;
    	let data = {tlsnNo : num, shipStCode : 'D03'};
    	let node = e.currentTarget.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode;
    	shipStateUpdate(data,'구매확정이 완료되었습니다.',node);
    })
    $('.refundBtn').click((e)=>{
    	let num = e.currentTarget.dataset.tlsnno;
    	let data = {tlsnNo : num, shipStCode : 'D05'};
    	let node = e.currentTarget.parentElement.parentElement.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling;
    	shipStateUpdate(data,'반송 신청이 접수되었습니다.', node);
    })
    
    
    // 날짜검색
    $('#date2').on('input', (e)=>{
    	if(!$('#date1').val()){
    		return;
    	}
    	$.ajax({
    		url : '/user/userPaySearch',
    		data : {regDateSearch : new Date($('#date1').val()).toISOString().slice(0,10), expDateSearch : new Date($('#date2').val()).toISOString().slice(0,10)},
    	})
    	.done((r)=>{
    		removeAll();
    		r.forEach((v)=>{
	    		$('.myPayList').append(makeRow(v));    			
    		})
    	})
    })
    
    //날짜검색 후 DOM 조작 
    const removeAll = ()=>{
    	$('.myPayList').children().remove();
    }
    const makeRow = (list)=>{
    	let ktPrc = '( 키트 가격 : '+list.kitPrc+'원 )';
    	let tr = $('<tr>');
    	if(list.rfStCode==='RF01'){
    		list.rfStCode='환불 신청 대기'
    	} else if(list.rfStCode==='RF02') {
    		list.rfStCode='환불 완료'
    	} else if(list.rfStCode==='RF03'){
    		list.rfStCode='환불 거부됨'
    	}   	
    	tr.addClass('align-middle');
    	tr.append(
    		$('<td>').append(
    				$('<img>').attr('src',list.thumb).css('width','200px').css('height','150px'))
    				.addClass('p-0 text-center align-middle'),
    		$('<td>').text(list.ttl).addClass('text-center align-middle'),
    		$('<td>').text(list.pay).append($('<br>'),
    				$('<span>').text(ktPrc)).addClass('text-center align-middle'),
    		$('<td>').text(dateformat(list.regDate)).addClass('text-center align-middle'),
    		$('<td>').text(dateformat(list.expDate)).addClass('text-center align-middle'),
    		$('<td>').text(list.rfStCode).addClass('text-danger').addClass('text-center align-middle')
    	)
    	return tr;
    }
    
    // change to dateformat
    const dateformat = (num)=>{
    	return new Date(num).toISOString().slice(0,10);
    }
    //mouseover 이벤트 : 사이드바 css변경
    $('.list-group .list-group-item:not(.mylist)').on('mouseover',function(){
      $(this).css('background-color','#e53637');
      $(this).find('.list-link').css('color','#ffffff');
    })

    //mouseover 이벤트 : 사이드바 css변경
    $('.list-group .list-group-item:not(.mylist)').on('mouseout',function(){
      $(this).css('background-color','#ffffff');
      $(this).find('.list-link').css('color','#000000');
      $(this).find('.list-link.active').css('color','#e53637');
    })
  </script>
</body>
</html>