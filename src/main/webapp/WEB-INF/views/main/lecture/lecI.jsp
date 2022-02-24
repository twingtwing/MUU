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
            width:600px;
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
    </style>
</head>
<body>
<!-- 배너 시작-->
    <section class="normal-breadcrumb set-bg" data-setbg="img/normal-breadcrumb.jpg">
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
                                <a class="list-link" href="#">크리에이터 정보</a>
                            </li>
                            <p class="list-group-item border-bottom-0 mb-0 align-items-center d-flex mylist">내 강의 목록</p>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex pl-40" style="height: 35px;">
                                <a class="list-link" href="#">&nbsp;&nbsp;- 신청한 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                                <a class="list-link" href="#">&nbsp;&nbsp;- 열린 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                                <a class="list-link" href="#">&nbsp;&nbsp;- 종료된 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                                <a class="list-link" href="#">&nbsp;&nbsp;- 신고된 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                                <a class="list-link active" href="#">강의등록</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                                <a class="list-link" href="#">매출내역</a>
                            </li>
                            <li class="list-group-item align-items-center d-flex" style="height: 55px;">
                                <a class="list-link" href="#">환불 요청 내역</a>
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
									<option value="">요리</option>
									<option value="">건강</option>
									<option value="">아트</option>
									<option value="">IT/컴퓨터</option> 
									<option value="">외국어</option>
									<option value="">자기계발</option>
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
                                        <th rowspan="2" style="border-right : 1px rgb(214, 214, 214) solid">
                                            <div style="width:auto; height: 400px; border-radius: 10px;">사진1</div>
                                        </th>
                                        <td><div style="width: auto; height:200px; border-radius: 10px;">사진2</div></td>
                                    </tr>
                                        <td><div style="width: auto; height:200px; border-radius: 10px;">사진3</div></td>
                                    <tr>
                                        <td colspan="2" style="text-align: center;">
                                            <button class="btn btn-outline-danger">대표 사진 업로드</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="col-5" style="border-left:1px rgb(175, 175, 175) solid">
                            <table class="table lec_ph" style="table-layout:fixed">
                                <tbody>
                                    <tr rowspan="2">
                                        <td style="text-align: -webkit-center;">
                                            <div style="width: 200px; height:200px; border-radius: 10px;">썸넬사진1</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:center;">
                                            <button class="btn btn-outline-danger">썸네일 업로드</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                    <div class="row col-12">
                        <div class="col-4">
                            <button class="btn btn-outline-secondary" style="border-radius:100px;">나가기</button>
                        </div>
                        <div class="col-4 text-center mt-4">
                            1/4
                        </div>
                        <div class="col-4" style="text-align: right;">
                            <button class="btn btn-outline-secondary" style="border-radius:100px;">임시저장</button>        
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
                            <form action="">
                                <div class="mb-3">
                                    <input type="text" style="width:-webkit-fill-available" placeholder="강의 제목을 적어주세요">
                                </div>
                                <div class="">
                                    <textarea rows="7" style="width:-webkit-fill-available" placeholder="강의 소개글을 적어주세요"></textarea>
                                </div>
                            </form>
                        </div>
    
                        <!--강의게시기간, 강의수강기간 등록란 / 수강기간이 강의게시기간보다 길수 없게 설정해야함 !-->
                        <div class="col-5 ml-3 mt-5 mb-5 align-self-center periodselect">
                            <div class="row">
                                <h5>강의게시기간 설정</h5>
                            </div>
                            <div class="row mt-3 mb-3">
                                <select name="" id="lecP" >
                                    <option value="1" selected>3개월</option>
                                    <option value="2">6개월</option>   
                                    <option value="3">9개월</option>
                                    <option value="4">12개월</option>
                                </select>
                            </div>
                            <h6 class="periodsub">*강의 게시 기간은 3, 6, 9, 12개월간 가능하며 추가 게시를 원한다면 재등록을 이용하셔야 합니다.</h6>
                            <div class="row">
                                <h5 class="mt-3">수강기간 설정</h5>
                            </div>
                            <div class="row mt-3 mb-3">
                                <select name="" id="coP" disabled>
                                    <option value="1" selected>1개월</option>
                                    <option value="2">3개월</option>   
                                    <option value="3">6개월</option>
                                </select>
                            </div>
                            <h6 class="periodsub">*강의 수강 기간은 1,3,6개월 단위로 설정 가능하며 게시기간을 초과하는 수강기간은 설정 불가합니다.</h6>
                        </div>
                    </div>
                    
                    <div class="row col-12">
                        <div class="col-4">
                            <a href="#" onclick="lecIpage0()">
                                <i class="arrow_left" type="button" style="vertical-align:middle; font-size: 30px;"></i>
                            </a>
                            <button class="btn btn-outline-secondary" style="border-radius:100px;">나가기</button>
                        </div>
                        <div class="col-4 text-center mt-4">
                            2/4
                        </div>
                        <div class="col-4" style="text-align: right;">
                            <button class="btn btn-outline-secondary" style="border-radius:100px;">임시저장</button>        
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
                            <button class="btn btn-outline-secondary" id="addItem" data-toggle="modal" data-target="#insertClass">수업추가</button>
                        </div>
                        
                        <!-- 수업 드래그 앤 드롭  -->
                        <div class="" id="itemBoxWrap">
                            <div id="plzInsert">
                                수업을 추가해주세요(OT영상은 필수입니다.)
                            </div>
                        </div>
                    </div>
                    
                    <div class="row col-12" style="padding-top:30px;">
                        <div class="col-4">
                            <a href="#" onclick="lecIpage1()">
                                <i class="arrow_left" type="button" style="vertical-align:middle; font-size: 30px;"></i>
                            </a>
                            <button class="btn btn-outline-secondary" style="border-radius:100px;">나가기</button>
                        </div>
                        <div class="col-4 text-center mt-4">
                            3/4
                        </div>
                        <div class="col-4" style="text-align: right;">
                            <button class="btn btn-outline-secondary" style="border-radius:100px;">임시저장</button>        
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
                                <input type="text" size="50" id="className" placeholder="강의제목을 입력하세요.">
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
                    <div class="row ml-2">
                        <h3 class="font-weight-bold"><i class="fa fa-plus-square-o text-danger" aria-hidden="true"></i>
                            강의 등록
                        </h3>
                    </div>

                    <hr class="font-weight-bold">

                    <div class="row d-flex h-400" style="height:400px">
                        <!--수업 키트 입력란-->
                        <div class="row col-6 ml-3 justify-content-center align-items-center" style="height:400px; border-right:1px solid rgb(218, 218, 218);">
                            <form action="">
                                <div class="row mb-3">
                                    <input type="text" size="35" style="width:-webkit-fill-available" placeholder="수업 키트명을 입력해주세요">
                                </div>
                                <div class="row">
                                    <textarea rows="10" style="width:-webkit-fill-available" placeholder="키트에 대한 설명을 간단히 입력해주세요"></textarea>
                                </div>
                            </form>
                        </div>
    
                        <!--수업키트 금액 및 강의금액 입력란 / input type을 바꾸거나 백단에서 제한 둘 것-->
                        <div class="col-5 ml-3 mt-5 mb-5 align-self-center periodselect">
                            <div class="mb-5">
                                <input type="text" style="width:-webkit-fill-available" placeholder="수업 키트 금액을 입력해주세요">
                            </div>
                            <div class="mb-2">
                                <input type="number" min="10", max="500" style="width:-webkit-fill-available" placeholder="강의 금액을 입력해주세요">
                            </div>
                            <h6 class="periodsub">*만원단위이며 10~500만원 사이 금액만 등록 가능합니다.</h6>
                        </div>
                    </div>

                    
                    <!--태그 선택 /  최대 3개선택-->
                    <div class="row mb-5 mx-5">
                        <div class="row col-12 mt-3 mb-3" style="border-bottom:1px solid rgb(200, 200, 200)"></div>
                        <div class="col-12 mx-4">
                            <form method="" action="">
                                <div >
                                    <h6 class="mb-2 font-weight-bold">태그 선택</h6>
                                </div>
                                <div >
                                    <label class="mr-2"><input type="checkbox" name="" value="1번태그">&nbsp;1번태그</label>
                                    <label class="mr-2"><input type="checkbox" name="" value="2번태그">&nbsp;2번태그</label>
                                    <label class="mr-2"><input type="checkbox" name="" value="3번태그">&nbsp;3번태그</label>
                                </div>
                            </form>
                        </div>
                    </div>
                    
                    <div class="row col-12">
                        <div class="col-4">
                            <a href="#" onclick="lecIpage2()">
                                <i class="arrow_left" type="button" style="vertical-align:middle; font-size: 30px;"></i>
                            </a>
                            <button class="btn btn-outline-secondary" style="border-radius:100px;">나가기</button>
                        </div>
                        <div class="col-4 text-center mt-4">
                            4/4
                        </div>
                        <div class="col-4" style="text-align: right;">
                            <button class="btn btn-outline-secondary" style="border-radius:100px;">임시저장</button>        
                            <button class="btn btn-outline-secondary" style="border-radius:100px;">등록</button>        
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
<!-- Js Plugins -->
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script src="resources/js/jquery.nice-select.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/player.js"></script>
<script src="resources/js/mixitup.min.js"></script>
<script src="resources/js/jquery.slicknav.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/main.js"></script>
</body>
<script>
	$(function(){
		$('select').niceSelect('destroy');
	})
	
    //카테고리
    const 종류 = {
        '음악' : ['클래식','재즈','락','힙합/랩','타악기','기타/베이스','동양음악','보컬','작사/작곡'],
        '요리': ['양식','동양식','간편요리','코스요리','가정식','베이킹'],
        '건강': ['홈트레이닝','필라테스','요가','정신건강','테라피'],
        '아트': ['2D/애니메이션','드로잉','수채화','유화','동양화','판화','공예','사진','메이크업/분장'],
        'IT/컴퓨터': ['Java','Python','C/C++/C#','웹프로그래밍','Unity','영상편집','Photoshop/Illustrator','3D모델링','기타'],
        '외국어': ['영어','일본어','중국어','스페인어','포르투갈어','아랍어','러시아어'],
        '자기계발': ['부동산','주식','면접/자소서','SNS/블로그','기타'],
      }
	$('#ctgr').change(()=>{
		$('#downctgr>option').remove();
			let upper = $('#ctgr option:selected').text();
			종류[upper].forEach((v)=>{
				$('#downctgr').append(
				$('<option>').val(v).text(v)
			)
		})
	})
   
    //강의게시기간/수강기간 선택불가
    $('#lecP').change(function(){
        let changeLecP = $('#lecP').find('option:selected').val();
        if($('#lecP').find('option:selected').val() == '1'){
            $('#coP').attr('disabled', true).niceSelect('update');
        } 
        if($('#lecP').find('option:selected').val() != '1'){
            $('#coP').removeAttr('disabled').niceSelect('update');
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
    }

    function lecIpage1(){
        $('#lecIpage1').attr('style', 'display:none');
        $('#lecIpage2').attr('style', 'display:block');
        $('#lecIpage3').attr('style', 'display:none');
    }

    function lecIpage2(){
        $('#lecIpage2').attr('style', 'display:none');
        $('#lecIpage3').attr('style', 'display:block');
        $('#lecIpage4').attr('style', 'display:none');
    }

    function lecIpage3(){
        $('#lecIpage3').attr('style', 'display:none');
        $('#lecIpage4').attr('style', 'display:block');
    }

    
    
                 
    //여기서 부터 수업등록 / 드래그 앤 드롭
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
            // var valueCheck = false;
            
            // $(this).parent().find('span').each(function() {
            //     console.log(this);
            //     console.log($(this).find('.itemClassName').innerText());
            //     if($('.itemClassName').text() != '' && null) {
            //         console.log(this);
            //         valueCheck = true;
            //         console.log(valueCheck);
            //     }
            // });

            // if(valueCheck) {
            //     var delCheck = confirm('입력하신 내용이 있습니다.\n삭제하시겠습니까?');
            // }
            // if(!valueCheck || delCheck == true) {
                $(this).parent().remove();
                reorder();
            // }
        });
        // 번호 재정렬
        reorder();
    }

    // 아이템을 구성할 태그를 반환합니다.
    // itemBox 내에 번호를 표시할 itemNum 과 입력필드가 있습니다.
    function createBox() {
        var className = $("#className").val();
        var contents 
            = "<div class='itemBox'>"
            + "<div style='float:left;'>"
            + "<span class='itemNum'></span> "
            + "<span class='itemClassName'>" + className + "</span>"
            // + "<input type='text' name='item' style='width:300px;'/>"
            + "</div>"
            + "</div>";
        return contents;
    }
                            
              
</script>
</html>