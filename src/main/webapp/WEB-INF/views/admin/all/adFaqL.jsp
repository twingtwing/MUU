<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <style>
        table tr,
        table td {
            text-align: center;
            vertical-align: middle;
        }
        
        tr .faq_chg:hover{
        	cursor: pointer;
        	text-decoration: underline;
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
            <!-- 페이지명-->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <!-- 페이지명 작성 및 카테고리 작성 -->
                        <h4 class="page-title">자주묻는질문</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/admin/home">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">자주묻는질문</li>
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
                                <form action="/admin/adFaqL" method="get">
                                	<div class="row position-relative">
	                                    <table class="admin_search table table-bordered">
	                                        <tr height="38">
	                                            <th width="15%" class="align-middle">질문</th>
	                                            <td width="35%" class="align-middle">
	                                                <input class="w-100" type="text" name="qcontent" spellcheck="false">
	                                            </td>
	                                            <th class="align-middle">카테고리</th>
	                                            <td>
	                                                <div>
	                                                    <select name="ctgr" class="text-center w-100">
	                                                        <option value="" selected>전체</option>
	                                                        <option value="CQ01">결제</option>
	                                                        <option value="CQ02">배송</option>
	                                                        <option value="CQ03">강의</option>
	                                                        <option value="CQ04">회원정보/보안</option>
	                                                        <option value="CQ05">오류</option>
	                                                        <option value="CQ06">환불</option>
	                                                    </select>
	                                                </div>
	                                            </td>
	                                        </tr>
	                                        <tr height="38">
	                                            <th class="align-middle">작성일</th>
	                                            <td>
	                                                <div class="row ml-1">
	                                                    <div><input name="start" type="date"></div>
	                                                    <div class="ml-3 mr-3"><i class="fa fa-minus"></i></div>
	                                                    <div><input name="end" type="date"></div>
	                                                </div>
	                                            </td>
	                                            <th>상태</th>
	                                            <td class="text-left align-middle">
	                                            	<div class="row">
	                                            		<div class="align-self-center">
		        	                                        <input type="checkbox" class="ml-3 mr-1" name="fstcode" value="F01" id="code_1" spellcheck="false">
	                                            		</div>
	    	                                            <label for="code_1" class="mr-3 mb-0">등록</label>
	    	                                            <div class="align-self-center">
			                                                <input type="checkbox" class="mx-1" name="fstcode" value="F02" id="code_2" spellcheck="false">
	    	                                            </div>
		                                                <label for="code_2" class="mb-0 mr-3">삭제</label>
	                                            	</div>
	                                            </td>
	                                        </tr>
	                                    </table>
	                                    <button type="submit" class="btn btn-secondary position-absolute" style="width: 75px; height: 33px; right: 5px; bottom: 19px;">검색</button>
                                	</div>
                                </form>
                                <div class="row">
                                    <div class="col-8">
                                        <div class="row">
                                            <table class="table table-bordered">
                                                <tr style="background-color: #eeeeee;">
                                                    <th>번호</th>
                                                    <th>카테고리</th>
                                                    <th class="w-50">질문</th>
                                                    <th>작성자</th>
                                                    <th>작성일</th>
                                                </tr>
                                                <c:if test="${empty list }">
                                                	<tr>
                                                		<td colspan="5" class="font-weight-bold py-5">데이터가 없습니다.</td>
                                                	</tr>
                                                </c:if>
                                                <c:if test="${not empty list}">
                                                	<c:forEach items="${list}" var="faq" varStatus="val">
		                                                <tr data-no="${val.index}">
		                                                    <td>${faq.fno}</td>
		                                                    <td>${faq.ctgr}</td>
		                                                    <td class="faq_chg">${faq.qcontent}</td>
		                                                    <td>관리자</td>
		                                                    <td><fmt:formatDate value="${faq.wrdate}" pattern="yyyy-MM-dd"/></td>
		                                                </tr>
                                                	</c:forEach>
                                                </c:if>
                                            </table>
                                        </div>
                                        <div class="row d-flex justify-content-center position-relative">
		                                    <div class="dataTables_paginate paging_simple_numbers" id="zero_config_paginate">
		                                        <ul class="pagination">
		                                        <c:if test = "${pageMaker.prev }">
		                                            <li class="paginate_button page-item previous"
		                                                id="zero_config_previous"><a href=" ${pageMaker.startpage -1 }" aria-controls="zero_config"
		                                                    data-dt-idx="0" tabindex="0" class="page-link"><i class="mdi mdi-chevron-double-left"></i>previous</a></li>
		                                          </c:if>
		                                     	<c:forEach var = "num" begin = "${pageMaker.startpage }" end = "${pageMaker.endpage }">
		                                     	<li class = "paginate_button page-item  ${pageMaker.fvo.pageNum == num? 'active':'' }">
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
		                                    <form id='actionFrom' method = 'get' action = '/admin/adFaqL'>
			                                    <input type = 'hidden' name = 'pageNum' value = '${pageMaker.fvo.pageNum }'>
			                                    <input type = 'hidden' name = 'amount' value = '${pageMaker.fvo.amount }'>
		                                    </form>
		                                    <div class="position-absolute" style="right: 1px;">
		                                        <button id="faqInsert" class="btn btn-dark">글 등록</button>
		                                        <button class="btn btn-danger">PDF다운</button>
		                                        <button class="btn btn-success">EXCEL다운</button>
		                                    </div>
		                                </div>
                                    </div>
                                    <div class="col-4 px-3">
                                        <div id="faq_none" class="faq_tab col-12" style="border: 2px solid #eeeeee">
                                            <div class="row justify-content-center align-items-center position-relative" style="height: 30vh;">
                                                <i class="fas fa-spinner text-success position-absolute" style="font-size: 200px; opacity: 20%;"></i>
                                                <h4 class="font-weight-bold">선택한 정보가 없습니다.</h4>
                                            </div>
                                        </div>
                                        <div id="faq_select" class="faq_tab col-12 d-none" style="border: 2px solid #eeeeee">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="row p-2"
                                                        style="background-color: #eeeeee; border-bottom: 1px solid black; border-top: 2px solid black;">
                                                        <h5 class="mb-0">제목</h5>
                                                        <h5 class="mb-0 ml-2" style="font-weight: 500;">강의를 듣고 싶은데 어떻게 하나요</h5>
                                                    </div>
                                                    <div class="row justify-content-between p-2"
                                                        style="background-color: #eeeeee; border-bottom: 2px solid black;">
                                                        <div class="row">
                                                            <h6 class="mb-0 ml-2 pl-1">번호</h6>
                                                            <h6 class="mb-0 ml-2" style="font-weight: 500;">000</h6>
                                                        </div>
                                                        <div class="row">
                                                            <div class="row mr-4">
                                                                <h6 class="mb-0">카테고리</h6>
                                                                <h6 class="mb-0 ml-2" style="font-weight: 500;">강의</h6>
                                                            </div>
                                                            <div class="row mr-4">
                                                                <h6 class="mb-0">작성일자</h6>
                                                                <h6 class="mb-0 ml-2" style="font-weight: 500;">0000-00-00</h6>
                                                            </div>
                                                            <div class="row mr-1">
                                                                <h6 class="mb-0">상태</h6>
                                                                <h6 class="mb-0 ml-2" style="font-weight: 500;">삭제</h6>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="card">
                                                    <div class="card-body" style="height: 20vh;">
                                                        카드안에 카드바디가 존재하는거임
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 상태가 삭제면 보이면 안됨 -->
                                            <div class="row d-flex justify-content-end mb-2">
                                                <button type="button" class="btn btn-secondary">수정</button>
                                                <button type="button" class="btn btn-secondary ml-1 mr-2">삭제</button>
                                            </div>
                                        </div>
                                        <div id="faq_Insert" class="faq_tab col-12 d-none" style="border: 2px solid #eeeeee">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="row p-2" style="background-color: #eeeeee; border-bottom: 1px solid black; border-top: 2px solid black;">
                                                        <div class="col-1 pr-0 d-flex align-items-center">
                                                            <h5 class="mb-0">제목</h5>
                                                        </div>
                                                        <div class="col-11 px-0">
                                                            <input class="w-100" type="text" spellcheck="false" value="">
                                                        </div>
                                                    </div>
                                                    <div class="row p-2" style="background-color: #eeeeee; border-bottom: 2px solid black;">
                                                        <div class="col-2 pr-0 d-flex align-items-center">
                                                            <h6 class="mb-0">카테고리</h6>
                                                        </div>
                                                        <div class="col-10 px-0">
                                                            <select>
                                                                <option selected>선택</option>
                                                                <option value="1">강의</option>
                                                                <option value="2">배송</option>
                                                                <option value="3">결제</option>
                                                                <option value="3">아이디정보/보안</option>
                                                                <option value="3">오류</option>
                                                                <option value="3">이벤트</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="row form-group pt-3 px-2">
                                                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="10"></textarea>
                                                    </div>
                                                    <div class="row d-flex justify-content-end mb-2">
                                                        <button type="button" class="btn btn-secondary">등록</button>
                                                        <button type="button" class="btn btn-secondary ml-2 mr-2">취소</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="faq_Update" class="faq_tab col-12 d-none" style="border: 2px solid #eeeeee">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="row p-2" style="background-color: #eeeeee; border-bottom: 1px solid black; border-top: 2px solid black;">
                                                        <div class="col-1 pr-0 d-flex align-items-center">
                                                            <h5 class="mb-0">제목</h5>
                                                        </div>
                                                        <div class="col-11 px-0">
                                                            <input class="w-100" type="text" spellcheck="false" value="자주묻는글 수정">
                                                        </div>
                                                    </div>
                                                    <div class="row justify-content-between p-2" style="background-color: #eeeeee; border-bottom: 2px solid black;">
                                                        <div class="row align-items-center">
                                                            <h6 class="mb-0 ml-2 pl-1">번호</h6>
                                                            <h6 class="mb-0 ml-2" style="font-weight: 500;">000</h6>
                                                        </div>
                                                        <div class="row align-items-center">
                                                            <h6 class="mb-0 mr-2">카테고리</h6>
                                                            <select>
                                                                <option selected>선택</option>
                                                                <option value="1">강의</option>
                                                                <option value="2">배송</option>
                                                                <option value="3">결제</option>
                                                                <option value="3">아이디정보/보안</option>
                                                                <option value="3">오류</option>
                                                                <option value="3">이벤트</option>
                                                            </select>
                                                            <h6 class="mb-0 ml-2">작성일자</h6>
                                                            <h6 class="mb-0 mx-2" style="font-weight: 500;">0000-00-00</h6>
                                                        </div>
                                                    </div>
                                                    <div class="row form-group pt-3 px-2">
                                                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="10">수정수정</textarea>
                                                    </div>
                                                    <div class="row d-flex justify-content-end mb-2">
                                                        <button type="button" class="btn btn-secondary">수정</button>
                                                        <button type="button" class="btn btn-secondary ml-2 mr-2">취소</button>
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
                <!-- 내용 끝 -->

                <!-- 바디 끝 -->
	<script type="text/javascript">
		$('.faq_chg').on('click',function(){
			let index = $(event.target).closest('tr').attr('data-no');
			$('.faq_tab').addClass('d-none');
			$('#faq_select').removeClass('d-none');
		});
		
		//insert input값 저장 금지 백업
		$('#faqInsert').on('click',function(){
			let index = $(event.target).closest('tr').attr('data-no');
			$('.faq_tab').addClass('d-none');
			$('#faq_Insert').removeClass('d-none');
		});
		
		//update값 저장 금지 백업??
		$('#faqInsert').on('click',function(){
			let index = $(event.target).closest('tr').attr('data-no');
			$('.faq_tab').addClass('d-none');
			$('#faq_Update').removeClass('d-none');
		});
		
		$(".paginate_button a").on("click" , function(e) {
			e.preventDefault();
			console.log('click');
			
			$('#actionFrom').find("input[name='pageNum']").val($(this).attr("href"));
			$('#actionFrom').submit();
		});
	</script>
</body>
</html>