<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
      background-color: black;
      color: white;
    }

    video {
      cursor: pointer;
    }
    ol>li{
      list-style-type: decimal-leading-zero;
      cursor: pointer;
      margin: 0.5rem;
      padding: 0.5rem;
    }
    ol>li:hover{
      background-color: rgb(121, 121, 121);
      border-radius: 10px;
      font-weight: bold;
      transition: all 0.3s;
    }
    @media (max-width:1080px) {
      #box {
        flex-direction: column;
        align-items: center;
        margin: 0px;
      }
      video{
        width: 100%;
        margin: 0px;
      }
    }
  </style>
</head>
<body class="bg-black;">
<div id="box" class="d-flex bg-black p-5" style="background-color: black;">
    <div style="width: 70vw;">
      <video controls width="100%" controlsList="nodownload">
        <source src="${firstLesson.lsnFile}" type="video/mp4" data-poster="" id="vd">
      </video>    
      <h2 style="font-weight: bold; color:white;" id="title">${firstLesson.ttl}</h2>
      <div>
        <div style="text-align: right;" id="regdate">${firstLesson.regDate}</div>    
      </div>
      </div>
    <div style="margin-left: 5rem;">
      <h4 class="text-white mb-4">커리큘럼</h4>
      <ol id="curr">
      <c:forEach items="${lessons}" var="lesson">
      <!--  for each 돌리되 .. ajax 사용해서 영상 src, 제목, 내용, 날짜만 바꿔주면 될듯함 -->
        <li class="${lesson.lsnNo}">${lesson.ttl}</li>
      </c:forEach>
      </ol>
    </div>
</div>
<script type="text/javascript">
const changeVideo = (ttl, regDate, filepath)=>{
	console.log(ttl,regDate,filepath)
	$('#title').text(ttl);
	$('#regdate').text(regDate);
	$('#vd').attr('src',filepath);
	$('video')[0].load();
}

$('#curr>li').click((e)=>{
	let no = e.currentTarget.className;
	let data = {lsnNo : no};
	$.ajax({
		url : '/user/userLWselect',
		data : data,
		contentType : 'application/json; charset=utf-8',
	})
	.done((e)=>{
		changeVideo(e.ttl,new Date(e.regDate).toISOString().slice(0,10),e.lsnFile)
	})
})

// 시청시간 기록
</script>
</body>
</html>