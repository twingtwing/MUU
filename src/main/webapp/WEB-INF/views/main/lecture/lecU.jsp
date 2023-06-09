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
        img{
            cursor:pointer;
        }
        .lec_ph img:hover{
        	opacity:0.4;
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
                        <h2>강의 정보 수정</h2>
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
                        <span>강의 정보 수정</span>
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
                <div class="col-lg-10">
                    <div class="row ml-2">
                        <h3 class="font-weight-bold"><i class="fa fa-file-o text-danger" aria-hidden="true"></i>
                            강의 정보 수정
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
                                <select name="" id="ctgr">
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
                                <select name="" id="downctgr">
                                    <option value="">전체(하위 카테고리)</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <!--강의제목, 소개글 등록란-->
                        <div class="col-7 align-self-center" style="border-right:1px solid rgb(200, 200, 200)">
                            <form action="">
                                <div class="mb-3">
                                	<input hidden="hidden">
                                    <input id="lecttl" type="text" style="width:-webkit-fill-available" placeholder="강의 제목을 적어주세요" value="${lecinfo.ttl }" title="강의 제목란" spellcheck="false">
                                </div>
                                <div>
                                    <textarea id="lecintro" rows="7" style="width:-webkit-fill-available" placeholder="강의 소개글을 적어주세요" title="강의 소개란" spellcheck="false"></textarea>
                                </div>
                            </form>
                        </div>
                        <!--해당 강의 태그는 이미 checked 된 상태 /  최대 3개선택-->
                        <div class="col-5">
                            <div class="row">
                                <div class="col-12 mx-4">
                                    <div >
                                        <h6 class="mb-2 font-weight-bold">태그 선택</h6>
                                    </div>
                                    <div id="tagdiv">
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 사진 각각 단일 업로드 / 미리보기 / 크기 고정하거나 맞게 되도록 조정할 필요 있음-->
                    <div class="row mt-2">
                        <div class="col-7" >
                            <table class="table lec_ph" style="table-layout:fixed">
                                <tbody>
                                    <tr>
                                        <th rowspan="2" style="vertical-align: middle; border-right : 1px rgb(214, 214, 214) solid">
    	                                    <img id="lecpht1" src="${lecinfo.pht1 }" class="card-img-left img-thumbnail" onclick='imgUpload1()'>
                                        </th>
                                        <td>
                                            <img id="lecpht2" src="${lecinfo.pht2 }" class="card-img-left img-thumbnail" onclick='imgUpload2()'>
                                        </td>
                                    </tr>
                                        <td>
                                            <img id="lecpht3" src="${lecinfo.pht3 }" class="card-img-left img-thumbnail" onclick='imgUpload3()'>    
                                        </td>
                                    <tr>
                                        <td colspan="2" style="text-align: center;">
                                            <!-- <button class="btn btn-outline-danger">대표 사진 업로드</button> -->
                                        </td>
                                    </tr>
                                    <tr>
                                		<td colspan="2" style="font-size:x-small; text-align:right;">*클릭시 이미지 수정</td>
                                	</tr>
                                </tbody>
                            </table>
                        </div>
                        

                        <div class="col-5" style="border-left:1px rgb(200, 200, 200) solid">
                            <table class="table lec_ph" style="table-layout:fixed">
                                <tbody>
                                    <tr rowspan="2">
                                        <td style="width:inherit; text-align: -webkit-center;">
                                            <img id="lecthumb" src="${lecinfo.thumb }" class="card-img-left img-thumbnail" onclick='imgthUpload()'>    
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:center;">
                                            <!-- <button class="btn btn-outline-danger">썸네일 업로드</button> -->
                                        </td>
                                    </tr>
                                    <tr>
                                		<td style="font-size:x-small; text-align:right;">*클릭시 이미지 수정</td>
                                	</tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    
                    <div class="row mt-3 mx-1 justify-content-between">
                        <button type="button" class="btn btn-outline-danger" onclick="history.back();">뒤로가기</button>
                        <button type="button" class="btn btn-outline-danger" onclick="updateBtn()">수정</button>
                    </div>

                </div>
            </div>
        </div>
    </section>
    	<div id="phtDiv" style="display:none">
	    	<input id="pht1" name="pht1" type="file" accept="image/*">
	    	<input id="pht2" name="pht2" type="file" accept="image/*">
	    	<input id="pht3" name="pht3" type="file" accept="image/*">
	    	<input id="thumb" name="thumb" type="file" accept="image/*">
    	</div>
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
    
    $(function(){
		$('select').niceSelect('destroy');
	})
	
    //카테고리
    const Tcategory = {
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
	
	//기존 카테고리 가져오기
	$(function(){
		for(var i=0; i < $('#ctgr option').length; i++){
			if($('#ctgr option').eq(i).text() == '${lecinfo.upCtgr}'){
				$('#ctgr option').eq(i).attr('selected', 'selected');
				$('#downctgr>option').remove();
				let upper = $('#ctgr option:selected').text();
				Tcategory[upper].forEach((a)=>{
					$('#downctgr').append(
					$('<option>').val(a[Object.keys(a)[0]]).text(Object.keys(a)[0])
					)
				})
			}
		}
		for(var i=0; i < $('#downctgr option').length; i++){
			if($('#downctgr option').eq(i).text() == '${lecinfo.downCtgr}'){
				$('#downctgr option').eq(i).attr('selected', 'selected');
			}
		}
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
			    
			    if(b.tagName=='${lecinfo.tag1}'
			    || b.tagName=='${lecinfo.tag2}'
			    || b.tagName=='${lecinfo.tag3}'){
			    	taginput.attr('checked', 'checked');
			    }
	   		});
	   		
	   		$('#tagdiv').find('input[type="checkbox"]').on('click', function(e){
		     	let tagcount = $('input:checked[type="checkbox"]').length;
		     	if(tagcount > 3){
		     		alert("태그는 최대 3개까지 선택가능합니다");
		     		$(this).prop("checked", false);
		     	}
		    })
   });
    
    //이미지 클릭시 이미지 교체
    function imgUpload1(){
    	$('#pht1').click();
    }
    function imgUpload2(){
    	$('#pht2').click();
    }
    function imgUpload3(){
    	$('#pht3').click();
    }
    function imgthUpload(){
    	$('#thumb').click();
    }
    
    //이미지 미리보기
    $(document).ready(function() {
        $("#pht1").on("change", handleThImgFileSelect1);
        $("#pht2").on("change", handleThImgFileSelect2);
        $("#pht3").on("change", handleThImgFileSelect3);
        $("#thumb").on("change", handleThImgFileSelect4);
    });
 
    function handleThImgFileSelect1(e) {
    	$('#lecpht1').removeAttr('src');
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
        var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
        filesArr.forEach(function(f,i) {
            if (!f.type.match(reg)) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }
            sel_file = f;
 			
            var reader = new FileReader();
            reader.onload = function(e) {
                $("#lecpht1").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    }
    function handleThImgFileSelect2(e) {
    	$('#lecpht2').removeAttr('src');
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
        var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
        filesArr.forEach(function(f,i) {
            if (!f.type.match(reg)) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }
            sel_file = f;
 			
            var reader = new FileReader();
            reader.onload = function(e) {
                $("#lecpht2").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    }
    function handleThImgFileSelect3(e) {
    	$('#lecpht3').removeAttr('src');
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
        var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
        filesArr.forEach(function(f,i) {
            if (!f.type.match(reg)) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }
            sel_file = f;
 			
            var reader = new FileReader();
            reader.onload = function(e) {
                $("#lecpht3").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    }
    function handleThImgFileSelect4(e) {
    	$('#lecthumb').removeAttr('src');
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
        var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
        filesArr.forEach(function(f,i) {
            if (!f.type.match(reg)) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }
            sel_file = f;
 			
            var reader = new FileReader();
            reader.onload = function(e) {
                $("#lecthumb").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    }
    
  	//시큐리티 토큰
	let header = "${_csrf.headerName}";
	let token = "${_csrf.token}";
    
    //수정버튼
    function updateBtn(){
    	let tagchecklist = new Array();
    	$('input[type="checkbox"]:checked').each(function(ind,v){
    		tagchecklist.push($(v).val());
    	})
    	let intro = $('#lecintro').val();
    	intro = lineMaker(intro);
    	
    	let form = new FormData();
    	
    	form.append("ltNo", ${lecinfo.ltNo});
    	form.append("ttl", $('#lecttl').val());
    	form.append("intro", intro);
    	form.append("upCtgr", $('#ctgr option:selected').val());
    	form.append("downCtgr", $('#downctgr option:selected').val());
    	form.append("tag1", tagchecklist[0]);
    	form.append("tag2", tagchecklist[1]);
    	form.append("tag3", tagchecklist[2]);
    	
    	form.append("pht11", $("input[name=pht1]")[0].files[0]);
    	form.append("pht22", $("input[name=pht2]")[0].files[0]);
    	form.append("pht33", $("input[name=pht3]")[0].files[0]);
    	form.append("thumbb", $("input[name=thumb]")[0].files[0]);
    	
    	$.ajax({
            url : "/creator/lecUpdate",
          	method : "post",
          	processData : false,
            contentType : false,
            async : false,
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
             },
            data : form,
            success:function() {
              alert("강의가 수정되었습니다");
              history.back();
            },
	         error: function () { 
	           alert('실패'); 
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

//강의정보란 입력
$(function(){
	let intro = '${lecinfo.intro }';
	let resultVal = brDel(intro);
	$('#lecintro').val(resultVal);
})
                        
</script>

</html>