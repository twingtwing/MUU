<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 .lec_ph div{
     border : 1px solid rgb(202, 202, 202);
 }
 .next-button{
     width: 0px;
     height: 0px;
     border-left: 36px solid #e53637;
     border-top: 18px solid transparent;
     border-bottom: 18px solid transparent;
 }
 .arrow_right,.arrow_left{
     color: red;
 }

 .arrow_right:hover,.arrow_left:hover{
     color: white;
 }

 .periodsub{
     font-size: 10px;
 }

 .itemBox {
     border:solid 1px rgb(200, 200, 200);
     width:770px;
     height:50px;
     padding:10px;
     margin-bottom:10px;
 }

 .itemBoxHighlight {
     border:solid 1px black;
     width:600px;
     height:50px;
     padding:10px;
     margin-bottom:10px;
     background-color:rgb(255, 193, 193);
 }

 .deleteBox {
     float:right;
     display:none;
     cursor:pointer;
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
 
 .lecIprog{
 	font-size : xx-small;
 }
 .photobutton{
 	border:none important;
 }
 .photobutton label{
 	border : 1px solid grey;
 	border-radius : 5px;
 	background-color:white;
 	color: grey;
 	padding:5px;
 	cursor:pointer;
 }
 .photobutton label:hover{
 	color:white;
 	background-color:black;
 }
select {
	border-radius:8px;
	height:38px;
 }
.tooltip .tooltiptext::after {
  content: " ";
  position: absolute;
  top: 50%;
  right: 100%; /* To the left of the tooltip */
  margin-top: -5px;
  border-width: 5px;
  border-style: solid;
  border-color: transparent black transparent transparent;
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
                        <h2>강의 등록</h2>
                        <p></p>
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
                        <span>강의 등록</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 카테고리 끝-->

    <!-- body 의 body-->
    <!-- 크리에이터 정보 -->
    <section class="blog spad">
        <div class="container">
            <div class="row">
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
                                <a class="list-link" href="/creator/rpLecL">&nbsp;&nbsp;- 신고된 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                                <a class="list-link active" href="/creator/lecI">강의등록</a>
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

<!--임시저장 페이지 일괄 페이지 데이터 저장 및 이동 필요합니다-->
                <!--1페이지-->
                <div class="col-lg-10" id="lecIpage1">
                    <div class="row ml-2">
                        <h3 class="font-weight-bold"><i class="fa fa-plus-square-o text-danger" aria-hidden="true"></i>
                            강의 등록
                        </h3>
                    </div>

                    <hr class="font-weight-bold">

                    <!--대표 카테고리 선택시 상세 카테고리 활성화 및 리스트-->
                    <div class="row ml-3 my-3" id="app">
                        <div class="col-6">
                            <div class="row">
                                <div class="align-self-center mr-2">
                                    <h4 class="text-muted">대표 카테고리</h4>
                                </div>
                                <select name="" id="ctgr" class="border w-100">
									<option value="">전체(상위 카테고리)</option>
									<option value="HC01">음악</option>
									<option value="HC02">요리</option>
									<option value="HC03">건강</option>
									<option value="HC04">아트</option>
									<option value="HC05">IT/컴퓨터</option> 
									<option value="HC06">외국어</option>
									<option value="HC07">자기계발</option>
		                        </select>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="row">
                                <div class="align-self-center mr-2">
                                    <h4 class="text-muted">상세 카테고리</h4>
                                </div>
                                <select name="" id="downctgr" class="border w-100">
                          			<option value="">전체(하위 카테고리)</option>
                        		</select>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-7" >
                            <table class="table lec_ph" style="table-layout:fixed">
                                <tbody>
                                    <tr>
                                        <td colspan="2" style="text-align: center;">
                                        	<p class="photobutton">
	                                        	<label class="phtLb" for="mainPhtUp">대표 사진 업로드</label>
	                                        	<input type="file" id="mainPhtUp" name="mainPhtUp" multiple="multiple" accept="image/*">
                                        	</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th rowspan="2" style="vertical-align: middle; border-right : 1px rgb(214, 214, 214) solid">
                                           	<img src="/resources/img/lecturePreview.png" class="image-show" id="imgShow0"/>
                                        </th>
                                        <td>
                                           	<img src="/resources/img/lecturePreview.png" class="image-show" id="imgShow1"/>
                                        </td>
                                    </tr>
                                        <td>
                                           	<img src="/resources/img/lecturePreview.png" class="image-show" id="imgShow2"/>
                                        </td>
                                </tbody>
                            </table>
                        </div>

                        <div class="col-5" style="border-left:1px rgb(175, 175, 175) solid">
                            <table class="table lec_ph" style="table-layout:fixed">
                                <tbody>
                                    <tr>
                                        <td style="text-align:center;">
                                        	<p class="photobutton">
	                                        	<label class="phtLb" for="thPhtUp">썸네일 사진 업로드</label>
	                                        	<input type="file" id="thPhtUp" name="thPhtUp" accept="image/*">
                                        	</p>
                                        </td>
                                    </tr>
                                    <tr rowspan="2">
                                    	<td style="width:inherit; text-align: -webkit-center;">
                                           	<img src="/resources/img/lecturePreview.png" class="thimage-show" id="thImgShow"/>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                    <div class="row col-12">
                        <div class="col-2">
                            <button class="btn btn-outline-secondary exit" style="border-radius:100px;">나가기</button>
                        </div>
                        <div class="col-8 text-center mt-4">
	                        <button class="btn btn-outline-danger lecIprog active" style="border-radius:200px;" onclick="lecIpage0()">카테고리 / 사진 설정</button>
	                        <i class="fa fa-caret-right" aria-hidden="true"></i><i class="fa fa-caret-right" aria-hidden="true"></i>
	                        <button class="btn btn-outline-danger lecIprog" style="border-radius:200px;" onclick="lecIpage1()">강의정보 / 기간 설정</button>
	                        <i class="fa fa-caret-right" aria-hidden="true"></i><i class="fa fa-caret-right" aria-hidden="true"></i>
	                        <button class="btn btn-outline-danger lecIprog" style="border-radius:200px;" onclick="lecIpage2()">수업 등록</button>
	                        <i class="fa fa-caret-right" aria-hidden="true"></i><i class="fa fa-caret-right" aria-hidden="true"></i>
	                        <button class="btn btn-outline-danger lecIprog" style="border-radius:200px;" onclick="lecIpage3()">수업키트, 태그 / 비용 설정</button>
                        </div>
                        <div class="col-2" style="text-align: right;">
                            <button class="btn btn-outline-secondary tempsave" style="border-radius:100px;">임시저장</button>        
                            <a href="#" onclick="lecIpage1();">
                                <i class="arrow_right" type="button" style="vertical-align:middle; font-size: 30px;"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <!--2페이지-->
                <div class="col-lg-10" style="height:600px; display:none;" id="lecIpage2">
                    <div class="row ml-2">
                        <h3 class="font-weight-bold"><i class="fa fa-plus-square-o text-danger" aria-hidden="true"></i>
                            강의 등록
                        </h3>
                    </div>

                    <hr class="font-weight-bold">

                    <div class="row align-self-center" style="height:400px">
                        <!--강의제목, 소개글 등록란-->
                        <div class="col-6 ml-3 align-self-center" style="border-right:1px solid rgb(218, 218, 218)">
                            <div class="mb-3">
                                <input type="text" id="lecTitle" maxlength="200" onkeyup="fn_checkByte(this)" style="width:-webkit-fill-available" placeholder="강의 제목을 적어주세요" title="강의제목란">
                            </div>
                            <div class="">
                                <textarea rows="7" id="lecIntro" maxlength="4000" style="width:-webkit-fill-available" placeholder="강의 소개글을 적어주세요" title="강의소개란"></textarea>
                            </div>
                        </div>
    
                        <!--강의게시기간, 강의수강기간 등록란 / 수강기간이 강의게시기간보다 길수 없게 설정해야함 !-->
                        <div class="col-5 ml-3 mt-5 mb-5 align-self-center periodselect">
                            <div class="row">
                                <h5>강의게시기간 설정</h5>
                            </div>
                            <div class="row mt-3 mb-3">
                                <select name="" id="lecP" >
                                    <option value="3" selected>3개월</option>
                                    <option value="6">6개월</option>   
                                    <option value="9">9개월</option>
                                    <option value="12">12개월</option>
                                </select>
                            </div>
                            <h6 class="periodsub">*강의 게시 기간은 3, 6, 9, 12개월간 가능하며 추가 게시를 원한다면 재등록을 이용하셔야 합니다.</h6>
                            <div class="row">
                                <h5 class="mt-3">수강기간 설정</h5>
                            </div>
                            <div class="row mt-3 mb-3">
                                <select name="" id="coP">
                                    <option value="1" selected>1개월</option>
                                    <option value="3">3개월</option>   
                                    <option value="6" style="display:none;">6개월</option>
                                </select>
                            </div>
                            <h6 class="periodsub">*강의 수강 기간은 1,3,6개월 단위로 설정 가능하며 게시기간을 초과하는 수강기간은 설정 불가합니다.</h6>
                        </div>
                    </div>
                    
                    <div class="row col-12">
                        <div class="col-2">
                            <a href="#" onclick="lecIpage0()">
                                <i class="arrow_left" type="button" style="vertical-align:middle; font-size: 30px;"></i>
                            </a>
                            <button class="btn btn-outline-secondary exit" style="border-radius:100px;">나가기</button>
                        </div>
                        <div class="col-8 text-center mt-4">
                            <button class="btn btn-outline-danger lecIprog" style="border-radius:200px;" onclick="lecIpage0()">카테고리 / 사진 설정</button>
	                        <i class="fa fa-caret-right" aria-hidden="true"></i><i class="fa fa-caret-right" aria-hidden="true"></i>
	                        <button class="btn btn-outline-danger lecIprog active" style="border-radius:200px;" onclick="lecIpage1()">강의정보 / 기간 설정</button>
	                        <i class="fa fa-caret-right" aria-hidden="true"></i><i class="fa fa-caret-right" aria-hidden="true"></i>
	                        <button class="btn btn-outline-danger lecIprog" style="border-radius:200px;" onclick="lecIpage2()">수업 등록</button>
	                        <i class="fa fa-caret-right" aria-hidden="true"></i><i class="fa fa-caret-right" aria-hidden="true"></i>
	                        <button class="btn btn-outline-danger lecIprog" style="border-radius:200px;" onclick="lecIpage3()">수업키트, 태그 / 비용 설정</button>
                        </div>
                        <div class="col-2" style="text-align: right;">
                            <button class="btn btn-outline-secondary tempsave" style="border-radius:100px;">임시저장</button>        
                            <a href="#" onclick="lecIpage2()"> 
                                <i class="arrow_right" type="button" style="vertical-align:middle; font-size: 30px;"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <!--3페이지-->
                <div class="col-lg-10" style="height:600px; display:none;" id="lecIpage3">
                    <div class="row ml-2">
                        <h3 class="font-weight-bold"><i class="fa fa-plus-square-o text-danger" aria-hidden="true"></i>
                            강의 등록
                        </h3>
                    </div>

                    <hr class="font-weight-bold">

                    <div class="col-12" style="height:auto;">
                        <div class="text-right mb-3">
                            <button class="btn btn-outline-secondary" onclick="createItem()">수업추가</button>
                        </div>
                        
                        <!-- 수업 드래그 앤 드롭  -->
                        <div id="plzInsert" style="min-height:120px;">
                            수업을 추가해주세요(OT영상은 필수입니다.)
                        </div>
                        <div class="" id="itemBoxWrap" style="min-height:250px;">
                        </div>
                    </div>
                    
                    <div class="row col-12" style="padding-top:30px;">
                        <div class="col-2">
                            <a href="#" onclick="lecIpage1()">
                                <i class="arrow_left" type="button" style="vertical-align:middle; font-size: 30px;"></i>
                            </a>
                            <button class="btn btn-outline-secondary exit" style="border-radius:100px;">나가기</button>
                        </div>
                        <div class="col-8 text-center mt-4">
                            <button class="btn btn-outline-danger lecIprog" style="border-radius:200px;" onclick="lecIpage0()">카테고리 / 사진 설정</button>
	                        <i class="fa fa-caret-right" aria-hidden="true"></i><i class="fa fa-caret-right" aria-hidden="true"></i>
	                        <button class="btn btn-outline-danger lecIprog" style="border-radius:200px;" onclick="lecIpage1()">강의정보 / 기간 설정</button>
	                        <i class="fa fa-caret-right" aria-hidden="true"></i><i class="fa fa-caret-right" aria-hidden="true"></i>
	                        <button class="btn btn-outline-danger lecIprog active" style="border-radius:200px;" onclick="lecIpage2()">수업 등록</button>
	                        <i class="fa fa-caret-right" aria-hidden="true"></i><i class="fa fa-caret-right" aria-hidden="true"></i>
	                        <button class="btn btn-outline-danger lecIprog" style="border-radius:200px;" onclick="lecIpage3()">수업키트, 태그 / 비용 설정</button>
                        </div>
                        <div class="col-2" style="text-align: right;">
                            <button class="btn btn-outline-secondary tempsave" style="border-radius:100px;">임시저장</button>        
                            <a href="#" onclick="lecIpage3()">
                                <i class="arrow_right" type="button" style="vertical-align:middle; font-size: 30px;"></i>
                            </a>
                        </div>
                    </div>
                </div>
<!--영상 정보 담을 공간 / 보낼 곳 필요-->
                <!--수업 추가 모달-->
                <div class="modal fade" id="insertClass" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <input type="text" size="50" id="className" placeholder="수업제목을 입력하세요.">
                            </div>
                            <div class="modal-body">
                                <div class="row ml-3">
                                    <div class="col-8" style="border:1px solid rgb(255, 224, 224); height:168px;">
                                        <div class="text-center" id="previewClass" style="padding-top:70px;">
                                            미리보기 화면입니다.
                                        </div>
                                    </div>
                                    <div class="col-4 align-self-center">
                                        <button class="btn btn-danger" style="font-size:small;" onclick="">영상 업로드</button>
                                    </div>
                                    <div style="display:none">
                                        (영상 정보 담을 곳)
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div class="row col-12 justify-content-center mt-2 mb-2">
                                    <button type="button" class="btn btn-outline-danger" data-dismiss="modal" onclick="createItem();">수업추가</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--4페이지-->
                <div class="col-lg-10" style="height:600px; display:none;" id="lecIpage4">
                    <div class="row ml-2 justify-content-between">
                        <h3 class="font-weight-bold"><i class="fa fa-plus-square-o text-danger" aria-hidden="true"></i>
                            강의 등록
                        </h3>
                        <div class="col-12" style="text-align:right;">
                            <button class="btn btn-outline-danger" style="border-radius:100px;" onclick="lectureResisterF()">등록</button>        
                        </div>
                    </div>

                    <hr class="font-weight-bold">

                    <div class="row d-flex h-400" style="height:400px">
                        <!--수업 키트 입력란-->
                        <div class="row col-6 ml-3 justify-content-center align-items-center" style="height:400px; border-right:1px solid rgb(218, 218, 218);">
                            <form>
                                <div class="row mb-3">
                                	<input hidden="hidden">
                                    <input type="text" id="kitname" size="35" maxlength="200" style="width:-webkit-fill-available" placeholder="수업 키트명을 입력해주세요" title="키트이름란">
                                </div>
                                <div class="row">
                                    <textarea rows="10" id="kitintro" maxlength="4000" style="width:-webkit-fill-available" placeholder="키트에 대한 설명을 간단히 입력해주세요" title="키트설명란"></textarea>
                                </div>
                            </form>
                        </div>
    
                        <!--수업키트 금액 및 강의금액 입력란 / input type을 바꾸거나 백단에서 제한 둘 것-->
                        <div class="col-5 ml-3 mt-5 mb-5 align-self-center periodselect">
                            <div class="mb-2">
                                <input type="text" id="kitprc" style="width:-webkit-fill-available" placeholder="수업 키트 금액을 입력해주세요" title="키트금액란">
                            </div>
                            <div style="text-align:right;">
                            	<h6 class="periodsub">*단위는 원</h6>
                            </div>
                            <div class="mt-5 mb-2">
                                <input type="text" id="prc" style="width:-webkit-fill-available" placeholder="강의 금액을 입력해주세요" title="강의금액란">
                            </div>
                            <div style="text-align:right;">
                            	<h6 class="periodsub">*단위는 원</h6>
                            </div>
                        </div>
                    </div>

                    
                    <!--태그 선택 /  최대 3개선택-->
                    <div class="row mb-5 mx-5">
                        <div class="row col-12 mt-3 mb-3" style="border-bottom:1px solid rgb(200, 200, 200)"></div>
                        <div class="col-12 mx-4">
                           <div>
                               <h6 class="mb-2 font-weight-bold">태그 선택(최대 3개)</h6>
                           </div>
                           <div id="tagdiv">
                           </div>
                        </div>
                    </div>
                    
                    <div class="row col-12">
                        <div class="col-2">
                            <a href="#" onclick="lecIpage2()">
                                <i class="arrow_left" type="button" style="vertical-align:middle; font-size: 30px;"></i>
                            </a>
                            <button class="btn btn-outline-secondary exit" style="border-radius:100px;">나가기</button>
                        </div>
                        <div class="col-8 text-center mt-4">
                            <button class="btn btn-outline-danger lecIprog" style="border-radius:200px;" onclick="lecIpage0()">카테고리 / 사진 설정</button>
	                        <i class="fa fa-caret-right" aria-hidden="true"></i><i class="fa fa-caret-right" aria-hidden="true"></i>
	                        <button class="btn btn-outline-danger lecIprog" style="border-radius:200px;" onclick="lecIpage1()">강의정보 / 기간 설정</button>
	                        <i class="fa fa-caret-right" aria-hidden="true"></i><i class="fa fa-caret-right" aria-hidden="true"></i>
	                        <button class="btn btn-outline-danger lecIprog" style="border-radius:200px;" onclick="lecIpage2()">수업 등록</button>
	                        <i class="fa fa-caret-right" aria-hidden="true"></i><i class="fa fa-caret-right" aria-hidden="true"></i>
	                        <button class="btn btn-outline-danger lecIprog active" style="border-radius:200px;" onclick="lecIpage3()">수업키트, 태그 / 비용 설정</button>
                        </div>
                        <div class="col-2" style="text-align: right;">
                            <button class="btn btn-outline-secondary tempsave" style="border-radius:100px;">임시저장</button>        
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
<!-- Js Plugins -->
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

</body>
<script>
	$(function(){
		$('select').niceSelect('destroy');
		$('#mainPhtUp').attr('style', 'display:none');
		$('#thPhtUp').attr('style', 'display:none');
	})
	
    //카테고리
    const Tcategory = {
		//'전체(상위 카테고리)' : ['없음'],
       	'음악' : [{'클래식':'LC01'},{'재즈/락':'LC02'},{'힙합/랩':'LC03'},{'기타/베이스':'LC04'},{'동양':'LC05'},{'보컬':'LC06'},{'작사/작곡':'LC07'}],
        '요리': [{'한식':'LC08'},{'양식':'LC09'},{'일식':'LC10'},{'중식':'LC11'},{'베이킹':'LC12'},{'가정식':'LC13'},{'기타':'LC14'}],
        '건강': [{'홈트레이닝':'LC15'},{'필라테스':'LC16'},{'요가':'LC17'},{'헬스':'LC18'},{'정신건강':'LC19'},{'기타':'LC20'}],
        '아트': [{'2D/애니메이션':'LC21'},{'드로잉':'LC22'},{'수채화/유화':'LC23'},{'동양화':'LC24'},{'사진':'LC25'},{'메이크업/분장':'LC26'},{'기타':'LC27'}],
        'IT/컴퓨터': [{'Java':'LC28'},{'Python':'LC29'},{'C언어':'LC30'},{'웹프로그래밍':'LC31'},{'Unity':'LC32'},{'Photoshop/Illustrator':'LC33'},{'기타':'LC34'}],
        '외국어': [{'영어':'LC35'},{'일본어':'LC36'},{'중국어':'LC37'},{'스페인어':'LC38'},{'아랍어':'LC39'},{'러시아어':'LC40'},{'기타':'LC41'}],
        '자기계발': [{'부동산':'LC42'},{'주식':'LC43'},{'면접/자소서':'LC44'},{'SNS/블로그':'LC45'},{'기타':'LC46'}]
        
      }
	
	$('#ctgr').change(()=>{
		$('#downctgr>option').remove();
			let upper = $('#ctgr option:selected').text();
			Tcategory[upper].forEach((a)=>{
				$('#downctgr').append(
				$('<option>').val(a[Object.keys(a)[0]]).text(Object.keys(a)[0])
			)
		})
	})
	
	//태그
	const taglist = [
                       { tagId : 'LT01', tagName :'일본'},
                       { tagId : 'LT02', tagName :'프랑스'},
                       { tagId : 'LT03', tagName :'이탈리아'},
                       { tagId : 'LT04', tagName :'중국'},
                       { tagId : 'LT05', tagName :'동남아'},
                       { tagId : 'LT06', tagName :'인도'},
                       { tagId : 'LT07', tagName :'스케치'},
                       { tagId : 'LT08', tagName :'감성'},
                       { tagId : 'LT09', tagName :'레트로'},
                       { tagId : 'LT10', tagName :'인디'},
                       { tagId : 'LT11', tagName :'오리엔탈'},
                       { tagId : 'LT12', tagName :'SWAG'},
                       { tagId : 'LT13', tagName :'자취생'},
                       { tagId : 'LT14', tagName :'호텔'},
                       { tagId : 'LT15', tagName :'집밥'},
                       { tagId : 'LT16', tagName :'운동'},
                       { tagId : 'LT17', tagName :'힐링'},
                       { tagId : 'LT18', tagName :'감성샷'},
                       { tagId : 'LT19', tagName :'인생샷'},
                       { tagId : 'LT20', tagName :'여행'}
                    ]
   $(function(){
	   		$.each(taglist, function(a,b){
	   			let taglabel = $('<label>').addClass('mr-2').text(b.tagName).attr('for', a);
	   			let taginput = $('<input>').attr('type','checkbox').attr('id',a).val(b.tagId);
					   			
			    taginput.appendTo($('#tagdiv'));
			    taglabel.appendTo($('#tagdiv'));
	   		});
   });
	
	
	
	//강의게시기간/수강기간 선택불가
    $('#lecP').change(function(){
        let changeLecP = $('#lecP').find('option:selected').val();
        if($('#lecP').find('option:selected').val() == '3'){
            $('#coP option[value = 6]').attr('style', 'display:none');
        } 
        if($('#lecP').find('option:selected').val() != '3'){
            $('#coP option[value = 6]').removeAttr('style');
        }
    })
    
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

    //등록 네페이지 display on/off
    function lecIpage0(){
        $('#lecIpage1').attr('style', 'display:block');
        $('#lecIpage2').attr('style', 'display:none');
        $('#lecIpage3').attr('style', 'display:none');
        $('#lecIpage4').attr('style', 'display:none');
    }

    function lecIpage1(){
        $('#lecIpage1').attr('style', 'display:none');
        $('#lecIpage2').attr('style', 'display:block');
        $('#lecIpage3').attr('style', 'display:none');
        $('#lecIpage4').attr('style', 'display:none');
    }

    function lecIpage2(){
    	$('#lecIpage1').attr('style', 'display:none');
        $('#lecIpage2').attr('style', 'display:none');
        $('#lecIpage3').attr('style', 'display:block');
        $('#lecIpage4').attr('style', 'display:none');
    }

    function lecIpage3(){
    	$('#lecIpage1').attr('style', 'display:none');
    	$('#lecIpage2').attr('style', 'display:none');
        $('#lecIpage3').attr('style', 'display:none');
        $('#lecIpage4').attr('style', 'display:block');
    }

    
    
                 
    //수업등록 / 드래그 앤 드롭
    $(function() {  
        $("#sortable").sortable();
        $("#sortable").disableSelection();
    });
          
    $(function() {
        $("#itemBoxWrap").sortable({
            placeholder:"itemBoxHighlight",
            start: function(event, ui) {
                ui.item.data('start_pos', ui.item.index());
            },
            stop: function(event, ui) {
                var spos = ui.item.data('start_pos');
                var epos = ui.item.index();
            reorder();
            }
        });
    });

    //번호 재정렬
    function reorder() {
        $(".itemBox").each(function(i, box) {
            $(box).find(".itemNum").html(i + 1);
        });
    }

    //수업추가
    function createItem() {
        $('#plzInsert').attr('style', 'display:none');

        $(createBox())
        .appendTo("#itemBoxWrap")
        .hover(
            function() {
                $(this).css('backgroundColor', '#f9f9f5');
                $(this).find('.deleteBox').show();
            },
            function() {
                $(this).css('background', 'none');
                $(this).find('.deleteBox').hide();
            }
        )

        .append("<div class='deleteBox'>[삭제]</div>")

        .find(".deleteBox").click(function() {
                $(this).parent().remove();
                reorder();
        });
        // 번호 재정렬
        reorder();
    }

    // 아이템을 구성할 태그를 반환합니다.
    // itemBox 내에 번호를 표시할 itemNum 과 입력필드가 있습니다.
    function createBox() {
        //var className = $("#className").val();
        var lastCtitle = $('#itemBoxWrap').find('input[type=text]:last').val();
    	var lastInput = $('#itemBoxWrap').find('input[type=file]:last').val();
        if(lastInput == '' || lastCtitle == ''){
        	alert('이전 수업추가를 완료해주세요');
    		return false;
        } else {
    	    var contents 
    	        = "<div class='itemBox'>"
    	        + "<span class='itemNum'></span> "
    	        + "&nbsp&nbsp&nbsp"
    	        + "<span class='itemClassName'><input type='text' maxlength='100' class='classTtl' style='width:300px;'></span>"
    	        + "&nbsp&nbsp&nbsp"
    	        + "<input type='file' class='classUp' accept='video/*'>"
    	        + "</div>";
    	    return contents;
        }
    }
     
    
    //강의등록 나가기(저장 안하는 버튼)
    $('.exit').on('click', function(){
    	location.href = "/creator/rLecL";						//페이지 어디로 갈지 ?? 일단 신청강의리스트로
    })
    
    //이미지 미리보기(사진 1,2,3)
    var sel_file;
    $(document).ready(function() {
        $("#mainPhtUp").on("change", handleImgFileSelect);
    });
 
    function handleImgFileSelect(e) {
    	$('.image-show').removeAttr('src');
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
        var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
        filesArr.forEach(function(f,i) {
            if (!f.type.match(reg)) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }
            sel_file = f;
 			var stImg = "#imgShow" + i;
            var reader = new FileReader();
            reader.onload = function(e) {
                $(stImg).attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    }
    
    //썸네일 이미지 미리보기
    $(document).ready(function() {
        $("#thPhtUp").on("change", handleThImgFileSelect);
    });
 
    function handleThImgFileSelect(e) {
    	$('.thimage-show').removeAttr('src');
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
        var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
        filesArr.forEach(function(f,i) {
            if (!f.type.match(reg)) {
                alert("확장자는 이미지 확장자만 가능합니다");
                return;
            }
            sel_file = f;
 			
            var reader = new FileReader();
            reader.onload = function(e) {
                $("#thImgShow").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    }
    
    //4페이지 유효성 검사(키트 null 가능)
    //키트금액 체크
     $('#kitprc').on('keyup', function(obj) {
    	if ($('#kitname').val() == null || $('#kitname').val() == ''){
    		this.value = this.value.replace(this.value,'');
    		alert('키트에 대한 설명을 먼저 입력해주세요');
    	} else if (/\D/.test(this.value)) {
			this.value = this.value.replace(/\D/g, '');
			alert('숫자만 입력가능합니다.');
		}
	});
    
    //키트 설명란 체크
    $('#kitintro').on('keyup', function() {
    	if ($('#kitname').val() == null || $('#kitname').val() == ''){
    		this.value = this.value.replace(this.value,'');
    		alert('키트명을 먼저 입력해주세요');
    	}
	});
    
	//강의금액 체크
     $('#prc').on('keyup', function() {
		if (/\D/.test(this.value)) {
			this.value = this.value.replace(/\D/g, '');
			alert('1000 ~ 300000 사이 값만 입력가능합니다.');
		}
	});
	
	//강의제목 200바이트 제한
     function fn_checkByte(obj){
   	    const maxByte = 200; 
   	    const text_val = obj.value;
   	    const text_len = text_val.length;
   	    
   	    let totalByte=0;
   	    for(let i=0; i<text_len; i++){
   	    	const each_char = text_val.charAt(i);
   	        const uni_char = escape(each_char) //유니코드 형식으로 변환
   	        if(uni_char.length>4){
   	            totalByte += 2;
   	        }else{
   	            totalByte += 1;
   	        }
   	    }
   	    
   	    if(totalByte>maxByte){
   	    	alert('강의 제목이 너무 깁니다!');
   	    	this.value 
   	        	//document.getElementById("nowByte").text() = totalByte;
   	            //document.getElementById("nowByte").style.color = "red";
   	        }
   	    	//else{
   	        	//document.getElementById("nowByte").innerText = totalByte;
   	            //document.getElementById("nowByte").style.color = "green";
   	        //}
   	  }
    	
    
     //태그 체크
     $(function(){
	     $('#tagdiv').find('input[type="checkbox"]').on('click', function(e){
	     	let tagcount = $('input:checked[type="checkbox"]').length;
	     	if(tagcount > 3){
	     		alert("태그는 최대 3개까지 선택가능합니다");
	     		$(this).prop("checked", false);
	     	}
	     })
     })
     
     //메인사진 3장 알림
     $('#mainPhtUp').on('change', function(){
         if($("#mainPhtUp")[0].files.length != 3){
         	alert('최초 사진 등록은 3장 하여야 합니다');
         	return false;
         }
     })
     
    
		//시큐리티 토큰
		let header = "${_csrf.headerName}";
		let token = "${_csrf.token}";
	    
    function lectureResisterF(){
        //강의 등록 / 이미지 업로드
	    let form = new FormData();
	    
		//변수 선언, parameter통일
		let creid = '${id}';
		let upctgr = $('#ctgr option:selected').val();
		let downctgr = $('#downctgr option:selected').val();
		let ttl = $('#lecTitle').val();
		let intro = $('#lecIntro').val();
		intro = lineMaker(intro);
		let openterm = $('#lecP option:selected').val();
		let tlsnterm = $('#coP option:selected').val();
		let kitname = $('#kitname').val();
		let kitintro = $('#kitintro').val();
		kitintro = lineMaker(kitintro);
		let kitprc = $('#kitprc').val();
		let prc = $('#prc').val();
		let tag1 = null;
		let tag2 = null;
		let tag3 = null;
		$('input:checked[type="checkbox"]').each(function(a){
			if(a == 0){
				tag1 = $(this).val();
			}
			if(a == 1){
				tag2 = $(this).val();
			}
			if(a == 2){
				tag3 = $(this).val();
			}
		})
		
		for(var i = 0; i < $('.classUp').length; i++){
			form.append("lsnNo", $('.itemNum').eq(i).text());
			form.append("classTtl", $('.classTtl').eq(i).val());
			form.append("classMov", $('.classUp')[i].files[0]);
		}
			
        //메인사진 값
        form.append("mainPhtUp", $("#mainPhtUp")[0].files[0]);
        form.append("mainPhtUp", $("#mainPhtUp")[0].files[1]);
        form.append("mainPhtUp", $("#mainPhtUp")[0].files[2]);
        
        //사진이외 값 
        form.append("upCtgr", upctgr);
        form.append("downCtgr", downctgr);
        form.append("ttl", ttl);
        form.append("intro", intro);
        form.append("openTerm", openterm);
        form.append("tlsnTerm", tlsnterm);
        form.append("kitName", kitname);
        form.append("kitIntro", kitintro);
        form.append("kitPrc", kitprc);
        form.append("prc", prc);
        form.append("tag1", tag1);
        form.append("tag2", tag2);
        form.append("tag3", tag3);
        form.append("creId", creid);
        
        //썸네일 값
        form.append("mainPhtUp", $("#thPhtUp")[0].files[0]);
    	
        //강의신청코드 값
        form.append("ltStCode", "L02");
        
        //여기서부터 유효성검사 !!
        //카테고리 유효성 검사
		if(upctgr == null || upctgr == '' || upctgr == '전체(상위 카테고리)'){
			alert('상위 카테고리를 선택해주세요');
			return false;
		} else if (downctgr == null || downctgr == '' || downctgr == '전체(하위 카테고리)'){
			alert('하위 카테고리를 선택해주세요');
			return false;
		}
		//메인사진 유효성 검사
		else if($("#mainPhtUp")[0].files.length < 3){
			alert('대표 사진은 3장 업로드 해야합니다');
			return false;
		} else if($("#mainPhtUp")[0].files.length > 3){
			alert('선택한 사진이 3장이 넘습니다');
			return false;
		}
        //썸네일 유효성 검사
        else if($("#thPhtUp")[0].files.length < 1){
			alert('썸네일 사진을 등록해주세요');
			return false;
		}
        //2페이지 유효성 검사
        else if(ttl == null || ttl == ''){
        	alert('강의 제목을 입력해주세요');
			return false;	
        } else if(intro == null || intro == ''){
        	alert('강의 소개를 입력해주세요');
			return false;	
        }
        
        //3페이지 영상 체크(OT필수로 넣도록)
        else if($('#itemBoxWrap').find('.classUp').length == 0){
        	alert('OT영상은 필수로 등록하여야합니다');
        	return false;
        }
		for(var i = 0; i < $('.classUp').length; i++){
			if($($('.classTtl')[i]).val() == ''){
				alert('수업제목을 입력해주세요');
				return false;
			} else if($('.classUp')[i].files[0] == null){
				alert('영상이 없는 수업이 있습니다');
				return false;
			}
		}
		//4페이지 금액 체크
		if($('#kitname').val() != ''){
			if($('#kitprc').val() < 1000){
				$(this).val(1000);
				alert('키트금액은 1000원 미만으로 등록할 수 없습니다');
				return false;
			} else if($('#kitprc').val() > 50000){
				$(this).val(50000);
				alert('키트금액은 50000원 초과하여 등록할 수 없습니다');
				return false;
			}
		}
		
		if($('#prc').val() < 1000){
			$(this).val(1000);
			alert('수강료는 1000원 미만으로 등록할 수 없습니다');
			return false;
		} else if($('#prc').val() > 300000){
			$(this).val(300000);
			alert('수강료는 300000원 초과하여 등록할 수 없습니다');
			return false;
		}
		
        
        $.ajax({
            url : "/creator/lectureResister",
          	method : "post",
          	processData : false,
            contentType : false,
            async : false,
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
             },
            data : form,
            success:function() {
              alert("강의 등록 신청되었습니다");
              location.href = "/creator/rLecL";
            },
	         error: function (jqXHR) { 
	           alert(jqXHR.responseText); 
	         }
        });
    }
        
        //임시저장
        $('.tempsave').on('click', function(){
            //강의 등록 / 이미지 업로드
		    let form = new FormData();
		    
			let creid = '${id}';
			let upctgr = $('#ctgr option:selected').val();
			let downctgr = $('#downctgr option:selected').val();
			let ttl = $('#lecTitle').val();
			let intro = $('#lecIntro').val();
			intro = lineMaker(intro);
			let openterm = $('#lecP option:selected').val();
			let tlsnterm = $('#coP option:selected').val();
			let kitname = $('#kitname').val();
			let kitintro = $('#kitintro').val();
			kitintro = lineMaker(kitintro);
			let kitprc = $('#kitprc').val();
			let prc = $('#prc').val();
			if(prc == null || prc == ''){
	        	prc = 0;
        	}
			let tag1 = null;
			let tag2 = null;
			let tag3 = null;
			$('input:checked[type="checkbox"]').each(function(a){
				if(a == 0){
					tag1 = $(this).val();
				}
				if(a == 1){
					tag2 = $(this).val();
				}
				if(a == 2){
					tag3 = $(this).val();
				}
			})
			for(var i = 0; i < $('.classUp').length; i++){
				form.append("lsnNo", $('.itemNum').eq(i).text());
				form.append("classTtl", $('.classTtl').eq(i).val());
				form.append("classMov", $('.classUp')[i].files[0]);
			}
				
	        //메인사진 값
	        form.append("mainPhtUp", $("#mainPhtUp")[0].files[0]);
	        form.append("mainPhtUp", $("#mainPhtUp")[0].files[1]);
	        form.append("mainPhtUp", $("#mainPhtUp")[0].files[2]);
	        
	        //사진이외 값 
	        form.append("upCtgr", upctgr);
	        form.append("downCtgr", downctgr);
	        form.append("ttl", ttl);
	        form.append("intro", intro);
	        form.append("openTerm", openterm);
	        form.append("tlsnTerm", tlsnterm);
	        form.append("kitName", kitname);
	        form.append("kitIntro", kitintro);
	        form.append("kitPrc", kitprc);
	        form.append("prc", prc);
	        form.append("tag1", tag1);
	        form.append("tag2", tag2);
	        form.append("tag3", tag3);
	        form.append("creId", creid);
	        
	        //썸네일 값
	        form.append("mainPhtUp", $("#thPhtUp")[0].files[0]);
        	
          	//강의신청코드 값
            form.append("ltStCode", "L05");
            
            $.ajax({
                url : "/creator/lectureResister",
              	method : "post",
              	processData : false,
                contentType : false,
                async : false,
                beforeSend: function(xhr) {
                    xhr.setRequestHeader(header, token);
                 },
                data : form,
                success:function() {
                  alert("강의가 임시저장되었습니다");
                  location.href = "/creator/rLecL";
                },
    	         error: function (jqXHR) { 
    	           alert(jqXHR.responseText); 
    	         }
            });
        })
        
        
        
        
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



</script>
</html>