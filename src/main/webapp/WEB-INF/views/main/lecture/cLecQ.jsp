<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

        #cctgy>li {
            cursor: pointer;

        }

        .list-link {
            color: black;
        }

        .list-link.active {
            font-weight: bold;
            color: #e53637;

        }

        form .nice-select{
            height: 38px;
        }
        a {
        	cursor : pointer;
        }
        table {
        	table-layout : fixed;
        }
        td {
        	text-overflow:ellipsis; 
        	overflow:hidden; 
        	white-space:nowrap;
        } 
       
    </style>
</head>
<body>
 <section class="normal-breadcrumb set-bg" data-setbg="/resources/img/normal-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>질문답변</h2>
                        <p>질문답변게시판</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 배너끝 -->

    <!-- 카테고리 시작-->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="#" class="text-dark font-weight-bold"><i class="fa fa-home"></i> Home</a>
                        <a href="#" class="text-dark font-weight-bold"> 내 강의 목록</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 카테고리 끝-->

    <!-- body 의 body-->
    <section class="blog spad">
        <div class="container">
            <div class="row">
                <!--사이드바-->
                <div class="col-lg-2">
                    <div class="row" style="width:160px">
                        <ul class="list-group w-100" id="cctgy">
                            <!-- 해당 상위카테고리 일때, active가 보여야함 => 자바스크립트 혹은 jstl if구문으로 해결해야함 
                             이때 상태에 따라서 열린강의인지 종료된강의인지 구별해야함
                            -->
                              <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
			                      <a class="list-link" href="/creator/creS">크리에이터 정보</a>
			                  </li>
			                  <p class="list-group-item border-bottom-0 mb-0 align-items-center d-flex mylist">내 강의 목록</p>
			                  <li class="list-group-item border-bottom-0 align-items-center d-flex pl-40" style="height: 35px;">
			                      <a class="list-link" href="/creator/rLecL">&nbsp;&nbsp;- 신청한 강의</a>
			                  </li>
			                  <c:choose>
			                  <c:when test="${lecinfo.ltStCode eq 'L01' }">
			                  <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
			                      <a class="list-link active" href="/creator/oLecL">&nbsp;&nbsp;- 열린 강의</a>
			                  </li>
			                  <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
			                      <a class="list-link" href="/creator/clLecL">&nbsp;&nbsp;- 종료된 강의</a>
			                  </li>
			                  </c:when>
			                  <c:when test="${lecinfo.ltStCode eq 'L03' }">
			                  <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
			                      <a class="list-link" href="/creator/oLecL">&nbsp;&nbsp;- 열린 강의</a>
			                  </li>
			                  <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
			                      <a class="list-link active" href="/creator/clLecL">&nbsp;&nbsp;- 종료된 강의</a>
			                  </li>
			                  </c:when>
			                  </c:choose>
			                  <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
			                      <a class="list-link" href="/creator/rpLecL">&nbsp;&nbsp;- 신고된 강의</a>
			                  </li>
			                  <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
			                      <a class="list-link" href="/creator/lecI">강의등록</a>
			                  </li>
			                  <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
			                      <a class="list-link" href="/creator/creSaleYear">매출내역</a>
			                  </li>
			                  <li class="list-group-item align-items-center d-flex" style="height: 55px;">
			                      <a class="list-link" href="/creator/creRefund">환불 요청 내역</a>
			                  </li>
                        </ul>

                    </div>
                </div>
                <!--사이드바-->
                <div class="col-lg-10">
                    <div class="row ml-2">
                        <h5 class="ml-1 mb-2 font-weight-bold">
                            <i class="fa fa-hand-paper-o text-danger" aria-hidden="true"></i>
                            <c:if test="${lecinfo.ltStCode eq 'L01' }">
			                열린 강의 정보
			                </c:if>
			                <c:if test="${lecinfo.ltStCode eq 'L03' }">
			                닫힌 강의 정보
		                	</c:if>	
                            <!-- 상태에 따라 닫힌인지 열린인지 달라짐 -->
                        </h5>
                    </div>

                    <hr class="font-weight-bold">
                    <!-- 강의 하나에 대한 상세정보페이지-->
                    <div class="row col-12 mb-5 ml-3">
                        <!-- 제목 입력 / 제목 가져오기-->
                        <h5 class="mx-4 my-3 font-weight-bold">강의제목 : <strong class="text-danger">${lecinfo.ttl }</strong></h5>

                        <div class="row col-12">
                            <div class="row col-12 mt-3 mb-3 justify-content-around">
                                <!-- 선택 : active -->
                                  <c:if test="${lecinfo.ltStCode eq 'L01' }">
				                  <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="gooLecture(${lecinfo.ltNo })">강의정보</button>
					              </c:if>
					              <c:if test="${lecinfo.ltStCode eq 'L03' }">
					              <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="goclLecture(${lecinfo.ltNo })">강의정보</button>
					              </c:if>
				                  <button class="btn btn-outline-secondary lecbtn active" style="width: 150px;" type="button" onclick="goQna(${lecinfo.ltNo })">질문&답변</button>
				                  <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="goNotice(${lecinfo.ltNo })">공지사항</button>
				                  <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="goReview(${lecinfo.ltNo })">리뷰</button>
				                  <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="goStudent(${lecinfo.ltNo })">수강생</button>
                            </div>
                        </div>

                        <div class="row col-12 justify-content-end mt-3 mb-1">
                            <!--여기서 부터임-->
                             <div class="row mr-1">
                                 <div>
                                 	 <select id="qnayn" onchange="qnasearch()">
                                 	 	 <option value="">전체</option>
                                 	 	 <option value="Q02">처리</option>
                                 	 	 <option value="Q01">미처리</option>
                                 	 </select>
                                     <select id="qnasearch">
                                         <option value="질문내용">질문내용</option>
                                         <option value="작성자">작성자</option>
                                     </select>
                                 </div>
                                 <input class="border mb-0 ml-1" id="qnainput" style="height: 37px; width: 170px" type="text"
                                     placeholder="검색..." spellcheck=false onfocus="this.select()" onkeypress="if(event.keyCode==13){qnasearch();}">
                                 <a class="btn btn-outline-secondary search-a searchBtn" onclick="qnasearch()"><i class="icon_search"></i></a>
         
                             </div>
                        </div>
        
                        <div class="row col-12">
                            <table class="table">
                                <thead style="text-align:center" >
                                    <tr class="table-secondary border-top-0">
                                        <!-- ...처리하기 -->
                                        <th>질문내용</th>
                                        <th style="width: 160px;">작성자</th>
                                        <th style="width: 150px;">작성일자</th>
                                        <th style="width: 100px;">답변여부</th>
                                    </tr>
                                </thead>
                                <tbody id="mo" style="text-align:center">
                                <c:if test="${qnalist == '[]'}">
                                	<tr>
                                		<td colspan="4">등록된 질문이 없습니다</td>
                                	</tr>
                                </c:if>
                                <c:if test="${qnalist != '[]'}">
                                	<c:forEach items="${qnalist}" var="list" varStatus="status">
	                                    <tr data-toggle="modal" data-target="#qnamodal" 
	                                    data-qcontent='${list.qContent }' data-qregdate='${list.qRegDate }'
	                                    data-writer='${list.writer }' data-qnano='${list.qnaNo }'
	                                    data-qnastcode='${list.qnaStCode }' data-acontent='${list.aContent }'
	                                    style="cursor:pointer;">
	                                        <td id="qcontent">${list.qContent }</td>
	                                        <td>${list.writer }</td>
	                                        <td>${list.qRegDate }</td>
	                                        <c:if test="${list.qnaStCode == 'Q01' }">
	                                        <td class="text-danger">미처리</td>
	                                        </c:if>
	                                        <c:if test="${list.qnaStCode == 'Q02' }">
	                                        <td class="text-success">처리</td>
	                                        </c:if>
	                                    </tr>
	                                </c:forEach>
	                              </c:if>
                                </tbody>
                            </table>
                        </div>

                        <div class="row col-12 justify-content-center mt-3">
                            <div class="product__pagination">
                                <c:if test="${pagination.currRange ne 1}">
									<a><i class="fa fa-angle-double-left"></i></a>
								</c:if>
								<c:forEach begin="${pagination.startPage }" end="${pagination.endPage }" var="page">
									<c:choose>
										<c:when test="${page eq pagination.currPage}">
											<a class="current-page paging">${page}</a>
										</c:when>
										<c:otherwise>
											<a class="paging">${page}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${pagination.currRange ne pagination.pageCnt && pagination.pageCnt > 0}">
									<a><i class="fa fa-angle-double-right"></i></a>
								</c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <!-- click이벤트를 통해서 질문 값을 가지고 와야함
        tr에 따라서 달랴아함 -->
        <div class="modal fade" id="qnamodal" tabindex="-1" role="dialog">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header border-bottom-0 d-flex justify-content-center position-relative">
                    <h5 class="font-weight-bold mt-2">답변 작성</h5>
                    <button type="button" class="close position-absolute" data-dismiss="modal" aria-label="Close" style="right: 15px; top: 6px;">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body border-bottom-0 mb-3" id="modal-body">
                    <div class="col-lg-12">
                        <div class="row mb-4 justify-content-between">
                            <div class="col-lg-9 pr-0" style="min-height: 103px;">
                                <div class="h-100 p-2 d-flex align-items-center" style="border: 1px solid black; width:280px;">
                                    <p class="mb-0" id="inputQ"></p>
                                </div>
                            </div>
                            <div class="col-lg-3 d-flex justify-content-end align-items-end pl-0"> 
                                <div>
                                    <p class="mb-0 text-left">작성자 : <strong id="inputWriter"></strong></p>
                                    <p class="mb-0 text-left" id="inputQregdate"></p>
                                    <input type="hidden" id="inputqnaNo" value="">
                                </div>
                            </div>
                        </div>
                        <div class="row justify-content-between mx-1">
                            <div class="align-self-start" style="transform: rotate(180deg);">
                                <i class="arrow_back" style="font-size: 70px;"></i>
                            </div>
                            <textarea name="aw" id="qnAnswer" cols="30" rows="4"></textarea> 
                            <button type="button" id="updateBtn" class="btn btn-outline-dark" onclick="aUpdate()">저장</button>
                        </div>
                    </div>
                </div>
            </div>
          </div>
        </div>
    </section>
<form id="frm">
  	<input class="sendltno" type="hidden" name="ltNo" value="">
</form>
<form id="pageFrm">
   	<input class="sendltno" type="hidden" name="ltNo" value="">
   	<input class="spage" type="hidden" name="page" value="">
</form>
<form id="pagesearchFrm">
    <input class="sendltno" type="hidden" name="ltNo" value="${lecinfo.ltNo}">
   	<input class="sendcontent" type="hidden" name="contentSearchKey" value="">
   	<input class="sendwriter" type="hidden" name="writerSearchKey" value="">
   	<input class="sendqnastcode" type="hidden" name="qnaStCodeSearchKey" value="">
   	<input class="spage" type="hidden" name="page" value="">
</form>
<form id="searchFrm">
	<input class="sendltno" type="hidden" name="ltNo" value="${lecinfo.ltNo }">
	<input class="sendcontent" type="hidden" name="contentSearchKey" value="">
	<input class="sendwriter" type="hidden" name="writerSearchKey" value="">
	<input class="sendqnastcode" type="hidden" name="qnaStCodeSearchKey" value="">
</form>
</body>
<script type="text/javascript">
$(function(){
	$('select').niceSelect('destroy');
})

//클릭한 QnA 정보
$('#qnamodal').on('show.bs.modal', function(e){
	let acontent = $(e.relatedTarget).data('acontent');
	acontent = brDel(acontent);
	let qcontent = $(e.relatedTarget).data('qcontent');
	qcontent = brDel(qcontent);
	$('#inputQ').text(qcontent);
	$('#inputWriter').text($(e.relatedTarget).data('writer'));
	$('#inputQregdate').text($(e.relatedTarget).data('qregdate'));
	$('#inputqnaNo').val($(e.relatedTarget).data('qnano'));
	if($(e.relatedTarget).data('qnastcode')=='Q02'){
		$('#updateBtn').attr('style','display:none');
		$('#qnAnswer').val(acontent);
		$('#qnAnswer').attr('readonly', true);
	} else {
		$('#updateBtn').attr('style','display:block');
		$('#qnAnswer').val('');
		$('#qnAnswer').attr('readonly', false);
	}
})

//시큐리티 토큰
let header = "${_csrf.headerName}";
let token = "${_csrf.token}";

//검색 키워드 선언
let contentSearchKey;
let writerSearchKey;
let qnastcodeSearchKey;

$(function(){
	$('.paging').on('click', function(){
		//검색 후 페이지 이동
		if($('#qnainput').val() != null){
			$('.spage').val($(this).text());
			qnastcodeSearchKey = $('#qnayn option:selected').val();
			if($('#qnasearch option:selected').val() == '작성자'){
				writerSearchKey = $('#qnainput').val();
		  	} else if($('#qnasearch option:selected').val() == '질문내용'){
				contentSearchKey = $('#qnainput').val();
			}
			$('.sendttl').val(writerSearchKey);
		    $('.sendcontent').val(contentSearchKey);
		    $('.sendqnastcode').val(qnastcodeSearchKey);
		  	$('#pagesearchFrm').attr('action', '/creator/cLecQpagesearch');
		  	$('#pagesearchFrm').submit();
		  	
		//페이지 이동
		} else {
			$('.sendltno').val(${lecinfo.ltNo});
			$('.spage').val($(this).text());
		  	$('#pageFrm').attr('action', '/creator/cLecQpage');
		  	$('#pageFrm').submit();
		}
	})
})
//mouseover 이벤트 : 사이드바 css변경
$('#cctgy > .list-group-item:not(.mylist)').on('mouseover', function () {
    $(this).css('background-color', '#e53637');
    $(this).find('.list-link').css('color', '#ffffff');
})

//mouseover 이벤트 : 사이드바 css변경
$('#cctgy > .list-group-item:not(.mylist)').on('mouseout', function () {
    $(this).css('background-color', '#ffffff');
    $(this).find('.list-link').css('color', '#000000');
    $(this).find('.list-link.active').css('color', '#e53637');
})
//열린강의정보 페이지 이동
function gooLecture(e){
	$('.sendltno').val(e);
	$('#frm').attr("action", "/creator/oLecS");
	$('#frm').submit();
}
//닫힌강의정보 페이지 이동
function goclLecture(e){
	$('.sendltno').val(e);
	$('#frm').attr("action", "/creator/clLecS");
	$('#frm').submit();
}
//qna 페이지 이동
function goQna(e){
	$('.sendltno').val(e);
	$('#frm').attr("action", "/creator/cLecQ");
	$('#frm').submit();
}
//공지사항 페이지 이동
function goNotice(e){
	$('.sendltno').val(e);
	$('#frm').attr("action", "/creator/cLecNL");
	$('#frm').submit();
}
//리뷰 페이지 이동
function goReview(e){
	$('.sendltno').val(e);
	$('#frm').attr("action", "/creator/cLecR");
	$('#frm').submit();
}
//수강생 리스트 페이지 이동
function goStudent(e){
	$('.sendltno').val(e);
	$('#frm').attr("action", "/creator/cLecSt");
	$('#frm').submit();
}

//QnA 검색
function qnasearch(){
	qnastcodeSearchKey = $('#qnayn option:selected').val();
	if($('#qnasearch option:selected').val() == '질문내용'){
		contentSearchKey = $('#qnainput').val();
	} 
	if($('#qnasearch option:selected').val() == '작성자') {
		writerSearchKey = $('#qnainput').val(); 
	}
	$('.sendcontent').val(contentSearchKey);
	$('.sendwriter').val(writerSearchKey);
	$('.sendqnastcode').val(qnastcodeSearchKey);
	$('#searchFrm').attr("action", "/creator/cLecQsearch");
	$('#searchFrm').submit();
}


//검색 조회시 검색란 선입력
$(function(){
	$('#qnayn option').prop('selected', false);
	$('#qnasearch option').prop('selected', false);
	if('${inputQnaStCode}' != ''){
		$($('#qnayn option[value="${inputQnaStCode}"]')).attr('selected', 'selected');
	}
	if('${inputContent}' != ''){
		$($('#qnasearch option[value="질문내용"]')).attr('selected', 'selected');
		$('#qnainput').val('${inputContent}');
	}
	if('${inputWriter}' != ''){
		$($('#qnasearch option[value="작성자"]')).attr('selected', 'selected');
		$('#qnainput').val('${inputWriter}');
	}
}) 

//답변 업데이트
function aUpdate(){
	let aContent = $('#qnAnswer').val();
	aContent = lineMaker(aContent);
	let qnaNo = $('#inputqnaNo').val();
	
	$.ajax({
		url : '/creator/cLecQupdate',
		method : 'post',
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
		dataType : 'text',
		data : {
			aContent : aContent,
			qnaNo : qnaNo
		},
        success : function(){
        	alert('해당 질문글에 답변하였습니다');
        	location.reload();
        	
        } 
	})
	
}

//줄바꿈
const lineMaker = (e)=>{
	let inputVal = e;
	inputVal = inputVal.replace(/\r\n/ig,'<br>');
	inputVal = inputVal.replace(/\\n/ig,'<br>');
	inputVal = inputVal.replace(/\n/ig,'<br>');
	return inputVal;
}

//br없애기
const brDel = (e)=>{
	let inputVal = e;
	inputVal = inputVal.replace(/<br>/ig,'\n');
	inputVal = inputVal.replace(/<\/br>/ig,'\n');
	inputVal = inputVal.replace(/<br\/>/ig,'\n');
	return inputVal
}

$(function(){
	let tdval = $('#qcontent').text();
	tdval = brDel(tdval);
	$('#qcontent').text(tdval);
})



    </script>
</html>