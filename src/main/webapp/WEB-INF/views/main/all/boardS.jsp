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
				<div class="row justify-content-between px-4 py-2 bg-light">
					<div>
						<h5>작성자 : 관리자</h5>
					</div>
					<div class="row mr-2">
						<h5 class="mx-2">작성일자 : 2022-02-18</h5>
						<h5>조회수 : 18</h5>
					</div>
				</div>
				<div class="border-bottom"></div>
				<div class="d-flex justify-content-end mt-3">
					<p class="text-muted ml-2">첨부파일 명</p>
					<div>
						<i v-on:click="downloadDetail(index)"
							class="fa fa-download text-dark"></i>
					</div>
				</div>
				<div class="d-flex justify-content-start mt-1 alert" role="alert">
					<p class="mb-3">국가는 전통문화의 계승·발전과 민족문화의 창달에 노력하여야 한다. 대통령의 임기연장
						또는 중임변경을 위한 헌법개정은 그 헌법개정 제안 당시의 대통령에 대하여는 효력이 없다. 법관은 헌법과 법률에 의하여
						그 양심에 따라 독립하여 심판한다. 국무총리 또는 행정각부의 장은 소관사무에 관하여 법률이나 대통령령의 위임 또는
						직권으로 총리령 또는 부령을 발할 수 있다. 대통령은 헌법과 법률이 정하는 바에 의하여 공무원을 임면한다. 대한민국은
						민주공화국이다. 이 헌법에 의한 최초의 대통령의 임기는 이 헌법시행일로부터 개시한다. 대통령은 국회에 출석하여
						발언하거나 서한으로 의견을 표시할 수 있다. 국민경제자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 모든
						국민은 행위시의 법률에 의하여 범죄를 구성하지 아니하는 행위로 소추되지 아니하며, 동일한 범죄에 대하여 거듭 처벌받지
						아니한다. 평화통일정책의 수립에 관한 대통령의 자문에 응하기 위하여 민주평화통일자문회의를 둘 수 있다. 누구든지 체포
						또는 구속의 이유와 변호인의 조력을 받을 권리가 있음을 고지받지 아니하고는 체포 또는 구속을 당하지 아니한다. 체포
						또는 구속을 당한 자의 가족등 법률이 정하는 자에게는 그 이유와 일시·장소가 지체없이 통지되어야 한다. 대통령이 궐위된
						때 또는 대통령 당선자가 사망하거나 판결 기타의 사유로 그 자격을 상실한 때에는 60일 이내에 후임자를 선거한다.
						대통령은 법률이 정하는 바에 의하여 사면·감형 또는 복권을 명할 수 있다. 국민의 모든 자유와 권리는
						국가안전보장·질서유지 또는 공공복리를 위하여 필요한 경우에 한하여 법률로써 제한할 수 있으며, 제한하는 경우에도 자유와
						권리의 본질적인 내용을 침해할 수 없다. 국가는 사회보장·사회복지의 증진에 노력할 의무를 진다. 국회의 회의는
						공개한다. 다만, 출석의원 과반수의 찬성이 있거나 의장이 국가의 안전보장을 위하여 필요하다고 인정할 때에는 공개하지
						아니할 수 있다. 교육의 자주성·전문성·정치적 중립성 및 대학의 자율성은 법률이 정하는 바에 의하여 보장된다.
						국회의원은 현행범인인 경우를 제외하고는 회기중 국회의 동의없이 체포 또는 구금되지 아니한다. 대통령의 임기는 5년으로
						하며, 중임할 수 없다. 대통령은 전시·사변 또는 이에 준하는 국가비상사태에 있어서 병력으로써 군사상의 필요에 응하거나
						공공의 안녕질서를 유지할 필요가 있을 때에는 법률이 정하는 바에 의하여 계엄을 선포할 수 있다. 형사피고인은 유죄의
						판결이 확정될 때까지는 무죄로 추정된다. 국가는 국민 모두의 생산 및 생활의 기반이 되는 국토의 효율적이고 균형있는
						이용·개발과 보전을 위하여 법률이 정하는 바에 의하여 그에 관한 필요한 제한과 의무를 과할 수 있다. 헌법개정안은
						국회가 의결한 후 30일 이내에 국민투표에 붙여 국회의원선거권자 과반수의 투표와 투표자 과반수의 찬성을 얻어야 한다.
						공무원의 직무상 불법행위로 손해를 받은 국민은 법률이 정하는 바에 의하여 국가 또는 공공단체에 정당한 배상을 청구할 수
						있다. 이 경우 공무원 자신의 책임은 면제되지 아니한다. 국가는 농·어민과 중소기업의 자조조직을 육성하여야 하며, 그
						자율적 활동과 발전을 보장한다. 대통령은 제1항과 제2항의 처분 또는 명령을 한 때에는 지체없이 국회에 보고하여 그
						승인을 얻어야 한다. 국회는 정부의 동의없이 정부가 제출한 지출예산 각항의 금액을 증가하거나 새 비목을 설치할 수
						없다. 이 헌법시행 당시에 이 헌법에 의하여 새로 설치될 기관의 권한에 속하는 직무를 행하고 있는 기관은 이 헌법에
						의하여 새로운 기관이 설치될 때까지 존속하며 그 직무를 행한다. 대통령이 제1항의 기간내에 공포나 재의의 요구를 하지
						아니한 때에도 그 법률안은 법률로서 확정된다. 국무회의는 정부의 권한에 속하는 중요한 정책을 심의한다.</p>
				</div>
				<div class="border-top"></div>
				<div id="next" class="d-flex justify-content-start ml-5 mt-3">
					<i class="fa fa-angle-double-up"></i>
					<div class="ml-2">다음글 :</div>
					<div v-on:click="boardNext(index)">{{board[0].bNo}},{{board[0].title}}</div>
				</div>
				<div class="border-bottom mt-3"></div>
				<div id="pre" class="d-flex justify-content-start ml-5 mt-3">
					<i class="fa fa-angle-double-down"></i>
					<div class="ml-2">이전글 :</div>
					<div v-on:click="boardPre(index)" class="rgba-green-slight">{{board[1].bNo}},{{board[1].title}}</div>
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
                    download : []
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
                boardNext(index) {
                    console.log(this.board[0].bNo);
                    //location.href ="상세페이지?ltNo="+this.lectures[index].ltNo;
                },
                boardPre(index) {
                    console.log(this.board[1].bNo);
                    //location.href ="상세페이지?ltNo="+this.lectures[index].ltNo;
                },
                downloadDetail(index) {
                    console.log(this.download[0].bNo);
                    //location.href ="상세페이지?ltNo="+this.lectures[index].ltNo;
                },
            },
            beforeMount: function () {
                this.board = [{
                    bNo: 1,
                    title: '다음글'
                }, {
                    bNo: 2,
                    title: '이전글'
                }]
                this.download = [{
                    bNo: 1,
                    title: '다운로드'
                }]
            }
        })
        //mount vue
        const mountedBoard = board.mount('#board_search');
    </script>

</body>
</html>