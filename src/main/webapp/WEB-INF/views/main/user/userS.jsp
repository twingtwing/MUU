<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

div>button {
	margin: 1rem;
}

td, th {
	padding: 5px;
}

.info td, .info th {
	padding: 0.5rem 1.5rem;
	padding-top: 1rem;
}

.UserGradeInfo, .CreGradeInfo {
	z-index: 1;
	background-color: white;
	display: flex;
	justify-content: center;
	position: absolute;
	top: 1rem;
	left: 4rem;
	padding: 1rem;
	display: none;
}

.CreGradeInfo {
	top: 20rem;
}

.show {
	display: inline-block;
}

.small {
	font-size: 0.8rem;
	color: gray;
}

.modal {
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
						<a href="/home" class="text-dark font-weight-bold"><i
							class="fa fa-home"></i>Home</a> <a href="/user/userSelect"
							class="text-dark font-weight-bold">마이페이지</a> <span>내정보</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 카테고리 끝-->


	<!-- body 의 body-->
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
								<a class="list-link active" href="/user/userSelect">내 정보</a>
							</li>
							<li
								class="list-group-item border-bottom-0 align-items-center d-flex"
								style="height: 55px;"><a class="list-link"
								href="/user/userLectureList">내 강의리스트</a></li>
							<li
								class="list-group-item border-bottom-0 align-items-center d-flex"
								style="height: 55px;"><a class="list-link"
								href="/user/userWishList">위시 리스트</a></li>
							<li class="list-group-item align-items-center d-flex"
								style="height: 55px;"><a class="list-link"
								href="/user/userPay">결제내역</a></li>
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
										class="d-flex justify-content-center align-items-center justify-content-around my-5 position-relative">
										<c:if test="${empty user.pht}">
											<img src="/resources/img/profile.png" alt="유저의 프로필 사진입니다."
												style="width: 150px; height: 150px; border-radius: 100%; border: lightgray 1px solid; cursor: pointer;"
												class="mr-4 position-relative" onclick="file.click();"
												id="profile">
										</c:if>
										<c:if test="${not empty user.pht}">
											<img src="${user.pht }" alt="유저의 프로필 사진입니다."
												style="width: 150px; height: 150px; border-radius: 100%; border: lightgray 1px solid; cursor: pointer;"
												class="mr-4" onclick="$('#file').click();" id="profile">
										</c:if>
										<input type="file" id="file" style="display: none;" multiple>
										<div
											class="p-3 bg-white position-absolute imgwindow small text-center"
											onclick="$('#file').click();"
											style="top: 0; left: 0; width: 150px; height: 165px; display: none; opacity: 80%">
											<br>프로필 사진<br>변경하기
										</div>
										<div>
											<table class="ml-4">
												<tr>
													<th>아이디</th>
													<td>${user.id}</td>
												</tr>
												<tr>
													<th>내 권한/등급</th>
													<td style="cursor: pointer;" id="getGrade"><c:if
															test="${user.authCode eq 'A02'}">
                                                    	유저 ( ${user.uGrdCode}회원 )
                                                    </c:if> <c:if
															test="${user.authCode eq 'A03'}">
                                                    	크리에이터 ( ${user.creGrdCode } )
                                                    </c:if></td>
												</tr>
												<tr>
													<th>적립금<br></th>
													<td><fmt:formatNumber>${user.point}</fmt:formatNumber>원</td>
												</tr>
											</table>
											<span class="text-danger ml-4" style="font-size: 0.8rem;">※
												적립금은 구매 후 7일 뒤, 혹은 구매 확정 시 적립됩니다.</span>
										</div>
									</div>
									<div class="d-flex justify-content-center border info w-75 p-4">
										<table class="w-75">
											<tr>
												<th>이름</th>
												<td>${user.name }</td>
											</tr>
											<tr>
												<th>성별</th>
												<td><c:if test="${user.gender eq 'M' }">
													남성
                                                </c:if> <c:if
														test="${user.gender eq 'W' }">
													여성
                                                </c:if></td>
											</tr>
											<tr>
												<th>나이</th>
												<td>${user.age}세</td>
											</tr>
											<tr>
												<th>전화번호</th>
												<td>${user.tel}</td>
											</tr>
											<tr>
												<th>주소</th>
												<td>${user.addr }<br>${user.detaAddr}</td>
											</tr>
										</table>
									</div>
									<div class="d-flex justify-content-center mx-5 mb-5 mt-4">
										<button class="border px-4 py-2 rounded"
											onclick="location.href='/user/userUpdate'">회원정보수정</button>
										<button class="border rounded px-4 -y-2" id="changePw">비밀번호 변경</button>
										<button class="px-4 py-2 bg-danger rounded" id="out" style="color:white;border:none;">탈퇴</button>
									</div>
								</div>
								<!--card body end-->
								<!-- 등급 보이는 창 -->
								<div class="UserGradeInfo card">
									<table>
										<tr>
											<th style="text-align: center; padding-bottom: 2rem;"
												colspan="2">회원 등급별 적립금 혜택</th>
										</tr>
										<tr>
											<th>일반 회원</th>
											<td>구매 금액의 1%를 적립</td>
										</tr>
										<tr>
											<th>새싹 회원 🌱<br>
											<span class="small">(월 10만원 이상 결제한 고객)</span></th>
											<td>구매 금액의 3%를 적립</td>
										</tr>
										<tr>
											<th>꽃 회원 🌹<br>
											<span class="small">(월 30만원 이상 결제한 고객)</span></th>
											<td>구매 금액의 5%를 적립</td>
										</tr>
										<tr>
											<th>나무 회원 🌳<br>
											<span class="small">(월 50만원 이상 결제한 고객)</span></th>
											<td>일반: 구매 금액의 10%를 적립</td>
										</tr>
									</table>
								</div>

								<!--크리에이터 등록한 사람만 보여주게함-->
								<c:if test="${user.authCode eq 'A03' }">

									<div class="CreGradeInfo card">
										<table>
											<tr>
												<th style="text-align: center; padding-bottom: 2rem;"
													colspan="2">크리에이터 등급별 수수료 감면 혜택</th>
											</tr>
											<tr>
												<th>Family (기본) ♔</th>
												<td>수수료 15%</td>
											</tr>
											<tr>
												<th>VIP ♛<br>
												<span class="small">(수익이 월 500만원 이상인 경우)</span></th>
												<td>수수료 10%</td>
											</tr>
											<tr>
												<th>VVIP 👑<br>
												<span class="small">(수익이 월 1000만원 이상인 경우)</span></th>
												<td>수수료 5%</td>
											</tr>
										</table>
									</div>
								</c:if>
							</div>
							<!-- card 끝-->
						</div>
					</div>
				</div>
			</div>

		</div>
	</section>

	<!-- 탈퇴 모달 -->
	<div class="modal fade" id="outModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div align="right">
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>

				<h3 class="modal-body text-center">정말로 탈퇴하시겠습니까?</h3>
				<div class="mb-5 text-center  text-danger font-weight-bold">※
					수강중인 강의는 탈퇴 처리후 복구가 불가능 합니다.</div>
				<div class="d-flex justify-content-center align-items-center">
					<a class="btn" id="modalY" href="#">네, 탈퇴합니다.</a>
					<button class="btn" type="button" data-dismiss="modal">취소</button>
				</div>

			</div>
		</div>
	</div>

	<!-- 크리에이터가 강의를 열고 있는 경우 탈퇴 모달 -->
	<div class="modal fade" id="creModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div align="right">
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>

				<h5 class="modal-body text-center text-danger font-weight-bold">
					⛔<br>
					<br>현재 진행 중인 강의가 존재하여 탈퇴가 불가능합니다.
				</h5>
				<div class="mb-5 text-center mt-2">
					<span id="exp"></span> 부터 탈퇴가 가능합니다.
				</div>
				<div class="d-flex justify-content-center align-items-center">
					<button class="btn" type="button" data-dismiss="modal">확인</button>
				</div>

			</div>
		</div>
	</div>
<form action="/user/userPwForm" method="post" id="pwForm">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</form>
	<script>
        $('#getGrade').mouseover((e)=>{
            $('.UserGradeInfo').addClass('show');
            $('.CreGradeInfo').addClass('show');
        })
        
        $('#getGrade').mouseout((e)=>{
            $('.UserGradeInfo').removeClass('show');
            $('.CreGradeInfo').removeClass('show');
        })
        
        
        
        //탈퇴 관련
        let state =true;
   		// 상태별 모달창
        $('#out').click(()=>{
            let auth = "${user.authCode}";
            if(auth==='A02'){
            	$('#outModal').modal('show'); 
            	return;
            } else {
            	const data = { id : "${user.id}"}
        		$.ajax({
        		data : data,
        		url : '/user/userFarewellChk',
        		success : (res)=>{
	            	if(res=='ok'){
	            		$('#outModal').modal('show');
	            	}else{
	            		state = false;
	            		$('#exp').text(res);
	            		$('#creModal').modal('show');
	            	}        			
        			}
        		})	
            }        
        })
        
        
        const farewell = ()=>{
        	let userpht = "${user.pht}";
        	if(userpht){        		
        		userpht = userpht.replace('/upload/','C:/uploadTest/');
        	}
        	const data = { id : "${user.id}", pht : userpht};
        	$.ajax({
        		method : 'post',
        		url : '/user/userFarewell',
        		beforeSend : (xhr) =>{
  			    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
  			  	},
        		data : data,
        		success : (res) =>{
        		},
        		err : (e)=>{
        			console.log(e);
        			window.alert('관리자에게 문의하세요.');
        		}
        	})
        }
        
        
        $('#modalY').click(()=>{
            // 탈퇴 ajax처리
            //사용자가 임의로 코드를 만져서 모달창을 띄울 가능성을 생각하여 state 변수로 제어함
            if(!state){
            	location.href='/accessError';
            	return;
            };
            farewell();
            $('#logout').submit();
        })
        
       	// 비밀번호 변경 페이지로 이동
       $('#changePw').click(()=>{
    	   $('#pwForm').submit()
       })
        
        
        
        // change profile image
      $('#file').change((e)=>{
    	  const imgreg = /\.(jpg|jpeg|png|bmp)$/;
    	  let fileName = e.target.files[0].name;
    	  if(!imgreg.test(fileName)){
    		  window.alert('이미지 파일만 올릴 수 있습니다.');
    		  return;
    	  }
		  const formData = new FormData();
		  formData.append("uploadFile", e.target.files[0]);
		  if($('#profile').attr('src')){
			  formData.append("beforeFileName",$('#profile').attr('src'));			  
		  } else {
			  formData.append("beforeFileName","no");		
		  }
		  $.ajax({
			  type : 'post',
			  url :"/user/uploadProfile",
			  processData : false,
			  contentType : false,
			  beforeSend : (xhr) =>{
			      xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			  },
			  data : formData,
			  success : (result) =>{
				  $('#profile').attr('src',result);
			  },
			  err : (err) => console.log(err)
		  })
      })
           
      $('#profile').mouseover(()=>{
    	  $('.imgwindow').css('display','block');
      })
      $('#profile').mouseout(()=>{
    	  $('.imgwindow').css('display','none');
      })
        
        
        
        
    //mouseover 이벤트 : 사이드바 css변경
    $('.list-group .list-group-item:not(.mylist)').on('mouseover',function(){
      $(this).css('background-color','#e53637');
      $(this).find('.list-link').css('color','#ffffff');
    })

      //mouseover 이벤트 : 사이드바 css변경
    $('.list-group .list-group-item:not(.mylist)').on('mouseout',function(){
      $(this).css('background-color','#ffffff');
      $(this).find('.list-link').css('color','#000000');
      $(this).find('.list-link.active').css('color','#e53637');
    })
    </script>
</body>
</html>