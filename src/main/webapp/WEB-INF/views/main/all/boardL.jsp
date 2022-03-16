<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.name:hover{
	text-decoration : underline;
 	cursor: pointer;
}
.name {
	display: inline-block;
	width: 700px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
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
						<h2>공지사항</h2>
						<p>공지사항입니다</p>
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
						<a href="/home" class="text-dark font-weight-bold"><i class="fa fa-home "></i> Home</a> 
						<span>공지사항</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 카테고리 끝-->
	<!-- body 의 body-->
	<section id="title_search" class="blog spad">
		<div class="container">
			<div class="col-lg-12 ">
				<div class="row ml-2">
					<h3 class="font-weight-bold text-danger">
						<i class="fa fa-chalkboard"></i> 공지사항
					</h3>
				</div>
				<div class="blog__details__form pt-0 d-flex justify-content-end m-2">
					<div class="row">
						<form onsubmit="return false">
							<div class="row mr-2">
								<input v-model="inputTitle" v-on:click="cursorSearch" class="border mb-0" style="height: 35px; width: 170px" type="text" placeholder="제목 검색..." spellcheck=false>
								<a v-on:click="titleSearch" class="btn btn-outline-secondary" style="height: 35px;"> <i class="icon_search"></i></a>
							</div>
						</form>
					</div>
				</div>
			</div>
			<table class="table table-hover">
				<thead class="table-secondary">
					<th class="text-center">번호</th>
					<th class="text-center">제목</th>
					<th class="text-center">작성일</th>
					<th class="text-center">조회수</th>
					<th class="text-center">첨부파일</th>
				</thead>
				<tbody>
				<tr v-for="(board,index) in boards[pageNum]">
						<td scope="row" class="text-center">{{board.bno}}</td>
						<!-- 나중에 페이지네이션 들어가면 index 못쓸거임 아마 방법 생각하삼 -->
						<td v-on:click="titleDetail(board.bno)">
							<div class="name">{{board.ttl}}</div>
						</td>
						<td>{{board.wrDate}}</td>
						<td class="text-center">{{board.hits}}</td>
						<td class="text-center">
							<i v-if="board.fileNo > -1" class="fa fa-download text-danger"></i>
							<i v-if="board.fileNo == -1" class="fa fa-minus"></i>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="product__pagination d-flex justify-content-center">
			<a href="#" v-if="pageNum+1 > 1" v-on:click="pageMove(-1)"><i class="fa fa-angle-double-left"></i></a>
			<a href="#" v-for="page in pages" v-on:click="pageMove(page-1)" v-bind:class="{'current-page':pageNum+1 == page}"/>{{page}}</a> 
			<a href="#" v-if="pageNum+1 < pages" v-on:click="pageMove(-2)" ><i class="fa fa-angle-double-right"></i></a>
		</div>
		<div class="d-flex justify-content-center mt-3">
			<a class="site-btn" href="/home">뒤로가기</a>
		</div>
	</section>

	<script>
		let header = "${_csrf.headerName}";
		let token = "${_csrf.token}";
		
        const notice = Vue.createApp({
            data(){
                return {
                    inputTitle: '',
                    originBoards : [],
                    boards: [],
                	pages : 0,
                    pageNum : 0
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
            	cursorSearch(){
            		console.log($(event.target));
            		$(event.target).select();
            	},
                titleSearch() {
                   this.page(this.originBoards.filter(obj => obj.ttl.indexOf(this.inputTitle)!== -1));
                },
                titleDetail(index) {
                	location.href='boardS?bNo='+index;
                },
                page(list){
                	this.pages = Math.ceil(list.length/10);
                	this.pageNum = 0;
             		var count = 0;
             		this.boards[count] = [];
                	for (var i = 0; i < list.length; i++) {
                		this.boards[count].push(list[i]);
						if((i+1)%10 === 0 && i !== 1){
							count++;
							this.boards[count] = [];
						}
					}
                	console.log(this.boards);
                },
                pageMove(num){
                	
                	if(num == -1){
                		this.pageNum --;
                	}else if(num == -2){
                		this.pageNum ++;
                	}else{
                		this.pageNum = num;
                	}
                	console.log(this.pageNum);
                }
            },
            beforeCreate: function () {
            	
            	$.ajax({
            		url : 'selectBoardList',
            		type : 'post',
            		datatype : 'json',
            		beforeSend: function(xhr) {
            			xhr.setRequestHeader(header, token);
            		}

            	})
            	.done(result => {
            		console.log(result);
            		for(obj of result){
            			obj.wrDate = new Date(obj.wrDate).toISOString().slice(0,10);
            		}
            		this.originBoards = result;
            		this.page(this.originBoards);
            	});
            }
        })
        //mount vue
        const mountedTitle = notice.mount('#title_search');
</script>
</body>
</html>