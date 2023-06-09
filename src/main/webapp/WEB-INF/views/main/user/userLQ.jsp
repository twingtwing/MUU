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
    .qstboard, .qstboard button, .qstboard td{
   	font-size: 0.9rem;
   }
   #qstList tr:hover{
   	background-color: lightgray;
   }
   tr{
   	border-bottom: solid 1px lightgray;
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
            <a href="/home" class="text-dark font-weight-bold"><i class="fa fa-home"></i>Home</a>
            <a href="/user/userSelect" class="text-dark font-weight-bold">마이페이지</a>
            <a href="/user/userLectureList" class="text-dark font-weight-bold">내 강의리스트</a>
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
              <li class="list-group-item border-bottom-0 align-items-center d-flex justify-content-center"
                style="height: 75px;" onclick="location.href='/user/userLectureList'">
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
              <li class="list-group-item border-bottom-0 align-items-center d-flex  listmenu"
                data-url="/user/userLectureSelect" style="height: 55px;">
                <div class="list-link">수업 목록</div>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex listmenu" data-url="/user/userLNL"
                style="height: 55px;">
                <div class="list-link">공지사항</div>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex listmenu" data-url="/user/userLQ"
                style="height: 55px;">
                <div class="list-link  active" data-url="/user/userLQ">질문 & 답변</div>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex listmenu" data-url="/user/userLR"
                style="height: 55px;">
                <div class="list-link">리뷰 & 별점</div>
              </li>
              <li class="list-group-item align-items-center d-flex listmenu" data-url="/user/userRefund"
                style="height: 55px;">
                <div class="list-link">환불</div>
              </li>
            </ul>
          </div>
        </div>

        <div class="col-lg-10">
          <div class="row col-lg-12 ml-2">
            <h3 class="font-weight-bold"><i class="fa fa-question-circle-o text-danger" aria-hidden="true"></i>&nbsp;수강
              중 - 질문 & 답변</h3>
          </div>
          <hr class="font-weight-bold">
          <div class="col-lg-12 px-0 mb-3">
            <div class="card w-100">
              <div class="card-body">
                <div class="row">
                  <div class="col-3">
                    <img class="rounded" src="${sugang.thumb }" alt=""
                      style="object-fit: cover; width: 100%; height: 150px;">
                  </div>
                  <div class="col-9 d-flex align-items-center">
                    <div class="w-100">
                      <h3 class="font-weight-bold pb-3">${sugang.ttl }</h3>
                      <div class="progress mt-3">
                        <div class="progress-bar bg-danger text-left" role="progressbar" aria-valuenow="70"
                          aria-valuemin="0" aria-valuemax="100" style="width:${sugang.progPct}%">
                          　${sugang.progPct}%
                        </div>
                      </div>
                      <div class="text-right font-weight-bold mt-2 text-secondary">수강기간:　${sugang.regDate
                        }　-　${sugang.expDate }　</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="card" style="height: auto; position: relative;">
            <div class="card-body">
             <div class="text-danger">※ <span class="text-success font-weight-bold">답변 완료</span> 표시가 있는 질문을 클릭하면 답변을 확인할 수 있습니다.</div>
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
                    <th style="width:120px">작성일</th>
                    <th style="width:120px">답변여부</th>
                    <th style="width:100px;"></th>
                  </tr>
                </thead>
                <tbody class="qstboard myQstBoard">
                <c:if test="${empty myList }">
                <tr><td colspan="4">질문 내역이 없습니다.</td></tr>
                </c:if>
                  <c:forEach items="${myList}" var="list">
                    <tr data-qnano="${list.qnaNo}">
                      <td>${list.qContent }</td>
                      <td>${list.qRegDate }</td>
                      <c:if test="${list.qnaStCode eq 'Q01' }">
                        <th class="font-weight-bold text-danger">답변 대기 중</th>
                        <td>
                          <button class="border modify">수정</button>
                          <button class="border delete">삭제</button>
                        </td>
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
                <textarea class="border p-3" spellcheck="false" placeholder="질문 내용을 작성해주세요." style="height: 20rem;"
                  id="myquestion"></textarea>
                <button class="border px-3 py-2" id="wr">작성</button>
              </div>
              <br>

              <div class="d-flex justify-content-end ">
                <select class="border px-4" id="searchOption">
                  <option value="content">내용</option>
                  <option value="writer">작성자</option>
                </select>
                <input type="text" class="border" id="lqSearchKey" spellcheck="false">
                <button type="button" class="border px-4" id="searchQna">검색</button>
              </div>
              <table class="bg-light w-100 mt-3 text-center border">
                <thead>
                  <tr>
                    <th>질문 내용</th>
                    <th style="width:150px">작성자</th>
                    <th style="width:120px">작성일</th>
                    <th style="width:100px">답변여부</th>
                  </tr>
                </thead>

                <c:if test="${empty qnaList }">
                <tr><td colspan="4">질문 내역이 없습니다.</td></tr>
                </c:if>
                <tbody class="qstboard" id="qstList">
                  <c:forEach items="${qnaList}" var="list">
                    <tr data-qnano="${list.qnaNo}">
                      <td>${list.qContent }</td>
                      <td >${list.writer }</td>
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
                      <a class="paging current-page">${page}</a>
                    </c:when>
                    <c:otherwise>
                      <a class="paging">${page}</a>
                    </c:otherwise>
                  </c:choose>
                </c:forEach>
                <c:if test="${pagination.currRange ne pagination.pageCnt && pagination.pageCnt > 0}">
                  <a><i class="fa fa-angle-double-right"></i></a>
                </c:if>
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
	  $('#move').submit();
  })
    // 질문박스
    $('#qst').click((e) => {
      if ($('#qst').text() === '질문하기') {
    	$('.delete').attr('disabled',true);
    	$('.modify').attr('disabled',true);
        $('#qst').text('닫기')
      } else {
    	$('.delete').attr('disabled',false);
      	$('.modify').attr('disabled',false);
        $('#qst').text('질문하기')
      }
      $('#qstbox').toggleClass('d-none');
      $('#qstbox').toggleClass('d-flex');
    })

    
    
    
    let qnanoForMod;
    // 질문 등록 및 수정
    $('#wr').click((e) => {
      let length = $('#myquestion').val().replace(/[\0-\x7f]|([0-\u07ff]|(.))/g,"$&$1$2").length;
      if ($('#wr').text() === '작성') {
    	if(length>=1000){
    		window.alert('1000자 내외로 작성해주세요.');
    		return;
    	}
    	lineMaker($('#myquestion'));
        let data = {
          qContent: $('#myquestion').val(),
          ltNo: ${ltNo}
        }
        $('#myquestion').val('')
        $.ajax({
            url: '/user/userInsertLQ',
            data: data,
            method: 'post',
            beforeSend: (xhr) => {
              xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
          })
          .done((r) => {
        	$('#qst').text('질문하기');
        	$('.delete').attr('disabled',false);
      		$('.modify').attr('disabled',false);
            let today = new Date().toISOString().slice(0, 10)
            $('#qstbox').toggleClass('d-none');
            $('#qstbox').toggleClass('d-flex');
            window.alert('등록이 완료되었습니다.');
            location.reload();
          })
      } else if($('#wr').text() === '수정'){
      	  if(length>=1000){
      		window.alert('1000자 내외로 작성해주세요.');
      		return;
      	  }
      	  lineMaker($('#myquestion'));
    	  let data = {qnaNo : qnanoForMod, qContent : $('#myquestion').val()}
    	  $('#myquestion').val('')
    	  updateQna(data);
    	  location.reload()
    	  window.alert('수정이 완료되었습니다.')
    	  $('.modify').click()
    	  $('#qstbox').addClass('d-none');
    	  $('#myquestion').val()    	  
    	  $('#myquestion').val('')
      }
    })


    // 답변 조회
    const makeRow = (content) => {
      let row = $('<tr>').append(
        $('<td>').attr('colspan', 4).html(content).addClass('clicked')).addClass('font-weight-bold');
      return row;
    }
    $('.qstboard').click((e) => {
      if(e.target.nodeName ==='BUTTON'){
    	  return;
      }	
      let qnaNo = $(e.target).parent().data('qnano');
      if(e.currentTarget.className.includes('myQstBoard')){
    	  let chk = e.target.parentElement.nextElementSibling==null ? 0 : e.target.parentElement.nextElementSibling.firstElementChild.className;
    	  if(chk==='clicked'){
    		  e.target.parentElement.nextElementSibling.remove();
			  return;
    	  }
      } else {
		  if(e.target.parentElement.nextElementSibling?.children.length===1){

			  e.target.parentElement.nextElementSibling.remove();
			  return;
		  }   	  
      }
      if ($(e.target.parentNode.firstElementChild).next().next().text() === '답변 완료'||e.target.parentNode.lastElementChild.textContent === '답변 완료') {
	      $.ajax({
	          url: '/user/selectQna',
	          data: {
	            qnaNo: qnaNo
	          },
	          contentType: 'application/text;charset=utf-8'
	        })
	        .done((res) => {
	          $(e.target.parentNode).after(makeRow(res.aContent));
	        })
      }
    })


    // 페이지네이션
    $('.paging').click((e) => {
      let pageNum = +e.currentTarget.textContent;
      const data = {
        ltNo: ${ltNo},
        writerSearchKey: '',
        contentSearchKey: '',
        page: pageNum
      };
      if (!$('#lqSearchKey').val()) {
        pagination(data);
      } else {
        let searchData = makeSearchData(pageNum);
        pagination(searchData);
      }
      $('.current-page').removeClass('current-page');
      $(e.target).addClass('current-page');
    })
    
    $('#searchQna').click(() => {
      let data = makeSearchData(1);
      pagination(data);
    });
    
    const makeSearchData = (p) => {
      const data = {
        ltNo: ${ltNo},
        writerSearchKey: '',
        contentSearchKey: '',
        page: p
      };
      let key = $('#lqSearchKey').val();
      if ($('#searchOption').val() === 'writer') {
        data.writerSearchKey = key;
        data.contentSearchKey = '';
      } else if ($('#searchOption').val() === 'content') {
        data.contentSearchKey = key;
        data.writerSearchKey = '';
      }
      return data;
    }
    
    $('#lqSearchKey').keyup((e) => {
      if (e.key === 'Enter') {
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
			if(res.length===0){
				$('#qstList').append(
					$('<tr>').append($('<td>').attr('colspan',4).text('검색 결과가 없습니다.'))
				)
			} else {
				makeRowPage(res);				
			}
		})
	}
    const removeAll = () => {
      $('#qstList').children().remove();
    }
    const makeRowPage = (list) => {
      for (let val of list) {
        if (val.qnaStCode === 'Q01') {
          val.qnaStCode = '답변 대기 중';
          val.color = 'text-danger'
        } else {
          val.qnaStCode = '답변 완료';
          val.color = 'text-success';
        }
        let tr = $('<tr>').append(
          $('<td>').html(val.qContent),
          $('<td>').text(val.writer),
          $('<td>').text(dateformat(val.qRegDate)),
          $('<th>').text(val.qnaStCode).addClass(val.color),
        );
        tr.data('qnano', +val.qnaNo)
        $('#qstList').append(tr)
      }
    }
    const dateformat = (num)=>{
    	let date = new Date(num);
    	return new Date(num - date.getTimezoneOffset()*60000).toISOString().slice(0,10);
    }

    // 수정버튼 클릭시
    $('.myQstBoard').click((e) => {
      if(e.target.className.includes('modify')){
	      if(e.target.textContent === '수정'){
	    	  e.target.textContent = '닫기'
	      } else if (e.target.textContent === '닫기') {
	    	  e.target.textContent = '수정';
	      }
	      let qnaNo = $(e.target).parent().parent().data('qnano');
	      $('#qstbox').toggleClass('d-none');
	      $('#qstbox').toggleClass('d-flex');
	      $('#wr').text('수정')
	      $.ajax({
	    	  url : '/user/selectQna',
	      	  data : { qnaNo: qnaNo },
	          contentType: 'application/json;charset=utf-8'
	      })
	      .done((r)=>{
	    	  $('#myquestion').val(r.qContent.replaceAll(/(<br>|<br\/>|<br \/>)/g, '\r\n'));
	    	  qnanoForMod = qnaNo;  
	      }) 
      }
    })
    
	const updateQna = (d) =>{
		$.ajax({
			url : '/user/updateMyqna',
			data : d,
			type : 'post',
			beforeSend : (xhr) =>{
			      xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
		})
	}

	// 삭제버튼 클릭시
	$('.myQstBoard').click((e)=>{
		console.log($(e.target).parent().parent().data('qnano'))
		if(!e.target.className.includes('delete')){
			return;
		}
		if(!window.confirm('정말로 삭제하시겠습니까?')){
			return;
		}
		let qnaNo = $(e.target).parent().parent().data('qnano');
		$.ajax({
			url : '/user/deleteMyqna',
			data : {qnaNo : qnaNo},
			type : 'post',
			beforeSend : (xhr) =>{
			      xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
		})
		.done(()=>{
			$(e.target).parent().parent().remove();
		})
	})
	
	const lineMaker = (el)=>{
		let content = el.val();
		content = content.replace(/\r\n/ig,'<br>');
		content = content.replace(/\\n/ig,'<br>');
		content = content.replace(/\n/ig,'<br>');
		el.val(content);
	}
		
    //mouseover 이벤트 : 사이드바 css변경
    $('#cctgr  .list-group-item:not(.mylist)').on('mouseover', function () {
      $(this).css('background-color', '#e53637');
      $(this).find('.list-link').css('color', '#ffffff');
      $(this).find('p').css('color', '#ffffff');
    })

    //mouseover 이벤트 : 사이드바 css변경
    $('#cctgr  .list-group-item:not(.mylist)').on('mouseout', function () {
      $(this).css('background-color', '#ffffff');
      $(this).find('.list-link').css('color', '#000000');
      $(this).find('p').css('color', '#000000');
      $(this).find('.list-link.active').css('color', '#e53637');
    })
  </script>
</body>

</html>