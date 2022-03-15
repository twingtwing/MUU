<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input, .custom-select {
	width: 100%;
	padding: 1rem 2.5rem;
}

td>span {
	font-size: 0.7rem;
	color: gray;
}

td {
	padding: 0.5rem;
}

#alert, .pwAlert, .idAlert {
	color: var(--danger);
	font-weight: bold;
	transition: all 0.3s;
}

.pilsu {
	position: relative;
}

.pilsu>i {
	position: absolute;
	font-size: 1.3rem;
	left: 1.2rem;
	top: 1.2rem;
	color: var(--danger);
}

table {
	text-align: center;
}

</style>
</head>

<body>
	<!-- Normal Breadcrumb Begin -->
	<section class="normal-breadcrumb set-bg"
		data-setbg="resources/img/normal-breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="normal__breadcrumb__text">
						<h2>회원가입</h2>
						<p>어이 그 앞은 지옥이라고</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Normal Breadcrumb End -->

	<!-- Signup Section Begin -->
	<section class="signup spad">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="login__form">
					<h3 style="color: black;">회원가입</h3>
					<span class="pl-4 text-muted">( <i
						class="fa fa-check-circle text-danger" aria-hidden="true"></i> 는
						필수 입력 값입니다. )
					</span>
					<form action="/signup" class="d-flex justify-content-center"
						method="post" id="signupForm">
						<table style="width: 37vw;">
							<tbody>
								<tr>
									<td class="pilsu"><input type="text"
										class="border px-10 py-2" placeholder="아이디" required name="id"
										id="id" spellcheck="false"> <i
										class="fa fa-check-circle" aria-hidden="true"></i></td>
									<td><select class="custom-select emailAddr p-0 px-2">
											<option value="" disabled selected>주소 선택</option>
											<option value="@naver.com">@naver.com</option>
											<option value="@google.com">@google.com</option>
											<option value="@nate.com">@nate.com</option>
									</select></td>
								</tr>
								<tr>
									<td><span class="d-flex idAlert"> <!--아이디 중복 테스트 결과 여기에 메시지--></span>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="pilsu"><input
										class="border px-10 py-2" spellcheck="false" type="password"
										placeholder="비밀번호" required name="pw" id="pw"
										spellcheck="false"> <i class="fa fa-check-circle"
										aria-hidden="true"></i> <span class="d-flex"> ※ 영문자와
											숫자를 포함한 8~20자로 입력해주세요.</span></td>
								</tr>
								<tr>
									<td colspan="2" class="pilsu"><input
										class="border px-10 py-2" spellcheck="false" type="password"
										placeholder="비밀번호 확인" required id="pw2"> <i
										class="fa fa-check-circle" aria-hidden="true"></i></td>
								</tr>
								<tr>
									<td><span class="d-flex pwAlert"> <!--비밀번호 확인 틀리면 여기에 메시지-->
									</span></td>
								</tr>
								<tr>
									<td colspan="2" class="pilsu"><input
										class="border px-10 py-2" spellcheck="false" type="text"
										placeholder="성명" required name="name" id="name"> <i
										class="fa fa-check-circle" aria-hidden="true"></i></td>
								</tr>
								<tr>
									<td class="pilsu"><input class="border px-10 py-2"
										spellcheck="false" type="text" placeholder="출생년도 ..."
										name="birthDate" id="birthDate" required> <i
										class="fa fa-check-circle" aria-hidden="true"></i></td>
									<td class="pilsu"><select
										class="custom-select px-10 py-0 gender" name="gender">
											<option value="" selected disabled>성별</option>
											<option value="W">여성</option>
											<option value="M">남성</option>
									</select> <i class="fa fa-check-circle" aria-hidden="true"></i></td>
								</tr>
								<tr>
									<td><span class="d-flex"> ※ 통계 정보로 사용됩니다.</span></td>
								</tr>
								<tr>
									<td colspan="2"><input class="border px-10 py-2"
										spellcheck="false" type="text"
										placeholder="전화번호 ('-'없이 입력해주세요.)" name="tel" id="tel"></td>
								</tr>
								<tr>
									<td><input class="border px-10 py-2" spellcheck="false"
										type="number" placeholder="우편번호" id="sample4_postcode"
										readonly onclick="sample4_execDaumPostcode()" name="zip">
									</td>
									<td>
										<button class="site-btn" style="width: 100%;"
											onclick="sample4_execDaumPostcode()">우편번호 찾기</button>
									</td>
								</tr>
								<tr>
									<td colspan="2"><input class="border px-10 py-2"
										spellcheck="false" type="text" placeholder="도로명 주소"
										id="sample4_roadAddress" readonly name="addr"></td>
								</tr>
								<tr>
									<td colspan="2"><input class="border px-10 py-2"
										spellcheck="false" type="text" placeholder="상세주소"
										id="sample4_detailAddress" name="detaAddr"> <span
										id="guide" style="color: #999; display: none"></span> <span
										class="d-flex"> ※ 배송 정보로 사용됩니다.</span></td>
								</tr>
								<tr>
									<td colspan="2"><br>
										<div class="border p-5 text-muted">㈜재준과
											아이들(http://localhost/ 이하 "회사"이라 함)은 귀하의 개인정보를 중요시하며, 『정보통신망
											이용촉진 및 정보보호 등에 관한 법률』, 『개인정보 보호법』, 『통신비밀보호법』, 『전기통신사업법』 등
											정보통신 서비스 제공자가 준수하여야 할 관련 법령상의 개인정보보호 규정을 준수하고 있습니다. 회사는 본
											개인정보취급방침을 통하여 귀하가 회사에 제공하는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 회사가
											개인정보보호를 위해 어떠한 조치룰 취하고 있는지 알려드립니다. 회사의 개인정보취급방침은 정부정책, 관련 법령
											및 회사 내부 방침 변경 등 사회적 필요와 변화에 따라 수시로 변경될 수 있고, 회사는 이에 따른
											개인정보취급방침의 지속적인 개선을 위하여 필요한 절차를 정하고 있습니다. 개인정보취급방침을 개정하는 경우
											회사는 그 개정사항을 홈페이지에 게시하여 귀하가 개정된 사항을 쉽게 확인할 수 있도록 하고 있습니다.</div> <br>
										<label for="rule"> <input type="checkbox" id="rule">위
											내용을 확인했으며,<br>개인정보 처리방침 및 이용약관에 동의합니다 (필수)
									</label> <br> <br></td>
								</tr>
								<tr>
									<td colspan="2"><span id="alert"></span> <input
										spellcheck="false" type="button" class="site-btn" value="가입하기"
										id="sbmt" /></td>
								</tr>
								<tr>
									<td colspan="2">
										<h5 style="color: black;">
											이미 계정이 있으신가요? <a href="/customLogin"><strong>로그인</strong></a>
										</h5>
									</td>
								</tr>
							</tbody>
						</table>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- Signup Section End -->

	<!-- js -->
	<script>
		let chkState = false;
		let pwState = false;
		let timer;	
		const idreg = /^[A-za-z0-9]{6,20}$/;
		$('#id').keyup(()=>{
			if(!idreg.test($('#id').val())){
				$('.idAlert').text('영문자를 조합해 6~20자로 맞춰주세요.');
				return;
			} else {
				$('.idAlert').text('');
			}
		})
		$('#id, .emailAddr').change((e)=>{
			let currid = $('#id').val() + $('.emailAddr option:selected').val();
			if(!currid.endsWith('.com') || !$('#id').val()){
				return;
			}
			if(!idreg.test($('#id').val())){
				$('.idAlert').text('영문자를 조합해 6~20자로 맞춰주세요.');
				return;
			}
			if(timer){
				clearTimeout(timer);
			}
			timer = setTimeout((e)=>{idajaxChk()},800)
		})
		
		const idajaxChk = ()=>{		
			let currid = $('#id').val() + $('.emailAddr option:selected').val();
			$.ajax({
			url : 'idchk',
			data : {
				id : currid 
			},
			success : (result)=>{
				if(result){
					$('.idAlert').text('✔ 사용할 수 있는 아이디입니다.').addClass('text-success')
					chkState = true;
				} else{
					$('.idAlert').text('⛔ 사용할 수 없는 아이디입니다.').removeClass('text-success')
					chkState = flase;
				}
			},	
		})
		} 
		
	
		$('.site-btn').click((e) => {
			e.preventDefault();
		})
		
		$('#pw, #pw2').keyup((e) => {
			const pwreg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,20}$/;
			if(!pwreg.test($('#pw').val())){
				$('.pwAlert').text('비밀번호 양식을 지켜주시기 바랍니다.')
			}				
			if ($('#pw').val() != $('#pw2').val()) {
				$('.pwAlert').text('비밀번호 확인이 맞지 않습니다.')
			}
			if ($('#pw').val() === $('#pw2').val() && pwreg.test($('#pw').val())) {
				$('.pwAlert').text('')
				pwState=true;
			}
		})
		
		
		const telreg = /^010\d{8}$/;
		const birthreg = /\d{4}$/;
		$('#tel').keyup(()=>{
			if($('#tel').val()){
				!telreg.test($('#tel').val()) ? $('#alert').text('전화번호 양식이 바르지 않습니다.') : $('#alert').text('')
			}
		})
		$('#sbmt').click((e) => {
			e.preventDefault();
			if (!document.getElementById('rule').checked) {
				$('#alert').text('개인정보 처리방침에 동의해주세요.');
				return;
			} else {
				$('#alert').text('');
			}
			if (!$('.gender option:selected').val() || !$('.emailAddr option:selected').val() ||!$('#name').val() || !$('#birthDate').val()) {
				$('#alert').text('필수 항목들이 빠지지 않았는지 확인해주세요.');
				return;
			} else {
				$('#alert').text('');
			}
			if($('#tel').val()){
				!telreg.test($('#tel').val()) ? $('#alert').text('전화번호 양식이 바르지 않습니다.') : $('#alert').text('')
			}
			if(!birthreg.test($('#birthDate').val())){
				$('#alert').text('출생년도 양식에 맞게 작성해주세요.');	
				return;
			} else {
				$('#alert').text('');
			}
			if(chkState && !$('#alert').text() && pwState){
				$('#id').val($('#id').val() + $('.emailAddr option:selected').val());
				$('#sample4_postcode').val(+$('#sample4_postcode').val());
				$('#signupForm').submit();
			}
		})
	</script>

	<!-- 주소 api -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function sample4_execDaumPostcode() {
			new daum.Postcode({
				oncomplete: function (data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
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
	</script>
</body>

</html>