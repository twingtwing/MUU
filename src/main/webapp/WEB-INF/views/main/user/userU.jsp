<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.list-link {
	color: black;
}

.list-link.active {
	font-weight: bold;
	color: #e53637;
}

td>img {
	width: 25px;
	margin: 0 5px;
}

td, th {
	padding: 5px;
}

.info td, .info th {
	padding: 0.5rem 1.2rem;
}

.info input {
	padding: 0.5rem 1rem;
}

.alert {
	color: var(- -danger);
	font-size: 0.8rem;
	text-align: center;
	font-weight: bold;
	padding: 0;
	margin: 0;
}

@media screen and (max-width: 980px) {
	.col-lg-3:first-child {
		height: 5rem;
	}
	.col-lg-3>.card>.card-body {
		display: flex;
	}
	.card-title, .card-subtitle text-muted {
		margin: 0px;
		height: 5rem;
	}
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
						<h2>마이페이지</h2>
						<p>내 정보</p>
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
						<a href="#"><i class="fa fa-home"></i> HOME</a> <a href="#">마이페이지</a>
						<span>내 정보</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 카테고리 끝-->

	<section class="blog spad">
		<div class="container">
			<div class="row">
				<!-- 사이드 시작 -->
				<div class="col-lg-2">
					<div class="row mr-2" style="width: 160px">
						<ul class="list-group w-100">
							<li
								class="list-group-item border-bottom-0 align-items-center d-flex"
								style="height: 55px;">
								<!-- 해당 상위카테고리 일때, active가 보여야함 => 자바스크립트 혹은 c:if구문으로 해결해야함 -->
								<a class="list-link active" href="#">내 정보</a>
							</li>
							<li
								class="list-group-item border-bottom-0 align-items-center d-flex"
								style="height: 55px;"><a class="list-link" href="#">내
									강의리스트</a></li>
							<li
								class="list-group-item border-bottom-0 align-items-center d-flex"
								style="height: 55px;"><a class="list-link"
								href="./박정욱_위시리스트.html">위시 리스트</a></li>
							<li class="list-group-item align-items-center d-flex"
								style="height: 55px;"><a class="list-link"
								href="./박정욱_유저결제내역.html">결제내역</a></li>
						</ul>
					</div>
				</div>
				<!-- 사이드 끝 -->
				<div class="col-lg-10">
					<div class="row ml-2">
						<h3 class="font-weight-bold">
							<i class="fa fa-user-circle-o text-danger" aria-hidden="true"></i>&nbsp;내
							정보
						</h3>
					</div>
					<hr class="font-weight-bold">
					<div class="row py-3">
						<div class="col-lg-12">
							<div class="card" style="height: 80vh; position: relative;">
								<div class="card-body d-flex flex-column align-items-center">
									<div
										class="d-flex justify-content-center align-items-center justify-content-around my-5">
										<img src="/resources/img/profile.png" alt="유저의 프로필 사진입니다."
											style="width: 150px; height:150px; border-radius: 100%; border: lightgray 1px solid; cursor: pointer;"
											class="mr-4" onclick="file.click();"> <input
											type="file" id="file" style="display: none;">
										<div>
											<table class="ml-4">
												<tr>
													<th>아이디</th>
													<td>steel@naver.com</td>
												</tr>
												<tr>
													<th>SNS 연동</th>
													<td><img src="/resources/img/kakao.svg" alt="">
														<img src="/resources/img/naver.png" alt=""> <img
														src="/resources/img/google.png" alt=""></td>
												</tr>
												<tr>
													<th>내 권한/등급</th>
													<td>사용자 ( 새싹 회원 ) 🌱 🌹 🌳</td>
												</tr>
												<tr>
													<th>적립금<br></th>
													<td>500원</td>
												</tr>
											</table>
											<span class="text-danger ml-4" style="font-size: 0.8rem;">※
												적립금은 구매 후 7일 뒤, 혹은 구매 확정 시 적립됩니다.</span>
										</div>
									</div>
									<form
										class="d-flex flex-column justify-content-center border info w-75 pt-3">
										<table class="p-5">
											<tr>
												<th>이름</th>
												<td>우오오</td>
											</tr>
											<tr>
												<th>나이<br> / 성별
												</th>
												<td>17세 (여성)</td>
											</tr>
											<tr>
												<th>전화번호</th>
												<td><input type="text" value="01012345678"
													class="border w-100" placeholder="'-' 없이 입력해주세요" id="tel"></td>
											</tr>
											<tr>
												<th>주소</th>
												<td><input type="text" value="12345"
													class="border w-50" readonly id="sample4_postcode"
													onclick="sample4_execDaumPostcode()" name="zip">
													<button type="button"
														class="border bg-danger round text-white p-2 px-5"
														onclick="sample4_execDaumPostcode()">우편번호 찾기</button> <input
													type="text" value="대구광역시 중구 중앙대로 403" class="border w-100"
													readonly id="sample4_roadAddress" name="addr"><br>
													<input type="text" value="태왕아너스타워 5층 예담직업전문학교"
													class="border w-100" placeholder="상세주소 입력" id="detaAddr"
													name="detaAddr"></td>
											</tr>
										</table>
										<div class="alert"></div>
										<div class="d-flex justify-content-center mb-3">
											<button class="border px-4 py-2 rounded mx-3" type="button"
												id="sbmt">완료</button>
											<button class="border px-4 py-2 rounded mx-3"
												onclick="location.href=history.back()">취소</button>
										</div>
									</form>
								</div>
								<!--card body end-->
							</div>
							<!-- card 끝-->
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="row ml-2"></div>
				<hr class="font-weight-bold">
				<div class="row py-3">

					<div class="col-lg-9"></div>
				</div>
			</div>
		</div>
	</section>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
        function sample4_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = ''; // 참고 항목 변수

                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraRoadAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data
                            .buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraRoadAddr !== '') {
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample4_postcode').value = data.zonecode;
                    document.getElementById("sample4_roadAddress").value = roadAddr;

                },
            }).open();
        }
 
      $('#tel').keyup((e)=>{
        const telreg = /^[0-9]{11}$/;
        if(!telreg.test(e.target.value)){
          $('.alert').text('전화번호 양식을 지켜주세요.')
          return;
        } else {
          $('.alert').text('');
        }
      })
      $('#sbmt').click((e)=>{
        if($('.alert').text()){
          return;
        }
        if(!$('#detaAddr').val()){
          $('.alert').text('상세 주소를 입력해주세요.');
          return;
        } else{
          $('.alert').text('');
        }
      })

        //mouseover 이벤트 : 사이드바 css변경
        $('.list-group .list-group-item').on('mouseover',function(){
            $(this).css('background-color','#e53637');
            $(this).find('.list-link').css('color','#ffffff');
        })

        //mouseover 이벤트 : 사이드바 css변경
        $('.list-group .list-group-item').on('mouseout',function(){
            $(this).css('background-color','#ffffff');
            $(this).find('.list-link').css('color','#000000');
            $(this).find('.list-link.active').css('color','#e53637');
        })
        
        
        // 유저정보 업데이트 (사진이랑 같이해야될듯.)
        
    </script>
</body>
</html>