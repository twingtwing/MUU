<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #cctgr li {
      cursor: pointer;

    }

    .list-link {
      color: black;
    }

    .list-link.active {
      font-weight: bold;
      color: #e53637;

    }

    #rfmodal {
      margin-top: 12rem;
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
            <h2>내 강의리스트</h2>
            <p>환불</p>
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
            <a href="/home" class="text-dark font-weight-bold"><i class="fa fa-home"></i>Home</a>
            <a href="/user/userSelect" class="text-dark font-weight-bold">마이페이지</a>
            <a href="/user/userLectureList" class="text-dark font-weight-bold">내 강의리스트</a>
            <span>환불</span>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 카테고리 끝-->
  
  <!-- body 의 body-->
  <section class="blog spad" style="margin : 0 10vw;">
    <div class="container">
      <div class="row">
        <div class="col-lg-2">
          <div class="row mr-2" style="width:160px">
            <ul class="list-group w-100" id="cctgr">
              <li class="list-group-item border-bottom-0 align-items-center d-flex justify-content-center" style="height: 75px;"onclick="location.href='/user/userLectureList'">
                <div class="list-link">
                  <div class="row">
                    <div class="col-lg-4 justify-content-center align-items-center d-flex">
                      <span style="font-size:25px;">🚀</span>
                    </div>
                    <div class="col-lg-8 pr-0 pl-0 align-items-center d-flex">
                      <p class="font-weight-bold mb-0">&nbsp;&nbsp;&nbsp;&nbsp;GO TO<br>강의 리스트</p>
                    </div>
                  </div>
                </div>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex  listmenu" data-url="/lecD" style="height: 55px;">
                <div class="list-link">강의 상세정보</div>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex  listmenu" data-url="/user/userLectureSelect" style="height: 55px;">
                <div class="list-link">수업 목록</div>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex listmenu" data-url="/user/userLNL" style="height: 55px;">
                <div class="list-link">공지사항</div>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex listmenu" data-url="/user/userLQ" style="height: 55px;">
                <div class="list-link" data-url="/user/userLQ">질문 & 답변</div>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex listmenu" data-url="/user/userLR"style="height: 55px;">
                <div class="list-link" >리뷰 & 별점</div>
              </li>
              <li class="list-group-item align-items-center d-flex listmenu"  data-url="/user/userRefund" style="height: 55px;">
                <div class="list-link active">환불</div>
              </li>
            </ul>
          </div>
        </div>

        <div class="col-lg-10">
          <div class="row col-lg-12 ml-2">
            <h3 class="font-weight-bold"><i class="fa fa-retweet text-danger" aria-hidden="true"></i>&nbsp;수강 중 - 리뷰 & 별점</h3>
          </div>
          <hr class="font-weight-bold"> 
          
           <div class="col-lg-12 px-0 mb-3">
            <div class="card w-100">
              <div class="card-body">
                <div class="row">
                  <div class="col-3">
                    <img class="rounded" src="${sugang.thumb }" alt="" style="object-fit: cover; width: 100%; height: 150px;">
                  </div>
                  <div class="col-9 d-flex align-items-center">
                    <div class="w-100">
                      <h3 class="font-weight-bold pb-3">${sugang.ttl }</h3>
                      <div class="progress mt-3">
                        <div class="progress-bar bg-danger text-left" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:${sugang.progPct}%">
							　${sugang.progPct}%
                        </div>
                      </div>
                      <div class="text-right font-weight-bold mt-2 text-secondary">수강기간:　${sugang.regDate }　-　${sugang.expDate }　</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
  
          <div class="col-lg-12">
            <div class="row justify-content-center">
              <div class="col-lg-12 p-0">
                <div class="card" style="position: relative; height: 60vh;">
                  <div class="card-body d-flex align-items-center justify-content-center">
                    <div class="d-flex flex-column align-items-center">
                      <h4>환불 규정</h4>
                      <div class="card bg-light m-3 my-5 p-5 text-center w-100"><b>강의 기간 시작일로부터 7일 이내,<br> 3개 이하 수업 영상(OT 영상 제외)을
                          시청한 경우</b>결제대금 전액 환불 가능합니다.<br>
                        강의 기간 시작일은 결제일부터입니다.<br>
                        <a href="/refundRule" target="_blank">자세한 환불 규정은 여기를 참고하십시오.</a>
                      </div>
                      <div>
                        <!--기간이 지난 경우 표시
                          <div>해당 강의는 환불이 불가합니다.</div>
                        -->
                        <button class="border px-3 py-2" id="refund">환불 신청</button>
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
    <!--확인창 모달-->
    <div class="modal fade p-3" id="rfmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
      aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content p-3">
          <div class="modal-header">
            <h5 class="modal-title">환불 신청 사유</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body d-flex flex-column align-items-center ">
            <!--환불 사유 카테고리-->
            <select name="" class="w-100" id="reason">
              <option value=""disabled selected>환불 사유(필수)</option>
              <option value="강의가 만족스럽지 못함">강의가 만족스럽지 못함</option>
              <option value="터무니 없는 가격">터무니 없는 가격</option>
              <option value="결제 실수">결제 실수</option>
              <option value="단순 변심">단순 변심</option>
              <option value="친구나 가족 구성원이 내 동의 없이 결제함">친구나 가족 구성원이 내 동의 없이 결제함</option>
              <option value="">기타</option>
            </select>
            <div class="reasonbox w-100"></div>
          </div>
          <div class="modal-footer d-flex justify-content-center">
            <button type="button" class="border px-3 py-2 bg-danger text-white" id="refundBtn">환불</button>
            <button type="button" class="border px-3 py-2" data-dismiss="modal">취소</button>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- body 의 body 끝 -->
<form action="" id="move" method="get">
  	<input type="hidden" name="ltNo" value="${sugang.ltNo}">
  	<input type="hidden" name="tlsnNo" value="${sugang.tlsnNo }">
  </form>
  <script>
  $('.listmenu').click((e)=>{
	  let url = e.currentTarget.dataset.url;
	  $('#move').attr('action',url);
	  $('#move').submit();
  })
    $('#refund').click(() => {
      $('#rfmodal').modal('show')
    })
    $('#reason').change((e)=>{
      if(!e.currentTarget.value){
        $('.reasonbox').append(
          $('<input>').attr('type','text').addClass('border w-100 p-2 my-3 etc').attr('spellcheck','false')
        )
      } else {
        $('.reasonbox').children().remove();
      }
    })
    $('#refundBtn').click(()=>{
    	const refundData = {
    		content : $('#reason').val(),
    		tlsnNo : "${sugang.tlsnNo}"
    	}
    	if($('.etc').val()){
    		refundData.content = $('.etc').val();
    	}
    	if(refundData.content===null || refundData.tlsnNo === null){
    		window.alert('환불 사유를 선택해주시기 바랍니다.')
    		return;
    	}
    	$.ajax({
    		url : '/user/userRefundReq',
    		type : 'post',
    		data : refundData,
    		beforeSend : (xhr) =>{
			      xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
    	})
    	.done((res)=>{
    		window.alert('환불 신청이 완료되었습니다.')
    		location.href='/user/userLectureList';
    	})
    })

    //mouseover 이벤트 : 사이드바 css변경
        $('#cctgr  .list-group-item:not(.mylist)').on('mouseover',function(){
        $(this).css('background-color','#e53637');
        $(this).find('.list-link').css('color','#ffffff');
        $(this).find('p').css('color','#ffffff');
    })

    //mouseover 이벤트 : 사이드바 css변경
    $('#cctgr  .list-group-item:not(.mylist)').on('mouseout',function(){
        $(this).css('background-color','#ffffff');
        $(this).find('.list-link').css('color','#000000');
        $(this).find('p').css('color','#000000');
        $(this).find('.list-link.active').css('color','#e53637'); 
    })
  </script>
</body>
</html>