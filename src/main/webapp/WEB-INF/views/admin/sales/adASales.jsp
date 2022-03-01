<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
      <!-- 바디 시작 -->

      <!-- 페이지명-->
      <div class="page-breadcrumb">
        <div class="row">
          <div class="col-12 d-flex no-block align-items-center">
            <!-- 페이지명 작성 및 카테고리 작성 -->
            <h4 class="page-title">기타 통계</h4>
            <div class="ml-auto text-right">
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">매출</a></li>
                  <li class="breadcrumb-item active" aria-current="page">기타 통계</li>
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
                  <h5 class="bg-dark px-3 py-2 mb-0 text-white" style="border-radius: 13px;">성별 매출 통계</h5>
                  <div class="row mt-4 m-3 justify-content-center">
                    <div class="col-lg-11">
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
                    <div class="row col-lg-11">
                      <div class="w-25 d-flex align-self-center flex-column">
                        <!-- 비율 숫자 나와야함 -->
                        <canvas id="gender" width="10" height="5"></canvas>
                      </div>
                      <div class="w-75 align-items-center flex-column">
                        <!-- 비율 숫자 나와야함 -->
                        <canvas id="genderm" width="10" height="5"></canvas>
                      </div>
                    </div>
                  </div>
                  <h5 class="mt-4"><i class="fas fa-hashtag"></i> 여성 매출 표</h5>
                  <table class="w-100 text-center mt-2 table-bordered">
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
                  <h5 class="mt-4"><i class="fas fa-hashtag"></i> 남성 매출 표</h5>
                  <table class="w-100 text-center mt-2 table-bordered">
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

                <hr>

                <div class="col-lg-12 pb-5 pt-3">
                  <h5 class="bg-dark px-3 py-2 mb-0 text-white" style="border-radius: 13px;">연령별 매출 통계</h5>
                  <div class="row mt-4 m-3 justify-content-center">
                    <div class="col-lg-11">
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
                    <div class="row col-lg-11">
                      <div class="w-25 d-flex align-self-center flex-column">
                        <!-- 비율 숫자 나와야함 -->
                        <canvas id="age" width="10" height="5"></canvas>
                      </div>
                      <div class="w-75 align-items-center flex-column">
                        <!-- 비율 숫자 나와야함 -->
                        <canvas id="agem" width="10" height="5"></canvas>
                      </div>
                    </div>
                  </div>
                  <h5 class="mt-4"><i class="fas fa-hashtag"></i> 10대 이하 매출 표</h5>
                  <table class="w-100 text-center mt-2 table-bordered">
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
                  <h5 class="mt-4"><i class="fas fa-hashtag"></i> 20대 매출 표</h5>
                  <table class="w-100 text-center mt-2 table-bordered">
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
                  <h5 class="mt-4"><i class="fas fa-hashtag"></i> 30대 매출 표  </h5>
                  <table class="w-100 text-center mt-2 table-bordered">
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
                  <h5 class="mt-4"><i class="fas fa-hashtag"></i> 40대 매출 표  </h5>
                  <table class="w-100 text-center mt-2 table-bordered">
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
                  <h5 class="mt-4"><i class="fas fa-hashtag"></i> 50대 매출 표  </h5>
                  <table class="w-100 text-center mt-2 table-bordered">
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
                  <h5 class="mt-4"><i class="fas fa-hashtag"></i> 60대 이상 매출 표  </h5>
                  <table class="w-100 text-center mt-2 table-bordered">
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
      <!-- 내용 끝 -->

      <!-- 바디 끝 -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script>
    const genderId = document.getElementById('gender').getContext('2d');
    const gender = new Chart(genderId, {
      type: 'doughnut',
      data: {
        labels: ['남성', '여성'],
        datasets: [{
          label: '매출액',
          backgroundColor: ['powderblue', 'pink'],
          data: [
            44, 56
          ]
        }, ]
      },
      options: {
        scales: {

        },
      }
    });


    const gendermId = document.getElementById('genderm').getContext('2d');
    const genderm = new Chart(gendermId, {
      type: 'bar',
      data: {
        labels: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
        datasets: [{
          type: 'bar',
          label: '남성',
          backgroundColor: 'powderblue',
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
          label: '여성',
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
        }, ]
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


    const ageId = document.getElementById('age').getContext('2d');
    const age = new Chart(ageId, {
      type: 'doughnut',
      data: {
        labels: ['10대 이하', '20대','30대','40대','50대','60대 이상'],
        datasets: [{
          label: '매출액',
          backgroundColor: ['powderblue','pink','teal','Lavender','lightgray','tomato'],
          data: [
            32,15,17,9,16,11
          ]
        },]
      },
      options: {
      }
    });


    const agemId = document.getElementById('agem').getContext('2d');
    const agem = new Chart(agemId, {
      type: 'bar',
      data: {
        labels: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
        datasets: [{
            type: 'bar',
            label: '10대 이하',
            backgroundColor: 'powderblue',
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
            label: '20대',
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
          },
          {
            type: 'bar',
            label: '30대',
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
            backgroundColor: 'teal'
          },
          {
            type: 'bar',
            label: '40대',
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
            backgroundColor: 'lavender'
          },
          {
            type: 'bar',
            label: '50대',
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
            label: '60대 이상',
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
            backgroundColor: 'tomato'
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