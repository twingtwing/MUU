<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
                        <h4 class="page-title">유저 관리</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/admin/home">Home</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/adUserL">유저관리</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">유저관리 (상세)</li>
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
                                            <td>
                                            <c:if test="${userInfo.name eq ' ' }">
                                            	정보 없음
                                            </c:if>
                                            ${userInfo.name }
                                            </td>
                                            <td>
                                            <c:if test="${userInfo.age eq 0 }">
                                            	정보 없음
                                            </c:if>
                                            <c:if test="${userInfo.age ne 0}">
	                                            ${userInfo.age }세
                                            </c:if>
                                            </td>
                                            <td>
                                            <c:if test="${empty userInfo.tel }">
                                            	정보 없음
                                            </c:if>
                                            ${userInfo.tel }
                                            </td>
                                            <td>
                                            <c:if test="${userInfo.gender eq 'W'}">
                                        		여성
                                        	</c:if>
                                        	<c:if test="${userInfo.gender eq 'M'}">
                                        		남성
                                        	</c:if>
                                        	<c:if test="${empty userInfo.gender }">
                                            	정보 없음
                                            </c:if>
                                            </td>
                                            <td>${userInfo.joinDate}</td>
                                        </tr>
                                        <tr style="background-color: #eeeeee;">
                                        	<th>우편번호</th>
                                            <th colspan="3">주소(상세주소)</th>
                                            <th>크리에이터 등급</th>
                                            <th>유저 등급</th>
                                            <th>적립금</th>
                                        </tr>
                                        <tr>
                                        	<td>
                                        	<c:if test="${userInfo.zip ne 0}">${userInfo.zip }</c:if>
                                        	<c:if test="${userInfo.zip eq 0}">정보 없음</c:if>
                                        	</td>
                                            <td colspan="3">
                                            <c:if test="${empty userInfo.addr}">정보 없음</c:if>
                                            <c:if test="${not empty userInfo.addr}">${userInfo.addr } ${userInfo.detaAddr }</c:if>
                                            </td>
                                            <td>
                                            	<c:if test="${ not empty userInfo.creGrdCode }">
                                            		<a href="/admin/creatorSelect?id=${userInfo.id }">${userInfo.creGrdCode } (크리에이터 정보로 이동)</a>
                                            	</c:if>
                                            	<c:if test="${empty userInfo.creGrdCode }">
                                            		-
                                            	</c:if>
                                            </td>
                                            <!--크리에이터이기도 하면 관리자 크리에이터 상세페이지로 연결-->
                                            <td>${userInfo.uGrdCode }</td>
                                            <td><fmt:formatNumber>${userInfo.point }</fmt:formatNumber>원</td>
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
                                        <c:if test="${empty sugang }">
                                        <tr><td colspan="8">신청한 강의가 없습니다.</td></tr>
                                        </c:if>
                                        <c:forEach items="${sugang }" var="s">
                                        <tr>
                                            <td>${s.tlsnNo }</td>
                                            <td>${s.ttl }</td>
                                            <td>${s.creId }</td>
                                            <td>${s.regDate }</td>
                                            <td>${s.expDate }</td>
                                            <td><fmt:formatNumber>${s.pay }</fmt:formatNumber>원</td>
                                        </tr>
                                        </c:forEach>
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
                                        <c:if test="${empty refund }">
                                        <tr><td colspan="8">환불 내역이 없습니다.</td></tr>
                                        </c:if>
                                        <c:forEach items="${refund }" var="r">
                                        <tr>
                                            <td>${r.tlsnNo }</td>
                                            <td>${r.ttl }</td>
                                            <td>${r.creId }</td>
                                            <td>${r.content }</td>
                                            <td><fmt:formatNumber>${r.pay }</fmt:formatNumber>원</td>
                                            <td>${r.reqDate }</td>
                                            <td>
                                            	<c:if test="${r.rfStCode eq 'RF01'}">
                                            		환불신청대기
                                            	</c:if>
                                            	<c:if test="${r.rfStCode eq 'RF02'}">
                                            		환불완료
                                            	</c:if>
                                            	<c:if test="${r.rfStCode eq 'RF03'}">
                                            		환불거부
                                            	</c:if>
                                            </td>
                                        </tr>
                                        </c:forEach>
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
                                        <c:if test="${empty deliver }">
                                        <tr><td colspan="8">배송 내역이 없습니다.</td></tr>
                                        </c:if>
                                        <c:forEach items="${deliver }" var="d">
                                        <tr>
                                            <td>${d.tlsnNo }</td>
                                            <td>${d.ttl }</td>
                                            <td>${d.kitName }</td>
                                            <td><fmt:formatNumber>${d.kitPrc }</fmt:formatNumber>원</td>
                                            <td>${d.shipNum }</td>
                                            <td>
                                            	<c:if test="${d.shipStCode eq 'D01' }">
                                            		배송시작
                                            	</c:if>
                                            	<c:if test="${d.shipStCode eq 'D02' }">
                                            		배송중
                                            	</c:if>
                                            	<c:if test="${d.shipStCode eq 'D04' }">
                                            		배송실패
                                            	</c:if>
                                            	<c:if test="${d.shipStCode eq 'D05' }">
                                            		반송
                                            	</c:if>
                                            	<c:if test="${d.shipStCode eq 'D06' }">
                                            		반송 거부
                                            	</c:if>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                    </table>
                                    <button type="button" class="btn btn-secondary mr-5"
                                                                onclick="history.go(-1);">뒤로가기</button>
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