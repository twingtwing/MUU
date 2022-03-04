<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                        <h2>수업 수정</h2>
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
                        <span>수업 수정</span>
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

                
                <div class="col-lg-10" style="height:600px;" id="">
                    <div class="row ml-2">
                        <h3 class="font-weight-bold"><i class="fa fa-file-o text-danger" aria-hidden="true"></i>
                            수업 수정
                        </h3>
                    </div>

                    <hr class="font-weight-bold">

                    <div class="col-12" style="height:auto;">
                        <div class="text-right mb-3">
                            <button class="btn btn-outline-secondary" id="addItem" data-toggle="modal" data-target="#insertClass">수업추가</button>
                        </div>
                        
                        <!-- 수업 드래그 앤 드롭  -->
                        <div class="" id="itemBoxWrap">
                        <c:forEach items="${lesinfo }" var="list" varStatus="status">
						<!--기존 수업 값 들고오기-->
							<div class="itemBox" onclick="videoInsert()">
					            <div style="float:left;">
						            <span class="itemNum">${list.lsnNo }</span>
						            <span><input class="itemClassName" type="text" value="${list.ttl }"></span>
						            <span id="inputVideo"></span>
					            </div>
				            </div>
                        </c:forEach>
                        </div>
                        
                    </div>
                    <div class="row col-12 justify-content-center">
                        <button class="btn btn-danger mt-3">수정</button>
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

                
                

            </div>
        </div>
    </section>
	<div id="newvideoIn" style="display:none;">
		<input type="file" class="videoIn" accept="video/*">
	</div>
<!-- Js Plugins -->
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
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
        // $('#plzInsert').attr('style', 'display:none');

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
        //var className = $("#className").val();
        var lastCtitle = $('#itemBoxWrap').find('input[type=text]:last').val();
    	var lastInput = $('#itemBoxWrap').find('input[type=file]:last').val();
        if(lastInput == '' || lastCtitle == ''){
        	alert('이전 수업추가를 완료해주세요');
    		return false;
        } else {
    	    var contents 
    	        = "<div class='itemBox'>"
    	        + "<div style='float:left;'>"
    	        + "<span class='itemNum'></span> "
    	        + "<span class='itemClassName'><input type='text' class='classTtl' style='width:300px;'/></span>"
    	        + "<span>"
    	        + "<input type='file' class='classUp' accept='video/*'>"
    	        + "</span>"
    	        + "</div>"
    	        + "</div>";
    	    return contents;
        }
    }
    
    function videoInsert(){
    	$('#videoIn').click();
    	console.log($('#videoIn')[0].files[0]);
    	console.log($('#videoIn')[0].files[1]);
    	
    }
    $(function(){
    	//$('#videoIn').val().appendTo($('inputVideo'));
    })
                            
              
</script>
</html>