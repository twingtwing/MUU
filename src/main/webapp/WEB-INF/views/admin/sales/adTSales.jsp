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
            <h4 class="page-title">기간별 매출 통계</h4>
            <div class="ml-auto text-right">
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">home</a></li>
                  <li class="breadcrumb-item active" aria-current="page">기간별 매출 통계</li>
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
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <!-- 여기서부터 작성 -->
                <div class="col-lg-12 pb-5 pt-3">
                  <h5 class="bg-dark px-3 py-2 mb-0 text-white" style="border-radius: 13px;">연도별 회사 매출</h5>
                  <div class="row mt-4 justify-content-center">
                    <div class="col-lg-8">
                      <div class="w-100 d-flex align-items-center flex-column">
                        <canvas id="myChart" width="10" height="5"></canvas>
                      </div>
                    </div>
                  </div>
                  <div class="row justify-content-center">
                    <div class="col-lg-10">
                      <table class="w-100 text-center border mt-4" border="1">
                        <tr>
                          <th></th>
                          <th>2016</th>
                          <th>2017</th>
                          <th>2018</th>
                          <th>2019</th>
                          <th>2020</th>
                          <th>2021</th>
                          <th>2022</th>
                          <th>총 합</th>
                        </tr>
                        <tr>
                          <td>판매량</td>
                          <td>5</td>
                          <td>9</td>
                          <td>7</td>
                          <td>12</td>
                          <td>20</td>
                          <td>36</td>
                          <td>28</td>
                          <td></td>
                        </tr>
                        <tr>
                          <td>매출액</td>
                          <td>5</td>
                          <td>9</td>
                          <td>7</td>
                          <td>12</td>
                          <td>20</td>
                          <td>36</td>
                          <td>28</td>
                          <td></td>
                        </tr>
                      </table>
                      <div class="row justify-content-end mt-3 w-100">
                        <button class="btn btn-danger mr-2">PDF다운</button>
                        <button class="btn btn-success mr-2">EXCEL다운</button>
                      </div>
                    </div>
                  </div>

                </div>

                <hr class="my-5">

                <div class="col-lg-12 pb-5 pt-3">
                  <h5 class="bg-dark px-3 py-2 mb-0 text-white" style="border-radius: 13px;">월별 회사 매출</h5>
                  <div class="row mt-4 m-3 justify-content-center">
                    <div class="col-lg-8">
                      <div class="row justify-content-end">
                        <select name="" id="" class="select border px-3 py-2">
                          <option value="">2022년</option>
                          <option value="">2021년</option>
                          <option value="">2020년</option>
                          <option value="">2019년</option>
                          <option value="">2018년</option>
                          <option value="">2017년</option>
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="row justify-content-center">
                    <div class="col-lg-8">
                      <div class="w-100 d-flex align-items-center flex-column">
                        <canvas id="myChart2" width="10" height="5"></canvas>
                      </div>
                    </div>
                  </div>

                  <div class="row justify-content-center">
                    <div class="col-lg-10">
                      <table class="w-100 text-center mt-4 table-bordered">
                        <tr>
                          <th></th>
                          <th width="7%">1월</th>
                          <th width="7%">2월</th>
                          <th width="7%">3월</th>
                          <th width="7%">4월</th>
                          <th width="7%">5월</th>
                          <th width="7%">6월</th>
                          <th width="7%">7월</th>
                          <th width="7%">8월</th>
                          <th width="7%">9월</th>
                          <th width="7%">10월</th>
                          <th width="7%">11월</th>
                          <th width="7%">12월</th>
                          <th width="7%">총 합</th>
                        </tr>
                        <tr>
                          <td>판매량</td>
                          <td>5</td>
                          <td>9</td>
                          <td>7</td>
                          <td>12</td>
                          <td>20</td>
                          <td>36</td>
                          <td>28</td>
                          <td>5</td>
                          <td>9</td>
                          <td>7</td>
                          <td>12</td>
                          <td>20</td>
                          <td></td>
                        </tr>
                        <tr>
                          <td>매출액</td>
                          <td>5</td>
                          <td>9</td>
                          <td>7</td>
                          <td>12</td>
                          <td>20</td>
                          <td>36</td>
                          <td>28</td>
                          <td>5</td>
                          <td>9</td>
                          <td>7</td>
                          <td>12</td>
                          <td>20</td>
                          <td></td>
                        </tr>
                      </table>
                      <div class="row justify-content-end mt-3 w-100">
                        <button class="btn btn-danger mr-2">PDF다운</button>
                        <button class="btn btn-success mr-2">EXCEL다운</button>
                      </div>
                    </div>
                  </div>
                  
                </div>

                <hr class="my-5">

                <div class="col-lg-12 pb-5">
                  <h5 class="bg-dark px-3 py-2 mb-0 text-white" style="border-radius: 13px;">카테고리별 연도별 매출</h5>
                  <div class="row mt-4 justify-content-center">
                    <div class="col-lg-8">
                      <div class="w-100 d-flex align-items-center flex-column">
                        <canvas id="myChart3" width="10" height="5"></canvas>
                      </div>
                    </div>
                  </div>
                  <div class="row justify-content-center">
                    <div class="col-lg-10">
                      <table class="w-100 mt-4 text-center border" border="1">
                        <tr>
                          <th></th>
                          <th>2016</th>
                          <th>2017</th>
                          <th>2018</th>
                          <th>2019</th>
                          <th>2020</th>
                          <th>2021</th>
                          <th>2022</th>
                          <th>총 합</th>
                        </tr>
                        <tr>
                          <td>판매량</td>
                          <td>5</td>
                          <td>9</td>
                          <td>7</td>
                          <td>12</td>
                          <td>20</td>
                          <td>36</td>
                          <td>28</td>
                          <td></td>
                        </tr>
                        <tr>
                          <td>매출액</td>
                          <td>5</td>
                          <td>9</td>
                          <td>7</td>
                          <td>12</td>
                          <td>20</td>
                          <td>36</td>
                          <td>28</td>
                          <td></td>
                        </tr>
                      </table>
                      <div class="row justify-content-end mt-3 w-100">
                        <button class="btn btn-danger mr-2">PDF다운</button>
                        <button class="btn btn-success mr-1">EXCEL다운</button>
                      </div>
                    </div>
                  </div>
                </div>

                <hr class="my-5">

                <div class="col-lg-12 pb-5">
                  <h5 class="bg-dark px-3 py-2 mb-0 text-white" style="border-radius: 13px;">카테고리별 월별 회사 매출</h5>
                  <div class="row mt-4 m-3 justify-content-center">
                    <div class="col-lg-8">
                      <div class="row justify-content-end">
                        <select name="" id="" class="select border px-3 py-2">
                          <option value="">2022년</option>
                          <option value="">2021년</option>
                          <option value="">2020년</option>
                          <option value="">2019년</option>
                          <option value="">2018년</option>
                          <option value="">2017년</option>
                        </select>
                      </div>
                    </div>
                  </div>
  
                  <div class="row justify-content-center">
                    <div class="col-lg-8">
                      <div class="w-100 d-flex align-items-center flex-column">
                        <canvas id="myChart4" width="10" height="5"></canvas>
                      </div>
                    </div>
                  </div>
                  <div class="row justify-content-center">
                    <div class="col-lg-10">
                      <table class="w-100 text-center mt-4 table-bordered">
                        <tr>
                          <th></th>
                          <th width="7%">1월</th>
                          <th width="7%">2월</th>
                          <th width="7%">3월</th>
                          <th width="7%">4월</th>
                          <th width="7%">5월</th>
                          <th width="7%">6월</th>
                          <th width="7%">7월</th>
                          <th width="7%">8월</th>
                          <th width="7%">9월</th>
                          <th width="7%">10월</th>
                          <th width="7%">11월</th>
                          <th width="7%">12월</th>
                          <th width="7%">총 합</th>
                        </tr>
                        <tr>
                          <td>판매량</td>
                          <td>5</td>
                          <td>9</td>
                          <td>7</td>
                          <td>12</td>
                          <td>20</td>
                          <td>36</td>
                          <td>28</td>
                          <td>5</td>
                          <td>9</td>
                          <td>7</td>
                          <td>12</td>
                          <td>20</td>
                          <td></td>
                        </tr>
                        <tr>
                          <td>매출액</td>
                          <td>5</td>
                          <td>9</td>
                          <td>7</td>
                          <td>12</td>
                          <td>20</td>
                          <td>36</td>
                          <td>28</td>
                          <td>5</td>
                          <td>9</td>
                          <td>7</td>
                          <td>12</td>
                          <td>20</td>
                          <td></td>
                        </tr>
                      </table>
                      <div class="row justify-content-end mt-3 w-100">
                        <button class="btn btn-danger mr-2">PDF다운</button>
                        <button class="btn btn-success mr-2">EXCEL다운</button>
                      </div>
                    </div>
                  </div>
                </div>

              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- 내용 끝 -->
      
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script>
    const ctx = document.getElementById('myChart').getContext('2d');
    const myChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: [2016, 2017, 2018, 2019, 2020, 2021, 2022],
        datasets: [{
          type: 'line',
          label: '매출액',
          backgroundColor: 'black',
          borderColor: 'darkred',
          data: [
            Math.random() * 15,
            Math.random() * 15,
            Math.random() * 15,
            Math.random() * 15,
            Math.random() * 15,
            Math.random() * 15,
            Math.random() * 15,
          ]
        }, {
          type: 'bar',
          label: '판매량',
          data: [
            Math.random() * 15,
            Math.random() * 15,
            Math.random() * 15,
            Math.random() * 15,
            Math.random() * 15,
            Math.random() * 15,
            Math.random() * 15,
          ],
          backgroundColor: 'gray'
        }, ]
      },
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        },
      }
    });

    const ctx2 = document.getElementById('myChart2').getContext('2d');
    const myChart2 = new Chart(ctx2, {
      type: 'bar',
      data: {
        labels: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
        datasets: [{
          type: 'line',
          label: '매출액',
          backgroundColor: 'black',
          borderColor: 'darkred',
          data: [
            Math.random() * 15,
            Math.random() * 15,
            Math.random() * 15,
            Math.random() * 15,
            Math.random() * 15,
            Math.random() * 15,
            Math.random() * 15,
            Math.random() * 15,
            Math.random() * 15,
            Math.random() * 15,
            Math.random() * 15,
            Math.random() * 15,
          ]
        }, {
          type: 'bar',
          label: '판매량',
          data: [
            Math.random() * 15,
            Math.random() * 15,
            Math.random() * 15,
            Math.random() * 15,
            Math.random() * 15,
            Math.random() * 15,
            Math.random() * 15,
            Math.random() * 15,
            Math.random() * 15,
            Math.random() * 15,
            Math.random() * 15,
            Math.random() * 15,
          ],
          backgroundColor: 'gray'
        }, ]
      },
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        },
      }
    });

    const ctx3 = document.getElementById('myChart3').getContext('2d');
    const myChart3 = new Chart(ctx3, {
      type: 'bar',
      data: {
        labels: [2016, 2017, 2018, 2019, 2020, 2021, 2022],
        datasets: [{
            type: 'bar',
            label: '요리',
            backgroundColor: 'Darkseagreen',
            data: [
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
            ]
          }, {
            type: 'bar',
            label: '아트',
            data: [
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
            ],
            backgroundColor: 'lightgray'
          },
          {
            type: 'bar',
            label: '자기계발',
            data: [
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
            ],
            backgroundColor: 'powderblue'
          },
          {
            type: 'bar',
            label: 'IT, 컴퓨터',
            data: [
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
            ],
            backgroundColor: 'pink'
          }
        ]
      },
      options: {
        scales: {
          x: {
            stacked: true
          },
          y: {
            beginAtZero: true,
            stacked: true
          }
        },
      }
    });
 
    const ctx4 = document.getElementById('myChart4').getContext('2d');
    const myChart4 = new Chart(ctx4, {
      type: 'bar',
      data: {
        labels: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
        datasets: [{
            type: 'bar',
            label: '요리',
            backgroundColor: 'Darkseagreen',
            data: [
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
            ]
          }, {
            type: 'bar',
            label: '아트',
            data: [
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
            ],
            backgroundColor: 'lightgray'
          },
          {
            type: 'bar',
            label: '자기계발',
            data: [
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
            ],
            backgroundColor: 'powderblue'
          },
          {
            type: 'bar',
            label: 'IT, 컴퓨터',
            data: [
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
              Math.random() * 15,
            ],
            backgroundColor: 'pink'
          }
        ]
      },
      options: {
        scales: {
          x: {
            stacked: true
          },
          y: {
            beginAtZero: true,
            stacked: true
          }
        },
      }
    });
  
  </script>
</body>
</html>