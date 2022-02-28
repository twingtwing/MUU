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
                                                <input class="w-100" type="text" spellcheck="false">
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
                                                    <h6 class="mb-0 ml-2" style="font-weight: 500;">0000-00-00</h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row form-group mt-3">
                                    <textarea class="form-control"  rows="25"></textarea>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="row p-2" style="background-color: #eeeeee; border-bottom: 2px solid black; border-top: 2px solid black;">
                                            <input type="file" name="" id="" spellcheck="false">
                                        </div>
                                    </div>
                                </div>
                                <div class="row d-flex justify-content-between mt-2">
                                    <div>
                                        <button type="submit" class="btn btn-secondary" onclick="history.go(-1);">뒤로가기</button>
                                    </div>
                                    <div>
                                        <button type="submit" class="btn btn-secondary" onclick="location.href='./공지사항 관리자 페이지.html'">공지사항 등록</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 내용 끝 -->

                <!-- 바디 끝 -->
</body>
</html>