<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="normal-breadcrumb set-bg"
		data-setbg="/resources/img/normal-breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="normal__breadcrumb__text">
						<h2>크리에이터 등록</h2>
						<p>🎉환영합니다!<br><br>
						<span class="small">당신의 재능과 노하우를 Make U Up 에서 마음껏 펼쳐보세요.</span></p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 배너끝 -->

	<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__links">
						<a href="/home" class="text-secondary"><i class="fa fa-home"></i>
							홈</a> <span>크리에이터 등록</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	

<form action="/user/userTocreator" method="post" id="updateForm">
	<section class="d-flex flex-column align-items-center">
		<h4>크리에이터 등록</h4>
		<textarea name="creIntro" rows="15" class="border w-25 mt-5 mb-2 p-3" spellcheck="false" placeholder="멋진 자기소개를 작성해주세요!" id="creIntro"></textarea>
		<input type="text" id="tel" name="tel" placeholder="전화번호 ('-'제외)" class="border w-25 m-2 p-3" spellcheck="false">
		<input type="password" id="pw1" class="border w-25 m-2 p-3" placeholder="비밀번호" name="pw"> 
		<input type="password" id="pw2" class="border w-25 m-2 p-3" placeholder="비밀번호 확인">
		<div class="small text-danger" id="alert"></div>
		<button type="button" class="border w-25 m-2 mb-5 p-3" id="register">크리에이터 신청</button>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</section>
</form>
	
<script type="text/javascript">


const passwordChk = (pw)=>{
	$.ajax({
		url : '/user/passwordChk',
		type : 'post',
		data : {pw : pw},
		beforeSend : (xhr) =>{
		      xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
	})
	.done((r)=>{
		if(r==='ng'){
			window.alert('비밀번호가 틀렸습니다.');
			return;
		} else if(r==='ok'){
			window.alert('크리에이터 등록이 완료되었습니다.');
			lineMaker();
			$('#updateForm').submit();
			$('#creIntro').val('')
		}
	})
}

const lineMaker = ()=>{
	let intro = $('#creIntro').val();
	intro = intro.replace(/\r\n/ig,'<br>');
	intro = intro.replace(/\\n/ig,'<br>');
	intro = intro.replace(/\n/ig,'<br>');
	$('#creIntro').val(intro);
}

const telReg = /^010\d{8}$/;
$('#register').click((e)=>{
	if(!$('#creIntro').val() || !$('#tel').val() || !$('#pw1').val() || !$('#pw2').val()){
		$('#alert').text('빠진 항목이 없는지 확인해주세요.')
		return;
	} 
	if(!telReg.test($('#tel').val())){
		$('#alert').text('전화번호 형식을 지켜주세요.')
		return;
	}
	if($('#pw1').val()!=$('#pw2').val()){
		$('#alert').text('비밀번호 확인이 틀렸습니다.')
		return;
	} 
	if($('#creIntro').val() && $('#tel').val() && $('#pw1').val() && $('#pw2').val() && telReg.test($('#tel').val())&& $('#pw1').val()===$('#pw2').val()){
		$('#alert').text('')
	}
	passwordChk($('#pw1').val());
})
</script>
</body>
</html>