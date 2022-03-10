<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
th, td {
	padding: 0.5rem;
	text-align: center;
}

.list tr {
	cursor: pointer;
}

.shipbox {
	display: none;
	z-index: 1;
}

.shipbox, .updateShip {
	font-size: 0.8rem;
}

.shipped {
	background-color: var(- -success);
}

#infomodal {
	margin-top: 10rem;
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
						<a href="/home" class="text-dark font-weight-bold"><i
							class="fa fa-home"></i> Home</a> <a href="/creator/clLecL"
							class="text-dark font-weight-bold"> 종료된 강의</a> <span>${cllists.ttl }</span>
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
								style="height: 55px;"><a class="list-link"
								href="/creator/creS">크리에이터 정보</a></li>
							<p
								class="list-group-item border-bottom-0 mb-0 align-items-center d-flex mylist">내
								강의 목록</p>
							<li
								class="list-group-item border-bottom-0 align-items-center d-flex pl-40"
								style="height: 35px;"><a class="list-link"
								href="/creator/rLecL">&nbsp;&nbsp;- 신청한 강의</a></li>
							<li
								class="list-group-item border-bottom-0 align-items-center d-flex"
								style="height: 35px;"><a class="list-link"
								href="/creator/oLecL">&nbsp;&nbsp;- 열린 강의</a></li>
							<li
								class="list-group-item border-bottom-0 align-items-center d-flex"
								style="height: 35px;"><a class="list-link active"
								href="/creator/clLecL">&nbsp;&nbsp;- 종료된 강의</a></li>
							<li
								class="list-group-item border-bottom-0 align-items-center d-flex"
								style="height: 35px;"><a class="list-link"
								href="/creator/rpLecL">&nbsp;&nbsp;- 신고된 강의</a></li>
							<li
								class="list-group-item border-bottom-0 align-items-center d-flex"
								style="height: 55px;"><a class="list-link"
								href="/creator/lecI">강의등록</a></li>
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
					<div class="row ml-2">
						<h5 class="ml-1 mb-2 font-weight-bold">
							<i class="fa fa-hand-paper-o text-danger" aria-hidden="true"></i>
							열린 강의 정보
							<!-- 상태에 따라 닫힌인지 열린인지 달라짐 -->
						</h5>
					</div>
					<hr class="font-weight-bold">
					<div class="row col-12 mb-5 ml-3">
						<!-- 제목 입력 / 제목 가져오기-->
						<h5 class="mx-4 my-3 font-weight-bold">
							강의제목 : <strong class="text-danger">집에서 배우는...</strong>
						</h5>

						<div class="row col-12">
							<div class="row col-12 mt-3 mb-3 justify-content-around">
								<!-- 선택 : active -->
								<button class="btn btn-outline-secondary lecbtn"
									style="width: 150px;" type="button"
									onclick="location.href='rLecS.html'">강의정보</button>
								<button class="btn btn-outline-secondary lecbtn"
									style="width: 150px;" type="button" onclick="location.href='#'">질문&답변</button>
								<button class="btn btn-outline-secondary lecbtn"
									style="width: 150px;" type="button" onclick="location.href='#'">공지사항</button>
								<button class="btn btn-outline-secondary lecbtn"
									style="width: 150px;" type="button" onclick="location.href='#'">리뷰</button>
								<button class="btn btn-outline-secondary lecbtn active"
									style="width: 150px;" type="button" onclick="location.href='#'">수강생</button>
							</div>
						</div>

						<div class="row mt-4 col-12 justify-content-center">
							<h5 class="font-weight-bold">수강생 목록</h5>
						</div>

						<div class="row col-12 justify-content-end mt-3 mb-1">
							<div>
								<select class="border px-4">
									<option value="" selected>전체</option>
									<option value="">배송 전</option>
									<option value="">배송 완료</option>
									<option value="">교환 요청</option>
								</select>
							</div>
							<input type="text" class="border" spellcheck="false"
								placeholder="이름 검색...">
							<button type="button" class="border px-4 mr-4">검색</button>
						</div>

						<div class="row col-12">
							<table class="w-100 list ml-2 mr-4">
								<thead class="bg-light">
									<tr>
										<th>회원번호</th>
										<th>이름</th>
										<th>수강기간</th>
										<th>진도율</th>
										<th>반송사유</th>
										<th>상태</th>
									</tr>
								</thead>
								<tbody>
									<!-- for문 돌리기 -->
									<tr>
										<td>1000</td>
										<td>박복자</td>
										<td><span>2022.05.06<span> ~ <span>2022.08.06</span></td>
										<td>12 / 60</td>
										<td>--</td>
										<td class="position-relative">
											<button class="border p-2 updateShip">배송시작</button>
											<div class="shipbox justify-content-center position-absolute">
												<input type="text" class="border" placeholder="운송장번호 입력">
												<button class="border compl">완료</button>
												<button class="border cancel">취소</button>
											</div>
										</td>
									</tr>
									<tr>
										<td>1000</td>
										<td>박복자</td>
										<td><span>2022.05.06<span> ~ <span>2022.08.06</span></td>
										<td>12 / 60</td>
										<td>--</td>
										<td class="position-relative">
											<button class="border p-2 updateShip">배송시작</button>
											<div class="shipbox justify-content-center position-absolute">
												<input type="text" class="border" placeholder="운송장번호 입력">
												<button class="border compl">완료</button>
												<button class="border cancel">취소</button>
											</div>
										</td>
									</tr>
									<tr>
										<td>1000</td>
										<td>박복자</td>
										<td><span>2022.05.06<span> ~ <span>2022.08.06</span></td>
										<td>12 / 60</td>
										<td>--</td>
										<td class="position-relative">
											<button class="border p-2 updateShip">배송시작</button>
											<div class="shipbox justify-content-center position-absolute">
												<input type="text" class="border" placeholder="운송장번호 입력">
												<button class="border compl">완료</button>
												<button class="border cancel">취소</button>
											</div>
										</td>
									</tr>
									<tr>
										<td>1000</td>
										<td>박복자</td>
										<td><span>2022.05.06<span> ~ <span>2022.08.06</span></td>
										<td>12 / 60</td>
										<td>--</td>
										<td class="position-relative">
											<button class="border p-2 updateShip">배송시작</button>
											<div class="shipbox justify-content-center position-absolute">
												<input type="text" class="border" placeholder="운송장번호 입력">
												<button class="border compl">완료</button>
												<button class="border cancel">취소</button>
											</div>
										</td>
									</tr>
									<tr>
										<td>1000</td>
										<td>박복자</td>
										<td><span>2022.05.06<span> ~ <span>2022.08.06</span></td>
										<td>12 / 60</td>
										<td>--</td>
										<td class="position-relative">
											<button class="border p-2 updateShip">배송시작</button>
											<div class="shipbox justify-content-center position-absolute">
												<input type="text" class="border" placeholder="운송장번호 입력">
												<button class="border compl">완료</button>
												<button class="border cancel">취소</button>
											</div>
										</td>
									</tr>
									<tr>
										<td>1000</td>
										<td>박복자</td>
										<td><span>2022.05.06<span> ~ <span>2022.08.06</span></td>
										<td>12 / 60</td>
										<td>--</td>
										<td class="position-relative">
											<button class="border p-2 updateShip">배송시작</button>
											<div class="shipbox justify-content-center position-absolute">
												<input type="text" class="border" placeholder="운송장번호 입력">
												<button class="border compl">완료</button>
												<button class="border cancel">취소</button>
											</div>
										</td>
									</tr>
									<tr>
										<td>1000</td>
										<td>박복자</td>
										<td><span>2022.05.06<span> ~ <span>2022.08.06</span></td>
										<td>12 / 60</td>
										<td>--</td>
										<td class="position-relative">
											<button class="border p-2 updateShip">배송시작</button>
											<div class="shipbox justify-content-center position-absolute">
												<input type="text" class="border" placeholder="운송장번호 입력">
												<button class="border compl">완료</button>
												<button class="border cancel">취소</button>
											</div>
										</td>
									</tr>
									<tr>
										<td>1000</td>
										<td>박복자</td>
										<td><span>2022.05.06<span> ~ <span>2022.08.06</span></td>
										<td>12 / 60</td>
										<td>--</td>
										<td class="position-relative">
											<button class="border p-2 updateShip">배송시작</button>
											<div class="shipbox justify-content-center position-absolute">
												<input type="text" class="border" placeholder="운송장번호 입력">
												<button class="border compl">완료</button>
												<button class="border cancel">취소</button>
											</div>
										</td>
									</tr>
									<tr>
										<td>1000</td>
										<td>박복자</td>
										<td><span>2022.05.06<span> ~ <span>2022.08.06</span></td>
										<td>12 / 60</td>
										<td>--</td>
										<td class="position-relative">
											<button class="border p-2 updateShip">배송시작</button>
											<div class="shipbox justify-content-center position-absolute">
												<input type="text" class="border" placeholder="운송장번호 입력">
												<button class="border compl">완료</button>
												<button class="border cancel">취소</button>
											</div>
										</td>
									</tr>

								</tbody>
							</table>
						</div>


						<div class="row col-12 justify-content-center mt-3">
							<div class="product__pagination">
								<a href="#"><i class="fa fa-angle-double-left"></i></a> <a
									href="#" class="current-page">1</a> <a href="#">2</a> <a
									href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#"><i
									class="fa fa-angle-double-right"></i></a>
							</div>
						</div>

					</div>
				</div>

			</div>
		</div>
		<!-- 수강생 모달 -->
		<div class="modal fade p-3" id="infomodal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content p-3">
					<div class="modal-header">
						<h5 class="modal-title">
							<span>박복자</span>수강생 결제내역
						</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body d-flex flex-column align-items-center ">
						<!--table-->
						<table class="border w-100" border="1">
							<tr>
								<th>수강번호</th>
								<td>1000</td>
							</tr>
							<tr>
								<th>이름</th>
								<td>박복자</td>
							</tr>
							<tr>
								<th>강의명</th>
								<td>쉽게 배우는 뜨개질</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>010-1234-5678</td>
							</tr>
							<tr>
								<th>주소</th>
								<td><span>도로명주소</span> <span>상세주소</span></td>
							</tr>
							<tr>
								<th>운송장 번호</th>
								<td>123465789</td>
							</tr>
							<tr>
								<th>배송 정보</th>
								<td
									class="d-flex justify-content-center align-items-center border">
									<select name="" id="">
										<option value="" selected>(현재 상태 db값)</option>
										<option value="">발송 완료</option>
								</select>
									<button class="border" onclick="updateShip(event)">완료</button>
								</td>
							</tr>
							<tr>
								<th>결제일</th>
								<td>2022-05-05</td>
							</tr>
							<tr>
								<th>결제가격</th>
								<td><span>500000000</span>원</td>
							</tr>
						</table>
					</div>
					<div class="modal-footer d-flex justify-content-center">
						<button type="button" class="border px-3 py-2"
							data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>

	</section>
	<script>
    // show input
    $('.updateShip').click((e) => {
      $(e.currentTarget.nextElementSibling).css('display', 'flex')
    })


    // ajax - change ship state
    const updateShip = (e) => {
      console.log('배송정보 업뎃됨')
    }

    $('.compl').click((e) => {
      $(e.currentTarget.parentElement).css('display', 'none')
      if(!e.currentTarget.parentElement.firstElementChild.value){
        return;
      }
      updateShip();
      $(e.currentTarget.parentElement.previousElementSibling).addClass('shipped').text('발송완료').css('color','white')
    })


    $('.cancel').click((e) => {
      $(e.currentTarget.parentElement).css('display', 'none')
    })
    $('.list tr').click((e)=>{
      // tr에다가 dataset으로 pk 넣어두거나 ..알아서
      // 수강생 결제정보 모달에 넣기
      if(e.target.nodeName !='BUTTON' && !e.target.classList.contains('updateShip')){
        // 버튼에는 모달창 안뜨도록 막아둠 => 막아두면 안되면 if구문 나가면 됨
        $('#infomodal').modal('show');
        console.log(e.currentTarget)
      }
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
  </script>
</body>
</html>