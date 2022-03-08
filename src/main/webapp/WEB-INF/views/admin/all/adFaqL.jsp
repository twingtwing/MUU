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
        #ho:hover{
        background-color:#f5f5f5;
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
	                                            <td colspan="3">
	                                                <div class="row ml-1">
	                                                    <div><input name="start" type="date"></div>
	                                                    <div class="ml-3 mr-3"><i class="fa fa-minus"></i></div>
	                                                    <div><input name="end" type="date"></div>
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
                                            <table id="faq_Table" class="table table-bordered">
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
                                                	<c:forEach items="${list}" var="faq" varStatus="val" >
		                                                <tr data-no="${val.count}" id="ho">
		                                                    <td class="fno">${faq.fno}</td>
		                                                    <td class="ctgr" data-code="${faq.ctgr}">${faq.ctgrName}</td>
		                                                    <td class="faq_chg qcontent">${faq.qcontent}</td>
		                                                    <td>관리자</td>
		                                                    <td class="wrdate"><fmt:formatDate value="${faq.wrdate}" pattern="yyyy-MM-dd"/></td>
		                                                	<td class="d-none acontent">${faq.acontent}</td>
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
                                                    <div class="row justify-content-between p-2"
                                                        style="background-color: #eeeeee; border-top: 2px solid black; border-bottom: 2px solid black;">
                                                        <div class="row">
                                                            <p class="mb-0 ml-2 pl-1">번호</p>
                                                            <p class="mb-0 ml-2 fno" style="font-weight: 500;"></p>
                                                        </div>
                                                        <div class="row">
                                                            <div class="row mr-4">
                                                                <p class="mb-0">카테고리</p>
                                                                <p class="mb-0 ml-2 ctgr" style="font-weight: 500;"></p>
                                                            </div>
                                                            <div class="row mr-4">
                                                                <p class="mb-0">작성일자</p>
                                                                <p class="mb-0 ml-2 wrdate" style="font-weight: 500;"></p>
                                                            </div>
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        	<div class="row form-group mb-0" style="border-bottom: 2px solid #eeeeee;">
                                                <div class="card">
                                                    <div class="card-body" style="height: 18vh;">
                                                    	<h6 class="font-weight-bold mb-0">질문</h6>
                                                    	<p class="qcontent mb-0 mt-1"></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="card">
                                                    <div class="card-body" style="height: 16vh;">
                                                    	<h6 class="font-weight-bold mb-0">답변</h6>
                                                    	<p class="acontent mb-0 mt-1"></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 상태가 삭제면 보이면 안됨 -->
                                            <div id="faq_up_del">
	                                            <div class="row d-flex justify-content-end mb-2">
	                                                <button id="faqUpdate" type="button" class="btn btn-secondary">수정</button>
	                                                <button id="faqDelete" type="button" class="btn btn-secondary ml-1 mr-2">삭제</button>
	                                            </div>
                                            </div>
                                        </div>
                                        
                                        <div id="faq_Insert" class="faq_tab col-12 d-none" style="border: 2px solid #eeeeee">
                                        	<form id="faq_Insert_frm">
	                                        	<div class="row">
	                                                <div class="col-lg-12">
	                                                    <div class="row justify-content-between p-2" style="background-color: #eeeeee; border-top: 2px solid black; border-bottom: 2px solid black;">
															<div class="align-self-center">
																<h6 class="font-weight-bold mb-0">공지사항 등록</h6>
															</div>
															<div class="row mr-1">
																<div class="align-self-center mr-1">
																	<p class="font-weight-bold mb-0">카테고리</p>
																</div>
																<select class="ctgr text-center" name="ctgr" id="oo1">
																	<option value="">전체</option>
	                                                        		<option value="CQ01">결제</option>
	                                                        		<option value="CQ02">배송</option>
	                                                        		<option value="CQ03">강의</option>
	                                                        		<option value="CQ04">회원정보/보안</option>
	                                                        		<option value="CQ05">오류</option>
	                                                        		<option value="CQ06">환불</option>
																</select>
															</div>
														</div>
			                                        	<div class="row form-group mb-0" style="border-bottom: 2px solid #eeeeee;">
			                                                <div class="card">
			                                                    <div class="card-body" style="height: 18vh;">
			                                                    	<h6 class="font-weight-bold mb-0">질문</h6>
			                                                    	<div class="row form-group pt-3 px-2">
			                                                        	<textarea  class="form-control qcontent" id="qe1" name="qcontent" cols="80" rows="5"></textarea>
			                                                    	</div>
			                                                    </div>
			                                                </div>
			                                            </div>
			                                            <div class="row form-group">
			                                                <div class="card">
			                                                    <div class="card-body" style="height: 16vh;">
			                                                    	<h6 class="font-weight-bold mb-0">답변</h6>
			                                                    	<div class="row form-group pt-3 px-2">
			                                                        	<textarea  class="form-control acontent" id="con1" name="acontent" cols="80" rows="5"></textarea>
			                                                    	</div>
			                                                    </div>
			                                                </div>
			                                            </div>
			                                            <div class="row d-flex justify-content-end mb-2">
	                                                        <button id="faqInsertFrm" type="button" class="btn btn-secondary" disabled>등록</button>
	                                                        <button type="button" class="btn btn-secondary ml-2 mr-2">취소</button>
	                                                    </div>
	                                                </div>
	                                            </div>
                                        	</form>
                                        </div>
                                        
                                        <div id="faq_Update" class="faq_tab col-12 d-none" style="border: 2px solid #eeeeee">
                                        	<form id="faq_Update_frm">
	                                            <div class="row">
	                                                <div class="col-lg-12">
	                                                	<div class="row justify-content-between p-2" style="background-color: #eeeeee; border-top: 2px solid black;">
															<div class="align-self-center">
																<h6 class="font-weight-bold mb-0">공지사항 수정</h6>
															</div>
															<div class="row mr-1">
																<div class="align-self-center mr-1">
																	<p class="font-weight-bold mb-0">카테고리</p>
																</div>
																<select class="ctgr text-center" name="ctgr" id="oo">
																	<option   value="">전체</option>
			                                                        <option value="CQ01">결제</option>
			                                                        <option value="CQ02">배송</option>
			                                                        <option value="CQ03">강의</option>
			                                                        <option value="CQ04">회원정보/보안</option>
			                                                        <option value="CQ05">오류</option>
			                                                        <option value="CQ06">환불</option>
																</select>
															</div>
														</div>
	                                                    <div class="row justify-content-between p-2"
	                                                        style="background-color: #eeeeee; border-top: 1px solid black; border-bottom: 2px solid black;">
	                                                        <div class="row">
	                                                            <p class="mb-0 ml-2 pl-1">번호</p>
	                                                            <p class="mb-0 ml-2 fno" style="font-weight: 500;"></p>
	                                                            <input type="hidden" class="fno" name="fno">
	                                                        </div>
	                                                        <div class="row">
	                                                            <div class="row mr-4">
	                                                                <p class="mb-0">작성일자</p>
	                                                                <p class="mb-0 ml-2 wrdate" style="font-weight: 500;"></p>
	                                                            </div>
	                                                        </div>
	                                                    </div>
			                                        	<div class="row form-group mb-0" style="border-bottom: 2px solid #eeeeee;">
			                                                <div class="card">
			                                                    <div class="card-body" style="height: 18vh;">
			                                                    	<h6 class="font-weight-bold mb-0">질문</h6>
			                                                    	<div class="row form-group pt-3 px-2">
			                                                        	<textarea class="form-control qcontent" id="qe" name="qcontent" cols="80" rows="5"></textarea>
			                                                    	</div>
			                                                    </div>
			                                                </div>
			                                            </div>
			                                            <div class="row form-group">
			                                                <div class="card">
			                                                    <div class="card-body" style="height: 16vh;">
			                                                    	<h6 class="font-weight-bold mb-0">답변</h6>
			                                                    	<div class="row form-group pt-3 px-2">
			                                                        	<textarea class="form-control acontent" id="con" name="acontent" cols="80" rows="5"></textarea>
			                                                    	</div>
			                                                    </div>
			                                                </div>
			                                            </div>
			                                            <div class="row d-flex justify-content-end mb-2">
	                                                        <button id="faqUpdateFrm" type="button" class="btn btn-secondary" onclick="btn()" disabled>수정</button>
	                                                        <button id="faq_chg_Back" type="button" class="btn btn-secondary ml-2 mr-2">취소</button>
	                                                    </div>
	                                                </div>
	                                            </div>
                                        	</form>
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
	// 수정
	$('#qe').keyup(function(){
		 btndisabled()
	})
	
	
	$('#con').keyup(function(){
		 btndisabled()
	})
	$('#oo').change(function(){
		btndisabled()
	})

	
	function btndisabled(){
		var qe = document.getElementById('qe').value;
		var con = document.getElementById('con').value;
		var oo = document.getElementById('oo').value;
		
		if(qe == '' || con == '' || oo == ''){
			$('#faqUpdateFrm').attr('disabled','disabled');
			
		} else if (qe !="" && con !="" && oo != ''){
			$('#faqUpdateFrm').removeAttr('disabled');
		}
	}
	
	
	// 등록
	$('#qe1').keyup(function(){
		 btndisableda()
	})
	
	$('#con1').keyup(function(){
		 btndisableda()
	})
	$('#oo1').change(function(){
		btndisableda()
	})

	
	function btndisableda(){
		var qe1 = document.getElementById('qe1').value;
		var con1 = document.getElementById('con1').value;
		var oo1 = document.getElementById('oo1').value;
		
		if(qe1 == '' || con1 == '' || oo1 == ''){
			$('#faqInsertFrm').attr('disabled','disabled');
			
		} else if (qe1 !="" && con1 !="" && oo1 != ''){
			$('#faqInsertFrm').removeAttr('disabled');
		}
	}
		$('#faqInsertFrm').on('click',function(){
			event.stopPropagation()
			//질문 답변 카테고리 유효성 검사가 필요
			
			//등록
			$.ajax({
				url : '/admin/insertfaq',
				type : 'post',
				data : $('#faq_Insert_frm').serialize(),
				beforeSend: function(xhr) {
		        	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		        }
			})
			.done((res)=>{
				if(res == 'Y') {
					alert("등록성공") ; 
					location.href = "/admin/adFaqL";
				}
				//등록성공 -> 등록성공 alert창 나오고 location.href="/admin/adFaqL"; 실행  
			})
		})
		
		$('#faqUpdateFrm').on('click',function(){
			event.stopPropagation()
			//질문 답변 카테고리 유효성 검사가 필요
			
			//수정
		
			$.ajax({
				url : '/admin/upfaq',
				type : 'post',
				data : $('#faq_Update_frm').serialize(),
				beforeSend: function(xhr) {
		        	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		        }
			})
			.done((res)=>{
				if(res == 'T'){
					alert("수정성공");
					location.href="/admin/adFaqL";
				} 
				//수정성공 -> 수정성공 alert창 나오고 location.href="/admin/adFaqL"; 실행  
			})
		
			
		})
	
		$('#faqDelete').on('click',function(){
			//삭제 진짜 진짜 삭제함
			let fno = $('#faq_select .fno')[0].innerText;
			
			$.ajax({
				url:'/admin/delfaq',
				type:'post',
				data : {fno:fno},
				beforeSend: function(xhr) {
		        	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		        }
			})
			.done((z)=>{
				if(z == 'z'){
					alert("삭제성공");
					location.href="/admin/adFaqL";
				} 
			
			})
			//삭제  -> 삭제 alert창 나오고 location.href="/admin/adFaqL"; 실행  
		})
	
		$('.faq_chg').on('click',function(){
			let index = $(event.target).closest('tr').attr('data-no');
			$('.faq_tab').addClass('d-none');
			$('#faq_select').removeClass('d-none');
			changeTab(index);
		});
		
		//insert input값 저장 금지 백업
		$('#faqInsert').on('click',function(){
			let index = $(event.target).closest('tr').attr('data-no');
			$('.faq_tab').addClass('d-none');
			$('#faq_Insert').removeClass('d-none');
		});
		
		//update값 저장 금지 백업??
		$('#faqUpdate').on('click',function(){
			$('.faq_tab').addClass('d-none');
			$('#faq_Update').removeClass('d-none');
		});
		
		$('#faq_chg_Back').on('click',function(){
			$('.faq_tab').addClass('d-none');
			$('#faq_select').removeClass('d-none');
		});
		
		function changeTab(index) {
			let tr = $('#faq_Table tr')[index];
			$('#faq_select .fno')[0].innerText = $(tr).find('.fno')[0].innerText;
			$('#faq_Update .fno')[0].innerText = $(tr).find('.fno')[0].innerText;
			$('#faq_Update .fno')[1].value = $(tr).find('.fno')[0].innerText;
			
			$('#faq_select .ctgr')[0].innerText = $(tr).find('.ctgr')[0].innerText;
			$('#faq_Update .ctgr')[0].value = $($(tr).find('.ctgr')[0]).data('code');
			
			$('#faq_select .qcontent')[0].innerText = $(tr).find('.qcontent')[0].innerText;
			$('#faq_Update .qcontent')[0].value = $(tr).find('.qcontent')[0].innerText;
			
			$('#faq_select .wrdate')[0].innerText = $(tr).find('.wrdate')[0].innerText;
			$('#faq_Update .wrdate')[0].innerText = $(tr).find('.wrdate')[0].innerText;

			$('#faq_select .acontent')[0].innerText = $(tr).find('.acontent')[0].innerText;
			$('#faq_Update .acontent')[0].value = $(tr).find('.acontent')[0].innerText;
			
			
		}
		
		$(".paginate_button a").on("click" , function(e) {
			e.preventDefault();
			console.log('click');
			$('#actionFrom').find("input[name='pageNum']").val($(this).attr("href"));
			$('#actionFrom').submit();
		});
	</script>
</body>
</html>