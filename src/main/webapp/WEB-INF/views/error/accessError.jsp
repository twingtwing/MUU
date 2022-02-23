<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 style="background-color: pink">${msg }</h1>
<h2>넌 권한이 없어! 꺼져!</h2>
<h2>3초 후 메인 페이지로 이동합니다.</h2>
<script type="text/javascript">
const back = () => location.href='/home';
setTimeout(back,3000)
</script>
</body>
</html>