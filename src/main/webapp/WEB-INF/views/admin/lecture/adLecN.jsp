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
        .noticeList>tr {
        cursor: pointer;
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
                        <h4 class="page-title">강의 관리</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/admin/home">Home</a></li>
                                    <li class="breadcrumb-item"><a href="강의관리.html">강의관리</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">공지사항</li>
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
                                            <th><a class="crTab" href="/admin/adLecQ?ltNo=${lecInfo.ltNo }">질문/답변</a></th>
                                            <th><a class="crTab active" href="/admin/adLecN?ltNo=${lecInfo.ltNo }">공지사항</a></th>
                                        </tr>
                                    </table>
                                </div>

                                <!--검색페이지-->
                                <form action="/admin/adLecN" id="searchForm">
                                <input type="hidden" name="ltNo" value="${lecInfo.ltNo }">
                                <input type="hidden" name="page" value="1">
                                <div class="row position-relative">
                                    <table class="admin_search table table-bordered">
                                        <tr height="38">
                                            <th>검색내용</th>
                                            <td class="row">
                                                <div class="col-2">
                                                    <select class="w-100" id="searchBox">
                                                        <option value="title"
                                                    	<c:if test="${not empty search.ttl }">selected="selected"</c:if>
                                                        >제목</option>
                                                        <option value="content"
                                                    	<c:if test="${not empty search.content }">selected="selected"</c:if>
                                                        >내용</option>
                                                        <option value="ttlContent" 
                                                        <c:if test="${not empty search.ttlContent }">selected="selected"</c:if>
                                                        >제목+내용</option>
                                                    </select>
                                                </div>
                                                <div class="col-10">
                                                    <input class="w-100" type="text" id="incheck" spellcheck="false" 
                                                    <c:if test="${not empty search.ttlContent }">value="${search.ttlContent }"</c:if>
                                                    <c:if test="${not empty search.ttl }">value="${search.ttl }"</c:if>
                                                    <c:if test="${not empty search.content }">value="${search.content }"</c:if>
                                                    >
                                                </div>
                                            </td>
                                        </tr>
                                        <tr height="38">
                                            <th>작성일</th>
                                            <td class="text-left">
                                                <input class="" id="firstJdate" type="date" spellcheck="false" name="startDate" value="${search.startDate }"> ~ 
                                                <input class="" id="lastJdate" type="date" spellcheck="false" name="endDate" value="${search.endDate }">
                                            </td>
                                        </tr>
                                    </table>
                                    <button class="btn btn-secondary position-absolute" style="width: 75px; height: 33px; right: 5px; bottom: 19px;" id="searchBtn">검색</button>
                                </div>
                                </form>

                                <!--검색결과-->
                                <div class="row">
                                    <table class="table table-bordered">
                                    <thead>
                                        <tr style="background-color: #eeeeee;">
                                            <th style="width:90px;">글번호</th>
                                            <th>제목</th>                                            
                                            <th style="width:130px;">작성일</th>
                                            <th style="width:90px;">조회수</th>
                                        </tr>
                                    </thead>
                                    <tbody class="noticeList">
                                        <c:if test="${empty notices }">
                                        <tr>
                                        	<td colspan="4">검색 결과가 없습니다.</td>
                                        </tr>
                                        </c:if>
										<c:forEach items="${notices }" var="n">
                                        <tr data-ntno="${n.ntNo }">
                                            <td>${n.ntNo}</td>
                                            <td>${n.ttl}</td>                                            
                                            <td>${n.wrDate}</td>
                                            <td>${n.hits}</td>
                                        </tr>
										</c:forEach>
                                    </tbody>
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
const searchSetting = ()=>{
	if(!$('#firstJdate').val()){
		$('#firstJdate').val('2016-01-01');
	}
	if(!$('#lastJdate').val()){
		let today = new Date();
		today.setDate(today.getDate()+1);
		$('#lastJdate').val(new Date(today).toISOString().slice(0,10));
	}
	if($('#searchBox').val()==='title'){
		$('#incheck').attr('name','ttl')
	}
	if($('#searchBox').val()==='content'){
		$('#incheck').attr('name','content')		
	}
	if($('#searchBox').val()==='ttlContent'){
		$('#incheck').attr('name','ttlContent')			
	}
}

//페이지네이션
$('.page-item').click((e)=>{
	let pageNum = +e.currentTarget.dataset.num;
	$('#searchForm>input[name=page]').val(pageNum)
	searchSetting();
	$('#searchForm').submit();
})
//검색
$('#searchBtn').click((e)=>{
	searchSetting();
	$('#searchForm').submit();
})

$('.noticeList').click((e)=>{
	let ntno = e.target.parentElement.dataset.ntno;
	location.href = '/admin/adLecND?ltNo='+${lecInfo.ltNo}+'&ntNo='+ntno;
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
</script>
</body>
</html>