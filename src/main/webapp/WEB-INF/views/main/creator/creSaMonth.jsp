<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/creator-menu.css" type="text/css">
</head>
<body>
<!-- 배너 시작-->
  <section class="normal-breadcrumb set-bg" data-setbg="/resources/img/normal-breadcrumb.jpg">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <div class="normal__breadcrumb__text">
            <h2>크리에이터</h2>
            <p>매출 내역</p>
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
						<a href="#"><i class="fa fa-home"></i> 홈</a> <a href="#">크리에이터</a>
						<span>매출 내역</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 카테고리 끝-->

	<!-- body 의 body-->
	<section class="blog spad" style="margin: 0 10vw;">
		<div class="container">
			<div class="row">
				<div class="col-lg-2">
					<div class="row mr-2" style="width: 160px">
						<ul class="list-group w-100" id="cctgr">
							<!-- 해당 상위카테고리 일때, active가 보여야함 => 자바스크립트 혹은 jstl if구문으로 해결해야함 -->
							<li
								class="list-group-item border-bottom-0 align-items-center d-flex"
								style="height: 55px;"><a class="list-link" href="#">크리에이터
									정보</a></li>
							<p
								class="list-group-item border-bottom-0 mb-0 align-items-center d-flex mylist">내
								강의 목록</p>
							<li
								class="list-group-item border-bottom-0 align-items-center d-flex pl-40"
								style="height: 35px;"><a class="list-link" href="#">&nbsp;&nbsp;-
									신청한 강의</a></li>
							<li
								class="list-group-item border-bottom-0 align-items-center d-flex"
								style="height: 35px;"><a class="list-link" href="#">&nbsp;&nbsp;-
									열린 강의</a></li>
							<li
								class="list-group-item border-bottom-0 align-items-center d-flex"
								style="height: 35px;"><a class="list-link" href="#">&nbsp;&nbsp;-
									종료된 강의</a></li>
							<li
								class="list-group-item border-bottom-0 align-items-center d-flex"
								style="height: 35px;"><a class="list-link" href="#">&nbsp;&nbsp;-
									신고된 강의</a></li>
							<li
								class="list-group-item border-bottom-0 align-items-center d-flex"
								style="height: 55px;"><a class="list-link" href="#">강의등록</a>
							</li>
							<li
								class="list-group-item border-bottom-0 align-items-center d-flex"
								style="height: 55px;"><a class="list-link active" href="#">매출내역</a>
							</li>
							<li class="list-group-item align-items-center d-flex"
								style="height: 55px;"><a class="list-link" href="#">환불
									요청 내역</a></li>
						</ul>
					</div>
				</div>

				<div class="col-lg-10">
					<div class="col-12 ml-2">
						<div class="row col-12">
							<h3 class="font-weight-bold">
								<i class="fa fa-area-chart text-danger" aria-hidden="true"></i>&nbsp;매출
								내역
							</h3>
						</div>
						<hr class="font-weight-bold">

						<div class="row col-12">
							<div class="menu w-100 d-flex justify-content-between">
								<div>
								<a href="/creator/creSaleYear"><button class="border mx-1 px-3 py-2">연도별 매출</button></a>
                  				<a href="/creator/creSaleMonth"><button class="border mx-1 px-3 py-2 bg-secondary text-white">월별 매출</button></a>
                 				<a href="/creator/creSaleLec"><button class="border mx-1 px-3 py-2">강의별 매출</button></a>
								</div>
							</div>
							<hr class="font-weight-bold">
							<div class="row col-12 justify-content-end">
								<select name="" id="">
									<option value="2022" selected>2022년</option>
									<option value="2022">2021년</option>
									<option value="2022">2020년</option>
									<option value="2022">2019년</option>
									<option value="2022">2018년</option>
									<option value="2022">2017년</option>
									<option value="2022">2016년</option>
									<option value="2022">2015년</option>
								</select>
							</div>
							<div class="col-12 row justify-content-center">
								<div class="row col-11">
									<div class="w-100">
										<canvas id="myChart" class="m-3"></canvas>
									</div>
								</div>
							</div>
						</div>

						<div class="row col-12 mr-5">
							<table class="text-center table">
								<tr>
									<th></th>
									<th>1월</th>
									<th>2월</th>
									<th>3월</th>
									<th>4월</th>
									<th>5월</th>
									<th>6월</th>
									<th>7월</th>
									<th>8월</th>
									<th>9월</th>
									<th>10월</th>
									<th>11월</th>
									<th>12월</th>
								</tr>
								<tr>
									<td>판매량</td>
									<td>5</td>
									<td>9</td>
									<td>7</td>
									<td>12</td>
									<td>20</td>
									<td>36</td>
									<td>28</td>
									<td>5</td>
									<td>9</td>
									<td>7</td>
									<td>12</td>
									<td>20</td>
								</tr>
								<tr>
									<td>매출액</td>
									<td>5</td>
									<td>9</td>
									<td>7</td>
									<td>12</td>
									<td>20</td>
									<td>36</td>
									<td>28</td>
									<td>5</td>
									<td>9</td>
									<td>7</td>
									<td>12</td>
									<td>20</td>
								</tr>
							</table>
						</div>

						<div class="row col-12 mr-5 justify-content-end">
							<button class="border px-3 py-2 bg-danger text-white">PDF
								다운</button>
							<button class="border ml-1 mr-5 px-3 py-2 bg-success text-white">EXCEL
								다운</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script type="text/javascript">
		const ctx = document.getElementById('myChart').getContext('2d');
		const myChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ 2016, 2017, 2018, 2019, 2020, 2021, 2022 ],
				datasets : [
						{
							label : '판매량',
							data : [ Math.random() * 15, Math.random() * 15,
									Math.random() * 15, Math.random() * 15,
									Math.random() * 15, Math.random() * 15,
									Math.random() * 15, ],
							backgroundColor : 'gray'
						},
						{
							label : '매출액',
							data : [ Math.random() * 15, Math.random() * 15,
									Math.random() * 15, Math.random() * 15,
									Math.random() * 15, Math.random() * 15,
									Math.random() * 15, ]
						} ]
			},
			options : {
				scales : {
					y : {
						beginAtZero : true
					}
				}
			}
		});
		//mouseover 이벤트 : 사이드바 css변경
		$('#cctgr  .list-group-item:not(.mylist)').on('mouseover', function() {
			$(this).css('background-color', '#e53637');
			$(this).find('.list-link').css('color', '#ffffff');
			$(this).find('p').css('color', '#ffffff');
		})

		//mouseover 이벤트 : 사이드바 css변경
		$('#cctgr  .list-group-item:not(.mylist)').on('mouseout', function() {
			$(this).css('background-color', '#ffffff');
			$(this).find('.list-link').css('color', '#000000');
			$(this).find('p').css('color', '#000000');
			$(this).find('.list-link.active').css('color', '#e53637');
		})
	</script>
</body>
</html>