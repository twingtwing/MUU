<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Make U up</title>
<!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

<!-- Css Styles -->
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">

<!-- Vue.js cdn -->
	<script src="https://unpkg.com/vue@next"></script>
</head>
<body>

<tiles:insertAttribute name="top"/>
<div style="background-color: white">
<tiles:insertAttribute name="body"/>
</div>
<tiles:insertAttribute name="bottom"/>


<!-- Js Plugins -->

<script src="/resources/js/jquery.nice-select.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/player.js"></script>
<script src="/resources/js/mixitup.min.js"></script>
<script src="/resources/js/jquery.slicknav.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/main.js"></script>
<script type="text/javascript">
//mouseover 이벤트 : 사이드바 css변경
$('#cctgy > .list-group-item:not(.mylist)').on('mouseover',function(){
  $(this).css('background-color','#e53637');
  $(this).find('.list-link').css('color','#ffffff');
})

//mouseover 이벤트 : 사이드바 css변경
$('#cctgy > .list-group-item:not(.mylist)').on('mouseout',function(){
  $(this).css('background-color','#ffffff');
  $(this).find('.list-link').css('color','#000000');
  $(this).find('.list-link.active').css('color','#e53637');
})
</script>
</body>
</html>