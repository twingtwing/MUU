<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
        a:hover {
            cursor: pointer;
            text-decoration: underline;
        }
    </style>
</head>
<body>
  <!-- 페이지명-->
    <%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <!-- 페이지명 작성 및 카테고리 작성 -->
                        <h4 class="page-title">공지사항</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/admin/home">Home</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/adBadLi">공지사항</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">공지사항작성</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 페이지명 끝-->

            <!-- 내용 시작 -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <!-- 여기서부터 작성 -->
                                <form action="/admin/insertBoard" method="post" id="boardFrm">
	                                <div class="row">
	                                    <div class="col-lg-12">
	                                        <div class="row">
	                                            <h4><i class="fa fa-hashtag"></i>&nbsp;공지사항 작성</h4>
	                                        </div>
	                                        <div class="row p-2" style="background-color: #eeeeee; border-bottom: 1px solid black; border-top: 2px solid black;">
	                                            <div class="col-1 px-0 d-flex justify-content-center align-items-center">
	                                                <h5 class="mb-0">제목</h5>
	                                            </div>
	                                            <div class="col-11 px-0">
	                                                <input class="w-100 insert_vali" type="text" spellcheck="false" name="ttl" id="ttli" required>
	                                            </div>
	                                        </div>
	                                        <div class="row justify-content-between p-2" style="background-color: #eeeeee; border-bottom: 2px solid black;">
	                                            <div class="row ml-1">
	                                                <h6 class="mb-0 ml-2 pl-1">작성자</h6>
	                                                <h6 class="mb-0 ml-2" style="font-weight: 500;">관리자</h6>
	                                            </div>
	                                            <div class="row mr-2">
	                                                <div class="row mr-1">
	                                                    <h6 class="mb-0">작성일자</h6>
			                                        <h6 class="mb-0 ml-2" style="font-weight: 500;" ><%= sf.format(nowTime) %></h6>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                               
	                                <div class="row form-group mt-3">
	                                    <textarea class="form-control insert_vali" name="content" rows="25" id="cont"></textarea>
	                                </div>
	                                <div class="row">
	                                    <div class="col-lg-12">
	                                        <div class="row p-2" style="background-color: #eeeeee; border-bottom: 2px solid black; border-top: 2px solid black;">
	                                            <input type="file" id="multiFile" name="multiFile" multiple="multiple">
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="row d-flex justify-content-between mt-2">
	                                    <div>
	                                        <button type="button" class="btn btn-secondary" onclick="history.go(-1);">뒤로가기</button>
	                                    </div>
	                                    <div>
	                                        <button type="button" id="boardBtn"  onclick="lineMaker()" class="btn btn-secondary" disabled >공지사항 등록</button>
	                                    </div>
	                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 내용 끝 -->

            </div>
                <!-- 바디 끝 -->
                
          <!-- boardBtn  insert_vali -> chanbe : val() 없으면 console.log 없다  -->
          <script type="text/javascript">
        
        	 const lineMaker = ()=>{
        		   let intro = $('#cont').val();
        		   intro = intro.replace(/\r\n/ig,'<br>');
        		   intro = intro.replace(/\\n/ig,'<br>');
        		   intro = intro.replace(/\n/ig,'<br>');
        		   $('#cont').val(intro);
        		}
          
         
         $('#ttli').keyup(function(){
        	 btnDisabled()
         })
         
         $('#cont').keyup(function(){
        	 btnDisabled()
         })
         
         function btnDisabled() {
        	 var ttli = document.getElementById('ttli').value;
        	 var cont = document.getElementById('cont').value;
        	 if(ttli == "" || cont == "") {
        		 $('#boardBtn').attr('disabled','disabled');
        	 } else if(ttli != "" && cont != "") {
        		 $('#boardBtn').removeAttr('disabled');
        	 }
         }
         
         $('#boardBtn').on('click',function(){
        	 event.preventDefault();
        	 
        	 let form  = new FormData();
        	 form.append("ttl",document.getElementById('ttli').value);
        	 form.append("content",document.getElementById('cont').value);
        	 
        	 for(obj of $('#multiFile')[0].files){
        		 form.append("files",obj);
        	 }
        	 
        	 $.ajax({
                url : "/admin/insertBoard",
               	method : "post",
               	processData : false,
                contentType : false,
                async : false,
                beforeSend: function(xhr) {
                     xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                data : form,
             })
             .done((res)=>{
            	alert("글이 성공적으로 등록되었습니다.");
	        	location.href="/admin/adBadS?bNo="+res.bno;
             });
        	 
        	 
         })
          </script>
                
</body>

</html>