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
            <a href="#"><i class="fa fa-home"></i> 홈</a>
            <a href="#">마이페이지</a>
            <a href="#">내 강의리스트</a>
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
              <li class="list-group-item border-bottom-0 align-items-center d-flex justify-content-center" style="height: 75px;">
                <a class="list-link" href="#">
                  <div class="row">
                    <div class="col-lg-4 justify-content-center align-items-center d-flex">
                      <imo style="font-size:25px;">🚀</imo>
                    </div>
                    <div class="col-lg-8 pr-0 pl-0 align-items-center d-flex">
                      <p class="font-weight-bold mb-0">&nbsp;&nbsp;&nbsp;&nbsp;GO TO<br>강의 리스트</p>
                    </div>
                  </div>
                </a>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                <!-- 해당 상위카테고리 일때, active가 보여야함 => 자바스크립트 혹은 c:if구문으로 해결해야함 -->
                <a class="list-link" href="#">수업 목록</a>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                <a class="list-link" href="./박정욱_위시리스트.html">공지사항</a>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                <a class="list-link active" href="./박정욱_위시리스트.html">질문 & 답변</a>
              </li>
              <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                <a class="list-link" href="./박정욱_위시리스트.html">리뷰 & 별점</a>
              </li>
              <li class="list-group-item align-items-center d-flex" style="height: 55px;">
                <a class="list-link" href="./박정욱_유저결제내역.html">환불</a>
              </li>
            </ul>
          </div>
        </div>

        <div class="col-lg-10">
          <div class="row col-lg-12 ml-2">
            <h3 class="font-weight-bold"><i class="fa fa-question-circle-o text-danger" aria-hidden="true"></i>&nbsp;수강 중 - 질문 & 답변</h3>
          </div>
          <hr class="font-weight-bold"> 

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
              <tbody class="qstboard">
              <c:forEach items="${myList}" var="list">
                <tr data-qnaNo = "${list.qnaNo}">
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
                <button type="button" class="border px-4">검색</button>
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
                <tbody class="qstboard" id="qstList">
                <c:forEach items="${qnaList}" var="list">
                  <tr data-qnaNo = ${list.qnaNo}>
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
                  <a class="current-page paging">${page}</a>				
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
  <script>
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
      console.log(data)
      $.ajax({
    	  url : '/user/userInsertLQ',
    	  data : data,
    	  method : 'post',
    	  beforeSend : (xhr) =>{
		      xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		  },  
      })
      .done((r)=>{
    	  console.log(r)
      })
      // 데이터 다 제대로 넘어가고, sql문도 맞는데 안된다. 왜지 ㅡㅡ;;
    })

    
    // 답변 조회
	const makeRow = (content)=>{
		let row = $('<tr>').append(
	 	        $('<td>').attr('colspan', 4).text(content).addClass('clicked'));
	 	return row;
	}
    $('.qstboard').click((e) => {
    	let qnaNo = e.target.parentNode.dataset.qnano;
    	if(e.target.parentNode.lastElementChild.textContent==='답변 대기 중'){
    		return;
    	}
    	if(e.target.parentNode.childElementCount===1){
    		return;
    	}
	    if(e.target.parentNode.nextElementSibling.childElementCount===1){
	    	e.target.parentNode.nextElementSibling.firstElementChild.remove();
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
		let key = $('#lqSearchKey').val();
		const data = { ltNo : ${ltNo}, writerSearchKey: undefined, contentSearchKey : undefined, page : pageNum};
		if($('#searchOption').val()==='writer'){
			data.writerSearchKey = key;
		} else if($('#searchOption').val()==='content'){
			data.contentSearchKey = key;
		}
		pagination(data);
	})
	const pagination = (data)=>{
		$.ajax({
			url : '/user/userLQpage',
			data : data,
		})
		.done((res)=>{
			console.log(res);
			removeAll();
		})
	}
	const removeAll = ()=>{
		$('#qstList').children().remove();
	}
	const makeRow = (list)=>{
		let row = $('<tr>')
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