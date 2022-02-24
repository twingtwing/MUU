<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#modal {
	margin-top: 15rem;
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
						<h2>아이디/비밀번호 찾기</h2>
						<p>이번 한 번만 알려드리는 겁니다 ..</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Normal Breadcrumb End -->

	<!-- 아디비번찾기 섹션 시작 -->
	<section class="blog-details spad">
		<div class="container">
			<div class="col-lg-12 d-flex justify-content-center">
				<div class="row">
					<div class="card mr-5"
						style="border: 3px solid black; border-radius: 20px;">
						<div class="card-body mx-4 my-2"
							style="height: 40vh; width: 25vh;">
							<div class="mb-3 mt-3 row d-flex justify-content-center">
								<h4 class="font-weight-bold">아이디 찾기</h4>
							</div>
							<div class="row my-3" style="height: 30vh; width: 25vh;">
								<div class="mx-3 mt-5 mb-0">
									<button class="site-btn email">이메일 본인인증</button>
								</div>
								<div class="mx-3" style="margin-top: -40px;">
									<button class="site-btn phone">핸드폰 본인인증</button>
								</div>
							</div>
						</div>
					</div>
					<div class="card mr-5"
						style="border: 3px solid black; border-radius: 20px;">
						<div class="card-body mx-4 my-2"
							style="height: 40vh; width: 25vh;">
							<div class="mb-3 mt-3 row d-flex justify-content-center">
								<h4 class="font-weight-bold">비밀번호 찾기</h4>
							</div>
							<div class="row my-3" style="height: 30vh; width: 25vh;">
								<div class="mx-3 mt-5 mb-0">
									<button class="site-btn email">이메일 본인인증</button>
								</div>
								<div class="mx-3" style="margin-top: -40px;">
									<button class="site-btn phone">핸드폰 본인인증</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- modal -->
	<div class="modal fade" id="modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">비밀번호 변경</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="d-flex flex-column align-items-center">
						<div>
							<input type="text" id="email" class="border m-1 mt-5">
							<button id="sendCode" class="border">인증번호 전송</button>
						</div>
						<div>
							<input type="text" id="answer" class="border m-1">
							<button id="submit" class="border">인증번호 확인</button>
						</div>
						<div class="text-danger small alert font-weight-bold"></div>
					</div>
				</div>
				<div class="modal-footer">
					<a class="btn" id="modalY" href="#">확인</a>
					<button class="btn" type="button" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
<form action="/changePwForm">
<input type="hidden" name="email">
</form>


	<script type="text/javascript">
	$('.email').click(()=>{
		$('#modal').modal('show');
	})
	let header = "${_csrf.headerName}";
	let token = "${_csrf.token}";
	let key;
	
	const idchk = ()=>{
		$.ajax({
			url : 'idchk',
			data : {id : $('#email').val()},
			success : (r)=>{
				// null이면 true, 있으면 false, 우린 false여야함
				if(r){
					$('.alert').text('없는 아이디입니다.');
				} else {
					$('.alert').text('');
					$('#sendCode').attr('disabled',true);
					$('#email').attr('readonly',true);
				}
			}
		})
	}
	
	const getKey = () =>{
		$.ajax({
			url : 'mailCheck?email='+$('#email').val(),
			beforeSend : function(xhr){
				xhr.setRequestHeader(header,token)
			},
			contentType: false,
	        processData: false,
			success : (r)=>{
				console.log(r)
				key = r;
			},
			error : (err)=>{
				console.log(err)
			}
		})
	}
	
	// 인증번호 발급
	$('#sendCode').click((e)=>{
		idchk();
		if($('.alert').val()){
			return;
		}
		if(!$('#email').val()){
			$('.alert').text('아이디를 입력해주세요.')
			return;
		} else {
			$('.alert').text('');
		}
		getKey();
	})
	// 인증번호 확인 후 form으로 이동
	$('#submit').click(()=>{		
		if(+$('#answer').val()===key){
			$('form>input').val($('#email').val())
			console.log($('form>input').val())
			$('form').submit();
		} else {
			$('.alert').text('인증번호가 틀렸습니다.');
			return;
		}
	})
	</script>
</body>
</html>