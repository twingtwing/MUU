<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/creator-menu.css" type="text/css">
<style>
    #wrmodal {
      margin-top: 12rem;
    }
    #stars .gr {
      color: gray;
      cursor: pointer;
    }
    .wrbox {
      height: 20rem;
    }
    #span .selected {
      color: var(--danger)
    }
    a {
      color: var(--secondary);
    }
  </style>
</head>
<body>
<!-- 배너 시작-->
  <section class="normal-breadcrumb set-bg" data-setbg="/resources/img/normal-breadcrumb.jpg">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <div class="normal__breadcrumb__text">
            <h2>크리에이터 페이지</h2>
            <p>환불 요청 내역</p>
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

<section class="blog spad">
    <div class="container">
      <div class="row">

        <div class="col-lg-2">
          <div class="row" style="width:160px">
            <ul class="list-group w-100" id="cctgr">
                      <!-- 해당 상위카테고리 일때, active가 보여야함 => 자바스크립트 혹은 jstl if구문으로 해결해야함 -->
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
          <div class="row col-12 mb-2 ml-3">
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
                  <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="goQna(${lecinfo.ltNo })">질문&답변</button>
                  <button class="btn btn-outline-secondary lecbtn active" style="width: 150px;" type="button" onclick="goNotice(${lecinfo.ltNo })">공지사항</button>
                  <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="goReview(${lecinfo.ltNo })">리뷰</button>
                  <button class="btn btn-outline-secondary lecbtn" style="width: 150px;" type="button" onclick="goStudent(${lecinfo.ltNo })">수강생</button>
                  </div>
                </div> 
                
                <hr class="font-weight-bold">
                
                <div class="row mt-4 col-12 justify-content-center">
                  <h5 class="font-weight-bold">수강 리뷰( <span class="fas fa-star"></span><span id="avgStar"> </span> / 5 )</h5>
                </div>
                
                <div class="row col-12 justify-content-end mt-3 mb-1 pr-4">
                  <div>
                    <select class="border px-4">
                      <option value="">제목</option>
                      <option value="">내용</option>
                      <option value="">작성자ID</option>
                    </select>
                  </div>
                  <input type="text" class="border" spellcheck="false" placeholder="검색...">
                  <button type="button" class="border px-4 mr-4">검색</button>
                </div>

                <div class="row col-12 justify-content-center">
                  <!--  card 사실 유저페이지랑 거의 똑같음 -->
                  <c:forEach items="${rvlist}" var="list" varStatus="status">
	                  <div class="col-6 mt-3 rvcard">
	                    <div data-no="${list.rvNo}" class="bg-light border rounded d-flex flex-column align-items-center p-3 mx-3 mb-3 rv">
	                      <div class="d-flex justify-content-between w-100 mb-2 px-1">
	                        <span>
	                          <span>${list.writer }</span>
	                          <c:if test="${list.star==1 }">
	                          <span class="fas fa-star"></span>
	                          <span class="fa fa-star-o"></span>
	                          <span class="fa fa-star-o"></span>
	                          <span class="fa fa-star-o"></span>
	                          <span class="fa fa-star-o"></span>
	                          </c:if>
	                          <c:if test="${list.star==2 }">
	                          <span class="fas fa-star"></span>
	                          <span class="fas fa-star"></span>
	                          <span class="fa fa-star-o"></span>
	                          <span class="fa fa-star-o"></span>
	                          <span class="fa fa-star-o"></span>
	                          </c:if>
	                          <c:if test="${list.star==3 }">
	                          <span class="fas fa-star"></span>
	                          <span class="fas fa-star"></span>
	                          <span class="fas fa-star"></span>
	                          <span class="fa fa-star-o"></span>
	                          <span class="fa fa-star-o"></span>
	                          </c:if>
	                          <c:if test="${list.star==4 }">
	                          <span class="fas fa-star"></span>
	                          <span class="fas fa-star"></span>
	                          <span class="fas fa-star"></span>
	                          <span class="fas fa-star"></span>
	                          <span class="fa fa-star-o"></span>
	                          </c:if>
	                          <c:if test="${list.star==5 }">
	                          <span class="fas fa-star"></span>
	                          <span class="fas fa-star"></span>
	                          <span class="fas fa-star"></span>
	                          <span class="fas fa-star"></span>
	                          <span class="fas fa-star"></span>
	                          </c:if>
	                        </span>
	                        <span>
	                          <span>${list.wrDate }</span><i class="fa fa-ban report text-danger ml-2" aria-hidden="true"></i>
	                        </span>
	                        <input type="hidden" id="avgStarinput" value="${list.avgStar }">
	                      </div>
	                      <div class="bg-white h-25 w-100 h-100 rounded p-2" id="rvcontent">
	                        ${list.content }
	                      </div>
	                    </div>
	                  </div>
                  </c:forEach>
                  </div>
                </div>
        </div>
      </div>
    </div>
    
    <!-- 리뷰 신고 모달창 -->
    <div class="modal fade" id="revReport" tabindex="-1" role="dialog">
      <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
              <div class="modal-header d-flex justify-content-center border-bottom-0" style="position: relative;">
                  <h5 class="font-weight-bold mt-2 text-danger">리뷰신고</h5>
                  <div class="modal_close position-absolute" style="right: 10px; top: 10px;" data-dismiss="modal">
                    <i class="icon_close" style="font-size: 30px;"></i>
                  </div>
              </div>
              <div class="modal-body border-bottom-0">
                  <div class="col-lg-12">
                      <p class="font-weight-bold">신고 대상</p>
                      <div class="row d-flex justify-content-center mb-3 border px-2 pt-4 pb-2">
                          <div class="col-lg-12 px-0" id="rvcontentMd">
                            여기에 리뷰내용그대로 들어가야함
                          </div>
                      </div>
                      <div class="row product__page__title ml-1 mb-0">
                          <div class="product__page__filter">
                              <p class="text-dark font-weight-bold">신고 유형 :</p>
                              <select class="ctgr" style="display: none;">
                                  <option value="RPT01">부적절한 콘텐츠</option>
                                  <option value="RPT02">피싱 또는 스팸</option>
                                  <option value="RPT03">기타</option>
                              </select>
                              <div class="nice-select" tabindex="0">
                                  <span class="current">부적절한 콘텐츠</span>
                                  <ul class="list">
                                      <li data-value="RPT01" class="option selected focus">부적절한 콘텐츠</li>
                                      <li data-value="RPT02" class="option">피싱 또는 스팸</li>
                                      <li data-value="RPT03" class="option">기타</li>
                                  </ul>
                              </div>
                          </div>
                      </div>
                      <div class="row">
                          <div class="blog__details__form pt-0 w-100">
                              <form onsubmit="return false">  
                                  <div class="row ml-0 mr-1">
                                      <textarea v-on:change="changeErr" class="mb-0 border content" rows="10" spellcheck="false"></textarea>
                                  </div>
                                  <div class="d-flex justify-content-end">
                                      <p class="lecErr d-none text-danger mb-0 mr-2">신고 내용을 꼭 적어주셔야합니다.</p>
                                  </div>
                              </form>
                          </div>
                      </div>
                  </div>
              </div>
              <div class="modal-footer border-top-0">
                  <button v-on:click="revReport" type="button" class="btn btn-outline-secondary mr-2">신고</button>
                  <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
              </div>
          </div>
      </div>
    </div>
  </section>
<form id="frm">
 	<input class="sendltno" type="hidden" name="ltNo" value="">
</form>
<script type="text/javascript">
$(function(){
	$('#avgStar').text($('#avgStarinput').val());	
})

$('.report').click((e)=>{
	console.log($(e.target).closest('.rvcard').find($('#rvcontent')));
	$('#rvcontentMd').html($(e.target).closest('.rvcard').html());
    $('#revReport').modal('show')
    // 누른 rpno 가져와서 ajax
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

</script>
</body>
</html>