<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

    .fa-star,.fa-star-o {
      color: var(--warning);
    }

    .report,
    .rv {
      cursor: pointer;
    }

    .rv {

      height: 10rem;
    }

    #wrmodal {
      margin-top: 8rem;
    }
    #stars .gr{
      color: gray;
      cursor: pointer;
    }
    .wrbox{
      height: 20rem;
    }
    #span .selected {
      color: var(--danger)
    }
    .hided {
    	display: none;
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
            <p>리뷰 & 별점</p>
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
            <span>리뷰 & 별점</span>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 카테고리 끝-->
  
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
                <div class="list-link active" >리뷰 & 별점</div>
              </li>
              <li class="list-group-item align-items-center d-flex listmenu"  data-url="/user/userRefund" style="height: 55px;">
                <div class="list-link">환불</div>
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
          <div class="card" style="position: relative;">
            <div class="card-body">
              <div class="row mt-4 col-12 justify-content-center mx-0">
                <h5 class="font-weight-bold">수강 리뷰( <span class="fas fa-star"></span><span> ${starAvg}</span> / 5 )</h5>
              </div>            
              <div class="row col-12 justify-content-between mt-4 pr-4 mx-3">
             	<button class="btn btn-warning py-2 px-4 font-weight-bold text-white <c:if test="${not empty myReview }">d-none</c:if>" id="wr">작성</button>
                <button class="btn btn-success py-2 px-4 font-weight-bold text-white <c:if test="${empty myReview }">d-none</c:if>" id="modify">내 리뷰 수정</button>
                <div class="row mr-4">
                  <div>
                    <select class="border px-4 rvSearchType">
                      <option value="content">내용</option>
                      <option value="writer">작성자ID</option>
                    </select>
                  </div>
                  <input type="text" class="border" spellcheck="false" placeholder="검색..." id="rvSearchKey">
                  <button type="button" class="border px-4 mx-0 rvSearchBtn">검색</button>
                </div>
              </div>

              <div class="row col-12 justify-content-center m-0 reviewContainer">
                <!-- 내 리뷰 -->
                <c:if test="${not empty myReview.rvNo}">     
                <div class="col-6 mt-3 myrv">
			                <div class="bg-success border rounded d-flex flex-column align-items-center p-3 mx-3 mb-3 rv">
			                  <div class="d-flex justify-content-between w-100 mb-2 px-1">
		                      <span>
		                        <span class="text-white font-weight-bold">내가 쓴 리뷰</span>
		                        <span class="mystars">
		                        <c:forEach begin="1" end="${myReview.star}">
		                        <span class="fas fa-star"></span>
		                        </c:forEach>
		                        </span>
		                      </span>
		                      <span>
		                        <span>${myReview.wrDate }</span><span class="delete text-danger font-weight-bold ml-2" aria-hidden="true" data-rvno="${myReview.rvNo}">X</span>
		                      </span>
		                    </div>
		                    <div class="bg-white h-25 w-100 h-100 rounded p-2 myrvContent">
		                      ${myReview.content}
		                    </div>
		                  </div>
	                </div>
                </c:if>
                
                <c:forEach items="${reviews}" var="review" varStatus="st">
                <!--  card 사실 유저페이지랑 거의 똑같음 -->
                <c:if test="${review.writer ne myReview.writer }">
                	<c:choose>
                		<c:when test="${review.rvCode eq 'RE01' }">
                		  <div class="col-6 mt-3 reviews <c:if test="${st.count > 6}">hided</c:if>">
			                <div class="bg-light border rounded d-flex flex-column align-items-center p-3 mx-3 mb-3 rv">
			                  <div class="d-flex justify-content-between w-100 mb-2 px-1">
		                      <span>
		                        <span>${review.writer}</span>
		                        <c:forEach begin="1" end="${review.star}">
		                        <span class="fas fa-star"></span>
		                        </c:forEach>
		                      </span>
		                      <span>
		                        <span>${review.wrDate }</span><i class="fa fa-ban report text-danger ml-2" aria-hidden="true" data-rvno="${review.rvNo}"></i>
		                      </span>
		                    </div>
		                    <div class="bg-white h-25 w-100 h-100 rounded p-2">
		                      ${review.content}
		                    </div>
		                  </div>
	                </div>
                	</c:when>
                	<c:otherwise>
                	<div class="col-6 mt-3 reviews reported">
	                  <div class="bg-light border rounded d-flex flex-column align-items-center p-3 mx-3 mb-3 rv">
	                    <div class="d-flex justify-content-between w-100 mb-2 px-1">
	                      <span></span>
	                      <span>
	                        <span>${review.wrDate }</span>
	                      </span>
	                    </div>
	                    <div class="bg-light h-25 w-100 h-100 rounded pt-4 text-center">
	                      관리자에 의해 신고 처리된 리뷰입니다.
	                    </div>
	                  </div>
	                </div>
                	</c:otherwise>
                </c:choose>
                </c:if>
               </c:forEach> 
                <div class="text-secondary small" style="cursor:pointer;" id="more">더보기</div>              
              </div>  
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
                      <p class="font-weight-bold">신고 대상 : <span class="reported"></span></p>
                      <div class="row d-flex justify-content-center mb-3 border px-2 pt-4 pb-2">
                          <div class="col-lg-12 px-0 rpContent">
                          </div>
                      </div>
                      <div class="row product__page__title ml-1 mb-0">
                          <div class="product__page__filter">
                              <p class="text-dark font-weight-bold">신고 유형 :</p>
                              <select class="ctgr border px-1 py-1">
                                  <option value="RPT01">부적절한 콘텐츠</option>
                                  <option value="RPT02">피싱 또는 스팸</option>
                                  <option value="RPT03">기타</option>
                              </select>
                          </div>
                      </div>
                      <div class="row">
                          <div class="blog__details__form pt-0 w-100">
                                  <div class="row">
                                      <textarea class="mb-0 border reportContent w-100 p-3" rows="10" spellcheck="false"></textarea>
                                  </div>
                                  <div class="d-flex justify-content-end">
                                      <p class="lecErr d-none text-danger mb-0 mr-2">신고 내용을 꼭 적어주셔야합니다.</p>
                                  </div>
                          </div>
                      </div>
                  </div>
              </div>
              <div class="modal-footer border-top-0">
                  <button type="button" class="btn btn-outline-secondary mr-2 rvReport">신고</button>
                  <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
              </div>
          </div>
      </div>
    </div>
  </section>
  
  <!--작성 모달-->
  <div class="modal fade" id="wrmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog " role="document">
      <div class="modal-content p-3">
        <div align="right">
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">X</span>
          </button>
        </div>

        <h2 class="modal-body text-center w-100" id="stars">
          <span class="fas fa-star gr" data-num="0"></span>
          <span class="fas fa-star gr" data-num="1"></span>
          <span class="fas fa-star gr" data-num="2"></span>
          <span class="fas fa-star gr" data-num="3"></span>
          <span class="fas fa-star gr" data-num="4"></span>
        </h2>
        <textarea spellcheck="false" class="m-5 p-3 bg-white border wrbox" placeholder="리뷰를 작성해주세요"></textarea>
        <div class="d-flex justify-content-center align-items-center">
          <button class="btn border mx-2" id="modalY">작성</button>
          <button class="btn border mx-2" type="button" data-dismiss="modal">취소</button>
        </div>

      </div>
    </div>
  </div>
<form action="/user/userLR" class="ReviewSearchForm">
	<input type="hidden" name="ltNo" value="${ltNo}">
	<input type="hidden" name="writer" value="">
	<input type="hidden" name="content" value="">
</form>
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
  	let rvno;
  	// 리뷰 신고 클릭시 내용, 아이디 가져오기
    $('.report').click((e)=>{
      $('#revReport').modal('show')
      $('.rpContent').text($(e.currentTarget).parent().parent().next().text())
      $('.reported').text($(e.currentTarget).parent().parent().first().children().first().text())
      rvno = e.currentTarget.dataset.rvno;
    })
    
    // 리뷰작성 모달창 띄우기
    $('#wr').click(() => {
      $('#wrmodal').modal('show')
    })
    
    // 별 마우스오버 이벤트
    $('#stars>span').mouseover((e)=>{
      const num = +e.currentTarget.dataset.num+1
      const st = document.querySelectorAll('#stars>span');
      for(let i=0; i<num; i++){
        $(st[i]).css('color','var(--warning)')
      }
    })
    const getgray = () =>{
      $('#stars .gr').css('color','gray')
    }
    $('#stars').mouseout(getgray)
    
    // 별 클릭 이벤트
    let num = 0;
    $('#stars>span').click((e)=>{
      num = +e.currentTarget.dataset.num+1;
      const st = document.querySelectorAll('#stars>span');
      for(let i=0; i<num; i++){
        $(st[i]).removeClass('gr');
        $(st[i]).addClass('selected');
      }
    })
    
    // 리뷰작성 ajax
    $('#modalY').click((e)=>{
      if(num===0){
    	  return;
      }
      if($('#modalY').text()==='작성'){
	      $.ajax({
	    	  url : '/user/userLRWrite',
	    	  data : {writer : '', ltNo : ${ltNo}, star: num, content: $('.wrbox').val()},
	    	  type : 'post',
	    	  beforeSend : (xhr) =>{
			      xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			  },
	      })
	      .done((r)=>{
	    	  $('#wrmodal').modal('hide');
	    	  location.href='/user/userLR?ltNo=${ltNo}';
	      })	  
      } else if($('#modalY').text()==='수정'){
    	  	$.ajax({
    	  		url : '/user/updateReview',
    	  		type : 'post',
	  	    	beforeSend : (xhr) =>{
	  			  xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	  			},
	  			data : {rvNo : +'${myReview.rvNo}', content: $('.wrbox').val(), star: num}
    	  	})
    	  	.done(()=>{
	    	  		window.alert('수정이 완료되었습니다.');
	    	  		$('#wrmodal').modal('hide');
	    	  		$('.myrvContent').text($('.wrbox').val());
	    	  		$('.wrbox').val('');
	    	  		getgray();
	    	  		//별수정
	    	  		$('.mystars').children().remove();
	    	  		for(let i=0; i<num;i++){
	    	  			$('.mystars').append(
	    	  				$('<span>').addClass('fas fa-star')		
	    	  			)
	    	  		}
    	  		})
    	  	
      }
    })
	
    // 더보기 클릭
    $('#more').click(()=>{
    	for(let i=0; i<6; i++){
    		$('.hided').removeClass('hided');
    	}
    })
    
    // 리뷰 신고
    $('.rvReport').click(()=>{
    	const data = { ltNo : ${ltNo}, type : $('.ctgr').val(), content : $('.reportContent').val(), reporter : '', num : rvno}
    	if(!data.content){
    		return;
    	}
    	$.ajax({
    		url : '/user/reportReview',
    		data: data,
    		type : 'post',
    		beforeSend : (xhr) =>{
  		      xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
  		  	},
    	})
    	.done((r)=>{
    		window.alert('신고가 완료되었습니다.');
    		location.href='/user/userLR?ltNo=${ltNo}';
    	})
    })
    
    // 검색
    const setRvSearchData = ()=>{
    	if($('.rvSearchType').val()==='content'){
    		document.querySelector('.ReviewSearchForm').firstElementChild.nextElementSibling.value='';
    		document.querySelector('.ReviewSearchForm').lastElementChild.value = $('#rvSearchKey').val();
    	} else {
    		document.querySelector('.ReviewSearchForm').lastElementChild.value = '';
    		document.querySelector('.ReviewSearchForm').firstElementChild.nextElementSibling.value=$('#rvSearchKey').val();
    	}
    }
    $('.rvSearchBtn').click(()=>{
    	setRvSearchData();
    	$('.ReviewSearchForm').submit();
    })
    $('#rvSearchKey').keyup((e)=>{
    	if(e.key==='Enter'){
    		setRvSearchData();
    		$('.ReviewSearchForm').submit();	
    	}
    })
    
    // 리뷰 삭제
    $('.delete').click((e)=>{
    	let rvNo = $('.delete').data('rvno');
    	$.ajax({
    		url : '/user/deleteReview',
    		data : {rvNo : rvNo},
    		type : 'post',
    		beforeSend : (xhr) =>{
    		      xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
    		  	},
    	})
    	.done(()=>{
    		$(e.target).parent().parent().parent().parent().remove();
    		$('#modify').addClass('d-none');
    		$('#wr').removeClass('d-none')
    	})
    })
    
    //리뷰수정
    $('#modify').click((e)=>{
    	$('.wrbox').val($('.myrvContent').text().trim())
    	$('#wrmodal').modal('show');
    	$('#modalY').text('수정');
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