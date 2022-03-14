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
        input[name=star]{
            vertical-align: middle;
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
                                    <li class="breadcrumb-item active" aria-current="page">후기</li>
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
                                            <th><a class="crTab active" href="/admin/adLecR?ltNo=${lecInfo.ltNo }">후기</a></th>
                                            <th><a class="crTab" href="/admin/adLecQ?ltNo=${lecInfo.ltNo }">질문/답변</a></th>
                                            <th><a class="crTab" href="/admin/adLecN?ltNo=${lecInfo.ltNo }">공지사항</a></th>
                                        </tr>
                                    </table>
                                </div>

                                <!--검색페이지-->
                                <form action="/admin/adLecR" id="searchForm">
                                <input type="hidden" name="page" value="1">
                                <input type="hidden" name="ltNo" value="${lecInfo.ltNo }">
                                <div class="row position-relative mt-5">
                                    <table class="admin_search table table-bordered">
                                        <tr height="38">
                                            <th>수강생 아이디</th>
                                            <td>
                                                <input class="w-100" type="text" id="incheck" spellcheck="false" name="writer" value="${search.writer }">
                                            </td>                       
                                            <th>내용</th>
                                            <td>
                                                <input class="w-100" type="text" id="incheck" spellcheck="false" name="content" value="${search.content }">
                                            </td>                       
                                        </tr>
                                        <tr height="38">
                                            <th>별점</th>
                                            <td class="text-left">
                                                <input type="radio" class="ml-2"  name="star" id="5star" value="5" 
                                                <c:if test="${search.star eq 5 }">checked="checked"</c:if>
                                                ondblclick="this.checked=false">
                                                <label for="5star" class="mb-0">
                                                    <i class="fa fa-star text-warning m-0"></i>
                                                    <i class="fa fa-star text-warning m-0"></i>
                                                    <i class="fa fa-star text-warning m-0"></i>
                                                    <i class="fa fa-star text-warning m-0"></i>
                                                    <i class="fa fa-star text-warning m-0"></i>
                                                </label>
                                                <input type="radio" class="ml-2"name="star" id="4star" value="4" 
                                                <c:if test="${search.star eq 4 }">checked="checked"</c:if>
                                                ondblclick="this.checked=false">
                                                <label for="4star" class="mb-0">
                                                    <i class="fa fa-star text-warning m-0"></i>
                                                    <i class="fa fa-star text-warning m-0"></i>
                                                    <i class="fa fa-star text-warning m-0"></i>
                                                    <i class="fa fa-star text-warning m-0"></i>
                                                </label>
                                                <input type="radio" class="ml-2"name="star" id="3star" value="3" 
                                                <c:if test="${search.star eq 3 }">checked="checked"</c:if>
                                                ondblclick="this.checked=false">
                                                <label for="3star" class="mb-0">
                                                    <i class="fa fa-star text-warning m-0"></i>
                                                    <i class="fa fa-star text-warning m-0"></i>
                                                    <i class="fa fa-star text-warning m-0"></i>
                                                </label>
                                                <input type="radio" class="ml-2"name="star" id="2star" value="2" 
                                                <c:if test="${search.star eq 2 }">checked="checked"</c:if>
                                                ondblclick="this.checked=false">
                                                <label for="2star" class="mb-0">
                                                    <i class="fa fa-star text-warning m-0"></i>
                                                    <i class="fa fa-star text-warning m-0"></i>
                                                </label>
                                                <input type="radio" class="ml-2"name="star" id="1star" value="1" 
                                                <c:if test="${search.star eq 1 }">checked="checked"</c:if>
                                                ondblclick="this.checked=false">
                                                <label for="1star" class="mb-0">
                                                    <i class="fa fa-star text-warning m-0"></i>                                                    
                                                </label>
                                                <input type="radio" class="ml-2"name="star" id="all" value="0" 
                                                <c:if test="${search.star eq 0}">checked="checked"</c:if>
                                                ondblclick="this.checked=false">
                                                <label for="all" class="mb-0">
                                                  모두                                                  
                                                </label>
                                            </td>
                                            <th>상태</th>
                                            <td>
                                            <select name="rvCode" class="w-75 d-flex">
                                            <option  value="" <c:if test="${empty search.rvCode}">selected="selected"</c:if>>모두</option>
                                            <option value="RE01"<c:if test="${search.rvCode eq 'RE01'}">selected="selected"</c:if>>정상</option>
                                            <option value="RE02"<c:if test="${search.rvCode eq 'RE02'}">selected="selected"</c:if>>신고됨</option>
                                            </select>
                                            </td>
                                        </tr>
                                    </table>
                                    <button class="btn btn-secondary position-absolute" style="width: 75px; height: 33px; right: 5px; bottom: 19px;" id="searchBtn">검색</button>
                                </div>
							</form>
                                <div class="row">
                                    <table class="table table-bordered">
                                        <tr style="background-color: #eeeeee;">
                                            <th style="width:120px;">작성자</th>
                                            <th>내용</th>
                                            <th style="width:140px;">별점</th>
                                            <th>상태</th>
                                        </tr>
                                        <c:if test="${empty reviews }">
                                        <tr>
                                        <td colspan="4">결과가 없습니다.</td>
                                        </tr>
                                        </c:if>
										<c:forEach items="${reviews }" var="r">
	                                        <tr>
	                                            <td>${r.writer}</td>
	                                            <td>${r.content}</td>
	                                            <td class="text-left">
	                                            <c:forEach begin="1" end="${r.star }">
	                                            <i class="fa fa-star text-warning m-0"></i>
	                                            </c:forEach>
	                                            </td>
	                                            <td>${r.rvCode }</td>
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
                                        <button class="btn btn-light">목록가기</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 내용 끝 -->
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