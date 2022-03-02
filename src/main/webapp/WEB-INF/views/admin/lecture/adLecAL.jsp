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

    .admin_search th {
      background-color: #eeeeee;
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
            <h4 class="page-title">강의관리</h4>
            <div class="ml-auto text-right">
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">강의관리</a></li>
                  <li class="breadcrumb-item active" aria-current="page">강의등록</li>
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
                <div class="row position-relative">
                  <table class="admin_search table table-bordered">
                    <tr height="38">
                      <th width="15%">크리에이터 ID</th>
                      <td width="35%">
                        <input class="w-100 border" type="text" spellcheck="false">
                      </td>
                      <th width="15%">강의명</th>
                      <td width="35%">
                        <input class="w-100 border" type="text" spellcheck="false">
                      </td>
                    </tr>
                    <tr>
                      <th>카테고리</th>
                      <td class="d-flex border-0">
                        <select name="" id="ctgr" class="border w-100">
                          <option value="">전체(상위 카테고리)</option>
                          <option value="">요리</option>
                          <option value="">건강</option>
                          <option value="">아트</option>
                          <option value="">IT/컴퓨터</option>
                          <option value="">외국어</option>
                          <option value="">자기계발</option>
                        </select>
                        <select name="" id="downctgr" class="border w-100">
                          <option value="">전체(하위 카테고리)</option>
                        </select>
                      </td>
                      <th>처리상태</th>

                      <td class="text-left">
                        <input type="checkbox" class="ml-2" name="" id="complete" spellcheck="false">
                        <label for="complete" class="mr-3 mb-0">등록완료</label>
                        <input type="checkbox" name="" id="waiting" spellcheck="false">
                        <label for="waiting" class="mb-0 mr-3">대기중</label>
                      </td>
                    </tr>
                    <tr height="38">
                      <th>등록 신청 날짜</th>
                      <td colspan="3">
                        <div class="d-flex border-0 align-items-center">
                          <input type="date" class="border w-30">
                          <i class="fas fa-minus mx-2"></i>
                          <input type="date" class="border w-30">
                        </div>
                      </td>
                    </tr>
                  </table>
                  <button class="btn btn-secondary position-absolute"
                    style="width: 75px; height: 33px; right: 5px; bottom: 19px;">검색</button>
                </div>
                <div class="row">
                  <table class="table table-bordered">
                    <tr style="background-color: #eeeeee;">
                      <th width="100px">강의번호</th>
                      <th width="150px">크리에이터 ID</th>
                      <th width="250px">카테고리</th>
                      <th>강의명</th>
                      <th width="120px">강의 등록일</th>
                      <th width="120px">강의 금액</th>
                      <th width="100px">처리상태</th>
                    </tr>
                    <tr>
                      <td>4</td>
                      <td>user123@naver.com</td>
                      <td>
                        <span>요리</span> > <span>베이킹</span>
                      </td>
                      <td>재미있게 배우는 베이킹! 우리아이와 함께</td>
                      <td>2022-02-02</td>
                      <td>100,000</td>
                      <td>등록완료</td>
                    </tr>
                    <tr>
                      <td>4</td>
                      <td>user123@naver.com</td>
                      <td>
                        <span>요리</span> > <span>베이킹</span>
                      </td>
                      <td>재미있게 배우는 베이킹! 우리아이와 함께</td>
                      <td>2022-02-02</td>
                      <td>100,000</td>
                      <td>등록완료</td>
                    </tr>
                    <tr>
                      <td>4</td>
                      <td>user123@naver.com</td>
                      <td>
                        <span>IT/컴퓨터</span> <i class="mdi mdi-chevron-right"></i> <span>Photoshop/Illustrator</span>
                      </td>
                      <td>재미있게 배우는 베이킹! 우리아이와 함께</td>
                      <td>2022-02-02</td>
                      <td>100,000</td>
                      <td>등록완료</td>
                    </tr>
                  </table>
                </div>
                <div class="row d-flex justify-content-center position-relative">
                  <div class="dataTables_paginate paging_simple_numbers" id="zero_config_paginate">
                    <ul class="pagination">
                      <li class="paginate_button page-item previous"
                          id="zero_config_previous"><a href="#" aria-controls="zero_config"
                              data-dt-idx="0" tabindex="0" class="page-link"><i class="mdi mdi-chevron-double-left"></i></a></li>
                      <li class="paginate_button page-item active"><a href="#"
                              aria-controls="zero_config" data-dt-idx="1" tabindex="0"
                              class="page-link">1</a></li>
                      <li class="paginate_button page-item "><a href="#"
                              aria-controls="zero_config" data-dt-idx="2" tabindex="0"
                              class="page-link">2</a></li>
                      <li class="paginate_button page-item "><a href="#"
                              aria-controls="zero_config" data-dt-idx="3" tabindex="0"
                              class="page-link">3</a></li>
                      <li class="paginate_button page-item "><a href="#"
                              aria-controls="zero_config" data-dt-idx="4" tabindex="0"
                              class="page-link">4</a></li>
                      <li class="paginate_button page-item "><a href="#"
                              aria-controls="zero_config" data-dt-idx="5" tabindex="0"
                              class="page-link">5</a></li>
                      <li class="paginate_button page-item "><a href="#"
                              aria-controls="zero_config" data-dt-idx="6" tabindex="0"
                              class="page-link">6</a></li>
                      <li class="paginate_button page-item next" id="zero_config_next"><a href="#"
                              aria-controls="zero_config" data-dt-idx="7" tabindex="0"
                              class="page-link"><i class="mdi mdi-chevron-double-right"></i></a></li>
                    </ul>
                  </div>
                  <div class="position-absolute" style="right: 1px;">
                    <button class="btn btn-danger">PDF다운</button>
                    <button class="btn btn-success">EXCEL다운</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 내용 끝 -->
      </div>

      <!-- 바디 끝 -->
    <script>
      const 종류 = {
        '음악' : ['클래식','재즈','락','힙합/랩','타악기','기타/베이스','동양음악','보컬','작사/작곡'],
        '요리': ['양식','동양식','간편요리','코스요리','가정식','베이킹'],
        '건강': ['홈트레이닝','필라테스','요가','정신건강','테라피'],
        '아트': ['2D/애니메이션','드로잉','수채화','유화','동양화','판화','공예','사진','메이크업/분장'],
        'IT/컴퓨터': ['Java','Python','C/C++/C#','웹프로그래밍','Unity','영상편집','Photoshop/Illustrator','3D모델링','기타'],
        '외국어': ['영어','일본어','중국어','스페인어','포르투갈어','아랍어','러시아어'],
        '자기계발': ['부동산','주식','면접/자소서','SNS/블로그','기타'],
      }
      $('#ctgr').change(()=>{
        $('#downctgr>option:not(:eq(0))').remove();
        let upper = $('#ctgr option:selected').text();
        종류[upper].forEach((v)=>{
          $('#downctgr').append(
            $('<option>').val(v).text(v)
          )
        })
      })
    </script>
</body>
</html>