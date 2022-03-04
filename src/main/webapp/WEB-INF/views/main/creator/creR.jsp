<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/creator-menu.css"
	type="text/css">
<style type="text/css">
th, td {
	padding: 0.5rem;
	text-align: center;
}
</style>
</head>
<body>
	<!-- 배너 시작-->
	<section class="normal-breadcrumb set-bg"
		data-setbg="/resources/img/normal-breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="normal__breadcrumb__text">
						<h2>크리에이터 페이지</h2>
						<p>환불 요청 내역</p>
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
						<a href="#" class="text-dark font-weight-bold"> <i
							class="fa fa-home"></i> 홈
						</a> <span>환불요청내역</span>
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
					<div class="row mr-2" style="width: 160px">
						<ul class="list-group w-100" id="cctgr">
							<!-- 해당 상위카테고리 일때, active가 보여야함 => 자바스크립트 혹은 jstl if구문으로 해결해야함 -->
							<li
								class="list-group-item border-bottom-0 align-items-center d-flex"
								style="height: 55px;"><a class="list-link active"
								href="/creS">크리에이터 정보</a></li>
							<p
								class="list-group-item border-bottom-0 mb-0 align-items-center d-flex mylist">내
								강의 목록</p>
							<li
								class="list-group-item border-bottom-0 align-items-center d-flex pl-40"
								style="height: 35px;"><a class="list-link" href="/rLecL">&nbsp;&nbsp;-
									신청한 강의</a></li>
							<li
								class="list-group-item border-bottom-0 align-items-center d-flex"
								style="height: 35px;"><a class="list-link" href="/oLecL">&nbsp;&nbsp;-
									열린 강의</a></li>
							<li
								class="list-group-item border-bottom-0 align-items-center d-flex"
								style="height: 35px;"><a class="list-link" href="/clLecL">&nbsp;&nbsp;-
									종료된 강의</a></li>
							<li
								class="list-group-item border-bottom-0 align-items-center d-flex"
								style="height: 35px;"><a class="list-link" href="/rpLecL">&nbsp;&nbsp;-
									신고된 강의</a></li>
							<li
								class="list-group-item border-bottom-0 align-items-center d-flex"
								style="height: 55px;"><a class="list-link" href="/lecI">강의등록</a>
							</li>
							<li
								class="list-group-item border-bottom-0 align-items-center d-flex"
								style="height: 55px;"><a class="list-link"
								href="/creator/creSaleYear">매출내역</a></li>
							<li class="list-group-item align-items-center d-flex"
								style="height: 55px;"><a class="list-link"
								href="/creator/creRefund">환불 요청 내역</a></li>
						</ul>
					</div>
				</div>

				<div class="col-lg-10">
					<div class="col-12 ml-2">
						<div class="row col-12">
							<h3 class="font-weight-bold">
								<i class="fa fa-money text-danger" aria-hidden="true"></i>&nbsp;환불요청내역
							</h3>
						</div>

						<hr class="font-weight-bold">

						<div class="row col-12">
							<div class="row col-12 justify-content-end mt-3 mb-1">
								<div class="mr-3">
									<select class="border px-4" id="selectType">
										<option value="all" selected>전체</option>
										<option value="RF01">환불신청대기</option>
										<option value="RF02">환불완료</option>
										<option value="RF03">환불거부</option>
									</select>
								</div>
								<div>
									<select class="border px-4" id="searchType">
										<option value="contentSearchKey">환불 사유</option>
										<option value="idSearchKey">수강생 아이디</option>
										<option value="ttlSearchKey">강의명</option>
									</select>
								</div>
								<input type="text" class="border" spellcheck="false" id="refundSearchKey" placeholder="검색...">
								<button type="button" class="border px-4 mr-4" id="refundSearch">검색</button>
							</div>
							<div class="row col-12">
								<!-- 테이블 간격 조금 좁음 넓히자 -->
								<table class="w-100 list ml-2 mr-4">
									<thead class="bg-light">
										<tr>
											<th>순번</th>
											<th>이름</th>
											<th>강의명</th>
											<th>결제일</th>
											<th>환불 요청일</th>
											<th>환불사유</th>
											<th>결제금액</th>
											<th>처리상태</th>
										</tr>
									</thead>
									<tbody id="refundList">
										<!-- for문 돌리기 -->
										<c:forEach items="${refundlists }" var="refundlist">
											<tr>
												<td>${refundlist.tlsnNo }</td>
												<td>${refundlist.id }</td>
												<td>${refundlist.ttl }</td>
												<td>${refundlist.regDate }</td>
												<td>${refundlist.reqDate }</td>
												<td>${refundlist.content }</td>
												<td>${refundlist.pay }원</td>
												<c:if test="${refundlist.rfStCode eq 'RF01'}">
													<td class="font-weight-bold">환불신청대기</td>
												</c:if>
												<c:if test="${refundlist.rfStCode eq 'RF02'}">
													<td class="font-weight-bold">환불완료</td>
												</c:if>
												<c:if test="${refundlist.rfStCode eq 'RF03'}">
													<td class="font-weight-bold">환불거부</td>
												</c:if>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!--숨겨놓는 페이지네이션용 테이블-->
								<table class="w-100 list ml-2 mr-4" style="display: none">
									<thead class="bg-light">
										<tr>
											<th>회원번호</th>
											<th>이름</th>
											<th>강의명</th>
											<th>결제일</th>
											<th>환불 요청일</th>
											<th>환불사유</th>
											<th>결제금액</th>
											<th>처리상태</th>
										</tr>
									</thead>
									<tbody id="sampleTr">
										<tr>
											<td id="num_sam"></td>
											<td id="id_sam">${refundlist.id }</td>
											<td id="ttl_sam">${refundlist.ttl }</td>
											<td id="regDate_sam">${refundlist.regDate }</td>
											<td id="reqDate_sam">${refundlist.reqDate }</td>
											<td id="content_sam">${refundlist.content }</td>
											<td id="pay_sam">${refundlist.pay }</td>
											<td id="rfStCode_sam" class="font-weight-bold"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="product__pagination d-flex justify-content-center">
							<c:if test="${pagination.currRange ne 1}">
								<a><i class="fa fa-angle-double-left"></i></a>
							</c:if>
							<c:forEach begin="${pagination.startPage }"
								end="${pagination.endPage }" var="page">
								<c:choose>
									<c:when test="${page eq pagination.currPage}">
										<a class="current-page paging">${page}</a>
									</c:when>
									<c:otherwise>
										<a class="paging">${page}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if
								test="${pagination.currRange ne pagination.pageCnt && pagination.pageCnt > 0}">
								<a><i class="fa fa-angle-double-right"></i></a>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript">
	// 일반 페이지네이션 함수
	const normalPageAjax = (result) => {
		$.ajax({
				url: '/creator/creRefundPage',
				data: result,
				contentType: 'application/json;charset=utf-8',
			})
			.done((res) => {
				console.log(res);
				removeAll();
				changePage(res); 
			})
	}
	  // 검색시 페이지네이션 함수
	  const searchPageAjax = (searchData) =>{
		  console.log(searchData);
		  $.ajax({
	  		url : '/creator/creRefundSearch',
	  		data : searchData,
	  		contentType : 'application/json;charset=utf-8',
	  	})
	  	.done((res)=>{
	  		$(document.querySelectorAll('.product__pagination>a')).removeClass('current-page');
	  		removeAll();
	  		changePage(res);
	  	})
	  }
	// 셀렉트 선택시 페이지네이션 함수
	$("#selectType").on("change", function(){ 	
		let result = makeSelectObj();
		console.log(result);
		$.ajax({
	  		url : '/creator/creRefundSelect',
	  		data : {rfStCode : result},
	  		dataType : 'json',
	  		contentType : 'application/json;charset=utf-8',
	  		success: function(data) {
	  			console.log(data)
	  			$(document.querySelectorAll('.product__pagination>a')).removeClass('current-page');
	  			removeAll();
	  			changePage(data);
	  		}	
	  	})
		
	});
	
	// 페이지네이션
	$('.paging').click((e) => {
		let pageNum = +e.currentTarget.textContent - 1;
		const data = {page : pageNum, cre_id : '${username}'};
		if(!$('#refundSearchKey').val()){
			normalPageAjax(data)		
		} else if($('#refundSearchKey').val()){
			const searchData = makeSearchObj();
			searchData.page = pageNum;
			searchPageAjax(searchData);
		} else if($('#selectType').val() != "all"){
			const selectData = makeSelectObj();
			selectData.page = pageNum;
			selectPageAjax(selectData);
		}
		;
		$(document.querySelectorAll('.product__pagination>a')).removeClass('current-page');
		$(e.currentTarget).addClass('current-page');
	});
	
	// 페이징에 필요한 select 객체 생성
	const makeSelectObj = () =>{
		let rfStCode = null
		if($('#selectType').val()==='RF01'){
			let RF01 = "RF01"
			console.log("작동은 하니?1")
			rfStCode = RF01
			return rfStCode;
		}else if($('#selectType').val()==='RF02'){
			let RF02 = "RF02"
			console.log("작동은 하니?2")
			rfStCode = RF02
			return rfStCode;
		}else if($('#selectType').val()==='RF03'){
			let RF03 = "RF03"
			console.log("작동은 하니?3")
			rfStCode = RF03
			return rfStCode;
		}else{
			rfStCode = null;
			console.log("다시 전체 보여주기")
			return rfStCode;
		}
		
	}
	
	// 페이징에 필요한 검색 객체 생성
	const makeSearchObj = ()=>{
		   let ttl = null; 
		   let content = null;
		   let id = null;
		   if($('#searchType').val()==='ttlSearchKey'){
		   		ttl = $('#refundSearchKey').val()
		   } else if($('#searchType').val()==='contentSearchKey'){
			   content = $('#refundSearchKey').val();
		   }else if($('#searchType').val()==='idSearchKey'){
			   id = $('#refundSearchKey').val();
		   }else{
			   alert("다른 검색은 없는뎁쇼")
		   }
		   const searchData = { ttlSearchKey : ttl , contentSearchKey : content, idSearchKey : id, ltNo : ${ltno}, page : 0}
		   return searchData
	   }
	
	// 검색
    $('#refundSearch').click((e)=>{   	
    	searchPageAjax(makeSearchObj());
    })
    $('#refundSearchKey').keypress((e)=>{
    	if(e.key=='Enter'){
    		$('#refundSearch').click();
    	}
    })
	
	// 페이지네이션 DOM 조작 함수
	const removeAll = () => {
		$('#refundList').children().remove();
	}
	const changePage = (res) => {
		console.log(res)
		res.forEach((val) => {
			console.log(val)
				$('#sampleTr #num_sam').text(val.tlsnNo);
				$('#sampleTr #id_sam').text(val.id);
				$('#sampleTr #ttl_sam').text(val.ttl);
				$('#sampleTr #regDate_sam').text(new Date(val.regDate).toISOString().slice(0,10));
				$('#sampleTr #reqDate_sam').text(new Date(val.reqDate).toISOString().slice(0,10));
				$('#sampleTr #content_sam').text(val.content);
				$('#sampleTr #pay_sam').text(val.pay + "원");
				if(val.rfStCode == 'RF01'){
					$('#sampleTr #rfStCode_sam').text("환불신청대기");
				}else if(val.rfStCode == 'RF02'){
					$('#sampleTr #rfStCode_sam').text("환불완료");
				}else{
					$('#sampleTr #rfStCode_sam').text("환불거부");
				}
				$('#refundList').append($('#sampleTr').html());
		})
	}
	
		//mouseover 이벤트 : 사이드바 css변경
		$('#cctgr  .list-group-item:not(.mylist)').on('mouseover', function() {
			$(this).css('background-color', '#e53637');
			$(this).find('.list-link').css('color', '#ffffff');
			$(this).find('p').css('color', '#ffffff');
		})

		//mouseover 이벤트 : 사이드바 css변경
		$('#cctgr  .list-group-item:not(.mylist)').on('mouseout', function() {
			$(this).css('background-color', '#ffffff');
			$(this).find('.list-link').css('color', '#000000');
			$(this).find('p').css('color', '#000000');
			$(this).find('.list-link.active').css('color', '#e53637');
		})
	</script>
</body>
</html>