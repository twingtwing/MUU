<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
      <!-- 페이지명-->
      <div class="page-breadcrumb">
        <div class="row">
          <div class="col-12 d-flex no-block align-items-center">
            <!-- 페이지명 작성 및 카테고리 작성 -->
            <h4 class="page-title">크리에이터별 매출 통계</h4>
            <div class="ml-auto text-right">
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">매출</a></li>
                  <li class="breadcrumb-item active" aria-current="page">크리에이터 매출</li>
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
                <div class="col-lg-12 pb-5 pt-3">
                  <h5 class="bg-dark px-3 py-2 mb-0 text-white" style="border-radius: 13px;">크리에이터별 연도별 회사 매출</h5>
                  <div class="row mt-4 justify-content-between mb-3">
                      <select name="" id="" class="border px-3 py-2">
                        <option value="">2016</option>
                        <option value="">2017</option>
                        <option value="">2018</option>
                        <option value="">2019</option>
                        <option value="">2020</option>
                        <option value="">2021</option>
                        <option value="">2022</option>
                      </select>
                      <div>
                        <select name="" id="" class="border px-3 py-2">
                          <option value="id">아이디</option>
                          <option value="name">이름</option>
                        </select>
                        <input type="text" placeholder="검색" class="border px-3 py-2">
                        <button class="border px-3 py-2">검색</button>
                      </div>
                  </div>
                  <div class="row">
                    <table class="table table-bordered">
                      <tr style="background-color: #eeeeee;">
                        <th>순위</th>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>강의 수</th>
                        <th>판매량</th>
                        <th>총 매출</th>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>creator123</td>
                        <td>시바</td>
                        <td>개도 하는 뜨개질</td>
                        <td>24</td>
                        <td>150,000</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>creator123</td>
                        <td>시바</td>
                        <td>개도 하는 뜨개질</td>
                        <td>24</td>
                        <td>150,000</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>creator123</td>
                        <td>시바</td>
                        <td>개도 하는 뜨개질</td>
                        <td>24</td>
                        <td>150,000</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>creator123</td>
                        <td>시바</td>
                        <td>개도 하는 뜨개질</td>
                        <td>24</td>
                        <td>150,000</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>creator123</td>
                        <td>시바</td>
                        <td>개도 하는 뜨개질</td>
                        <td>24</td>
                        <td>150,000</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>creator123</td>
                        <td>시바</td>
                        <td>개도 하는 뜨개질</td>
                        <td>24</td>
                        <td>150,000</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>creator123</td>
                        <td>시바</td>
                        <td>개도 하는 뜨개질</td>
                        <td>24</td>
                        <td>150,000</td>
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

                 <div class="col-lg-12 pb-5 pt-3">
                  <h5 class="bg-dark px-3 py-2 mb-0 text-white" style="border-radius: 13px;">크리에이터별 월별 회사 매출 <span>(2022년)</span></h5>
                  <div class="row mt-4 justify-content-between mb-3">
                    <select name="" id="" class="border px-3 py-2">
                      <option value="">1월</option>
                      <option value="">2월</option>
                      <option value="">3월</option>
                      <option value="">4월</option>
                      <option value="">5월</option>
                      <option value="">6월</option>
                      <option value="">7월</option>
                      <option value="">8월</option>
                      <option value="">9월</option>
                      <option value="">10월</option>
                      <option value="">11월</option>
                      <option value="">12월</option>
                    </select>
                    <div>
                      <select name="" id="" class="border px-3 py-2">
                        <option value="id">아이디</option>
                        <option value="name">이름</option>
                      </select>
                      <input type="text" placeholder="검색" class="border px-3 py-2">
                      <button class="border px-3 py-2">검색</button>
                    </div>
                  </div>
                  <div class="row">
                    <table class="table table-bordered">
                      <tr style="background-color: #eeeeee;">
                        <th>순위</th>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>강의 수</th>
                        <th>판매량</th>
                        <th>총 매출</th>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>creator123</td>
                        <td>시바</td>
                        <td>개도 하는 뜨개질</td>
                        <td>24</td>
                        <td>150,000</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>creator123</td>
                        <td>시바</td>
                        <td>개도 하는 뜨개질</td>
                        <td>24</td>
                        <td>150,000</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>creator123</td>
                        <td>시바</td>
                        <td>개도 하는 뜨개질</td>
                        <td>24</td>
                        <td>150,000</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>creator123</td>
                        <td>시바</td>
                        <td>개도 하는 뜨개질</td>
                        <td>24</td>
                        <td>150,000</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>creator123</td>
                        <td>시바</td>
                        <td>개도 하는 뜨개질</td>
                        <td>24</td>
                        <td>150,000</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>creator123</td>
                        <td>시바</td>
                        <td>개도 하는 뜨개질</td>
                        <td>24</td>
                        <td>150,000</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>creator123</td>
                        <td>시바</td>
                        <td>개도 하는 뜨개질</td>
                        <td>24</td>
                        <td>150,000</td>
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
        </div>
      </div>
</body>
</html>