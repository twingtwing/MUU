<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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


	 <!-- 페이지명-->
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
                                    <li class="breadcrumb-item active" aria-current="page">공지사항상세페이지</li>
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
                                
                                        <div class="row p-2" style="background-color: #eeeeee; border-bottom: 1px solid black; border-top: 2px solid black;">
                                            <h5 class="mb-0">제목</h5>
                                            <h5 class="mb-0 ml-2" style="font-weight: 500;">${board.ttl }</h5>
                                        </div>
                                        <div class="row justify-content-between p-2" style="background-color: #eeeeee; border-bottom: 2px solid black;">
                                            <div class="row">
                                                <h6 class="mb-0 ml-2 pl-1">번호</h6>
                                                <h6 class="mb-0 ml-2" style="font-weight: 500;"id="bNo">${board.getBNo() }</h6>
                                            </div>
                                            <div class="row">
                                                <div class="row mr-1">
                                                    <h6 class="mb-0">작성일자</h6>
                                                    <h6 class="mb-0 mr-3 ml-1" style="font-weight: 500;">${board.wrDate }</h6>
                                                </div>
                                                <div class="row mx-2">
                                                    <h6 class="mb-0">조회수</h6>
                                                    <h6 class="mb-0 ml-2" style="font-weight: 500;">${board.hits }</h6>
                                                </div>
                                            </div>
                                        </div>
                                       
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="card">
                                        <div class="card-body" style="height: 50vh;">
                                           ${board.content }
                                        </div>
                                    </div>
                                </div>
	                                <div class="row mb-2">
	                                    <div class="col-lg-12">
	                                        <div class="row p-2 w-100" style="background-color: #eeeeee; border-bottom: 1px solid black; border-top: 1px solid black;">
                                				　
                                				<c:if test="${not empty board.detaFileList }">
		                                            <h6 class="mb-0"><i class="fa fa-download mx-1"></i></h6>
		                                            <c:forEach items="${board.detaFileList }" var="file">
		                                            	<h6 class="mb-0 ml-2" style="font-weight: 500;">
		                                            		<a href="/download?phyPath=${file.phyPath}" class="text-dark">${file.filePath}</a>
		                                            	</h6>
		                                            </c:forEach>
                                				</c:if>
	                                        </div>
	                                    </div>
	                                </div>
                                <div class="row d-flex justify-content-between">
                                    <div>
                                        <button type="button" class="btn btn-secondary" onclick="history.go(-1);">뒤로가기</button>
                                    </div>
                                    <div class="mr-4">
                                        <button type="button" class="btn btn-secondary" onclick ="location.href='/admin/adBadU?bNo=${board.getBNo() }'" >수정</button>
                                        <button type="button" class="btn btn-secondary" id="delete_btn" onclick="btn()">삭제</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
             </div>
                <!-- 내용 끝 -->

                <!-- 바디 끝 -->
</body>


 <script>
 function btn(){
	 	if(confirm("삭제하시겠습니까?.")){
			var bNo = document.getElementById('bNo').innerHTML;
        	 $.ajax ({
            	 url:'/admin/deladbad',
            	 type:'post',
            	 data:{bNo:bNo,fileNo : '${board.fileNo}'},
            	 beforeSend: function(xhr) {
         			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
         		},
            	 success:function(result){
            		 console.log(result)
            		 if(result == 1){
            			 alert("성공적으로 삭제하였습니다.")
            		  location.href = "/admin/adBadLi";
            			 
            		 }else{
            			 alert("삭제도중에 에러 발생하여중단합니다.")
            		 }
            	 }
             })
        
 		}   
	 }
          
        </script>

</html>