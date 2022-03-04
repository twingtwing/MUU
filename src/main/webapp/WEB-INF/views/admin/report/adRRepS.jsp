<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <style>
        a:hover {
            cursor: pointer;
            text-decoration: underline;
        }
    </style>
</head>
<body>
            <!-- 바디 시작 -->

            <!-- 페이지명-->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <!-- 페이지명 작성 및 카테고리 작성 -->
                        <h4 class="page-title">리뷰신고</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item"><a href="#">리뷰신고</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">리뷰신고상세페이지</li>
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
                                        <div class="row justify-content-between p-2"
                                            style="background-color: #eeeeee; border-bottom: 1px solid black; border-top:2px solid black;">
                                            <div class="row">
                                                <h6 class="mb-0 ml-2 pl-1">신고 대상</h6>
                                            </div>
                                            <div class="row">
                                                <div class="row mx-2">
                                                    <div class="row">
                                                        <div class="row mx-2">
	                                                        <h6 class="mb-0 ml-2 pl-1">신고 대상자</h6>
	                                                        <h6 class="mb-0 ml-2" style="font-weight: 500;">${report.creid }</h6>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row justify-content-between p-2"
                                            style="background-color: #eeeeee; border-bottom: 2px solid black;">
                                            <div class="row">
                                                <h6 class="mb-0 ml-2 pl-1">리뷰번호</h6>
                                                <h6 class="mb-0 ml-2" style="font-weight: 500;">${report.num }</h6>
                                            </div>
                                            <div class="row">
                                                <div class="row mx-2">
                                                    <h6 class="mb-0">강의 이름</h6>
                                                    <h6 class="mb-0 ml-2" style="font-weight: 500;">${report.ttl }</h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="card w-100">
                                        <div class="card-body" style="height: 25vh;">
                                            ${report.content }
                                        </div>
                                         <div class="card-footer row justify-content-end" style="background-color: white;">
	                                         <div>
	                                            별점 ${report.star }
	                                         </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- 여기서부터 작성 -->
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="row justify-content-between p-2"
                                            style="background-color: #eeeeee; border-bottom: 1px solid black; border-top: 2px solid black;">
                                            <div class="row">
                                                <h6 class="mb-0 ml-2 pl-1">신고</h6>
                                                <h6 class="mb-0 ml-2 pl-1">신고유형</h6>
                                                <h6 class="mb-0 ml-2" style="font-weight: 500;">
                                                <c:if test="${report.type eq 'RPT01' }">
                                                부적절한 컨텐츠
                                                </c:if>
                                                <c:if test="${report.type eq 'RPT02' }">
                                                피싱또는 스팸
                                                </c:if>
                                                <c:if test="${report.type eq 'RPT03' }">
                                                기타
                                                </c:if>
                                                </h6>
                                            </div>
                                            <div class="row">
                                                <div class="row mx-2">
                                                    <h6 class="mb-0 ml-2 pl-1">신고자</h6>
                                                    <h6 class="mb-0 ml-2" style="font-weight: 500;">${report.reporter }</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row justify-content-between p-2"
                                            style="background-color: #eeeeee; border-bottom: 2px solid black;">
                                            <div class="row">
                                                <h6 class="mb-0 ml-2 pl-1">신고번호</h6>
                                                <h6 class="mb-0 ml-2" style="font-weight: 500;">${report.rpNo }</h6>
                                            </div>
                                            <div class="row">
                                                <div class="row mx-2">
                                                    <h6 class="mb-0">신고 일자</h6>
                                                    <h6 class="mb-0 ml-2" style="font-weight: 500;">${report.rpdate }</h6>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="card w-100">
                                        <div class="card-body" style="height: 25vh;">
                                            ㅋㅋㅋㅋㅋ
                                        </div>
                                        <div class="card-footer row justify-content-end" style="background-color: white;">
	                                         <div>
	                                            처리 상태 : <span class="text-danger font-weight-bold">
	                                            <c:if test = "${report.rpStCode eq 'RPS01' }">
	                                            	대기중
	                                            </c:if>
	                                            <c:if test="${report.rpStCode eq 'RPS02' }">
	                                            	 신고 처리함
	                                            </c:if>
	                                            <c:if test="${report.rpStCode eq 'RPS03' }">
	                                            	 신고 반려
	                                            </c:if>
	                                            </span>
	                                         </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-lg-12 border-bottom">

                                    </div>
                                </div>
                                <div class="row d-flex justify-content-between">
                                    <div>
                                        <button type="button" class="btn btn-secondary"
                                            onclick="history.back();">뒤로가기</button>
                                    </div>
                                    <div class="mr-4">
                                        <button type="button" class="btn btn-secondary">반려</button>
                                        <button type="button" class="btn btn-secondary"
                                            onclick="javascript:btn();">삭제</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 내용 끝 -->
            <!-- 바디 끝 -->
	<script>
		function btn() {
			if (returnValue = true) {
				location.href = "리뷰신고.html"
			}
		}
	</script>
</body>
</html>