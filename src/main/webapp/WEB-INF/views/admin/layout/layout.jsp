<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MUU 관리자 페이지</title>
<!-- Favicon icon -->
<<<<<<< HEAD
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/assets/images/favicon.png">
<!-- Custom CSS -->
<link href="/resources/assets/libs/flot/css/float-chart.css"
	rel="stylesheet">
=======
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/assets/images/favicon.png">
    
>>>>>>> 1922133eb878c2588ff9db09d85fdcaf4b42f3f5
<!-- Custom CSS -->
<link href="/resources/dist/css/style.min.css" rel="stylesheet">
<script src="/resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>
<<<<<<< HEAD
	<tiles:insertAttribute name="top" />
	<tiles:insertAttribute name="side" />
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="bottom" />
=======
<div id="mai-wrapper">
<tiles:insertAttribute name="top"/>
<tiles:insertAttribute name="side"/>
<div class="page-wrapper">
<tiles:insertAttribute name="body"/>
<tiles:insertAttribute name="bottom"/>
</div>
</div>

>>>>>>> 1922133eb878c2588ff9db09d85fdcaf4b42f3f5

	<!-- Bootstrap tether Core JavaScript -->
	<script src="/resources/assets/libs/popper.js/dist/umd/popper.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script
		src="/resources/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script src="/resources/assets/extra-libs/sparkline/sparkline.js"></script>
	<!--Wave Effects -->
	<script src="/resources/dist/js/waves.js"></script>
	<!--Menu sidebar -->
	<script src="/resources/dist/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script src="/resources/dist/js/custom.min.js"></script>
	<!--This page JavaScript -->
	<!-- <script src="dist/js/pages/dashboards/dashboard1.js"></script> -->
	<!-- Charts js Files -->
	<script src="/resources/assets/libs/flot/excanvas.js"></script>
	<script src="/resources/assets/libs/flot/jquery.flot.js"></script>
	<script src="/resources/assets/libs/flot/jquery.flot.pie.js"></script>
	<script src="/resources/assets/libs/flot/jquery.flot.time.js"></script>
	<script src="/resources/assets/libs/flot/jquery.flot.stack.js"></script>
	<script src="/resources/assets/libs/flot/jquery.flot.crosshair.js"></script>
	<script
		src="/resources/assets/libs/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
	<script src="/resources/dist/js/pages/chart/chart-page-init.js"></script>
</body>
</html>