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
		data-setbg="resources/img/hero/hero-1.jpg">
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
	<section id="inquiry_test" class="blog spad">
		<div class="container">
			<div class="col-lg-12">
				<div class="d-flex justify-content-start border-bottom border-dark">
					<h5 class="font-weight-bold mb-2">01 고객동의</h5>
				</div>
				<div class="mt-4">
					<div>- 보내주신 문의를 확인 후 최대한 빠르게 답변해 드리겠습니다.</div>
					<div>- 문의 [제목]과 [내용]란에는 절대 개인정보를 입력하지 마세요.</div>
					<div>- 문의 [제목]과 [내용]란에 개인정보가 포함되어 있거나, 중복 문의인 경우에는 삭제될 수
						있습니다.</div>
					<div>- 문의에 욕설, 인격침해, 성희롱 등 수치심을 유발하는 표현이 있다면 상담이 중단될 수 있습니다.</div>
				</div>
				<div class="border alert mt-2" role="alert">
					<div class="form-check">
						<input v-model="privacy" class="form-check-input" type="checkbox"
							id="privacy" style="margin-top: 10px;"> <label
							class="form-check-label" for="privacy"> 개인정보 수집 및 이용동의 </label>
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
					<div class="border-left border-danger border-">아이디 :
						{{inquirys[0].inquiry_id}}</div>
					<div class="form-group mt-3">
						<label for="inputTitle">제목</label> <input v-model="inputTitle"
							class="form-control" id="inputTitle" type="text">
					</div>
					<div class="form-group mt-3">
						<label for="content">문의 내용</label>
						<textarea v-model="inputContent" class="form-control"
							name="content" id="content" cols="30" rows="10"></textarea>
					</div>
					<div>답변 이메일</div>
					<div class="form-group ml-1 mt-3 row ">
						<input name="email1" type="text" v-model="inputEmailID"> @
						<input name="email2" type="text" v-model="inputEmailType">
						<div class="ml-3">
							<select name="select_email" onChange="selectEmail(this)">
								<option value="" selected>선택하세요</option>
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hanmail.com">hanmail.com</option>
								<option value="1">직접입력</option>
							</select>
						</div>
					</div>
				</div>
				<div class="mt-5 d-flex justify-content-between">
					<button type="button" class="btn btn-danger"
						onclick="history.go(-1);">뒤로가기</button>
					<button type="button" v-on:click="allDetail" class="btn btn-danger">문의하기</button>
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
					[개인정보 수집 및 이용 동의]<br>
					<br> ㈜회사이름는 다음과 같이 개인정보를 수집하고 있습니다.<br>
					<br> 수집 및 이용 목적: 문의 대응, 이용자 식별<br>
					<br> 항목: 아이디<br>
					<br> 보유 및 이용기간: 수집일로부터 6개월(법령에 특별한 규정이 있을 경우 관련 법령에 따라 보관)<br>
					<br> 문의 유형에 따라 ID, 이름, 이메일 주소, 휴대폰번호, 생년월일, 성별, 주소, 본인확인정보, 결제
					정보, 자동으로 생성되는 정보, 기기를 식별하는 정보 등 추가로 수집하는 개인정보가 있을 수 있습니다.<br>
					<br> 동의를 거부할 경우 문의를 접수할 수 없습니다.<br>
					<br> ※그 외의 사항 및 자동 수집 정보와 관련된 사항은 개인정보처리방침을 따릅니다.<br>
					<br>
				</div>
				<div class="modal-footer d-flex justify-content-center">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<script>
        const inquiry = Vue.createApp({
            data() {
                return {
                    privacy: '',
                    inputTitle: '',
                    inputContent: '',
                    inputEmailID: '',
                    inputEmailType: '',
                    inquirys: []
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
                allDetail(index) {
                    console.log(this.privacy);
                    console.log(this.inputTitle);
                    console.log(this.inputContent);
                    console.log(this.inputEmailID);
                    console.log(this.inputEmailType);
                    console.log(this.inquirys[0])
                    //location.href ="상세페이지?ltNo="+this.lectures[index].ltNo;
                }

            },
            beforeMount: function () {
                this.inquirys = [{
                    inquiry_id: '문의자'
                }]
            }
        })
        //mount vue
        const mountedinquiry = inquiry.mount('#inquiry_test');
    </script>

	<script>
        function selectEmail(ele) {
            var $ele = $(ele);
            var $email2 = $(
                'input[name=email2]');
            // '1'인 경우 직접입력 
            if ($ele.val() == "1") {
                $email2.attr('readonly', false);
                $email2.val('');
            } else {
                $email2.attr('readonly', true);
                $email2.val($ele.val());
            }
        }
    </script>
</body>
</html>