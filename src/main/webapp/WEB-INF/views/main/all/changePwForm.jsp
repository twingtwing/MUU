<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
						<h2>비밀번호 재설정</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Normal Breadcrumb End -->
	<form action="/changePw" method="post" id="frm">
		<div
			class="d-flex justify-content-center align-items-center flex-column m-5">
			<input type="password" placeholder="새 비밀번호"
				class="mt-5 p-2 px-5 border" id="pw" name="pw"> <input
				type="password" placeholder="새 비밀번호 확인" class="mt-1 p-2 px-5 border"
				id="pw2"> <span class="small"> ※ 영문자와 숫자를 포함한 8~16자로
				입력해주세요.</span>
			<div class="alert small text-danger"></div>
			<button class="border px-5 py-1 mb-5 mt-1" id="smt" type="button">비밀번호
				변경</button>
			<input type="hidden" value="${id}" name="id">
		</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>

	<script type="text/javascript">
	
	$('#smt').click(()=>{
		const pwreg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,20}$/;
		if(!pwreg.test($('#pw').val())){
			$('.alert').text('비밀번호 양식을 지켜주시기 바랍니다.');
			return;
		} else {
			$('.alert').text('');
		}					
		if($('#pw').val()!=$('#pw2').val()){
			$('.alert').text('비밀번호 확인이 틀렸습니다.');
			return;
		}
		if(!$('.alert').val()){
			$('#frm').submit(); 			
		}
	})
	</script>
</body>
</html>