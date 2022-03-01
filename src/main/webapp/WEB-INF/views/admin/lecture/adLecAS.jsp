<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <style>
    table tr,
    table td {
      text-align: center;
      vertical-align: middle;
    }

    .admin_search td,
    .admin_search th {
      text-align: center;
      vertical-align: middle;
      padding: 5px;
    }
    td,th {
      padding: 10px;
    }

    .admin_search th {
      background-color: #eeeeee;
    }
    .reclicked {
      display: none;
    }
    .modal{
      margin-top: 10rem;
    }
  </style>
</head>
<body>
      <!-- 바디 시작 -->

      <!-- 페이지명-->
      <div class="page-breadcrumb">
        <div class="row">
          <div class="col-12 d-flex no-block align-items-center">
            <!-- 페이지명 작성 및 카테고리 작성 -->
            <h4 class="page-title">강의관리 (상세)</h4>
            <div class="ml-auto text-right">
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">크리에이터</a></li>
                  <li class="breadcrumb-item active" aria-current="page">강의관리 (상세)</li>
                </ol>
              </nav>
            </div>
          </div>
        </div>
      </div>
      <!-- 페이지명 끝-->

      <!-- 내용 시작 -->
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-body">
                <!-- 여기서부터 작성 -->
                <div class="row">
                  <a href="javscript:history.back()" class="mb-3 border p-2 text-secondary">뒤로가기</a>
                  <table class="table table-bordered mb-5">
                    <tr style="background-color: #eeeeee;">
                      <th>강의번호</th>
                      <th>크리에이터 ID</th>
                      <th>강의명</th>
                      <th>강의 등록일</th>
                      <th>강의 금액</th>
                      <th>키트 금액</th>
                      <th>카테고리</th>
                      <th>처리상태</th>
                    </tr>
                    <tr>
                      <td>4</td>
                      <td>user123@naver.com</td>
                      <td>재미있게 배우는 베이킹! 우리아이와 함께</td>
                      <td>2022-02-02</td>
                      <td>100,000</td>
                      <td>50,000</td>
                      <td>
                        <span>요리</span> > <span>베이킹</span>
                      </td>
                      <td>등록완료</td>
                    </tr>
                  </table>
                  <h5>강의 소개</h5>
                  <div class="border w-100 p-2 mb-5">
                    어쩌구저쩌구
                  </div>
                  <h5>수업 소개</h5>
                  <table class="table table-bordered mb-5 w-100" id="list">
                    <tr>
                      <td colspan="2">기초 다지기 - 피아노의 기본에 대하여</td>
                    </tr>
                    <tr>
                      <td colspan="2">기초 다지기 - 필수 음악이론</td>
                    </tr>
                    <tr>
                      <td colspan="2">악보 익히기 - 악보를 제대로 이해하자</td>
                    </tr>
                    <tr>
                      <td colspan="2">악보 익히기 - 오른손 연주</td>
                    </tr>
                    <tr>
                      <td colspan="2">악보 익히기 - 왼손 연주</td>
                    </tr>
                    <tr>
                      <td colspan="2">악보 익히기 - 양손 연주</td>
                    </tr>
                    <tr>
                      <td colspan="2">중간 점검</td>
                    </tr>
                    </tr>
                  </table>

                  <h5>키트 여부</h5>
                  <div class="mb-5 w-100 d-flex justify-content-center">
                    <table class="border mb-5 w-100" border="1">
                      <tr>
                        <th class="bg-light">강의명</th>
                        <td>제로부터 시작하는 피아노</td>
                      </tr>
                      <tr>
                        <th class="bg-light">키트 금액</th>
                        <td><span>50,000</span>원</td>
                      </tr>
                      <tr class="bg-light">
                        <th colspan="2">키트 설명</th>
                      </tr>
                      <tr>
                        <td colspan="2">
                          키트설명. 이건이렇게해서쓰면되고 매뉴얼에따라 이러쿵저러쿵 요리조리 해보세여
                        </td>
                      </tr>
                    </table>
                  </div>
                  <div class="d-flex flex-column align-items-center justify-content-center w-100 mb-3">
                    <h4>키트 금액 : <span>50,000</span>원</h4>
                    <h4>강의 금액 : <span>100,000</span>원</h4>
                    <h4 class="text-danger">합　계 : <span>150,000</span>원</h4>
                  </div>
                  
                  <div class="d-flex justify-content-center w-100 mb-5">
                    <button class="p-3 mx-2 border bg-success font-weight-bold text-white" id="ok">강의 등록 승인</button>
                    <button class="p-3 mx-2 border bg-danger font-weight-bold text-white" id="reject">강의 등록거부</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 내용 끝 -->
      <!--강의거부 모달창-->
        <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog " role="document">
            <div class="modal-content p-3">
              <div align="right">
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">X</span>
                </button>
              </div>
              <h3 class="text-center">강의 등록 신청 거부</h3>
              <textarea spellcheck="false" class="m-5 p-3 bg-white border wrbox" placeholder="거부 사유를 써주세요"></textarea>
              <div class="d-flex justify-content-center align-items-center">
                <button class="btn border mx-2 text-white bg-danger" id="modalY" href="#">거부</button>
                <button class="btn border mx-2" type="button" data-dismiss="modal">취소</button>
              </div>

            </div>
          </div>
        </div>
      </div>
      <!-- 바디 끝 -->
<script>
  const makerow = (no) => {
      const row = $('<tr>').append(
        $('<td>').append(
          $('<vedio>').attr('src','./'),$('<span>')
        )
      ).addClass('clicked');
      return row;
    }
    $('#list tr').click((e) => {
     if(e.currentTarget.nextElementSibling.className=='clicked'){
       $(e.currentTarget.nextElementSibling).addClass('reclicked').removeClass('clicked')
       return;
     }else{
       $(e.currentTarget).after(makerow());
     }
    })

    $('#reject').click(()=>{
      $('#modal').modal('show');
    })
</script>
</body>
</html>