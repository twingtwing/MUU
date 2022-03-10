<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	th,td {
      padding: 0.5rem;
      text-align: center;
    }
    .list tr{
      cursor: pointer;
    }
    .shipbox {
      display: none;
      z-index: 1;
    }
    .list-link {
        color: black;
    }

    .list-link.active {
        font-weight: bold;
        color: #e53637;
    }

    .shipbox,
    .updateShip {
      font-size: 0.8rem;
    }
    .shipped{
      background-color: var(--success);
    }
    #infomodal{
      margin-top: 10rem;
    }
    a{
    	cursor : pointer;
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
            <h2>크리에이터</h2>
            <p>수강생 목록</p>
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
                      <a href="#" class="text-dark font-weight-bold"><i class="fa fa-home"></i> Home</a>
                      <a href="#" class="text-dark font-weight-bold"> 내 강의 목록</a>
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
                <!-- 해당 상위카테고리 일때, active가 보여야함 => 자바스크립트 혹은 jstl if구문으로 해결해야함 
                                             이때 상태에 따라서 열린강의인지 종료된강의인지 구별해야함-->
	                <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
	                   <a class="list-link" href="/creator/creS">크리에이터 정보</a>
	               </li>
	               <p class="list-group-item border-bottom-0 mb-0 align-items-center d-flex mylist">내 강의 목록</p>
	               <li class="list-group-item border-bottom-0 align-items-center d-flex pl-40" style="height: 35px;">
	                   <a class="list-link" href="/creator/rLecL">&nbsp;&nbsp;- 신청한 강의</a>
	               </li>
	               <c:choose>
	               <c:when test="${lecinfo.ltStCode eq 'L01' }">
	               <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
	                   <a class="list-link active" href="/creator/oLecL">&nbsp;&nbsp;- 열린 강의</a>
	               </li>
	               <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
	                   <a class="list-link" href="/creator/clLecL">&nbsp;&nbsp;- 종료된 강의</a>
	               </li>
	               </c:when>
	               <c:when test="${lecinfo.ltStCode eq 'L03' }">
	               <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
	                   <a class="list-link" href="/creator/oLecL">&nbsp;&nbsp;- 열린 강의</a>
	               </li>
	               <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
	                   <a class="list-link active" href="/creator/clLecL">&nbsp;&nbsp;- 종료된 강의</a>
	               </li>
	               </c:when>
	               </c:choose>
	               <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
	                   <a class="list-link" href="/creator/rpLecL">&nbsp;&nbsp;- 신고된 강의</a>
	               </li>
	               <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
	                   <a class="list-link" href="/creator/lecI">강의등록</a>
	               </li>
	               <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
	                   <a class="list-link" href="/creator/creSaleYear">매출내역</a>
	               </li>
	               <li class="list-group-item align-items-center d-flex" style="height: 55px;">
	                   <a class="list-link" href="/creator/creRefund">환불 요청 내역</a>
	               </li>
            </ul>
          </div>          
        </div>
        
        <div class="col-lg-10">
          <div class="row ml-2">
            <h5 class="ml-1 mb-2 font-weight-bold">
                <i class="fa fa-hand-paper-o text-danger" aria-hidden="true"></i>
                <c:if test="${lecinfo.ltStCode eq 'L01' }">
                열린 강의 정보
                </c:if>
                <c:if test="${lecinfo.ltStCode eq 'L03' }">
                닫힌 강의 정보
                </c:if>
                <!-- 상태에 따라 닫힌인지 열린인지 달라짐 -->
            </h5>
          </div>
          <hr class="font-weight-bold">  
          <div class="row col-12 mb-5 ml-3">
            <!-- 제목 입력 / 제목 가져오기-->
            <h5 class="mx-4 my-3 font-weight-bold">강의제목 : <strong class="text-danger">집에서 배우는...</strong></h5>
  
            <div class="row col-12">
              <div class="row col-12 mt-3 mb-3 justify-content-around">
                <!-- 선택 : active -->
                  <c:if test="${lecinfo.ltStCode eq 'L01' }">
                  <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="gooLecture(${lecinfo.ltNo })">강의정보</button>
	              </c:if>
	              <c:if test="${lecinfo.ltStCode eq 'L03' }">
	              <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="goclLecture(${lecinfo.ltNo })">강의정보</button>
	              </c:if>
                  <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="goQna(${lecinfo.ltNo })">질문&답변</button>
                  <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="goNotice(${lecinfo.ltNo })">공지사항</button>
                  <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="goReview(${lecinfo.ltNo })">리뷰</button>
                  <button class="btn btn-outline-secondary lecbtn active" style="width: 150px;" type="button" onclick="goStudent(${lecinfo.ltNo })">수강생</button>
              </div>
            </div>

            <div class="row mt-4 col-12 justify-content-center">
              <h5 class="font-weight-bold">수강생 목록</h5>
            </div>
  
            <div class="row col-12 justify-content-end mt-3 mb-1">
              <input type="text" class="border" id="stval" spellcheck="false" onkeypress="if(event.keyCode==13){stSearch();}" placeholder="이름 검색...">
              <button type="button" class="border px-4 mr-4" id="stBtn" onclick="stSearch()">검색</button>
                <select id="shipcode" class="border px-4" onchange="stSearch()">
                  <option value="" selected>전체</option>
                  <option value="D01">배송 예정</option>
                  <option value="D02">배송 중</option>
                  <option value="D03">배송 완료</option>
                  <option value="D04">배송 실패</option>
                  <option value="D05">반송</option>
                  <option value="D06">반송 거부</option>
                </select>
            </div>

            <div class="row col-12">
              <table class="w-100 list ml-2 mr-4">
                <thead class="bg-light">
                  <tr>
                    <th>이름</th>
                    <th>수강기간</th>
                    <th>진도율</th>
                    <th>반송사유</th>
                    <th>상태</th>
                  </tr>
                </thead>
                <tbody>
                  <!-- for문 돌리기 -->
                  <c:forEach items="${sglist }" var="list" varStatus="status">
                  <tr data-toggle="modal" data-target="#stmodal" data-tlsnno="${list.tlsnNo }"
                  data-name="${list.name }" data-lecttl="${lecinfo.ttl }"
                  data-tel="${list.tel }" data-addr="${list.addr }"
                  data-detaaddr="${list.detaAddr }" data-shipnum="${list.shipNum }"
                  data-shipstcode="${shipStCode }" data-regdate="${list.regDate }"
                  data-pay="${list.pay }">
                    <td>${list.name }</td>
                    <td><span>${list.regDate }<span> ~ <span>${list.expDate }</span></td>
                    <td> ${list.prog }%</td>
                    <c:if test="${list.rtnContent != null }">
                    <td> ${list.rtnContent } </td>
                    </c:if>
                    <c:if test="${list.rtnContent == null || list.rtnContent == ''}">
                    <td> -- </td>
                    </c:if>
                    <td class="position-relative" onclick="event.cancelBubble=true">
	                    <c:if test="${list.shipStCode == 'D01' }">
		                      <button class="border p-2 updateShip">배송시작</button>
		                      <div class="shipbox justify-content-center position-absolute">
		                        <input type="text" id="inputshipNum" class="border" placeholder="운송장번호 입력">
		                        <button class="border compl" onclick="goDelivery(${list.tlsnNo })">완료</button>
		                        <button class="border cancel">취소</button>
		                      </div>
	                     </c:if>
	                     <c:if test="${list.shipStCode == 'D02' }">
	                     	<button class="border p-2 updateShip" style="cursor:default">배송중</button>
	                     </c:if>
	                     <c:if test="${list.shipStCode == 'D03' }">
	                     	<button class="border p-2 updateShip" style="cursor:default">배송완료</button>
	                     </c:if>
	                     <c:if test="${list.shipStCode == 'D04' }">
	                     	<button class="border p-2 updateShip" style="cursor:default">배송실패</button>
	                     </c:if>
	                     <c:if test="${list.shipStCode == 'D05' }">
	                     	<button class="border p-2 updateShip" style="cursor:default">반송</button>
	                     </c:if>
	                     <c:if test="${list.shipStCode == 'D06' }">
	                     	<button class="border p-2 updateShip" style="cursor:default">반송거부</button>
	                     </c:if>
                    </td>
                  </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
            
  
            <div class="row col-12 justify-content-center mt-3">
              <div class="product__pagination">
                <c:if test="${pagination.currRange ne 1}">
					<a><i class="fa fa-angle-double-left"></i></a>
				</c:if>
				<c:forEach begin="${pagination.startPage }" end="${pagination.endPage }" var="page">
					<c:choose>
						<c:when test="${page eq pagination.currPage}">
							<a class="current-page paging">${page}</a>
						</c:when>
						<c:otherwise>
							<a class="paging">${page}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pagination.currRange ne pagination.pageCnt && pagination.pageCnt > 0}">
					<a><i class="fa fa-angle-double-right"></i></a>
				</c:if>
              </div>
            </div>
  
          </div>
        </div>

      </div>
    </div>
    <!-- 수강생 모달 -->
    <div class="modal fade p-3" id="stmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
      aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content p-3">
          <div class="modal-header">
            <h5 class="modal-title"><span>박복자</span>수강생 결제내역</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body d-flex flex-column align-items-center ">
            <!--table-->
            <table class="border w-100" border="1">
              <tr>
                <th>수강번호</th>
                <td id="inputtlsnno"></td>
              </tr>
              <tr>
                <th>이름</th>
                <td id="inputname"></td>
              </tr>
              <tr>
                <th>강의명</th>
                <td id="inputlecttl"></td>
              </tr>
              <tr>
                <th>연락처</th>
                <td id="inputtel"></td>
              </tr>
              <tr>
                <th>주소</th>
                <td>
                  <span id="inputaddr"></span>
                  <span id="inputdetaaddr"></span>
                </td>
              </tr>
              <tr>
                <th>운송장 번호</th>
                <td id="inputshipnum"></td>
              </tr>
              <tr>
                <th>결제일</th>
                <td id="inputregdate"></td>
              </tr>
              <tr>
                <th>결제가격</th>
                <td><span id="inputpay"></span>원</td>
              </tr>
            </table>
          </div>
          <div class="modal-footer d-flex justify-content-center">
            <button type="button" class="border px-3 py-2" data-dismiss="modal">확인</button>
          </div>
        </div>
      </div>
    </div>
    
  </section>
<form id="frm">
  	<input class="sendltno" type="hidden" name="ltNo" value="">
</form>
<form id="pageFrm">
 	<input class="sendltno" type="hidden" name="ltNo" value="">
 	<input class="spage" type="hidden" name="page" value="">
</form>
<form id="pagesearchFrm">
    <input class="sendltno" type="hidden" name="ltNo" value="${lecinfo.ltNo}">
 	<input class="sendname" type="hidden" name="nameSearchKey" value="">
 	<input class="spage" type="hidden" name="page" value="">
</form>
<form id="stsearchFrm">
	<input class="sendltno" type="hidden" name="ltNo" value="${lecinfo.ltNo}">
   	<input class="sendname" type="hidden" name="nameSearchKey" value="">
   	<input class="sendshipcode" type="hidden" name="shipStCodeSearchKey" value="">
</form>
<script>
//시큐리티 토큰
let header = "${_csrf.headerName}";
let token = "${_csrf.token}";

//검색키 선언
let nameSearchKey;
let shipStCodeSearchKey;

// show input
$('.updateShip').click((e) => {
  $(e.currentTarget.nextElementSibling).css('display', 'flex')
})


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

$('.cancel').click((e) => {
  $(e.currentTarget.parentElement).css('display', 'none')
})

//열린강의정보 페이지 이동
function gooLecture(e){
	$('.sendltno').val(e);
	$('#frm').attr("action", "/creator/oLecS");
	$('#frm').submit();
}
//닫힌강의정보 페이지 이동
function goclLecture(e){
	$('.sendltno').val(e);
	$('#frm').attr("action", "/creator/clLecS");
	$('#frm').submit();
}
//qna 페이지 이동
function goQna(e){
	$('.sendltno').val(e);
	$('#frm').attr("action", "/creator/cLecQ");
	$('#frm').submit();
}
//공지사항 페이지 이동
function goNotice(e){
	$('.sendltno').val(e);
	$('#frm').attr("action", "/creator/cLecNL");
	$('#frm').submit();
}
//리뷰 페이지 이동
function goReview(e){
	$('.sendltno').val(e);
	$('#frm').attr("action", "/creator/cLecR");
	$('#frm').submit();
}
//수강생 리스트 페이지 이동
function goStudent(e){
	$('.sendltno').val(e);
	$('#frm').attr("action", "/creator/cLecSt");
	$('#frm').submit();
}

//페이징
$(function(){
	$('.paging').on('click', function(){
		//검색 후 페이지 이동
		if($('#stval').val() != null){
			$('.spage').val($(this).text());
		  	nameSearchKey = $('#stval').val();
			$('.sendname').val(nameSearchKey);
		  	$('#pagesearchFrm').attr('action', '/creator/cLecStpagesearch');
		  	$('#pagesearchFrm').submit();
		//페이지 이동
		} else {
			$('.sendltno').val(${lecinfo.ltNo});
			$('.spage').val($(this).text());
		  	$('#pageFrm').attr('action', '/creator/cLecStpage');
		  	$('#pageFrm').submit();
		}
	})
})

//클릭한 수강생 상세내역
$('#stmodal').on('show.bs.modal', function(e){
	$('#inputtlsnno').text($(e.relatedTarget).data('tlsnno'));
	$('#inputname').text($(e.relatedTarget).data('name'));
	$('#inputlecttl').text($(e.relatedTarget).data('lecttl'));
	$('#inputtel').text($(e.relatedTarget).data('tel'));
	$('#inputaddr').text($(e.relatedTarget).data('addr'));
	$('#inputdetaaddr').text($(e.relatedTarget).data('detaaddr'));
	$('#inputshipnum').text($(e.relatedTarget).data('shipnum'));
	$('#inputregdate').text($(e.relatedTarget).data('regdate'));
	$('#inputpay').text($(e.relatedTarget).data('pay'));
})
//수강생 이름 검색, 배송 상태 검색
function stSearch(){
	nameSearchKey = $('#stval').val();
	shipStCodeSearchKey = $('#shipcode').val();
	$('.sendname').val(nameSearchKey);
	$('.sendshipcode').val(shipStCodeSearchKey);
	  
	$('#stsearchFrm').attr("action", "/creator/cLecStsearch");
	$('#stsearchFrm').submit();
}
//이름 검색 후 선입력
$(function(){
	if(${inputName != ''}){
		$('#stval').val('${inputName}');
	}
})

//배송예정? 전? >> 운송장 입력
function goDelivery(e){
	let shipNum = $('#inputshipNum').val();
	let tlsnNo = e;
	
	$.ajax({
		url : "/creator/shipNumUpdate",
		method : "post",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
		dataType : 'text',
		data : {
			shipNum : shipNum,
			tlsnNo : tlsnNo
		},
		success : function(){
			alert('운송장 번호 입력을 완료하였습니다');
			location.reload();
		}
        
	})
}

</script>
</body>
</html>