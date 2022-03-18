<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    </style>
</head>
<body>
<!-- 카테고리 시작-->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="/home" class="text-dark font-weight-bold"><i class="fa fa-home"></i> Home</a>
                        <span>크리에이터 정보</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 카테고리 끝-->

    <!-- body 의 body-->
    <!-- 크리에이터 정보 수정, 소개수정글 입력 value 넘기기-->
    <section class="blog spad">
        <div class="container">
            <div class="row">
                <!--사이드바-->
                <div class="col-lg-2">
                    <div class="row mr-2" style="width:160px">
                        <ul class="list-group w-100" id="cctgr">
                            <!-- 해당 상위카테고리 일때, active가 보여야함 => 자바스크립트 혹은 jstl if구문으로 해결해야함 -->
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                                <a class="list-link active" href="/creator/creS">크리에이터 정보</a>
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

                <div class="col-lg-10">
                    <div class="row ml-2">
                        
                        <h3 class="font-weight-bold"><i class="fa fa-address-card-o text-danger" aria-hidden="true"></i>&nbsp;크리에이터 정보</h3>
                        
                    </div>
                    <hr class="font-weight-bold">
                    <div class="row d-flex justify-content-center align-items-center py-3" style="height: 55vh;">
                        <div class="card py-4 px-5 anime__details__form" style="border: 2px solid #212529;">
                            <form>
                                <div class="card-body">
                                    <div class="row mb-3 ml-1">
                                        <div class="d-flex align-items-center">
                                            
	                                        <img src="${photo }" class="img-thumbnail rounded-circle" style="width: 12rem; height: 12rem;">
	                                        
                                        </div>
                                        <ul class="list-group list-group-flush ml-3 ">
                                            <li class="list-group-item">     
                                                <input type="text" readonly class="form-control-plaintext font-weight-bold" id="" value="${name }">
                                            </li>
                                            <li class="list-group-item">
                                                <label for="" class="font-weight-bold">소개</label>
                                                <textarea id="creIntro" rows="7" spellcheck="false" class="border pl-3 pr-3"></textarea>
                                            </li> 
                                        </ul>
                                    </div>      
                                </div>
                            </form>
                            <div class="row justify-content-center">
                                <button type="button" class="btn btn-outline-danger" onclick="creatorUpdate()">수정</button>
                                &nbsp;&nbsp;&nbsp;
                                <button type="button" class="btn btn-outline-danger" onclick="location.href='/creator/creS'">돌아가기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- body 의 body 끝 -->

</body>
<script>
	//시큐리티 토큰
	let header = "${_csrf.headerName}";
	let token = "${_csrf.token}";

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
    
    
    
    //크리에이터 정보 수정 데이터 넘겨주기
    function creatorUpdate(){
    	let creIntro = $('#creIntro').val();
    	creIntro = lineMaker(creIntro);
    	
    	$.ajax({
    		url:'/creator/creU',
    		method:'post',
    		beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
             },
    		data:{ 
    			id : '${id}',
    			creIntro : creIntro
    		},
    		success:function(){
    			alert('수정되었습니다.');
    			location.href='/creator/creS';
    		},
    		error: function(e){
    			console.log('실패'+ e);
    		}
    	});
    	
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
    
    //크리에이터 수정란
    $(function(){
    	let creIntro = '${creIntro }';
    	let resultVal = brDel(creIntro);
    	$('#creIntro').val(resultVal);
    })
	

</script>
</html>
