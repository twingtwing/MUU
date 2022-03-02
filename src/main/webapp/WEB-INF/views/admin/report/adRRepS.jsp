<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                                                <h6 class="mb-0 ml-2 pl-1">신고</h6>

                                                <h6 class="mb-0 ml-2 pl-1">카테고리</h6>
                                                <h6 class="mb-0 ml-2" style="font-weight: 500;">凸</h6>
                                            </div>
                                            <div class="row">

                                                <div class="row mx-2">
                                                    <div class="row">
                                                        <h6 class="mb-0 ml-2 pl-1">신고자</h6>
                                                        <h6 class="mb-0 ml-2" style="font-weight: 500;">익명으</h6>
                                                        <div class="row mx-2">

                                                            <h6 class="mb-0 ml-2 pl-1">상태</h6>
                                                            <h6 class="mb-0 ml-2" style="font-weight: 500;">미해결</h6>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row justify-content-between p-2"
                                            style="background-color: #eeeeee; border-bottom: 2px solid black;">
                                            <div class="row">
                                                <h6 class="mb-0 ml-2 pl-1">신고번호</h6>
                                                <h6 class="mb-0 ml-2" style="font-weight: 500;">000</h6>
                                            </div>
                                            <div class="row">

                                                <div class="row mx-2">
                                                    <h6 class="mb-0">신고일자</h6>
                                                    <h6 class="mb-0 ml-2" style="font-weight: 500;">0000-00-00</h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="card">
                                        <div class="card-body" style="height: 25vh;">
                                            신고당한사유
                                        </div>
                                    </div>
                                </div>

                                <!-- 여기서부터 작성 -->
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="row justify-content-between p-2"
                                            style="background-color: #eeeeee; border-bottom: 2px solid black; border-top: 2px solid black;">
                                            <div class="row">
                                                <h6 class="mb-0 ml-2 pl-1">신고대상리뷰</h6>


                                            </div>
                                            <div class="row">
                                                <h6 class="mb-0 ml-2 pl-1">리뷰번호</h6>
                                                <h6 class="mb-0 ml-2" style="font-weight: 500;">1111</h6>
                                                <div class="row mx-2">

                                                    <h6 class="mb-0 ml-2 pl-1">신고 대상자</h6>
                                                    <h6 class="mb-0 ml-2" style="font-weight: 500;">익명의</h6>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="card">
                                        <div class="card-body" style="height: 25vh;">
                                            ㅋㅋㅋㅋㅋ
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