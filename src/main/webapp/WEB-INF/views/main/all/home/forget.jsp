<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Normal Breadcrumb Begin -->
    <section class="normal-breadcrumb set-bg" data-setbg="resources/img/normal-breadcrumb.jpg">
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
    
    <section class="blog-details spad">
        <div class="container">
            <div class="col-lg-12 d-flex justify-content-center">
                <div class="row">
                    <div class="card mr-5">
                        <div class="card-body mx-4 my-2">
                            <div class="mb-3 row d-flex justify-content-center">
                                <h4>아이디 찾기</h4>
                            </div>
                            <div class="row my-3">
                                <button class="site-btn email">이메일 본인인증</button>
                            </div>
                            <div class="row my-3">
                                <button class="site-btn phone">핸드폰 본인인증</button>
                            </div>
                        </div>
                    </div>
                    <div class="card ml-5">
                        <div class="card-body mx-4 my-2">
                            <div class="mb-3 row d-flex justify-content-center">
                                <h4>비밀번호 찾기</h4>
                            </div>
                            <div class="row my-3">
                                <button class="site-btn email">이메일 본인인증</button>
                            </div>
                            <div class="row my-3">
                                <button class="site-btn phone">핸드폰 본인인증</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!-- modal -->
    <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel"></h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body">
                    <div> 
                    </div>
                </div>
				<div class="modal-footer">
					<a class="btn" id="modalY" href="#">확인</a>
					<button class="btn" type="button" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

<script>
    $('.site-btn').click((e)=>{
        if(e.target.classList.contains('email')){
            $('.modal-body>div').append(
                    $('<input>').attr('placeholder','이메일 입력'),
                    $('<button>').text('전송'),
                    $('<br>'),
                    $('<input>').attr('placeholder','인증번호 입력'),
                    $('<button>').text('전송'),
            )
        }
        $('#modal').modal('show')
    })
</script>
</body>
</html>