<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="normal-breadcrumb set-bg"
		data-setbg="/resources/img/hero/hero-1.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="normal__breadcrumb__text">
						<h2>문의글</h2>
						<p>상세한 문의를 원하시면 여기서 하시면 됩니다.</p>
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
						<a href="#" class="text-dark font-weight-bold"><i
							class="fa fa-home "></i> Home</a> <a href="#"
							class="text-dark font-weight-bold">Contact</a> <span>문의글</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 카테고리 끝-->

	<!-- body 의 body-->
	<section id="inquiry_insert" class="blog spad">
		<div class="container">
			<div class="col-lg-12">
				<div class="row ml-1 mb-3">
					<h3 class="font-weight-bold text-danger">
						<i class="fa fa-rocketchat"></i> 문 의 글
					</h3>
				</div>
				<div class="d-flex justify-content-start border-bottom border-dark">
					<h5 class="font-weight-bold mb-2">01 고객동의</h5>
				</div>
				<div class="mt-4">
					<div>- 보내주신 문의를 확인 후 최대한 빠르게 답변해 드리겠습니다.</div>
					<div>- 문의 [제목]과 [내용]란에는 절대 개인정보를 입력하지 마세요.</div>
					<div>- 문의 [제목]과 [내용]란에 개인정보가 포함되어 있거나, 중복 문의인 경우에는 삭제될 수
						있습니다.</div>
					<div>- 문의에 욕설, 인격침해, 성희롱 등 수치심을 유발하는 표현이 있다면 상담이 중단될 수 있습니다.</div>
					<div>- 개인정보 제공에 동의하셔야 문의버튼이 활성화 됩니다.</div>
				</div>
				<div class="border alert mt-2" role="alert">
					<div class="form-check">
						<input v-on:click="clickEvent" v-model="privacy"
							class="form-check-input" type="checkbox"
							style="margin-top: 10px;"> <label
							class="form-check-label"> 개인정보 수집 및 이용동의 </label>
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-danger ml-5"
							data-toggle="modal" data-target="#privacyAgree">전문보기</button>
					</div>
				</div>

				<div
					class="d-flex justify-content-start border-bottom border-dark mt-5">
					<h5 class="font-weight-bold mb-2">02 문의입력</h5>
				</div>
				<div class="mt-4">
					<security:authorize access="isAuthenticated()">
						<security:authentication property="principal.username"
							var="username" />
					</security:authorize>
					<div>
						아이디 : ${username} <input v-model="inputid"
							data-id=${username
							} placeholder="${username}"
							type="hidden">
					</div>

					<div class="form-group mt-3">
						<label for="inputTitle">제목</label> <input v-model="inputTitle"
							class="form-control" id="inputTitle" type="text">
					</div>
					<div class="form-group mt-3">
						<label for="content">문의 내용</label>
						<textarea style="white-space: pre-line" v-model="inputContent"
							class="form-control" spellcheck="false" name="content" id="content" cols="30"
							rows="10"></textarea>
					</div>
					<div>답변 이메일</div>
					<div class="form-group ml-1 mt-3 row ">
						<input name="email1" id="emailId" spellcheck="false" type="text" v-model="inputEmailID"> @
						<input name="email2" id="emailType" spellcheck="false" type="text" v-on:keyup="chageEvent()" v-model="inputEmailType" >
						<div class="ml-3">
								<select v-model="inputEmailType">
								  <option disabled value="">선택하세요</option>
								  <option>naver.com</option>
								  <option>gmail.com</option>
								  <option>hanmail.net</option>
								  <option>직접선택</option>
								</select>
						</div>
					</div>
				</div>
				<div class="mt-5 d-flex justify-content-between">
					<button type="button" class="btn btn-danger"
						onclick="history.go(-1);">뒤로가기</button>
					<button type="button" id="qstBtn" v-on:click="QstInsertClick"
						class="btn btn-danger" disabled>문의하기</button>
					<!-- onclick="location.href='./inquiryEnd.html'" -->
				</div>
			</div>
		</div>
	</section>
	<!-- Modal -->
	<div class="modal fade" id="privacyAgree" tabindex="-1"
		aria-labelledby="privacyAgreeLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="privacyAgreeLabel">개인정보 관련 동의사항 안내</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					[개인정보 수집 및 이용 동의]<br> <br> ㈜회사이름는 다음과 같이 개인정보를 수집하고 있습니다.<br>
					<br> 수집 및 이용 목적: 문의 대응, 이용자 식별<br> <br> 항목: 아이디<br>
					<br> 보유 및 이용기간: 수집일로부터 6개월(법령에 특별한 규정이 있을 경우 관련 법령에 따라 보관)<br>
					<br> 문의 유형에 따라 ID, 이름, 이메일 주소, 휴대폰번호, 생년월일, 성별, 주소, 본인확인정보, 결제
					정보, 자동으로 생성되는 정보, 기기를 식별하는 정보 등 추가로 수집하는 개인정보가 있을 수 있습니다.<br>
					<br> 동의를 거부할 경우 문의를 접수할 수 없습니다.<br> <br> ※그 외의 사항 및
					자동 수집 정보와 관련된 사항은 개인정보처리방침을 따릅니다.<br> <br>
				</div>
				<div class="modal-footer d-flex justify-content-center">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		let header = "${_csrf.headerName}";
		let token = "${_csrf.token}";
		
        const inquiry = Vue.createApp({
            data() {
                return {
                    privacy: '',
                    inputTitle: '',
                    inputContent: '',
                    inputEmailID: '',
                    inputEmailType: '',
                    inputid : "${username}",
                    selected : ''
  
                }
            },
            computed: {
                // remaining(){
                //     return this.titles.filter(function(title){
                //         if (titles.todoyn == 0) return 1
                //     }).length;
                // }

                //변수 집합 가공시 사용
                //ex> 오름차순,내림차순
            },
            methods: {
            	clickEvent(){
            		if(this.privacy){
            			$('#qstBtn').attr('disabled','disabled');
            		}else{
            			$('#qstBtn').removeAttr('disabled');
            		}
            	},
            	chageEvent(){
            		const emailType_rule = /^[a-zA-Z0-9.][a-zA-Z0-9.]*$/;
            		console.log($('#emailType').val());
            		if(!emailType_rule.test($('#emailType').val())){
    					$('#emailType').val('');
    					return;
    				}
            	},
            	QstInsertClick(index) {
                    console.log("선택 " + this.privacy);
                    console.log("제목 " + this.inputTitle);
                    console.log("내용 " + this.inputContent);
                    console.log("이메일아이디 " + this.inputEmailID);
                    console.log("이메일타입 " + this.inputEmailType);
                    console.log("아이디 " + this.inputid);
                    //location.href ="상세페이지?ltNo="+this.lectures[index].ltNo;
					
                    if(this.inputTitle != '' && this.inputContent != '' && this.inputEmailID != ''
                    	&& this.inputEmailType != ''){
                    	let intro = this.inputContent;
            	   		intro = intro.replace(/\r\n/ig,'<br>');
            	   		intro = intro.replace(/\\n/ig,'<br>');
            	   		intro = intro.replace(/\n/ig,'<br>');
            	   		
                       $.ajax({
                		url : '/QstInsert',
                		type : 'post',
                		datatype : 'json',
                		beforeSend: function(xhr) {
                			xhr.setRequestHeader(header, token);
                		},
                		data : {
                			ttl: this.inputTitle,
                   		    content : intro,
                   		    writer : this.inputid,
                   		  	email : this.inputEmailID + "@" + this.inputEmailType
                		},
                		success: function(jqXHR) {
                			console.log("성공")
                			alert("문의해주셔서 감사합니다.")
                			location.href="/home"
                		}
                	})
                    	
                    }else{
                    	alert("작성하지 않은 부분이 존재합니다.")
                    }
                },
            },
            beforeCreate: function () {
            	
           	}
 	 })
        //mount vue
        const mountedinquiry = inquiry.mount('#inquiry_insert');
    </script>

	<script>
	 	let emailType_rule = /^[a-zA-Z0-9]{5,12}$/
		$(function(){
	      $('select').niceSelect('destroy');
	    })
	    
	    $("#emailId").keyup(function(event){ 
			 if (!(event.keyCode >=37 && event.keyCode<=40)) {
	    	    var inputVal = $(this).val();
	    	    $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
	    	   }
	     });
    </script>
</body>
</html>