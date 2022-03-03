<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <style>
        table tr, table td{
            text-align: center;
            vertical-align: middle;
        }
        .admin_search td,.admin_search th{
            text-align: center;
            vertical-align: middle;
            padding: 5px;
        }
        .admin_search th{
            background-color: #eeeeee;
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
                        <h4 class="page-title">회원 관리</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">회원관리 (상세)</li>
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
                                <!-- 프로필 사진도 보여야하나..? -->
                                    <table class="table table-bordered mb-5">
                                        <tr style="background-color: #eeeeee;">
                                        	<th>상태</th>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>생년월일</th>
                                            <th>전화번호</th>
                                            <th>성별</th>
                                            <th>가입날짜</th>
                                        </tr>
                                        <tr>
                                        	<td>비활성</td>
                                            <td>user123@naver.com</td>
                                            <td>정혜윤</td>
                                            <td>생일</td>
                                            <td>000-0000-000</td>
                                            <td>여자</td>
                                            <td>22/02/02</td>
                                        </tr>
                                        <tr style="background-color: #eeeeee;">
                                        	<th>우편번호</th>
                                            <th colspan="3">주소(상세주소)</th>
                                            <th>크리에이터</th>
                                            <th>등급</th>
                                            <th>적립금</th>
                                        </tr>
                                        <tr>
                                        	<td>비활성</td>
                                            <td colspan="3">user123@naver.com</td>
                                            <td>-</td>
                                            <!--크리에이터이기도 하면 관리자 크리에이터 상세페이지로 연결-->
                                            <td>나무</td>
                                            <td>5,000</td>
                                        </tr>
                                    </table>
                                    <h5><i class="fas fa-hashtag mr-1"></i>수강내역</h5>
                                    <table class="table table-bordered mb-5">
                                        <tr style="background-color: #eeeeee;">
                                            <th>수강번호</th>
                                            <th>강의명</th>
                                            <th>크리에이터</th>
                                            <th>수강시작일</th>
                                            <th>수강만료일</th>
                                            <th>금액</th>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>강아지도 할 수 있는 뜨개질</td>
                                            <td>시바</td>
                                            <td>2022/02/02</td>
                                            <td>2022/05/02</td>
                                            <td>60,000</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>디스크 터지는 홈 트레이닝</td>
                                            <td>인간MRI</td>
                                            <td>2022/02/02</td>
                                            <td>2022/05/02</td>
                                            <td>100,000</td>
                                        </tr>
                                    </table>
                                    <h5><i class="fas fa-hashtag mr-1"></i>환불내역</h5>
                                    <table class="table table-bordered mb-5">
                                        <tr style="background-color: #eeeeee;">
                                            <th>수강번호</th>
                                            <th>강의명</th>
                                            <th>크리에이터</th>
                                            <th>환불사유</th>
                                            <th>금액</th>
                                            <th>환불날짜</th>
                                            <th>환불상태</th>
                                        </tr>
                                        <tr>
                                            <td>7</td>
                                            <td>단타 너도 할 수 있다!</td>
                                            <td>영차영차</td>
                                            <td>단타해서 다 잃음</td>
                                            <td>50,000</td>
                                            <td>2022/02/02</td>
                                            <td>상태?</td>
                                        </tr>
                                    </table>
                                    <h5><i class="fas fa-hashtag mr-1"></i>배송내역</h5>
                                    <table class="table table-bordered">
                                        <tr style="background-color: #eeeeee;">
                                            <th>수강번호</th>
                                            <th>강의명</th>
                                            <th>키트명</th>
                                            <th>금액</th>
                                            <th>운송장번호</th>
                                            <th>배송상태</th>
                                        </tr>
                                        <tr>
                                            <td>7</td>
                                            <td>쉽게 배우는 수채화</td>
                                            <td>초보자용 물감 세트</td>
                                            <td>20,000</td>
                                            <td>50121752974</td>
                                            <td>배송중</td>
                                        </tr>
                                    </table>
                                    <a href="javscript:history.back()" class="btn btn-secondary">뒤로가기</a>
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