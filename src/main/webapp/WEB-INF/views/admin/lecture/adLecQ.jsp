<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        .crTab {
            color: black;
        }
        .crTab.active{
            font-weight: bold;
            color: orange;
        }
        .tableTab th{
            border:none !important;
        }
        input{
            vertical-align: middle;
            margin-right:5px;
        }
        label{
            margin-bottom:0px;
        }
        .questions:hover{
        	background-color: var(--light);
        }
        .answers{
        	font-weight: bold;
        }
    </style>
</head>
<body>
            <!-- 페이지명-->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <!-- 페이지명 작성 및 카테고리 작성 -->
                        <h4 class="page-title">강의 관리</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/admin/home">Home</a></li>
                                    <li class="breadcrumb-item"><a href="강의관리.html">강의관리</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">질문답변</li>
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
                                <!-- 기본 크리에이터 정보 -->
                                <div class="row position-relative">
                                   <table class="admin_search table table-bordered">
                                        <tr height="38">
                                            <th>강의이름</th>
                                            <td>
                                                ${lecInfo.ttl }
                                            </td>
                                            <th>강의별점</th>
                                            <td>
                                                <i class="fa fa-star text-warning"></i> 
                                                <c:if test="${lecInfo.avgStar eq 0 }">
                                                	리뷰없음
                                                </c:if>
                                                <c:if test="${lecInfo.avgStar ne 0 }">
                                                	${lecInfo.avgStar }
                                                </c:if>
                                            </td>
                                            <th rowspan="2" >
                                                <img src="${lecInfo.thumb }" style="width:70px; height:70px;" alt="">
                                            </th>
                                        </tr>

                                        <tr height="38">
                                            <th>강사정보</th>
                                            <td>
                                                <a href="/admin/creatorSelect?id=${lecInfo.creId }">${lecInfo.creId }</a> (크리에이터 정보로 이동)
                                            </td>
                                            <th>규정위반횟수</th>
                                            <td>
                                                ${lecInfo.cnt }회
                                            </td>
                                        </tr>
                                    </table>
                                </div>

                                <hr class="font-weight-bold">
                                
                                <div class="row" style="margin-top:40px; margin-bottom:0px;">
                                    <table class="table tableTab w-100">
                                        <tr style="background-color: #FCF8E3;">
                                            <th><a class="crTab" href="/admin/adLecI?ltNo=${lecInfo.ltNo }">강의소개</a></th>
                                            <th><a class="crTab" href="/admin/adLecU?ltNo=${lecInfo.ltNo }">수강생</a></th>
                                            <th><a class="crTab" href="/admin/adLecC?ltNo=${lecInfo.ltNo }">커리큘럼</a></th>
                                            <th><a class="crTab" href="/admin/adLecK?ltNo=${lecInfo.ltNo }">키트</a></th>
                                            <th><a class="crTab" href="/admin/adLecR?ltNo=${lecInfo.ltNo }">후기</a></th>
                                            <th><a class="crTab active" href="/admin/adLecQ?ltNo=${lecInfo.ltNo }">질문/답변</a></th>
                                            <th><a class="crTab" href="/admin/adLecN?ltNo=${lecInfo.ltNo }">공지사항</a></th>
                                        </tr>
                                    </table>
                                </div>
                                
                                <!--검색페이지-->
                                <form action="/admin/adLecQ" id="searchForm">
                                <div class="row position-relative">
                                    <table class="admin_search table table-bordered">
                                        <tr height="38">
                                            <th>작성자</th>
                                            <td>
                                                <input class="w-100" type="text" id="incheck" spellcheck="false"name="writer" value="${search.writer }">
                                            </td>
                                            <th>질문내용</th>
                                            <td>
                                                <input class="w-100" type="text" id="incheck" spellcheck="false" name="qContent" value="${search.qContent }">
                                            </td>
                                        </tr>
                                        <tr height="38">
                                            <th>처리상태</th>
                                            <td class="text-left" colspan="3" id="">
                                           		<label class="ml-2 mr-3"><input type="radio" name="qnaStCode" 
                                           		<c:if test="${empty search.qnaStCode }">checked="checked"</c:if>
                                           		value="">모두</label>
                                                <label><input type="radio" name="qnaStCode" value="Q01"
                                                <c:if test="${search.qnaStCode eq 'Q01'}">checked="checked"</c:if>
                                                >답변대기중</label>
                                                <label class="ml-2 mr-3"><input type="radio" name="qnaStCode" value="Q02"
                                                <c:if test="${search.qnaStCode eq 'Q02'}">checked="checked"</c:if>
                                                >답변완료</label>
                                            </td>
                                        </tr>
                                    </table>
                                    <button type="button"class="btn btn-secondary position-absolute" style="width: 75px; height: 33px; right: 5px; bottom: 19px;" id="searchBtn">검색</button>
                                </div>
                                <input type="hidden" name="page" value="1">
                                <input type="hidden" name="ltNo" value="${lecInfo.ltNo }">
							</form>
                                <!--검색결과-->
                                <div class="text-danger">※ 클릭 시 답변을 확인할 수 있습니다.</div>
                                <div class="row">
                                    <table class="table table-bordered">
                                        <tr style="background-color: #eeeeee;">
                                            <th style="width:90px;">번호</th>
                                            <th style="width:130px;">수강아이디</th>
                                            <th>질문</th>
                                            <th style="width:140px;">처리상태</th>
                                        </tr>
                                        <c:if test="${empty qna }">
                                        <tr>
                                        <td colspan="4">결과가 없습니다.</td>
                                        </tr>
                                        </c:if>
                                        <c:forEach items="${qna }" var="q">
                                        <tr class="questions">                                        
                                            <td>${q.qnaNo}</td> 
                                            <td>${q.writer}</td>
                                            <td class="question"><a onclick="openAnswer(${q.qnaNo})">${q.qContent}</a></td>
                                            <td>${q.qnaStCode}</td>
                                        </tr>
                                        <tr class="answer ans${q.qnaNo }">
                                            <td colspan="4" class="answers">
                                            <c:if test="${empty q.aContent }">
                                            답변이 없습니다.
                                            </c:if>
                                            <c:if test="${not empty q.aContent }">
                                            답변 : ${q.aContent}                                            
                                            </c:if>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                                
                                <div class="row d-flex justify-content-center position-relative">
                                    <div class="dataTables_paginate paging_simple_numbers" id="zero_config_paginate">
                                       <ul class="pagination">
                                        <c:if test="${pages.currPage ne 1 }">
                                            <li class="paginate_button page-item previous" data-num="${pages.prevPage }"
                                            id="zero_config_previous"><a href="#" aria-controls="zero_config"
                                            data-dt-idx="0" tabindex="0" class="page-link"><i class="mdi mdi-chevron-double-left"></i></a></li>
                                        </c:if>
                                        <c:forEach begin="${pages.startPage }" end="${pages.endPage }" var="p">
                                            <li data-num=${p } class="paginate_button page-item <c:out value="${pages.currPage == p ? 'active' : '' }"/>"><a href="#"
                                                    aria-controls="zero_config" 
                                                    class="page-link">${p }</a></li>
                                        </c:forEach>
                                        <c:if test="${pages.currPage ne pages.pageCnt && pages.pageCnt >0 }">
                                            <li class="paginate_button page-item next" id="zero_config_next" data-num="${pages.nextPage }">
                                            <a href="#"
                                                    aria-controls="zero_config" data-dt-idx="7" tabindex="0"
                                                    class="page-link"><i class="mdi mdi-chevron-double-right"></i></a></li>
                                        </c:if>          
                                        </ul>
                                    </div>
                                    <div class="position-absolute" style="left: 1px;">
                                        <button class="btn btn-light" onclick="location.href='/admin/adLecL'">목록가기</button>
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
//페이지네이션
$('.page-item').click((e)=>{
	let pageNum = +e.currentTarget.dataset.num;
	$('#searchForm>input[name=page]').val(pageNum)
	$('#searchForm').submit();
})

$('#searchBtn').click((e)=>{
		$('#searchForm').submit();
	})




    //mouseover 이벤트 : 탭 css변경
    $('.crTab').parent().on('mouseover',function(){
        $(this).children().parent().css('background-color','white');
        $(this).children().parent().find('.crTab').css('color','black');
    })

    //mouseover 이벤트 : 탭 css변경
    $('.crTab').parent().on('mouseout',function(){
        $(this).children().parent().css('background-color','#FCF8E3');
        $(this).children().parent().find('.crTab').css('color','#000000');
        $(this).children().parent().find('.crTab.active').css('color','orange');
    })

    //날짜 시작날짜/마지막날짜 disable
    $('#firstJdate').change(function(){
        let firstJdate = $('#firstJdate').val();
        $('#lastJdate').attr('min', firstJdate);
    })
    
    $('#lastJdate').change(function(){
        let lastJdate = $('#lastJdate').val();
        $('#firstJdate').attr('max', lastJdate);
    })

    //질문, 답변 토글
    $(function(){
        $('.answer').attr('style','display:none');
        $('.question').attr('style','cursor:pointer');
    })

    function openAnswer(num){
    	$($('.ans'+num)[0]).toggle('active')
    }
</script>
</body>
</html>