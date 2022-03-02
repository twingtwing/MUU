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
        #firstJdate, #lastJdate{
            
            width:200px;
        }
    </style>
</head>
<body>
            <!-- 페이지명-->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <!-- 페이지명 작성 및 카테고리 작성 -->
                        <h4 class="page-title">크리에이터 관리</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">크리에이터 관리</li>
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
                                <!-- 프로필 사진? -->
                                <!-- 크리에이터 정보 -->
								<div class="row">
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
                                            <th colspan="5">크리에이터 소개</th>
                                            <th>유저 정보</th>
                                            <th>등급</th>
                                        </tr>
                                        <tr>
                                            <td colspan="5">user123@naver.com</td>
                                            <td>-</td>
                                            <!--유저 정보 상세페이지로 연결-->
                                            <td>VVIP</td>
                                        </tr>
                                    </table>
 
								</div>                                
                                <!--크리에이터 강의정보내역-->
                                <div class="row">
                                    <h5><i class="fas fa-hashtag mr-1"></i>강의리스트</h5>
                                    <table class="table table-bordered">
                                        <tr style="background-color: #eeeeee;">
                                            <th>번호</th>
                                            <th>강의이름</th>
                                            <th>크리에이터</th>
                                            <th>시작날짜</th>
                                            <th>종료날짜</th>
                                            <th>금액</th>
                                            <th>수강자수</th>
                                        </tr>
                                        <!--크리에이터 강의정보 가져오기-->
                                        <tr>
                                            <td>dfdsf</td>
                                            <td>dfdsf</td>
                                            <td>dfdsf</td>
                                            <td>dfdsf</td>
                                            <td>dfdsf</td>
                                            <td>dfdsf</td>
                                            <td>dfdsf</td>
                                        </tr>
                                    </table>
                                </div>

                                <!--크리에이터 총 매출 내역-->
                                <div class="row">
                                    <table class="table table-bordered mb-5">
                                        <tr style="background-color: #eeeeee;">
                                            <th>총 매출 내역</th>
                                        </tr>
                                        <tr>
                                            <td>100000000원</td>
                                        </tr>
                                    </table>
                                </div>
                                
                                <!--크리에이터 강의 환불 내역-->
                                <div class="row">
                                    <h5><i class="fas fa-hashtag mr-1"></i>환불 내역</h5>
                                    <table class="table table-bordered mb-5">
                                        <tr style="background-color: #eeeeee;">
                                            <th>번호</th>
                                            <th>강의이름</th>
                                            <th>사용자</th>
                                            <th>시작날짜</th>
                                            <th>환불날짜</th>
                                            <th>환불금액</th>
                                        </tr>
                                        
                                        <tr>
                                            <td>dfdsf</td>
                                            <td>dfdsf</td>
                                            <td>dfdsf</td>
                                            <td>dfdsf</td>
                                            <td>dfdsf</td>
                                            <td>dfdsf</td>
                                        </tr>
                                    </table>
                                </div>

                                <!--크리에이터 신고 누적 내역-->
                                <div class="row">
                                    <h5><i class="fas fa-hashtag mr-1"></i>신고 누적 내역</h5>
                                    <table class="table table-bordered">
                                        <tr style="background-color: #eeeeee;">
                                            <th>번호</th>
                                            <th>강의이름</th>
                                            <th>신고 누적횟수</th>
                                        </tr>
                                        
                                        <tr>
                                            <td>dfdsf</td>
                                            <td>dfdsf</td>
                                            <td>dfdsf</td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="row d-flex justify-content-between">
                                    <button class="btn btn-secondary">뒤로가기</button>
                                    <div>
                                        <button class="btn btn-danger">PDF다운</button>
                                        <button class="btn btn-success">EXCEL다운</button>
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
</html>