<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/8d99e6c8fb.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
</head>
<body>
<div class="d-flex justify-content-center align-items-center flex-column mt-5">
  <i class="fa fa-exclamation-triangle text-danger mt-5" style="font-size:10rem;" aria-hidden="true"></i>
  <h3 class="font-weight-bold text-danger p-2 rounded">${msg }</h3>
  <span class="font-weight-bold">3초 후 메인페이지로 이동합니다...</span>
</div>
<script type="text/javascript">
const back = () => location.href='/home';
setTimeout(back,3000)
</script>
</body>
</html>