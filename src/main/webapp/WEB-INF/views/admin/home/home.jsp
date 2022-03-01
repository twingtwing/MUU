<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">사이트 주요 분석</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Library</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Sales Cards  -->
                <!-- ============================================================== -->
                <div class="row">
                    <!-- Column -->
                </div>
                <!-- ============================================================== -->
                <!-- Sales chart -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-md-flex align-items-center">
                                    <div>
                                        <h4 class="card-title">최근 일주일 매출</h4>
                                        <h5 class="card-subtitle">판매량 및 매출액</h5>
                                    </div>
                                </div>
                                <div class="row d-flex align-items-center">
                                    <!-- column -->
                                    <div class="col-lg-7">
                                        <div class="flot-chart">
                                            <canvas id="recent7days" width="10" height="5"></canvas>
                                        </div>
                                    </div>
                                    <div class="col-lg-5">
                                        <div class="row">
                                            <div class="col-6 mb-2" style="height: 110px;">
                                                <div class="bg-dark p-10 text-white h-100 d-flex align-items-center justify-content-center">
                                                    <div class="text-center">
                                                        <i class="fa fa-user m-0 font-16"></i>
                                                        <h5 class="mb-0 ">2540</h5>
                                                        <small class="font-light">총 회원 수</small>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-6 mb-2" style="height: 110px;">
                                                <div class="bg-dark p-10 text-white h-100 d-flex align-items-center justify-content-center">
                                                    <div class="text-center">
                                                        <i class="fa fa-plus m-0 m-b-5 font-16"></i>
                                                        <h5 class="mb-0">120</h5>
                                                        <small class="font-light">총 수강횟수</small>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-6 mb-2" style="height: 110px;">
                                                <div class="bg-dark p-10 text-white h-100 d-flex align-items-center justify-content-center">
                                                    <div class="text-center">
                                                        <i class="fa fa-cart-plus m-0 font-16"></i>
                                                        <h5 class="mb-0">656</h5>
                                                        <small class="font-light">크리에이터<br>총 강의 개수</small>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-6 mb-2" style="height: 110px;">
                                                <div class="bg-dark p-10 text-white h-100 d-flex align-items-center justify-content-center">
                                                    <div class="text-center">
                                                        <i class="fa fa-tag m-0 m-b-5 font-16"></i>
                                                        <h5 class="mb-0">9540</h5>
                                                        <small class="font-light">최근 한 달<br>수강횟수</small>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-6" style="height: 110px;">
                                                <div class="bg-dark p-10 text-white h-100 d-flex align-items-center justify-content-center">
                                                    <div class="text-center">
                                                        <i class="fa fa-table m-0 m-b-5 font-16"></i>
                                                        <h5 class="mb-0">100</h5>
                                                        <small class="font-light">최근 가입한<br>회원 수</small>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-6" style="height: 110px;">
                                                <div class="bg-dark p-10 text-white h-100 d-flex align-items-center justify-content-center">
                                                    <div class="text-center">
                                                        <i class="fa fa-globe m-0 m-b-5 font-16"></i>
                                                        <h5 class="mb-0">8540</h5>
                                                        <small class="font-light">최근 등록된<br>크리에이터 수</small>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- column -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- Sales chart -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Recent comment and chats -->
                <!-- ============================================================== -->

                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="chat-box scrollable">
                                    <h4 class="card-title">크리에이터 매출 TOP3</h4>
                                    <h5 class="card-subtitle">최근 1년 기준</h5>
                                    <!--크리에이터 프로필-->
                                    <div class="d-flex flex-row comment-row m-t-0 align-items-center">
                                        <div class="p-2"><img src="assets/images/users/1.jpg" alt="user" width="50"
                                                class="rounded-circle"></div>
                                        <div class="comment-text w-100">
                                            <h6 class="font-medium">서강중</h6>
                                            <div>개설 강의:
                                                <span>&lt; 리눅스, 알면 쉽다 &gt;</span> <span>&lt; PL/SQL &gt;</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex flex-row comment-row m-t-0 align-items-center">
                                        <div class="p-2"><img src="assets/images/users/1.jpg" alt="user" width="50"
                                                class="rounded-circle"></div>
                                        <div class="comment-text w-100">
                                            <h6 class="font-medium">서강중</h6>
                                            <div>개설 강의:
                                                <span>&lt; 리눅스, 알면 쉽다 &gt;</span> <span>&lt; PL/SQL &gt;</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex flex-row comment-row m-t-0 align-items-center">
                                        <div class="p-2"><img src="assets/images/users/1.jpg" alt="user" width="50"
                                                class="rounded-circle"></div>
                                        <div class="comment-text w-100">
                                            <h6 class="font-medium">서강중</h6>
                                            <div>개설 강의:
                                                <span>&lt; 리눅스, 알면 쉽다 &gt;</span> <span>&lt; PL/SQL &gt;</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <!-- Card -->
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">역대 인기 강의 TOP 3</h4>
                                <h5 class="card-subtitle">가장 사랑받았던 강의들</h5>
                                <div class="chat-box scrollable">
                                    <!--강의-->
                                    <div class="d-flex flex-row comment-row m-t-0 align-items-center">
                                        <div class="p-2"><img src="/assets/images/custom-select.png" alt="user" width="70"
                                                height="50" class="rounded c"></div>
                                        <div class="comment-text w-100">
                                            <h6 class="font-medium m-0">개도 하는 뜨개질</h6>
                                            <span>크리에이터 : <strong>김뜨개</strong></span>
                                        </div>
                                    </div>
                                    <div class="d-flex flex-row comment-row m-t-0 align-items-center">
                                        <div class="p-2"><img src="/assets/images/logo-icon.png" alt="user" width="70"
                                                height="50" class="rounded c"></div>
                                        <div class="comment-text w-100">
                                            <h6 class="font-medium m-0">개도 하는 뜨개질</h6>
                                            <span>크리에이터 : <strong>김뜨개</strong></span>
                                        </div>
                                    </div>
                                    <div class="d-flex flex-row comment-row m-t-0 align-items-center">
                                        <div class="p-2"><img src="/assets/images/custom-select.png" alt="user" width="70"
                                                height="50" class="rounded c"></div>
                                        <div class="comment-text w-100">
                                            <h6 class="font-medium m-0">개도 하는 뜨개질</h6>
                                            <span>크리에이터 : <strong>김뜨개</strong></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <!-- column -->
                    <div class="col-lg-6">
                        <!-- Card -->
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">올해 매출 한번에 보기</h4>
                                <canvas id="thisyear" width="10" height="5"></canvas>
                            </div>
                        </div>
                        
                        
                    </div>
                    <!-- column -->

                    <div class="col-lg-6">
                        <!-- card -->
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">성별 / 연령별 회원 통계</h4>
                                <canvas id="gender"></canvas>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-6">
                        <!-- card -->
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-5">
                                        <h4 class="text-center">카테고리 점유율</h4>
                                        <canvas id="ctgr"></canvas>
                                    </div>
                                    <div class="col-lg-7">
                                        <div class="row justify-content-center">
                                            <h4 class="mb-0">카테고리별 연령대 분포</h4>
                                        </div>
                                        <div class="row h-100 align-items-center">
                                            <canvas id="ctgrByOld" class="w-100 h-75"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                       <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">카테고리별 성별 분포</h4>
                                <canvas id="ctgrByGender" class="h-100"></canvas>
                            </div>
                        </div> 
                    </div>
                </div>
            <!-- ============================================================== -->
            <!-- Recent comment and chats -->
            <!-- ============================================================== -->
            </div>            
              
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // 최근 일주일
        const recent7daysId = document.getElementById('recent7days').getContext('2d');
        const recent7days = new Chart(recent7daysId, {
            type: 'bar',
            data: {
                labels: [17, 18, 19, 20, 21, 22, `${23} (오늘)`],
                datasets: [{
                    type: 'line',
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
                    ],
                    backgroundColor: 'seagreen'
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

        // 최근 1년
        const thisyearId = document.getElementById('thisyear').getContext('2d');
        const thisyear = new Chart(thisyearId, {
            type: 'bar',
            data: {
                labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
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

        // 성별, 연령별
        const genderId = document.getElementById('gender').getContext('2d');
        const gender = new Chart(genderId, {
            type: 'bar',
            data: {
                labels: ['10대', '20대', '30대', '40대', '50대', '60대 이상'],
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
                        Math.random() * 8,
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

        // 카테고리별
        const ctgrId = document.getElementById('ctgr').getContext('2d');
        const ctgr = new Chart(ctgrId, {
            type: 'doughnut',
            data: {
                labels: ['음악','요리','건강', '아트', 'IT/컴퓨터','외국어','자기계발'],
                datasets: [{
                    backgroundColor: ['Darkseagreen', 'powderblue', 'seagreen', 'beige','lightgray','aqua','pink'],
                    data: [
                        Math.random() * 15,
                        Math.random() * 15,
                        Math.random() * 15,
                        Math.random() * 15,
                        Math.random() * 15,
                        Math.random() * 15,
                        Math.random() * 15,
                    ]
                }]
            },

        });

        // 카테고리별 성별
        const ctgrByGenderId = document.getElementById('ctgrByGender').getContext('2d');
        const ctgrByGender = new Chart(ctgrByGenderId, {
            type: 'bar',
            data: {
                labels: ['음악','요리','건강', '아트', 'IT/컴퓨터','외국어','자기계발'],
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
                        Math.random() * 8,
                    ],
                    backgroundColor: 'pink'
                }, ]
            },
            options: {
                indexAxis: 'y',
                elements: {
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
            }
        });

        // 카테고리별 연령대
        const ctgrByOldId = document.getElementById('ctgrByOld').getContext('2d');
        const ctgrByOld = new Chart(ctgrByOldId, {
            type: 'bar',
            data: {
                labels: ['음악','요리','건강','아트','IT/컴퓨터','외국어','자기계발'],
                datasets: [{
                        type: 'bar',
                        label: '10대',
                        backgroundColor: 'powderblue',
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
                        label: '20대',
                        data: [
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
                        ],
                        backgroundColor: 'tomato'
                    }
                ]
            },
            options: {
                indexAxis: 'y',
                elements: {
                    scales: {
                        x: {
                            stacked: true
                        },
                        y: {
                            beginAtZero: true,
                            stacked: true
                        }
                    },
                },
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