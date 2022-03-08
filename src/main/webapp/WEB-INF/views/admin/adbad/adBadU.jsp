<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
        a:hover{
            cursor: pointer;
            text-decoration: underline;
        }
    </style>
</head>
<body>
   <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <!-- 페이지명 작성 및 카테고리 작성 -->
                        <h4 class="page-title">공지사항</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/admin/home">Home</a></li>
                                    <li class="breadcrumb-item"><a href="#">공지사항</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">공지사항수정</li>
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
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="row">
                                            <h4><i class="fa fa-hashtag"></i>&nbsp;공지사항 수정</h4>
                                        </div>
                                        <div class="row p-2" style="background-color: #eeeeee; border-bottom: 1px solid black; border-top: 2px solid black;">
                                            <div class="col-1 px-0 d-flex justify-content-center align-items-center">
                                                <h5 class="mb-0">제목</h5>
                                            </div>
                                            <div class="col-11 px-0">
                                                <input class="w-100" type="text" value="${board.ttl}" spellcheck="false" id="ttli" name="ttli">
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
                                                    <h6 class="mb-0 ml-2" style="font-weight: 500;">${board.wrDate }</h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row form-group mt-3">
                                    <textarea class="form-control"  rows="25" id="cont" name="cont">${board.content}</textarea>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="row p-2 position-relative" style="background-color: #eeeeee; border-bottom: 2px solid black; border-top: 2px solid black;">
                                            <input type="file" id="multiFile" name="multiFile" multiple="multiple" onchange="fileChange()">
                                        	<c:if test="${ not empty board.detaFileList}">
	                                        	<div id="fileDiv" class="row align-items-center position-absolute" style="background-color: #eeeeee; left: 99px; top: 12px; padding-right: 100px;">
		                                        	<c:forEach items="${board.detaFileList }" var="file">
			                                        	<p class="mb-0">${file.filePath}</p>
		                                        	</c:forEach>
	                                        	</div>
                                        	</c:if>
                                        </div>
                                    </div>
                                </div>
                                <div class="row justify-content-between mt-2">
                                    <div>
                                        <button type="button" class="btn btn-secondary" onclick="history.go(-1);">뒤로가기</button>
                                    </div>
                                    <div>
                                        <button type="button" id="boardBtn" class="btn btn-secondary" onclick="btn()" disabled>공지사항 수정</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
                <!-- 내용 끝 -->

                <!-- 바디 끝 -->
             <script type="text/javascript">

             	$('#ttli').keyup(function(){
                	console.log("4번 테스트")
               	 	btnDisabled()
                })
                
                $('#cont').keyup(function(){
                	console.log("9번 테스트")
               	 	btnDisabled()
                })
                
                function fileChange(){
                	if($('#multiFile')[0].files.length !=0){
                		$('#fileDiv').addClass('d-none');
                	}
                }
                
                function btnDisabled() {
               	 var ttli = document.getElementById('ttli').value;
               	 var cont = document.getElementById('cont').value;
               	 if(ttli == "" || cont == "") {
               		 $('#boardBtn').attr('disabled','disabled');
               	 } else if(ttli != "" && cont != "") {
               		 $('#boardBtn').removeAttr('disabled');
               	 }
                }
                
                
                function btn() {
                	event.preventDefault();
                    
                	let fileNo = '${board.fileNo}';
                	let bNo = '${board.getBNo()}';
                    let form  = new FormData();
                    form.append('bNo',bNo);
	            	form.append("ttl",document.getElementById('ttli').value);
	            	form.append("content",document.getElementById('cont').value);
	            	if(fileNo!=''){
	            		form.append('fileNo',fileNo);
	            	}
	            	
	            	for(obj of $('#multiFile')[0].files){
	            		form.append("files",obj);
	            	}
	            	 
	            	 $.ajax({
	            		url:'/admin/upadbad',
	                   	type:'post',
	                   	processData : false,
	                    contentType : false,
	                    async : false,
	                    beforeSend: function(xhr) {
	                         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	                    },
	                    data : form,
	                 })
	                 .done((result)=>{
	                	 console.log(result)
	               		 if(result == 1){
	               			 alert("글이 성공적으로 수정되었습니다.")
	               		  	location.href = "/admin/adBadS?bNo="+ bNo;
	               		 }else{
	               			 alert("수정도중에 에러 발생하여중단합니다.");
	               		 }
	                 });
                }
                
             </script>
                
</body>
</html>