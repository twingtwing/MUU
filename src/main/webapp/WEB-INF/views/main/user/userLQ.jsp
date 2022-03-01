<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
    #cctgr>li {
      cursor: pointer;

    }

    .list-link {
      color: black;
    }

    .list-link.active {
      font-weight: bold;
      color: #e53637;

    }
    td,
    th {
      padding: 0.5rem;
    }

    thead {
      background-color: lightgray;
    }

    tbody>tr {
      cursor: pointer;
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
            <a href="/home" class="text-secondary"><i class="fa fa-home"></i> 홈</a>
            <a href="/user/userSelect" class="text-secondary">마이페이지</a>
            <a href="/user/userLectureList" class="text-secondary">내 강의리스트</a>
            <span>질문 & 답변</span>
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
              <li class="list-group-item border-bottom-0 align-items-center d-flex  listmenu" data-url="/user/userLectureSelect" style="height: 55px;">
                <div class="list-link">수업 목록</div>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex listmenu" data-url="/user/userLNL" style="height: 55px;">
                <div class="list-link">공지사항</div>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex listmenu" data-url="/user/userLQ" style="height: 55px;">
                <div class="list-link  active" data-url="/user/userLQ">질문 & 답변</div>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex listmenu" data-url="/user/userLR"style="height: 55px;">
                <div class="list-link" >리뷰 & 별점</div>
              </li>
              <li class="list-group-item align-items-center d-flex listmenu"  data-url="/user/userRefund" style="height: 55px;">
                <div class="list-link">환불</div>
              </li>
            </ul>
          </div>
        </div>

        <div class="col-lg-10">
          <div class="row col-lg-12 ml-2">
            <h3 class="font-weight-bold"><i class="fa fa-question-circle-o text-danger" aria-hidden="true"></i>&nbsp;수강 중 - 질문 & 답변</h3>
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
          <div class="card" style="height: auto; position: relative;">
            <div class="card-body">
              <div class="d-flex justify-content-between align-items-center m-3">
                <div class="d-flex align-self-end">
                  <div class="row">
                    <i class="fa fa-hashtag mr-1"></i>
                    <h5 class="font-weight-bold">내 질문</h5>
                  </div>
                </div>
                <button class="border py-1 px-3" id="qst">질문하기</button>
              </div>
              <table class="border w-100 text-center">
				<thead>
                <tr class="bg-light">
                  <th>질문 내용</th>
                  <th>작성일</th>
                  <th>답변여부</th>
                </tr>
				</thead>
              <tbody class="qstboard" style="font-size: 0.9rem;">
              <c:forEach items="${myList}" var="list">
                <tr data-qnano = "${list.qnaNo}">
                  <td>${list.qContent }</td>
                  <td>${list.qRegDate }</td>
                  <c:if test="${list.qnaStCode eq 'Q01' }">
                  	<th class="font-weight-bold text-danger">답변 대기 중</th>
                  </c:if>
                  <c:if test="${list.qnaStCode eq 'Q02' }">
                  	<th class="font-weight-bold text-success">답변 완료</th>
                  </c:if>
                </tr>
              </c:forEach>
              </tbody>
              </table>
              <br>
              <div class="d-none justify-content-center flex-column" id="qstbox">
                <textarea class="border p-3" spellcheck="false" placeholder="질문 내용을 작성해주세요." style="height: 20rem;" id="myquestion"></textarea>
                <button class="border px-3 py-2" id="wr">작성</button>
              </div>
              <br>

              <div class="d-flex justify-content-end ">
                <select class="border px-4" id="searchOption">
                  <option value="content">내용</option>
                  <option value="writer">작성자</option>
                </select>
                <input type="text" class="border" id="lqSearchKey">
                <button type="button" class="border px-4" id="searchQna">검색</button>
              </div>
              <table class="bg-light w-100 mt-3 text-center border">
                <thead>
                  <tr>
                    <th>질문 내용</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>답변여부</th>
                  </tr>
                </thead>
                <tbody class="qstboard" id="qstList" style="font-size: 0.9rem;">
                <c:forEach items="${qnaList}" var="list">
                  <tr data-qnano = ${list.qnaNo}>
                    <td>${list.qContent }</td>
                    <td>${list.writer }</td>
                    <td>${list.qRegDate }</td>
                    <c:if test="${list.qnaStCode eq 'Q01'}">
                  		<th class="font-weight-bold text-danger">답변 대기 중</th>
                    </c:if>
                    <c:if test="${list.qnaStCode eq 'Q02'}">
                  		<th class="font-weight-bold text-success">답변 완료</th>
                  	</c:if>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
              
              <div class="product__pagination d-flex justify-content-center">
                <c:if test="${pagination.currRange ne 1}">
                  <a><i class="fa fa-angle-double-left"></i></a>
				</c:if>
				<c:forEach begin="${pagination.startPage }" end="${pagination.endPage }" var="page">
				<c:choose>
				<c:when test="${page eq pagination.currPage}">
                  <a class="paging">${page}</a>				
				</c:when>
				<c:otherwise>
				  <a class="paging">${page}</a>
				</c:otherwise>
				</c:choose>
				</c:forEach>
                <c:if test="${pagination.currRange ne pagination.pageCnt && pagination.pageCnt > 0}">
                  <a><i class="fa fa-angle-double-right"></i></a>
				</c:if>
                <a href="#"><i class="fa fa-angle-double-right"></i></a>
              </div>

            </div>
            <!--card body end-->
          </div>

        </div>
      </div>
    </div>
  </section>
    <form action="" id="move" method="get">
  	<input type="hidden" name="ltNo" value="${sugang.ltNo}">
  	<input type="hidden" name="tlsnNo" value="${sugang.tlsnNo }">
  </form>
  <script>
  $('.listmenu').click((e)=>{
	  let url = e.currentTarget.dataset.url;
	  $('#move').attr('action',url);
	  if(url ==='/user/userLectureSelect'){
		  $('#move').attr('method','post');
		  $('#move').append(
			$('<input>').attr('type','hidden').attr('name','${_csrf.parameterName}').val('${_csrf.token}')
		  )
	  }
	  $('#move').submit();
  })
  	// 질문박스
    $('#qst').click((e) => {
      if($('#qst').text()==='질문하기'){
        $('#qst').text('닫기')
      } else {
        $('#qst').text('질문하기')
      }
      $('#qstbox').toggleClass('d-none');
      $('#qstbox').toggleClass('d-flex');
    })

    // 질문 등록
    $('#wr').click((e) => {
      let data = {qContent : $('#myquestion').val(), ltNo : ${ltNo}}
      $.ajax({
    	  url : '/user/userInsertLQ',
    	  data : data,
    	  method : 'post',
    	  beforeSend : (xhr) =>{
		      xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		  },  
      })
      .done((r)=>{
    	  $('#qstbox').toggleClass('d-none');
          $('#qstbox').toggleClass('d-flex');
          window.alert('등록이 완료되었습니다.');
      })
    })

    
    // 답변 조회
	const makeRow = (content)=>{
		let row = $('<tr>').append(
	 	        $('<td>').attr('colspan', 4).text(content).addClass('clicked'));
	 	return row;
	}
	
    $('.qstboard').click((e) => {
    	let qnaNo = $(e.target).parent().data('qnano');
    	if(e.target.parentNode.lastElementChild.textContent==='답변 대기 중'){
    		return;
    	}
	    if($(e.target).parent().children().length===1){
	    	e.target.parentNode.nextElementSibling.firstElementChild.remove();
	       return;
	    }
    	if($(e.target).parent().children().length===1){
			return;
		}
	    if($(e.target).parent().next().children().length===1){
	    	$(e.target).parent().next().first().remove();
	       return;
	    }
	    $.ajax({
		 	url : '/user/selectQna',
		 	data : {qnaNo : qnaNo},
		 	contentType: 'application/text;charset=utf-8'
			})
			.done((res)=>{
			$(e.target.parentNode).after(makeRow(res));
			})    		
	    })

	     
	// 페이지네이션
	$('.paging').click((e)=>{
		let pageNum = +e.currentTarget.textContent-1;
		const data = { ltNo : ${ltNo}, writerSearchKey: '', contentSearchKey : '', page : pageNum};
		if(!$('#lqSearchKey').val()){
			pagination(data);			
		} else {
			let searchData = makeSearchData(pageNum);
			pagination(searchData);
		}	
	})
	
	$('#searchQna').click(()=>{
		let data = makeSearchData(0);
		pagination(data);
	});
	
    const makeSearchData = (p)=>{
    	const data = { ltNo : ${ltNo}, writerSearchKey: '', contentSearchKey : '', page : p};
    	let key = $('#lqSearchKey').val();
		if($('#searchOption').val()==='writer'){
			data.writerSearchKey = key;
			data.contentSearchKey = '';
		} else if($('#searchOption').val()==='content'){
			data.contentSearchKey = key;
			data.writerSearchKey = '';
		}
		return data;
    }
	
	
	$('#lqSearchKey').keyup((e)=>{
		if(e.key==='Enter'){
			$('#searchQna').click();
		}
	})
	
	const pagination = (d)=>{
		$.ajax({
			url : '/user/userLQpage',
			data : d,
		})
		.done((res)=>{
			removeAll();
			makeRowPage(res);
		})
	}
	const removeAll = ()=>{
		$('#qstList').children().remove();
	}
	const makeRowPage = (list) =>{
		for(let val of list) {
			if(val.qnaStCode==='Q01'){
				val.qnaStCode='답변 대기 중';
				val.color='text-danger'
			} else {
				val.qnaStCode='답변 완료';
				val.color='text-success';
			}
			let tr = $('<tr>').append(
					$('<td>').text(val.qContent),
					$('<td>').text(val.writer),
					$('<td>').text(new Date(val.qRegDate).toISOString().slice(0,10)),
					$('<th>').text(val.qnaStCode).addClass(val.color),
					);
			tr.data('qnano',+val.qnaNo)
			$('#qstList').append(tr)
			}
		}
	
	
	     
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