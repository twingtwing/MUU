<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
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
        input[name=star]{
            vertical-align: middle;
        }


        /* tiles에 넣어야함 */
        .page-link{
            color: #837f7f;
        }
        .page-link:hover{
            color: white;
        }
        .page-item.active .page-link{
            background-color: black;
            border-color: black;
        }
        .breadcrumb-item a{
            color: black;
            font-weight: bold;
        }
        .breadcrumb-item.active{
            color: rgb(153, 149, 149);
        }
        .lectureList tr{
        	cursor: pointer;
        }
        #ho:hover{
        background-color:#f5f5f5;
        }
        .fa-caret-down{
        	cursor: pointer;
        	float: right;
        }
        td{
        vertical-align: middle;
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
                                    <li class="breadcrumb-item active" aria-current="page">강의 관리</li>
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
                                <form action="/admin/adLecL" id="searchForm">
                                <input type="hidden" value="0" name="page">
                                <div class="row position-relative">
                                    <table class="admin_search table table-bordered">
                                        <tr height="38">
                                            <th width="15%">제목</th>
                                            <td width="35%">
                                                <input class="w-100 border" type="text" id="incheck" spellcheck="false" name="ttl" value="${search.ttl }">
                                            </td>
                                            <th width="15%">카테고리</th>
                                            <td width="35%">
                                                <div class="d-flex">
                                                    <!--상세 / 데이터필요-->
                                                    <select name="upCtgr" id="ctgr" class="border w-50">
                                                        <option value="" id="ctgrAll">전체(상위 카테고리)</option>
                                                        <option value="HC01" <c:if test="${search.upCtgr eq 'HC01'}">selected="selected"</c:if>>음악</option>
                                                        <option value="HC02" <c:if test="${search.upCtgr eq 'HC02'}">selected="selected"</c:if>>요리</option>
                                                        <option value="HC03" <c:if test="${search.upCtgr eq 'HC03'}">selected="selected"</c:if>>건강</option>
                                                        <option value="HC04" <c:if test="${search.upCtgr eq 'HC04'}">selected="selected"</c:if>>아트</option>
                                                        <option value="HC05" <c:if test="${search.upCtgr eq 'HC05'}">selected="selected"</c:if>>IT/컴퓨터</option>
                                                        <option value="HC06" <c:if test="${search.upCtgr eq 'HC06'}">selected="selected"</c:if>>외국어</option>
                                                        <option value="HC07" <c:if test="${search.upCtgr eq 'HC07'}">selected="selected"</c:if>>자기계발</option>
                                                    </select>
                                                    <!--상세 하나에 대한 하부 / 데이터-->
                                                    <select name="downCtgr" id="downctgr" class="border w-50" disabled>
                                                        <option value="">전체(하위 카테고리)</option>
                                                        <c:if test="${not empty search.downCtgr }">
                                                        <option value="${search.downCtgr }" selected="selected">${search.downCtgr }</option>
                                                        </c:if>
                                                    </select>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr height="38">
                                            <th>크리에이터</th>
                                            <td>
                                            	<div class="d-flex">
                                                    <div class="col-3 row align-items-center border">
                                                        <select class="w-100 searchBox">
                                                        <option value="id">아이디</option>
                                                        <option value="name">이름</option>
                                                    </select>
                                                    </div>
                                                    <div class="col-9">
                                                        <input class="w-100 searchKey border" type="text" spellcheck="false"
                                                        <c:if test="${not empty search.creId }">
                                                        	value = "${search.creId }"
                                                        </c:if>
                                                        <c:if test="${not empty search.name }">
                                                        	value = "${search.name }"
                                                        </c:if>
                                                        >
                                                    </div>
                                                </div>
                                            </td>
                                            <th>강의 게시 날짜</th>
                                            <td class="text-left">
                                            	<input class="w-30 border" type="date" spellcheck="false" id="firstJdate" name="pastDate" value="${search.pastDate }">
                                                <i class="fas fa-minus mx-1"></i>
                                                <input class="w-30 border" type="date" spellcheck="false" id="lastJdate" name="recentDate" value="${search.recentDate }">
                                            </td>
                                        </tr>

                                        <tr height="38">
                                            <th>별점</th>
                                            <td class="text-left">
                                                	<input type="radio" value="1" id="1" name=star ondblclick="this.checked=false"<c:if test="${search.star eq 1 }">checked="checked"</c:if>>
                                                    <label for="1" class="mb-0 ml-1 mr-2">
                                                        <i class="fa fa-star text-warning mr-0"></i>
                                                    </label>
                                                    <input type="radio" value="2" id="2" name=star ondblclick="this.checked=false"<c:if test="${search.star eq 2 }">checked="checked"</c:if>>
                                                    <label for="2" class="mb-0 ml-1 mr-2">
                                                        <i class="fa fa-star text-warning mr-0"></i>
                                                        <i class="fa fa-star text-warning mr-0"></i>
                                                    </label>
                                                    <input type="radio" value="3" id="3" name=star ondblclick="this.checked=false"<c:if test="${search.star eq 3 }">checked="checked"</c:if>>
                                                    <label for="3" class="mb-0 ml-1 mr-2">
                                                        <i class="fa fa-star text-warning mr-0"></i>
                                                        <i class="fa fa-star text-warning mr-0"></i>
                                                        <i class="fa fa-star text-warning mr-0"></i>
                                                    </label>
                                                    <input type="radio" value="4" id="4" name=star ondblclick="this.checked=false"<c:if test="${search.star eq 4 }">checked="checked"</c:if>>
                                                    <label for="4" class="mb-0 ml-1 mr-2">
                                                        <i class="fa fa-star text-warning mr-0"></i>
                                                        <i class="fa fa-star text-warning mr-0"></i>
                                                        <i class="fa fa-star text-warning mr-0"></i>
                                                        <i class="fa fa-star text-warning mr-0"></i>
                                                    </label>
                                                    <input type="radio" value="5" id="5" name=star ondblclick="this.checked=false"<c:if test="${search.star eq 5 }">checked="checked"</c:if>>
                                                    <label for="5" class="mb-0 ml-1 mr-2">
                                                        <i class="fa fa-star text-warning mr-0"></i>
                                                        <i class="fa fa-star text-warning mr-0"></i>
                                                        <i class="fa fa-star text-warning mr-0"></i>
                                                        <i class="fa fa-star text-warning mr-0"></i>
                                                        <i class="fa fa-star text-warning mr-0"></i>
                                                    </label>
                                            </td>
                                            <th>상태</th>
                                            <td class="text-left">
                                            	<c:forEach items="${search.ltStCodeList }" var="g">
                                            	<input type="checkbox"id="${g }" class="ml-2" spellcheck="false" value="${g }" name="ltStCodeList" checked="checked">                                     	
                                                <label for="${g }" class="mr-3 mb-0">
                                                <c:if test="${g eq 'L01' }">
                                                정상
                                                </c:if>
                                                <c:if test="${g eq 'L02' }">
                                                등록 대기
                                                </c:if>
                                                <c:if test="${g eq 'L03' }">
                                                만료
                                                </c:if>
                                                <c:if test="${g eq 'L07' }">
                                                등록 반려
                                                </c:if>
                                                </label>
                                            	</c:forEach>   
                                            	<button type="button" class="btn bg-white border position-absolute" style="width: 75px; height: 33px; right: 85px; bottom: 19px;" id="resetAll">초기화</button> 
                                            </td>
                                        </tr>
                                        

                                    </table>
                                    <button type="button" id="searchBtn" class="btn btn-secondary position-absolute" style="width: 75px; height: 33px; right: 5px; bottom: 19px;">검색</button>
                                </div>
                                <input type="hidden" value="${search.orderColumn }" name="orderColumn">
                                <input type="hidden" value="${search.orderBy }" name="orderBy">
                                <input type="hidden" name="state" 
								<c:choose>
								<c:when test="${not empty state }">value="${state }"</c:when>
								<c:otherwise>value="false"</c:otherwise>
								</c:choose>
								id="searchState">
                                </form>
                                <div class="row">
                                    <table class="table table-bordered">
                                    <thead>
                                        <tr style="background-color: #eeeeee;">
                                            <th style="width:90px;" data-col="lt_no">번호
                                            <i class=
                                            "fa fa-caret-down 
                                            <c:if test="${search.orderColumn eq 'lt_no' and search.orderBy eq 'asc'}">
                                            fa-rotate-180
                                            </c:if>
                                            "                                            
                                            aria-hidden="true"></i>
                                            </th>
                                            <th style="width: 200px;"data-col="up_ctgr">카테고리
                                            <i class=
                                            "fa fa-caret-down
                                            <c:if test="${search.orderColumn eq 'up_ctgr' and search.orderBy eq 'asc'}">
                                            fa-rotate-180
                                            </c:if>
                                            "                                            
                                            aria-hidden="true"></i>
                                            </th>
                                            <th data-col="ttl">강의명
                                            <i class=
                                            "fa fa-caret-down 
                                            <c:if test="${search.orderColumn eq 'ttl' and search.orderBy eq 'asc'}">
                                            fa-rotate-180
                                            </c:if>
                                            "                                            
                                            aria-hidden="true"></i>
                                            </th>
                                            <th style="width:190px;" data-col="cre_id">크리에이터 아이디
                                            <i class=
                                            "fa fa-caret-down 
                                            <c:if test="${search.orderColumn eq 'cre_id' and search.orderBy eq 'asc'}">
                                            fa-rotate-180
                                            </c:if>
                                            "                                            
                                            aria-hidden="true"></i>
                                            </th>
                                            <th style="width:110px;" data-col="name">이름
                                            <i class=
                                            "fa fa-caret-down 
                                            <c:if test="${search.orderColumn eq 'name' and search.orderBy eq 'asc'}">
                                            fa-rotate-180
                                            </c:if>
                                            "                                            
                                            aria-hidden="true"></i>
                                            </th>
                                            <th style="width:150px;" data-col="req_date">강의신청날짜
                                            <i class=
                                            "fa fa-caret-down 
                                            <c:if test="${search.orderColumn eq 'req_date' and search.orderBy eq 'asc'}">
                                            fa-rotate-180
                                            </c:if>
                                            "                                            
                                            aria-hidden="true"></i>
                                            </th>
                                            <th style="width:110px;"data-col="prc">수강료
                                            <i class=
                                            "fa fa-caret-down 
                                            <c:if test="${search.orderColumn eq 'prc' and search.orderBy eq 'asc'}">
                                            fa-rotate-180
                                            </c:if>
                                            "                                            
                                            aria-hidden="true"></i>
                                            </th>
                                            <th style="width:130px;"data-col="avgstar">강의별점
                                            <i class=
                                            "fa fa-caret-down 
                                            <c:if test="${search.orderColumn eq 'avgstar' and search.orderBy eq 'asc'}">
                                            fa-rotate-180
                                            </c:if>
                                            "                                            
                                            aria-hidden="true"></i>
                                            </th>
                                            <th style="width:180px;"data-col="lt_st_code">상태
                                            <i class=
                                            "fa fa-caret-down 
                                            <c:if test="${search.orderColumn eq 'lt_st_code' and search.orderBy eq 'asc'}">
                                            fa-rotate-180
                                            </c:if>
                                            "                                            
                                            aria-hidden="true"></i>
                                            </th>
                                        </tr>
                                    </thead>
                                        <!--강의 정보 가져와서 데이터 뿌리기 / 기본 강의소개페이지로 이동-->
                                       <tbody class="lectureList">
                                        <c:forEach items="${lectures}" var="l">
                                        <tr data-ltno = "${l.ltNo}" id="ho">
                                        	<td>${l.ltNo }</td>
                                        	<td>${l.upCtgr } > ${l.downCtgr }</td>	
                                        	<td>${l.ttl }</td>
                                        	<td>${l.creId }</td>
                                        	<td>${l.name }</td>
                                        	<td>${l.reqDate }</td>
                                        	<td>
                                        	<fmt:formatNumber>${l.prc }</fmt:formatNumber>원
                                        	</td>
                                        	<td><i class="fa fa-star text-warning mr-0"></i> 
                                        	<c:if test="${l.avgStar eq 0 }">
                                        		리뷰없음
                                        	</c:if>
                                        	<c:if test="${l.avgStar ne 0 }">
                                        	${l.avgStar }
                                        	</c:if>
                                        	</td>
                                        	<td>${l.ltStCode }</td>
                                        </tr>
                                        </c:forEach>
                                       <c:if test="${empty lectures[0].ltNo }">
                                       <tr><td colspan="9">결과가 없습니다.</td></tr>
                                       </c:if>
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
                                    <div class="position-absolute" style="right: 1px;">
                                        <button class="btn btn-success" id="excel">EXCEL다운</button>
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
	$('#searchBtn').click((e)=>{
		$('#searchState').val(true);
		searchSetting();
		$('#searchForm').submit();
	})
	
// 검색 초기화
$('#resetAll').click(()=>{
	$('#searchForm input[name=ttl]').val('');
	$('.searchKey').val('');
	$('#ctgrAll').prop('selected','selected');
	$('#firstJdate').val(null);	
	$('#lastJdate').val(null);
	$('input[name=star]').prop('checked',null);
	$('input[name=ltStCodeList]').prop('checked',null);
	$('#searchState').val(false);
})
	
	
	const searchSetting = ()=>{
		if($('.searchBox').val()==='id'){
			$('.searchKey').attr('name','creId');
		} else {
			$('.searchKey').attr('name','name');
		}
		if(!$('#firstJdate').val()){
			$('#firstJdate').val('2016-01-01');
		}
		if(!$('#lastJdate').val()){
			let today = new Date();
			today.setDate(today.getDate()+1);
			$('#lastJdate').val(new Date(today).toISOString().slice(0,10));
		}
	}
	
	$('#excel').click(()=>{
		searchSetting();
		$('#searchForm').attr('action','/admin/lectureExcel');
		$('#searchForm').submit();
		$('#searchForm').attr('action','/admin/adLecL');
	})

	$('.fa-caret-down').click((e)=>{
		if(!JSON.parse($('#searchState').val())){
			$('#resetAll').click();
		}
		searchSetting();
		$(e.currentTarget).toggleClass('fa-rotate-180')
		$('#searchForm>input[name=orderColumn]').val(e.currentTarget.parentElement.dataset.col)
		$('#searchForm>input[name=orderBy]').val('asc');
		$('#searchForm').submit();
	})
	$('.fa-rotate-180').click((e)=>{
		if(!JSON.parse($('#searchState').val())){
			$('#resetAll').click();
		}
		searchSetting();
		$(e.currentTarget).toggleClass('fa-rotate-180')
		$('#searchForm>input[name=orderColumn]').val(e.currentTarget.parentElement.dataset.col)
		$('#searchForm>input[name=orderBy]').val('desc');
		$('#searchForm').submit();
	})
	
	
	
	// 페이지네이션
	$('.page-item').click((e)=>{
		let pageNum = +e.currentTarget.dataset.num;
		if(!JSON.parse($('#searchState').val())){
			$('#resetAll').click();
		}
		$('#searchForm>input[name=page]').val(pageNum)
		searchSetting();
		$('#searchForm').submit();
	})

	$('.lectureList').click((e)=>{
		let ltno = e.target.parentElement.dataset.ltno;
		location.href='/admin/adLecI?ltNo='+ltno;
	})
	
    //가입날짜 시작날짜/마지막날짜 disable
    $('#firstJdate').change(function(){
        let firstJdate = $('#firstJdate').val();
        $('#lastJdate').attr('min', firstJdate);
    })
    
    $('#lastJdate').change(function(){
        let lastJdate = $('#lastJdate').val();
        $('#firstJdate').attr('max', lastJdate);
    })
    
    
    

    //카테고리 셀박
    const category = {
		'음악' : ['클래식','재즈/락','힙합/랩','기타/베이스','동양','보컬','기타'],
		 '요리': ['한식','양식','일식','중식','베이킹','가정식','기타'],
		 '건강': ['홈 트레이닝','필라테스','요가','정신건강','기타'],
		 '아트': ['2D/애니메이션','드로잉','수채화/유화','동양화','사진','메이크업/분장','기타'],
		 'IT/컴퓨터': ['Java','Python','C언어','웹 프로그래밍','Unity','Photoshop/Illustrator','기타'],
		 '외국어': ['영어','일본어','중국어','스페인어','아랍어','러시아어','기타'],
		 '자기계발': ['부동산','주식','면접/자소서','SNS/블로그','기타'],
    }

    $('#ctgr').change(()=>{
        if($(this).find('option:selected').val() == 'all'){
            $('#downctgr').attr('disabled', true);
        } 
        $('#downctgr').removeAttr('disabled');
        $('#downctgr > option:not(:eq(0))').remove();
        let upper = $('#ctgr option:selected').text();
        category[upper].forEach((v)=>{
                $('#downctgr').append($('<option>').val(v).text(v));
                    
        });
    })
    //가입날짜 시작날짜/마지막날짜 disable
    $('#firstJdate').on('change', function(){
        let pastDate = $('#firstJdate').val();
        $('#lastJdate').attr('min', pastDate);
    })
    
    $('#lastJdate').on('change', function(){
        let recentDate = $('#lastJdate').val();
        $('#firstJdate').attr('max', recentDate);
    })
    
    $(function(){
    	let date = new Date();
    	let today = date.toISOString().substring(0, 10);
    	$('#firstJdate').attr('max', today);
    	$('#lastJdate').attr('max', today);
    })



</script>
</body>
</html>