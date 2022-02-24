<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#next:hover {
	background-color: #dee2e6;
}

#pre:hover {
	background-color: #dee2e6;
}
</style>
</head>
<body>
	<section class="normal-breadcrumb set-bg"
		data-setbg="resources/img/hero/hero-1.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="normal__breadcrumb__text">
						<h2>공지사항 상세페이지</h2>
						<p>설명입니다.</p>
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
							class="text-dark font-weight-bold">공지사항</a> <span>공지사항상세보기</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 카테고리 끝-->

	<!-- body 의 body-->
	<section class="blog spad" id="board_search">
		<div class="container">
			<div class="col-lg-12">
				<div class="d-flex justify-content-center mt-3 mb-5">
					<h2>
						<strong>공지사항</strong>
					</h2>
				</div>
				<div
					class="d-flex justify-content-center p-3 border-top border-bottom bg-light">
					<div class="d-inline p-2 text-black">
						<h4 class="">공지사항 작성 제목입니다.</h4>
					</div>
				</div>
				<div class="d-flex justify-content-between px-2 py-2 bg-light">
					<div>
						<h5>작성자 : 관리자</h5>
					</div>
					<div class="row mr-2">
						<h5 class="mx-2">작성일자 : ${wrDate }</h5>
						<h5>조회수 :${hits }</h5>
					</div>
				</div>
				<div class="border-bottom"></div>
				<div class="d-flex justify-content-end mt-3 mr-2">
					<div>
						<i
							class="fa fa-download text-dark"></i>
					</div>
					<p v-on:click="downloadDetail(index)" class="text-muted ml-2">첨부파일 명</p>
				</div>
				<div class="d-flex justify-content-start mt-1 alert" role="alert">
					<p class="mb-3">${content }</p>
				</div>
				<div class="border-top"></div>
				<div id="next" class="d-flex justify-content-start ml-5 mt-3">
					<i class="fa fa-angle-double-up"></i>
					<div class="ml-2">다음글 :</div>
					<div v-on:click="boardNext()"></div>
				</div>
				<div class="border-bottom mt-3"></div>
				<div id="pre" class="d-flex justify-content-start ml-5 mt-3">
					<i class="fa fa-angle-double-down"></i>
					<div class="ml-2">이전글 :</div>
					<div v-on:click="boardPre()" class="rgba-green-slight"></div>
				</div>
				<div class="border-bottom mt-3"></div>
			</div>
			<div class="d-flex justify-content-center m-3">
				<button type="submit" class="btn btn-danger"
					onclick="location.href='Notice.html'">목록으로</button>
			</div>
		</div>
	</section>
	<!-- body 의 body 끝 -->
	<!-- body 끝 -->
	<script>
        const board = Vue.createApp({
            data(){
                return {
                    board: [],
                    download : [],
                    board : {}
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
                boardNext() {
                    console.log(this.board[0].bNo);
                    //location.href ="상세페이지?ltNo="+this.lectures[index].ltNo;
                },
                boardPre() {
                    console.log(this.board[1].bNo);
                    //location.href ="상세페이지?ltNo="+this.lectures[index].ltNo;
                },
                downloadDetail(index) {
                    console.log(this.download[0].bNo);
                    //location.href ="상세페이지?ltNo="+this.lectures[index].ltNo;
                },
            },
            beforeCreate: function () {
            	$.ajax({
            		url : '이번글 + 저번글/다음글(저번인지 다음인지 알 방법있어야함) + 다운로드',
            		type : 'post',
            		datatype : 'json',
            		data : {
            			bNo : '${bno}'
            		},
            		beforeSend: function(xhr) {
            			xhr.setRequestHeader(header, token);
            		}

            	})
            	.done(result => {
            		for(obj of result){
            			obj.wrDate = new Date(obj.wrDate).toISOString().slice(0,10);
            		}
            		this.board = result;
            	});
                this.boards = [{
                    bNo: 1,
                    title: '다음글'
                }, {
                    bNo: 2,
                    title: '이전글'
                }];
                this.download = [{
                    bNo: 1,
                    title: '다운로드'
                }];
            }
        })
        //mount vue
        const mountedBoard = board.mount('#board_search');
        
    </script>

</body>
</html>