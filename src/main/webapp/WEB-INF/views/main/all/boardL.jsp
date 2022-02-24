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
						<td scope="row" class="text-center">{{title.bNO}}</td>
						<td v-on:click="titleDetail(index)" onclick="location.href='/boardS'">
							<div class="name">{{title.title}}</div>
						</td>
						<td>관리자</td>
						<td>2022-02-18</td>
						<td class="text-center">10</td>
						<td class="text-center"><i class="fa fa-download text-danger"></i></td>
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
                    console.log(this.inputTitle);
                    /*
                    fetch('검색?ttl='+ttl)
                    .then(response => response.json())
                    .then(result => {this.lectures = result;})
                    */
                    this.titles = [{bNO :1, title: this.inputTitle}];
                },
                titleDetail(index) {
                    console.log(this.titles[index].bNO);
                    //location.href ="상세페이지?ltNo="+this.lectures[index].ltNo;
                },
            },
            beforeMount: function () {
                this.titles = [{
                    bNO: 1,
                    title: '공dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd지사항'
                }, {
                    bNO: 2,
                    title: '작성되어라'
                }, {
                    bNO: 3,
                    title: '이거 왜안돼?'
                }]
            }
        })
        //mount vue
        const mountedTitle = notice.mount('#title_search');
</script>
</body>
</html>