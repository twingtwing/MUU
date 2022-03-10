<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <style>
        table th,
        table td {
            text-align: center;
            vertical-align: middle;
        }

        .admin_search td,
        .admin_search th {
            padding: 5px;
        }

        .admin_search th {
            background-color: #eeeeee;
        }
    </style>
</head>
<body>
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <!-- 페이지명 작성 및 카테고리 작성 -->
                        <h4 class="page-title">문의글</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/admin/home">Home</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/adQstL">문의글</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">문의글 상세페이지</li>
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
                                            <h5 class="mb-0 ml-2" style="font-weight: 500;">${qst.ttl }</h5>
                                        </div>
                                        <div class="row justify-content-between p-2"
                                            style="background-color: #eeeeee; border-bottom: 2px solid black;">
                                            <div class="row">
                                                <h6 class="mb-0 ml-2 pl-1">번호</h6>
                                                <h6 class="mb-0 ml-2" style="font-weight: 500;">${qst.qstNo }</h6>
                                            </div>
                                            <div class="row">
                                                <div class="row mr-4">
                                                    <h6 class="mb-0">작성자 아이디</h6>
                                                    <h6 class="mb-0 ml-1" style="font-weight: 500;">${qst.writer }</h6>
                                                </div>
                                                <div class="row mr-2">
                                                    <h6 class="mb-0">처리상태</h6>
                                                    <h6 class="mb-0 ml-2" style="font-weight: 500;">
                                                    <c:if test="${qst.qstStCode eq 'QS01'}">
                                                    	답변 대기중
                                                    </c:if> 
                                                    <c:if test="${qst.qstStCode eq 'QS02'}">
                                                    	답변 완료
                                                    </c:if>
                                                    </h6>
                                                </div>
                                                <div class="row mr-2">
                                                    <h6 class="mb-0 ml-2">작성일</h6>
                                                    <h6 class="mb-0 ml-2" style="font-weight: 500;">${qst.qRegDate }</h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="row">
                                        <div class="card w-100">
                                            <div class="card-body">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <div class="mb-2">
                                                            <h2><i class="fa fa-comment-dots mr-1 text-danger"></i>${qst.ttl }</h2>
                                                        </div>
                                                        <div class="card" style="border: 2px solid black;">
                                                            <div class="m-4">
                                                                <div class="row ml-0">
                                                                    <p><u>${qst.email }</u></p>
                                                                </div>
                                                            </div>
                                                            <div class="card-body">
                                                                ${qst.content }
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card">
                                                    <div class="card-body">
                                                        <div class="mb-2">
                                                            <h2><i class="fa fa-font text-danger mr-1"></i>답변</h2>
                                                        </div>
                                                        <div class="card" style="border: 2px solid black;"></div>
                                                        <div class="row ml-4 mb-2">
                                                            <div class="font-weight-bold">작성날짜</div>
                                                            <div class="ml-2">2022-02-23</div>
                                                            <div class="ml-2">
                                                                <p>
                                                                    <u>muuproject.up@gmail.com</u>
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="form-group">
                                                                <label for="exampleFormControlTextarea1">답변작성</label>
                                                                
                                                                <c:if test="${empty qst.aContent }">
                                                                <textarea class="form-control" rows="10" id="answer"></textarea>
                                                                </c:if>
                                                                <c:if test="${not empty qst.aContent }">
                                                                <div>${qst.aContent }</div>
                                                                </c:if>
                                                                
                                                                <!-- 답변 처리 시에 보임 -->
                                                                <!-- <div>답변이 완료되었습니다.</div> -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row d-flex justify-content-center">
                                                        <div>
                                                            <button type="button" class="btn btn-secondary mr-5"
                                                                onclick="history.go(-1);">뒤로가기</button>
                                                        </div>
                                                        <!-- 답변완료 시에 안보임 -->
                                                        <div class="mr-4">
                                                            <button type="button" class="btn btn-secondary complete" >답변완료</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<form action="/admin/adQstMail" method="post" id="frm">
<input type="hidden" name="qstNo" value="${qst.qstNo }">
<input type="hidden" name="email" value="${qst.email }">
<input type="hidden" name="aContent">  
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">          
</form>
<script type="text/javascript">
$('.complete').click(()=>{
	if(!$('#answer').val()){
		return;
	}
	$('#frm>input[name=aContent]').val($('#answer').val());
	window.alert('답변이 완료되었습니다. 시간이 다소 걸릴 수 있습니다...');
	$('#frm').submit();
})
</script>
</body>
</html>