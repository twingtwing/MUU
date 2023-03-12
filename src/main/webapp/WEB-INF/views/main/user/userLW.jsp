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
<body class="bg-black">
<div id="box" class="d-flex bg-black p-5" style="background-color: black; margin: 4rem 0;">
    <div style="width: 70vw; height:60vh; ">
      <video controls width="100%" controlsList="nodownload" id="player">
        <source src="${firstLesson.lsnFile}" type="video/mp4" id="vd">
      </video>    
      <h2 style="font-weight: bold; color:white; margin: 1rem;" id="title" data-serialno="${firstLesson.serialNo }">${firstLesson.ttl}</h2>
      <div>
        <div style="text-align: right;" id="regdate">${firstLesson.regDate}</div>    
      </div>
      </div>
    <div style="margin-left: 5rem;">
      <h4 class="text-white mb-4">커리큘럼</h4>
      <ol id="curr">
      <c:forEach items="${lessons}" var="lesson">
        <li class="${lesson.serialNo}">${lesson.ttl}</li>
      </c:forEach>
      </ol>
    </div>
</div>
<script type="text/javascript">
const changeVideo = (ttl, regDate, filepath,no)=>{
	console.log(ttl,regDate,filepath)
	$('#title').text(ttl);
	$('#title').data('serialno',no);
	$('#regdate').text(regDate);
	$('#vd').attr('src',filepath);
	$('video')[0].load();
	console.log($('#title').data('serialno'))
}

$('#curr>li').click((e)=>{
	let no = e.currentTarget.className;
	let data = {serialNo : no};
	$.ajax({
		url : '/user/userLWselect',
		data : data,
		contentType : 'application/json; charset=utf-8',
	})
	.done((e)=>{
		changeVideo(e.ttl,new Date(e.regDate).toISOString().slice(0,10),e.lsnFile,e.serialNo)
	})
})

// 시청시간 기록
let record;
document.querySelector('#player').addEventListener('timeupdate',(e)=>{
	let duration = document.querySelector('#player').duration;
	let currTime = document.querySelector('#player').currentTime;
	record = currTime/duration;
})

const recordUpdate = ()=>{
	$.ajax({
		url : '/user/progressUpdate',
		type : 'post',
		beforeSend : (xhr) =>{
		  xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		data : {id:'',serialNo : $('#title').data('serialno'), progPct : Math.floor(record*100)}
	})
	.done((e)=>{
		console.log(e)
	})
}
setInterval(recordUpdate,3000);
</script>
</body>
</html>