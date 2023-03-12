<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#frm{
	padding: 10rem 0;
}
</style>
</head>
<body>
<div align="center">
<form class="d-flex flex-column align-items-center w-25" id="frm" action="/user/changePw" method="post">
<input type="password" placeholder="현재 비밀번호" class="border rounded p-2 m-2 w-100" id="currPw">
<input type="password" placeholder="새 비밀번호" name="pw" class="border rounded p-2 m-2 w-100" id="pw">
<input type="password" placeholder="새 비밀번호 확인" class="border rounded p-2 m-2 w-100" id="pw2">
<div class="small font-weight-bold text-danger">※ 영문자와 숫자를 포함한 8~20자로 입력해주세요.</div>
<div id="alert"></div>
<button type="button" class="border rounded px-5 py-2 m-2" id="btn">비밀번호 변경</button>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</form>
</div>
<script type="text/javascript">
let state = false;
const passwordChk = (pw)=>{
	$.ajax({
		url : '/user/passwordChk',
		type : 'post',
		data : {pw : pw},
		beforeSend : (xhr) =>{
		      xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		async : false,
	})
	.done((r)=>{
		console.log(r)
		if(r==='ng'){
			state = false;
			return;
		} else if(r==='ok'){
			state = true;
		}
	})
}

$('#btn').click(()=>{
	const pwreg = /^(?=.*[A-Za-z$`~!@$!%*#^?&\\(\\)\-_=+])(?=.*\d)[A-Za-z\d$`~!@$!%*#^?&\\(\\)\-_=+]{8,20}$/;
	passwordChk($('#currPw').val());
	console.log(state)
	if(!state){
		window.alert('현재 비밀번호가 틀렸습니다.');
		return;
	}
	if($('#pw').val()!=$('#pw2').val()){
		window.alert('비밀번호 확인이 맞지 않습니다.');
		return;
	}
	if(!pwreg.test($('#pw').val())){
		window.alert('비밀번호 양식에 맞지 않습니다.');
		return;
	}
	window.alert('비밀번호 변경이 완료되었습니다.')
	$('#frm').submit();
})


</script>
</body>
</html>