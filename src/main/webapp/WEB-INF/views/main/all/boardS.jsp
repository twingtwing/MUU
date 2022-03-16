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
.download_link:hover,.next_hover:hover{
	text-decoration: underline;
	cursor: pointer;
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
	<div id="board_search">
		
		<div class="breadcrumb-option">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="breadcrumb__links">
							<a href="/home" class="text-dark font-weight-bold"><i class="fa fa-home "></i> Home</a> 
							<a href="/boardL" class="text-dark font-weight-bold">공지사항</a> 
							<span>{{board.ttl}}</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 카테고리 끝-->
	
		<!-- body 의 body-->
		<section class="blog spad">
			<div class="container">
				<div class="col-lg-12">
					<div class="d-flex justify-content-center mt-3 mb-5">
						<h2>
							<strong>공지사항</strong>
						</h2>
					</div>
					<div class="d-flex justify-content-center p-3 border-top border-bottom bg-light">
						<div class="d-inline p-2 text-black" >
							<h4 class="">{{board.ttl}}</h4>
						</div>
					</div>
					<div class="d-flex justify-content-between px-2 py-2 bg-light">
						<div>
							<h5>작성자 : 관리자</h5>
						</div>
						<div class="row mr-2">
							<h5 class="mx-2">작성일자 :{{board.wrDate}} </h5>
							<h5>조회수 : {{board.hits}}  </h5>
						</div>
					</div>
					<div class="border-bottom"></div>
					<div v-if="board.detaFileList != null" class="d-flex justify-content-end mt-3 mr-2">
						<div class="mr-2">
							<i class="fa fa-download text-dark"></i>
						</div>
						<div>
							<p class="download_link mb-0" v-for="(file,index) in board.detaFileList" v-on:click="downloadDetail(index)" class="text-muted ml-2">{{file.filePath}}</p>
						</div>
					</div>
					<div id="cont" class="d-flex justify-content-start mt-1 alert" role="alert" style="height:40vh" name=linemak>
						<p class="mb-3" v-html="board.content"></p>
					</div>
					<div class="border-top"></div>
					<div v-if ="board.nextbno > -1" id="next" class="d-flex justify-content-start ml-5 mt-3">
						<i class="fa fa-angle-double-up"></i>
						<div v-on:click="boardNext()" class="next_hover"> <div class="ml-2">다음글 : {{board.nextbttl}}</div></div>
					</div>
					<div class="border-bottom mt-3"></div>
					<div v-if="board.prebno > -1" id="pre" class="d-flex justify-content-start ml-5 mt-3">
						<i class="fa fa-angle-double-down"></i>
						<div v-on:click="boardPre()" class="rgba-green-slight next_hover"><div class="ml-2">이전글 :{{board.prebttl}} </div></div>
					</div>
					<div class="border-bottom mt-3"></div>
				</div>
				<div class="d-flex justify-content-center m-3">
					<a class="btn btn-danger"
						href="/boardL">목록으로</a>
				</div>
			</div>
		</section>
		
	</div>
	
	<!-- body 의 body 끝 -->
	<!-- body 끝 -->
	<script>
		let header = "${_csrf.headerName}";
		let token = "${_csrf.token}";

        const board = Vue.createApp({
            data(){
                return {
                    board: [],
                    board : {}
                }
            },
            methods: {
                boardNext() {
                  //  console.log(this.board[0].bNo);
                    location.href ="boardS?bNo="+this.board.nextbno;
                },
                boardPre() {
                    //console.log(this.board[1].bNo);
                	 location.href ="boardS?bNo="+this.board.prebno;
                },
                downloadDetail(index) {
                    location.href ="/download?phyPath="+this.board.detaFileList[index].phyPath;
                },
            },
            beforeCreate: function () {
            	
            	
          
            	
            	
            	$.ajax({
            		url : 'selectBoard',
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
            		console.log(result);
            		result.wrDate = new Date(result.wrDate).toISOString().slice(0,10);
            		this.board = result;
            	});
               
            }
        })
        //mount vue
        const mountedBoard = board.mount('#board_search');
        
   
         
        
    </script>

</body>
</html>