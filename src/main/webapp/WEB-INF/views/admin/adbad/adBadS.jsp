<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item"><a href="#">공지사항</a></li>
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
                                            <h5 class="mb-0 ml-2" style="font-weight: 500;">공지사항</h5>
                                        </div>
                                        <div class="row justify-content-between p-2" style="background-color: #eeeeee; border-bottom: 2px solid black;">
                                            <div class="row">
                                                <h6 class="mb-0 ml-2 pl-1">번호</h6>
                                                <h6 class="mb-0 ml-2" style="font-weight: 500;">000</h6>
                                            </div>
                                            <div class="row">
                                                <div class="row mr-1">
                                                    <h6 class="mb-0">작성일자</h6>
                                                    <h6 class="mb-0 ml-2" style="font-weight: 500;">0000-00-00</h6>
                                                </div>
                                                <div class="row mx-2">
                                                    <h6 class="mb-0">조회수</h6>
                                                    <h6 class="mb-0 ml-2" style="font-weight: 500;">000</h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="card">
                                        <div class="card-body" style="height: 50vh;">
                                            카드안에 카드바디가 존재하는거임
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-lg-12">
                                        <div class="row p-2 w-100" style="background-color: #eeeeee; border-bottom: 1px solid black; border-top: 1px solid black;">
                                            <h6 class="mb-0"><i class="fa fa-download"></i></h6>
                                            <h6 class="mb-0 ml-2" style="font-weight: 500;"><a href="" class="text-dark">첨부파일데스</a></h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="row d-flex justify-content-between">
                                    <div>
                                        <button type="button" class="btn btn-secondary" onclick="history.go(-1);">뒤로가기</button>
                                    </div>
                                    <div class="mr-4">
                                        <button type="button" class="btn btn-secondary" onclick="location.href='./공지사항 수정 페이지.html'";>수정</button>
                                        <button type="button" class="btn btn-secondary" onclick="javascript:btn();">삭제</button>
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
            var returnValue = confirm('삭제하시겠습니까?');
                if(returnValue = true){
                    location.href = "공지사항 관리자 페이지.html"
                }
        }
        </script>

</html>