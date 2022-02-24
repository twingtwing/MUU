<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
						<a href="#" class="text-dark font-weight-bold"><i
							class="fa fa-home "></i> Home</a> <span>공지사항</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 카테고리 끝-->
 c
	<!-- body 의 body-->
	<section id="title_search" class="blog spad">
		<div class="container">
			<div class="col-lg-12 ">
				<div class="blog__details__form pt-0 d-flex justify-content-end m-2">
					<div class="row">
						<form onsubmit="return false">
							<div class="row mr-2">
								<input v-model="inputTitle" class="border mb-0"
									style="height: 35px; width: 170px" type="text"
									placeholder="제목 검색..." spellcheck=false> <a
									v-on:click="titleSearch" class="btn btn-outline-secondary"
									style="height: 35px;"> <i class="icon_search"></i>
								</a>
							</div>
						</form>
					</div>
				</div>
			</div>
			<table class="table table-hover">
				<thead class="table-secondary">
					<th class="text-center">번호</th>
					<th class="text-center">제목</th>
					<th class="text-center">작성자</th>
					<th class="text-center">작성일</th>
					<th class="text-center">조회수</th>
					<th class="text-center">첨부파일</th>
				</thead>
				<tbody>
				
					<tr v-for="(title,index) in titles">
						<td scope="row" class="text-center">{{index}}</td>
						<!-- 나중에 페이지네이션 들어가면 index 못쓸거임 아마 방법 생각하삼 -->
						<td v-on:click="titleDetail(index)">
							<div class="name">{{title.ttl}}</div>
						</td>
						<td ></td>
						<td>{{title.wrDate}}</td>
						<td class="text-center">{{title.hits}}</td>
						<td class="text-center">
							<i v-if="title.fileNo" class="fa fa-download text-danger"></i>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="product__pagination d-flex justify-content-center">
			<a href="#"><i class="fa fa-angle-double-left"></i></a> <a href="#"
				class="current-page">1</a> <a href="#">2</a> <a href="#">3</a> <a
				href="#">4</a> <a href="#">5</a> <a href="#"><i
				class="fa fa-angle-double-right"></i></a>
		</div>

		<div class="d-flex justify-content-center">
			<button type="submit" class="site-btn" onclick="history.go(-1);">뒤로가기</button>
		</div>
	</section>

	<script>
		let header = "${_csrf.headerName}";
		let token = "${_csrf.token}";
		
        const notice = Vue.createApp({
            data(){
                return {
                    inputTitle: '',
                    titles: []
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
                titleSearch() {
                    $.ajax({
                		url:'selectTtlList',
                		type:'get',
                		datatype:'json',
                		data : {
                			ttl :this.inputTitle
                		},
                		beforSend: function(xhr){
                			xhr.setRequestHeader(header, token);
                		},
                	})
                	.done(result => {
                		for(obj of result){
                			obj.wrDate = new Date(obj.wrDate).toISOString().slice(0,10);
                		}
                		this.titles = result;
                	});
                   
                },
                titleDetail(index) {
                	
                    location.href='boardS?bNo='+this.titles[index].bno;
                    		
                },
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
            		for(obj of result){
            			obj.wrDate = new Date(obj.wrDate).toISOString().slice(0,10);
            		}
            		this.titles = result;
            	});
            }
        })
        //mount vue
        const mountedTitle = notice.mount('#title_search');
</script>
</body>
</html>