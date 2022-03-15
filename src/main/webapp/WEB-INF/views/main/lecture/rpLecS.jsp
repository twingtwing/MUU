<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
        #cctgr > li{
            cursor: pointer;
        }

        .list-link {
            color: black;
        }
        
        .list-link.active{
            font-weight: bold;
            color: #e53637;
        }
        .bg-dark{
            color:white;
        }

        table {
            border-collapse: separate;
            border-spacing: 1px;
            text-align: left;
            line-height: 1.5;
            border-top: 1px solid #ccc;
            margin: 20px 10px;
            font-size: small;
            }
        th {
            width: 200px;
            padding: 10px;
            font-weight: bold;
            vertical-align: top;
            border-bottom: 1px solid #ccc;
            background: #efefef;
        }
        td {
            width: 300px;
            padding: 10px;
            vertical-align: top;
            border-bottom: 1px solid #ccc;
        }
        .modal {
                text-align: center;
        }
        
        @media screen and (min-width: 768px) { 
                .modal:before {
                        display: inline-block;
                        vertical-align: middle;
                        content: " ";
                        height: 100%;
                }
        }
        
        .modal-dialog {
                display: inline-block;
                text-align: left;
                vertical-align: middle;
        }
        .modal-body{
            width:500px;
            height:200px;
        }

        #mainPhoto td {
            width:120px; height:30px;
            font-size: small;
        }
        
</style>
</head>
<body>
<!-- 배너 시작-->
    <section class="normal-breadcrumb set-bg" data-setbg="img/normal-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>내 강의 목록</h2>
                        <p>신고된 강의</p>
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
                        <a href="/home" class="text-dark font-weight-bold"><i class="fa fa-home"></i> Home</a>
                        <a href="/creator/rpLecL" class="text-dark font-weight-bold"> 신고된 강의목록</a>
                        <span>${rplists.ttl }</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 카테고리 끝-->

    <!-- body 의 body-->
    <!-- 신청한 강의, 썸네일 클릭시 ? 강의페이지로 이동 -->
    <!-- 이미지 a태그로 감싸서 페이지 링크-->
    <section class="blog spad">
        <div class="container">
            <div class="row">
                <!--사이드바-->
                <div class="col-lg-2">
                    <div class="row mr-2" style="width:160px">
                        <ul class="list-group w-100" id="cctgr">
                            <!-- 해당 상위카테고리 일때, active가 보여야함 => 자바스크립트 혹은 jstl if구문으로 해결해야함 -->

                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                                <a class="list-link" href="/creator/creS">크리에이터 정보</a>
                            </li>
                            <p class="list-group-item border-bottom-0 mb-0 align-items-center d-flex mylist">내 강의 목록</p>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex pl-40" style="height: 35px;">
                                <a class="list-link" href="/creator/rLecL">&nbsp;&nbsp;- 신청한 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                                <a class="list-link" href="/creator/oLecL">&nbsp;&nbsp;- 열린 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                                <a class="list-link" href="/creator/clLecL">&nbsp;&nbsp;- 종료된 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                                <a class="list-link active" href="/creator/rpLecL">&nbsp;&nbsp;- 신고된 강의</a>
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
                            <i class="fa fa-exclamation-triangle text-danger" aria-hidden="true"></i>
                            신고된 강의 정보
                        </h5>
                    </div>

                    <hr class="font-weight-bold">
                    <!-- 강의 하나에 대한 상세정보페이지-->
                    <div class="col-12 ml-3">
                        <!-- 제목 입력 / 제목 가져오기-->
                        <h5 class="mx-4 my-4 font-weight-bold">강의제목 : <strong class="text-danger">${rplists.ttl }</strong></h5>

                        <div class="my-3 col-12">
                            <div class="row mx-2 justify-content-between">
                                <h5 class="font-weight-bold">신고사유 : 
                                <c:if test="${rplists.ltStCode eq 'L04' }"><strong class="text-danger">신고됨</strong></c:if>
                        		<c:if test="${rplists.ltStCode eq 'L06' }"><strong class="text-warning">검토중</strong></c:if>
                                </h5>
                                <p class="mr-5 mb-0">문제가 있는 수업번호 : [
                                <c:forEach items="${rplesson}" var="list" varStatus="status">
                                ${list.num } 
                                </c:forEach>
                                ]</p>
                            </div>
                            <div class="row mr-5 ml-2 p-3 mt-3 border">
                            	<c:forEach items="${rplesson}" var="list" varStatus="status">
                            	<c:if test="${list.type == 'RPT01' }">
                            	<p class="mb-0">[부적절한 콘텐츠]</p>&nbsp;&nbsp;
                            	</c:if>
                            	<c:if test="${list.type == 'RPT02' }">
                            	<p class="mb-0">[피싱 또는 스팸]</p>&nbsp;&nbsp;
                            	</c:if>
                            	<c:if test="${list.type == 'RPT03' }">
                                <p class="mb-0">[기타]</p>&nbsp;&nbsp;
                            	</c:if>
                                </c:forEach>
                                사유로 인해 신고당하였습니다.
                            </div>
                        </div>
                        
                        <!-- 신청 상태 / 상태, 반려사유 가져오기-->
                        <div class="row col-12">
                            <div class="col-12 text-right align-items-right">
                                <button class="btn btn-outline-secondary" type="button" onclick="lectureInfo(${rplists.ltNo })">강의정보수정</button>
                                &nbsp;&nbsp;&nbsp;
                                <!-- 
                                <button class="btn btn-outline-info"  type="button" onclick="lessonInfo(${rplists.ltNo })">영상 관리</button>
                                &nbsp;&nbsp;&nbsp;
                                 -->
                                <button class="btn btn-outline-success" type="button" onclick="lecCheck(${rplists.ltNo})">재검토</button>
                            </div>
                        </div>
                        
                        <!--썸네일, 강의 소개 / 사진, 소개글 가져오기-->
                        <div class="row col-12 justify-content-center my-4">
                            <h5 class="font-weight-bold text-danger">강의 정보</h5>
                        </div>
                        <div class="row col-12 mt-3 mb-5">
                            <div class="col-4 text-center" style="border-right: 5px solid grey">
                                <img src="${rplists.thumb }" class="card-img-left img-thumbnail rounded-circle" style="width: 12rem; height: 12rem;">
                            </div>
                            <div class="col-8">
                                <div class="col-12 mt-2">
                                    <p>
                                        ${rplists.intro }
                                    </p>
                                </div>         
                            </div>
                        </div>
                        
                        <!-- 대표사진-->
                        <div class="row col-12 justify-content-center my-4">
                            <h5 class="font-weight-bold">강의 사진 상세 정보</h5>
                        </div>
                        <div class="row col-12 justify-content-center border">
                            <div class="row mr-0 my-4">
                                <div class="col-lg-8 pr-2">
                                    <img src="${rplist.pht1 }" style="object-fit: cover; width: 100%; height: 500px;" alt="강의 이미지 1">
                                </div>
                                <div class="col-lg-4 p-0">
                                    <img src="${rplist.pht2 }" class="pb-2" style="object-fit: cover; width: 100%; height: 250px;" alt="강의 이미지 2">
                                    <img src="${rplist.pht3 }" style="object-fit: cover; width: 100%; height: 250px;" alt="강의 이미지 3">
                                </div>
                            </div>
                        </div>
                        
                        <!--강의 정보 테이블, 태그-->
                        <div class="row col-12 mt-3 mb-3">
                            <div class="col-9">
                                <h5 class="font-weight-bold text-center">강의 상세 정보</h5>
                                <table>
                                    <tbody>
                                        <tr>
                                            <th>카테고리</th>
                                            <td>${rplists.upCtgr }/${rplists.downCtgr }</td>
                                            <th>강의게시기간</th>
                                            <td>${rplists.openTerm }개월</td>
                                        </tr>
                                        <tr>
                                            <th>강의수강기간</th>
                                            <td>${rplists.tlsnTerm }개월</td>
                                            <th>강의만료날짜</th>
                                            <td>${rplists.expDate }</td>
                                        </tr>
                                        <tr>
                                            <th>강의가격</th>
                                            <td>${rplists.prc }만원</td>
                                            <th>키트가격</th>
                                            <td>${rplists.kitPrc }원</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-3">
                                <h5 class="font-weight-bold mb-2">태그</h5>
                                <!-- 태그 반복문 등록-->
                                <div>
                                    <c:if test="${rplists.tag1 !='null' }">
                                    	<span class="badge bg-dark px-2 py-1 mr-1">${rplists.tag1 }</span>
                                    </c:if>	
                                    <c:if test="${rplists.tag2 !='null' }">
	                                    <span class="badge bg-dark px-2 py-1 mr-1">${rplists.tag2 }</span>
	                                </c:if>
	                                <c:if test="${rplists.tag3 !='null' }">    
	                                    <span class="badge bg-dark px-2 py-1 mr-1">${rplists.tag3 }</span>
	                                </c:if>   
	                                <c:if test="${rplists.tag1 ==null && rplists.tag2 ==null && rplists.tag3 ==null }">
	                                	<span class="badge bg-dark px-2 py-1 mr-1">태그없음</span>
	                                </c:if>
                                </div>
                            </div>
                        </div>

                        <!-- 키트가 있을경우에만 -->
                        <div class="row col-12 justify-content-center my-4">
                            <h5 class="font-weight-bold">키트 상세 정보</h5>
                        </div>
                        <div class="row col-12 align-items-end">
                            <div class="col-10">
                                <div class="row">
                                	<c:if test="${rplists.kitName != null }">
                                    <h6 class="font-weight-bold">${rplists.kitName }</h6>
                                    </c:if>
                                    <c:if test="${rplists.kitName == null}">
                                    <h6 class="font-weight-bold">키트 없음</h6>
                                    </c:if>
                                </div>
                                <c:if test="${rplists.kitIntro != null}">
                                <div class="row mt-3" style="border-left: 4px solid grey">
                                    <p class="mb-0 ml-3 my-1">
                                        ${rplists.kitIntro }
                                    </p>
                                </div>
                                </c:if>
                            </div>
                            <div class="col-2">
                                <div class="row align-self-end">
                                	<c:if test="${rplists.kitPrc != null }">
                                    <p class="mb-0">키트 가격 : ${rplists.kitPrc }원</p>
                                    </c:if>
                                </div>
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
</body>
<script>
    //mouseover 이벤트 : 사이드바 css변경
    $('#cctgr > .list-group-item:not(.mylist)').on('mouseover',function(){
        $(this).css('background-color','#e53637');
        $(this).find('.list-link').css('color','#ffffff');
    })

    //mouseover 이벤트 : 사이드바 css변경
    $('#cctgr > .list-group-item:not(.mylist)').on('mouseout',function(){
        $(this).css('background-color','#ffffff');
        $(this).find('.list-link').css('color','#000000');
        $(this).find('.list-link.active').css('color','#e53637');
    })

    //재등록 모달 체크박스시 게시기간 비활성화
    let test1 = $('#test123');
    let test2 = $('#test456');
    test1.on('click', function(){
        if(test1.is(":checked") == true){
            console.log('t');
            test2.attr('disabled', true).niceSelect('update');    
        }
        if(test1.is(":checked") == false){
            console.log('f');
            test2.attr('disabled', false).niceSelect('update');
        }
    })
    
    //수정 페이지 이동
	function lectureInfo(e){
		$('.sendltno').val(e);
		$('#frm').attr("action", "/creator/lecU");
		$('#frm').submit();
	}
    //영상 관리 페이지 이동
    function lessonInfo(e){
    	$('.sendltno').val(e);
    	$('#frm').attr("action", "/creator/lesU");
    	$('#frm').submit();
    }
    
    //시큐리티 토큰
    let header = "${_csrf.headerName}";
    let token = "${_csrf.token}";
    
    //신고강의 재검토 업데이트
    function lecCheck(e){
   		let ltNo = e;
   		
    	$.ajax({
    		url : "/creator/lecRpCheck",
    		method : "post",
    		dataType:"text",
    		beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
             },
    		data:{
    			ltNo : ltNo
    		},
    		success : function(){
    			alert('재검토 신청하였습니다');
    			location.href="/creator/rLecL?ltNo="+e;
    		}
    		
    	})
    }
    

</script>
</html>