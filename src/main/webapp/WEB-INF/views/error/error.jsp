<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>Error</title>
<link href="/resources/dist/css/style.min.css" rel="stylesheet">
</head>
<body>
    <div class="main-wrapper">
        <div class="preloader">
            <div class="lds-ripple">
                <div class="lds-pos"></div>
                <div class="lds-pos"></div>
            </div>
        </div>
        <div class="error-box">
            <div class="error-body text-center">
                <h1 class="error-title text-danger" style="text-shadow : none;">${num}</h1>
                <h3 class="text-uppercase error-subtitle">${msg}</h3> <!--msg-->
                <p class="text-muted m-t-30">관리자 에게 문의하세요</p>
                <p class="text-muted m-b-30">문의 이메일 : admin123@naver.com</p>
                <a href="javascript:history.back()" class="btn btn-danger btn-rounded waves-effect waves-light m-b-40">Back</a> </div>
        </div>
    </div>
    <script src="/resources/js/jquery-3.3.1.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="/resources/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script>
    $('[data-toggle="tooltip"]').tooltip();
    $(".preloader").fadeOut();
    </script>
</body>
</html>