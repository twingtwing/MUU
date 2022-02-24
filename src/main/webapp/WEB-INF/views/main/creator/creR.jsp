<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/creator-menu.css" type="text/css">
</head>
<body>
<!-- 배너 시작-->
  <section class="normal-breadcrumb set-bg" data-setbg="/resources/img/normal-breadcrumb.jpg">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <div class="normal__breadcrumb__text">
            <h2>크리에이터 페이지</h2>
            <p>환불 요청 내역</p>
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
            <a href="#"><i class="fa fa-home"></i> 홈</a>
            <a href="#">환불요청내역</a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 카테고리 끝-->
  
  <section class="blog spad">
    <div class="container">
      <div class="row">
        <div class="col-lg-2">
          <div class="row mr-2" style="width:160px">
            <ul class="list-group w-100" id="cctgr">
                            <!-- 해당 상위카테고리 일때, active가 보여야함 => 자바스크립트 혹은 jstl if구문으로 해결해야함 -->
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                                <a class="list-link active" href="/creS">크리에이터 정보</a>
                            </li>
                            <p class="list-group-item border-bottom-0 mb-0 align-items-center d-flex mylist">내 강의 목록</p>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex pl-40" style="height: 35px;">
                                <a class="list-link" href="/rLecL">&nbsp;&nbsp;- 신청한 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                                <a class="list-link" href="/oLecL">&nbsp;&nbsp;- 열린 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                                <a class="list-link" href="/clLecL">&nbsp;&nbsp;- 종료된 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 35px;">
                                <a class="list-link" href="/rpLecL">&nbsp;&nbsp;- 신고된 강의</a>
                            </li>
                            <li class="list-group-item border-bottom-0 align-items-center d-flex" style="height: 55px;">
                                <a class="list-link" href="/lecI">강의등록</a>
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
          <div class="col-12 ml-2">
            <div class="row col-12">
              <h3 class="font-weight-bold"><i class="fa fa-money text-danger" aria-hidden="true"></i>&nbsp;환불요청내역</h3>
            </div>
          
            <hr class="font-weight-bold">
          
            <div class="row col-12">
              <div class="row col-12 justify-content-end mt-3 mb-1">
                <label for="chk" class="m-0 mx-4">  
                  <input type="checkbox" class="border" id="chk">
                  처리 전만 보기
                </label>
                <div>
                  <select class="border px-4">
                    <option value="" selected>전체</option>
                    <option value="">환불 사유</option>
                    <option value="">수강생 이름</option>
                    <option value="">강의명</option>
                  </select>
                </div>
                <input type="text" class="border" spellcheck="false" placeholder="검색...">
                <button type="button" class="border px-4 mr-4">검색</button>
              </div>

              <div class="row col-12">
                <!-- 테이블 간격 조금 좁음 넓히자 -->
                <table class="w-100 list ml-2 mr-4">
                  <thead class="bg-light">
                    <tr>
                      <th>회원번호</th>
                      <th>이름</th>
                      <th>강의명</th>
                      <th>결제일</th>
                      <th>환불 요청일</th>
                      <th>환불사유</th>
                      <th>결제금액</th>
                      <th>처리상태</th>
                    </tr>
                  </thead>
                  <tbody>
                    <!-- for문 돌리기 -->
                    <tr>
                      <td>1000</td>
                      <td>박복자</td>
                      <td>누구나 배우는 뜨개질 A to Z</td>
                      <td>2022.05.06</td>
                      <td>2022.05.08</td>
                      <td>재미없음</td>
                      <td>60,000</td>
                      <td class="font-weight-bold">처리 전</td>
                    </tr>
          
                    <tr>
                      <td>1000</td>
                      <td>박복자</td>
                      <td>누구나 배우는 뜨개질 A to Z</td>
                      <td>2022.05.06</td>
                      <td>2022.05.08</td>
                      <td>재미없음</td>
                      <td>60,000</td>
                      <td class="font-weight-bold text-success">처리완료</td>
                    </tr>
                    <tr>
                      <td>1000</td>
                      <td>박복자</td>
                      <td>누구나 배우는 뜨개질 A to Z</td>
                      <td>2022.05.06</td>
                      <td>2022.05.08</td>
                      <td>재미없음</td>
                      <td>60,000</td>
                      <td class="font-weight-bold text-danger">거부됨</td>
                    </tr>
                    <tr>
                      <td>1000</td>
                      <td>박복자</td>
                      <td>누구나 배우는 뜨개질 A to Z</td>
                      <td>2022.05.06</td>
                      <td>2022.05.08</td>
                      <td>재미없음</td>
                      <td>60,000</td>
                      <td class="font-weight-bold text-danger">거부됨</td>
                    </tr>
                    <tr>
                      <td>1000</td>
                      <td>박복자</td>
                      <td>누구나 배우는 뜨개질 A to Z</td>
                      <td>2022.05.06</td>
                      <td>2022.05.08</td>
                      <td>재미없음</td>
                      <td>60,000</td>
                      <td class="font-weight-bold text-danger">거부됨</td>
                    </tr>
                    <tr>
                      <td>1000</td>
                      <td>박복자</td>
                      <td>누구나 배우는 뜨개질 A to Z</td>
                      <td>2022.05.06</td>
                      <td>2022.05.08</td>
                      <td>재미없음</td>
                      <td>60,000</td>
                      <td class="font-weight-bold text-danger">거부됨</td>
                    </tr>
                  </tbody>
                </table>
              </div>

              <div class="row col-12 justify-content-center mt-3">
                <div class="product__pagination">
                  <a href="#"><i class="fa fa-angle-double-left"></i></a>
                  <a href="#" class="current-page">1</a>
                  <a href="#">2</a>
                  <a href="#">3</a>
                  <a href="#">4</a>
                  <a href="#">5</a>
                  <a href="#"><i class="fa fa-angle-double-right"></i></a>
                </div>
              </div>
              
            </div>
          
          </div>
        </div>
     
      </div>
    </div>
  </section>
<script type="text/javascript">
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