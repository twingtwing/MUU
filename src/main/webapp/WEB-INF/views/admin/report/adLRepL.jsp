<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<style>
#mod:hover{
background-color:#f5f5f5;
}
</style>
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
        .w-50 {
            width: 49%!important;
        }
                
        element.style {
            width: 70px;
            height: 34px;
            right: 18px;
            bottom: 23px;
        }
        #ct{
            width: 100%!important;
        }

        td:nth-child(3){
            text-align: left;
        }

    </style>
</head>
<body>
            <!-- 페이지명-->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <!-- 페이지명 작성 및 카테고리 작성 -->
                        <h4 class="page-title">강의신고</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/admin/home">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">강의신고</li>
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
                                <form action = '/admin/adLRepL' id='ser' method= 'get'>
                                <div class="row position-relative">
                                    <table class="admin_search table table-bordered">
                                        <tr height="38">
                                            <th width = "15%">신고자 ID</th>
                                            <td width = "35%">
                                                <input class="w-100" type="text" name = "reporter" spellcheck="false" ondblclick="this.checked=false"> 
                                            </td>
                                            
                                            <th width = "15%">크리에이터</th>
                                            <td width = "35%">
                                                <input class="w-100" type="text"  name="creid" spellcheck="false" ondblclick="this.checked=false">
                                            </td>
                                            
                                        </tr>
                                        <tr height="38">
                                            <th>강의명</th>
                                            <td>
                                                <input name="ttl" class="w-100" type="text" spellcheck="false" ondblclick="this.checked=false">
                                            </td>
                                            <th>신고유형</th>
                                            <td>
                                                <select name="type" id="ct">
                                                	<option value="">전체</option>
                                                    <option value="RPT01">부적절한콘텐츠</option>
                                                    <option value="RPT02">피싱또는스펨</option>
                                                    <option value="RPT03">기타</option>
                                                </select>
                                            </td>
                                            
                                        </tr>
                                        <tr height="38">
                                            <th>신고날짜</th>
                                            <td class="text-left">
                                                <input class="w-30" type="date" spellcheck="false" id="haq" name="start" ondblclick="this.checked=false" >
                                                <i class="fas fa-minus mx-1"></i>
                                                <input class="w-30" type="date" spellcheck="false" id="haq1" name="end" ondblclick="this.checked=false">
                                            </td>
                                            <th>처리상태</th>
                                            <td class="text-left">
                                                <input type="radio" class="ml-2" name=rpStCode id="t" spellcheck="false" ondblclick="this.checked=false" value="RPS02">
                                                <label for="t" class="mr-3 mb-0">처리</label>
                                                <input type="radio" name="rpStCode" id="r" spellcheck="false" ondblclick="this.checked=false" value="RPS01">
                                                <label for="r" class="mb-0">미처리</label>
                                                 <input type="radio" name="rpStCode" id="r" spellcheck="false" ondblclick="this.checked=false" value="RPS03">
                                                <label for="r" class="mb-0">반려</label>
                                            </td>
                                        </tr>
                                    </table>
                                    <button class="btn btn-secondary position-absolute" style="width: 70px; height: 33px; right: 5px; bottom: 19px;">검색</button>
                                </div>
                                </form>
                                <div class="row">
                                    <table class="table table-bordered">
                                        <thead>

                                            <tr style="background-color: #eeeeee;">
                                                <th style="width: 100px;">번호</th>
                                                <th style="width: 150px;">신고유형</th>
                                                <th style="width: 130px;">크리에이터</th>
                                                <th >강의명</th>
                                                <th style="width: 130px;">신고자</th>
                                                <th style="width: 120px;">신고날짜</th>
                                                <th style="width: 100px;">상태</th>
                                                
                                            </tr>
                                        </thead>
                                    <tbody id="mo" onmouseover = "setCursor(this,'pointer')">
                                   		<c:forEach items = "${list }" var = "list">
                                        <tr id="mod" onclick="location.href='/admin/adLRepS?rpNo=${list.rpNo }'">
                                            <td>${list.rpNo }</td>
                                            <td>
                                                   <c:if test="${list.type eq 'RPT01' }">
                                                부적절한 컨텐츠
                                                </c:if>
                                                <c:if test="${list.type eq 'RPT02' }">
                                                피싱또는 스팸
                                                </c:if>
                                                <c:if test="${list.type eq 'RPT03' }">
                                                기타
                                                </c:if>
                                            <td>${list.creid }</td>
                                            <td>${list.ttl }</td>
                                            <td>${list.reporter }</td>
                                            <td>${list.rpdate }</td>
                                            <td>
                                                <c:if test = "${list.rpStCode eq 'RPS01' }">
	                                            	미처리
	                                            </c:if>
	                                            <c:if test="${list.rpStCode eq 'RPS02' && list.ltStCode eq 'L04' }">
	                                            	 처리 - 신고
	                                            </c:if>
	                                            <c:if test="${list.rpStCode eq 'RPS02' && list.ltStCode eq 'L06' }">
	                                            	 처리 - 수정완료
	                                            </c:if>
	                                            <c:if test="${list.rpStCode eq 'RPS02' && list.ltStCode ne 'L04' && list.ltStCode ne 'L06'}">
	                                            	 처리 - 정상처리
	                                            </c:if>
	                                             <c:if test="${list.rpStCode eq 'RPS03' }">
	                                            	 반려
	                                            </c:if>
	                                            
                                                
                                           </td>
                                        </tr>
                                          </c:forEach>
                                    </tbody>
                                    </table>
                                </div>
                               <div class="row d-flex justify-content-center position-relative">
                                    <div class="dataTables_paginate paging_simple_numbers" id="zero_config_paginate">
                                        <ul class="pagination">
                                        <c:if test = "${pageMaker.prev }">
                                            <li class="paginate_button page-item previous"
                                                id="zero_config_previous"><a href=" ${pageMaker.startpage }" aria-controls="zero_config"
                                                    data-dt-idx="0" tabindex="0" class="page-link"><i class="mdi mdi-chevron-double-left"></i>previous</a></li>
												                                         
                                          </c:if>
                                            
                                     	<c:forEach var = "num" begin = "${pageMaker.startpage }" end = "${pageMaker.endpage}">
                                     	<li class = "paginate_button page-item  ${pageMaker.vot.pageNum == num? 'active':'' }">
                                     	<a href="${num}"aria-controls="zero_config" data-dt-idx="${num}" tabindex="0"class="page-link">${num}</a>
                                     	</li>
                                     	</c:forEach>
                                            
                                            
                                            <c:if test = "${pageMaker.next }">
                                            <li class="paginate_button page-item next" id="zero_config_next"><a href="${pageMaker.endPage +1 }"
                                                    aria-controls="zero_config" data-dt-idx="6" tabindex="0"
                                                    class="page-link"><i class="mdi mdi-chevron-double-right"></i>next</a></li>
                                        	</c:if>
                                        </ul>
                                    </div>
                                    <form id='actionFrom' method = 'get' action = '/admin/adRRepL'>
	                                    <input type = 'hidden' name = 'pageNum' value = '${pageMaker.vot.pageNum }'>
	                                    <input type = 'hidden' name = 'amount' value = '${pageMaker.vot.amount }'>
                                    </form>
                                    <div class="position-absolute" style="right: 1px;">
                                        
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
           
</body>

<script type="text/javascript">
$(".paginate_button a").on("click" , function(e) {
	e.preventDefault();
	console.log('click');
	
	$('#actionFrom').find("input[name='pageNum']").val($(this).attr("href"));
	$('#actionFrom').submit();
});

function setCursor(str,str2){
    str.style.cursor = str2;
}

</script>
</html>