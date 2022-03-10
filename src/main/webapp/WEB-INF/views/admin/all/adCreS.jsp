<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
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
                                    <li class="breadcrumb-item"><a href="/admin/home">Home</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/adCreL">크리에이터 관리</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">크리에이터 관리(상세)</li>
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
                                            <th>나이</th>
                                            <th>전화번호</th>
                                            <th>성별</th>
                                            <th>가입날짜</th>
                                        </tr>
                                        <tr>
                                        	<td>
                                        	<c:if test="${userInfo.uStCode eq 1}">
                                        		활성
                                        	</c:if>
                                        	<c:if test="${userInfo.uStCode eq 0}">
                                        		비활성
                                        	</c:if>
                                        	</td>
                                            <td>${userInfo.id }</td>
                                            <td>${userInfo.name }</td>
                                            <td>${userInfo.age }세</td>
                                            <td>${userInfo.tel }</td>
                                            <td>
                                            <c:if test="${userInfo.gender eq 'W'}">
                                        		여성
                                        	</c:if>
                                        	<c:if test="${userInfo.gender eq 'M'}">
                                        		남성
                                        	</c:if>
                                            </td>
                                            <td>${userInfo.joinDate}</td>
                                        </tr>
                                        <tr style="background-color: #eeeeee;">
                                            <th colspan="5">크리에이터 소개</th>
                                            <th>유저 정보</th>
                                            <th>등급</th>
                                        </tr>
                                        <tr>
                                            <td colspan="5">${cre.creIntro }</td>
                                            <td>
                                            <a href="/admin/userSelect?id=${userInfo.id}">유저정보로 이동</a>
                                            </td>
                                            <!--유저 정보 상세페이지로 연결-->
                                            <td>${userInfo.creGrdCode }</td>
                                        </tr>
                                    </table>
 
								</div>                                
                                <!--크리에이터 강의정보내역-->
                                <div class="row">
                                    <h5><i class="fas fa-hashtag mr-1"></i>강의리스트</h5>
                                    <table class="table table-bordered">
                                        <tr style="background-color: #eeeeee;">
                                            <th>강의번호</th>
                                            <th>강의이름</th>
                                            <th>크리에이터</th>
                                            <th>시작날짜</th>
                                            <th>종료날짜</th>
                                            <th>금액</th>
                                            <th>수강자수</th>
                                            <th>매출액</th>
                                        </tr>
                                        <!--크리에이터 강의정보 가져오기-->
                                        <c:if test="${empty lectures }">
                                        <tr><td colspan="8">등록된 강의가 없습니다.</td></tr>
                                        </c:if>
                                        <c:forEach items="${lectures }" var="lec">
                                        <tr>
                                            <td>${lec.ltNo }</td>
                                            <td>${lec.ttl }</td>
                                            <td>${lec.creId }</td>
                                            <td>${lec.startDate }</td>
                                            <td>${lec.expDate }</td>
                                            <td><fmt:formatNumber>${lec.prc }</fmt:formatNumber>원</td>
                                            <td>${lec.cnt }명</td>
                                            <td><fmt:formatNumber>${lec.sales }</fmt:formatNumber>원</td>
                                        </tr>
                                        </c:forEach>
                                    </table>
                                </div>

                                <!--크리에이터 총 매출 내역-->
                                <div class="row">
                                    <table class="table table-bordered mb-5">
                                        <tr style="background-color: #eeeeee;">
                                            <th>총 매출</th>
                                        </tr>
                                        <tr>
                                            <td><fmt:formatNumber>${salesAll }</fmt:formatNumber>원</td>
                                        </tr>
                                    </table>
                                </div>
                                
                                <!--크리에이터 강의 환불 내역-->
                                <div class="row">
                                    <h5><i class="fas fa-hashtag mr-1"></i>환불 내역</h5>
                                    <table class="table table-bordered mb-5">
                                        <tr style="background-color: #eeeeee;">
                                            <th>수강번호</th>
                                            <th>강의이름</th>
                                            <th>사용자</th>
                                            <th>시작날짜</th>
                                            <th>환불날짜</th>
                                            <th>환불금액</th>
                                            <th>환불상태</th>
                                        </tr>
                                        <c:if test="${empty refundList }">
                                        <tr><td colspan="8">환불 내역이 없습니다.</td></tr>
                                        </c:if>
                                        <c:forEach items="${refundList }" var="refund">
                                        <tr>
                                            <td>${refund.tlsnNo }</td>
                                            <td>${refund.ttl }</td>
                                            <td>${refund.id }</td>
                                            <td>${refund.regDate }</td>
                                            <td>${refund.reqDate }</td>
                                            <td><fmt:formatNumber>${refund.pay }</fmt:formatNumber>원</td>
                                            <td>
                                            	<c:if test="${refund.rfStCode eq 'RF01'}">
                                            		환불신청대기
                                            	</c:if>
                                            	<c:if test="${refund.rfStCode eq 'RF02'}">
                                            		환불 완료
                                            	</c:if>
                                            	<c:if test="${refund.rfStCode eq 'RF03'}">
                                            		환불 거부됨
                                            	</c:if>                                            
                                            </td>
                                        </tr>
                                        </c:forEach>
                                    </table>
                                </div>

                                <!--크리에이터 신고 누적 내역-->
                                <div class="row">
                                    <h5><i class="fas fa-hashtag mr-1"></i>신고 누적 내역</h5>
                                    <table class="table table-bordered">
                                        <tr style="background-color: #eeeeee;">
                                            <th>강의번호</th>
                                            <th>강의이름</th>
                                            <th>신고 누적횟수</th>
                                        </tr>
                                        <c:if test="${empty reports }">
                                        <tr><td colspan="8">신고 내역이 없습니다.</td></tr>
                                        </c:if>
                                        <c:forEach items="${reports }" var="rp">
                                        <tr>
                                            <td>${rp.ltNo }</td>
                                            <td>${rp.ttl }</td>
                                            <td>${rp.cnt }회</td>
                                        </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                                <div class="row d-flex justify-content-between">
                                    <button class="btn btn-secondary" onclick="history.back()">뒤로가기</button>
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