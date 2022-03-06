<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <style>
        .bocket_delete:hover, .checkModal:hover{
            text-decoration: underline;
            cursor: pointer;
        }

        .nav-items .active small{
            color: red;
        }

        .nav-link:not(.active){
            color: black;
        }

        .modal_close{
            position: absolute;
            right: 20px;
            font-size: 25px; 
            top: 10px;
        }
    </style>
</head>
<body>
    <div id="pay">
        
        <!-- 배너 시작-->
        <section class="normal-breadcrumb set-bg" data-setbg="/resources/img/normal-breadcrumb.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="normal__breadcrumb__text">
                            <h2>결제</h2>
                            <p>여러분의 자기 개발을 지원합니다!</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- 배너끝 -->

        <!-- 일부러 카테고리 안함 -->

        <!-- body 의 body-->
        <section class="blog spad">
            <div class="container">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-7">
                            <div class="card">
                                <div class="card-header d-flex justify-content-between">
                                    <h5>강의정보</h5>
                                    <p v-on:click="delAll" class="mb-0 bocket_delete text-muted">전체삭제</p>
                                </div>
                                <div class="card-body pb-1">
                                    <div v-if="lectureList.length == 0">
                                        <p class="text-center">선택한 강의가 없습니다.</p>
                                    </div>
                                    <!-- 반복 -->
                                    <div v-for="(lec,index) in lectureList" class="card mb-4" style="border-radius: 20px; border: 2px solid #070720;">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    <img src="/resources/img/blog/blog-1.jpg" style="height: 200px; width: 200px; border-radius: 17px;" alt="강의 이미지">
                                                </div>
                                                <div class="col-lg-8">
                                                    <div class="row h-100 mx-2 d-flex align-content-between flex-wrap">
                                                        <div class="w-100 mt-3">
                                                            <h5 class="font-weight-bold">{{lec.ttl}}</h5>
                                                            <p class="text-right mr-2">( 수강기간 : {{lec.tlsnTerm}}개월 )</p>
                                                        </div>
                                                        <div class="w-100 mb-1">
                                                            <p class="text-right mr-2">키트 : {{lec.kitPrc}}원</p>
                                                            <p class="text-right mr-2">강의 : {{lec.prc}}원</p>
                                                            <div class="row d-flex justify-content-between">
                                                                <small v-on:click="delSelect(index)" class="bocket_delete text-muted ml-2">장바구니에서 삭제</small>
                                                                <h5 class="mr-4 font-weight-bold">총합 : {{lec.prc + lec.kitPrc}}원</h5>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row d-flex justify-content-between mx-1 mt-2">
                                <button onclick="history.back()" class="btn btn-outline-secondary"><i class="arrow_left"></i>뒤로가기</button>
                                <button class="btn btn-outline-secondary">워시리스트로 이동</button>
                            </div>
                        </div>
                        <div class="col-lg-5">
                            <div class="card mb-2">
                                <div class="card-header">
                                    <h5>배송정보</h5>
                                </div>
                                <div class="card-body">
                                    <ul class="nav nav-tabs">
                                        <li class="nav-items">
                                            <a class="nav-link py-1 px-2 active" href="#orgin" data-toggle="tab" ><small>기존배송지</small></a>
                                        </li>
                                        <li class="nav-items">
                                            <a class="nav-link py-1 px-2" href="#another" data-toggle="tab" ><small>다른배송지</small></a>
                                        </li>
                                    </ul>
                                    <div class="tab-content border border-top-0">
                                        <div id="orgin" class="tab-pane fade show active">
                                            <div class="col-lg-12 px-0">
                                                <table class="table mb-0">
                                                    <tr height= 55>
                                                        <th width="130px" class="text-center align-middle border-top-0">전화번호</th>
                                                        <td class="border-top-0 align-middle">{{userAddr.tel}}</td>
                                                    </tr>
                                                    <tr height= 55>
                                                        <th class="text-center align-middle">우편번호</th>
                                                        <td class="align-middle">{{userAddr.zip}}</td>
                                                    </tr>
                                                    <tr height= 55>
                                                        <th class="text-center align-middle">주소</th>
                                                        <td class="align-middle">{{userAddr.addr}}</td>
                                                    </tr>
                                                    <tr height= 55>
                                                        <th class="text-center align-middle">상세주소</th>
                                                        <td class="align-middle">{{userAddr.detaAddr}}</td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                        <div id="another" class="tab-pane fade">
                                            <div class="blog__details__form pt-0 w-100">
                                                <form onsubmit="return false">  
                                                    <table class="table mb-0">
                                                        <tbody>
                                                            <tr>
                                                                <th class="text-center align-middle border-top-0">
                                                                    전화번호
                                                                </th>
                                                                <td class="border-top-0" colspan="2">
                                                                    <input maxlength="11" v-on:change="valiTel" class="border mb-0 tel" type="text" spellcheck="false" style="height: 30px;">
                                                                    <div class="d-flex justify-content-end">
                                                                        <small id="telErr" class="d-none text-danger">숫자를 입력해주세요.</small>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th class="text-center align-middle">우편번호</th>
                                                                <td>
                                                                    <input v-on:click="addrSearch" id="searchZip" class="border mb-0" type="text" spellcheck="false" style="height: 30px;">
                                                                </td>
                                                                <td>
                                                                    <button v-on:click="addrSearch" class="border mb-0" class="btn btn-light"><strong class="text-muted">주소검색</strong></button>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th class="text-center align-middle">주소</th>
                                                                <td colspan="2">
                                                                    <input v-on:click="addrSearch" id="searchAddr" class="border mb-0" type="text" spellcheck="false" style="height: 30px;">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th class="text-center align-middle">상세주소</th>
                                                                <td colspan="2">
                                                                    <input class="border mb-0" type="text" spellcheck="false" style="height: 30px;">
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header">
                                    <h5>결제</h5>
                                </div>
                                <div class="card-body">
                                    <div class="col-lg-12">
                                        <div class="mx-3 mt-2">
                                            <div v-for="lec in lecDetails" class="row justify-content-between">
                                                <p class="font-weight-bold">{{lec.ttl}}</p>
                                                <p class="font-weight-bold">+ {{lec.kitPrc + lec.prc}}원</p>
                                            </div>
                                            <div class="row justify-content-between">
                                                <p class="mb-0">사용할 적립금</p>
                                                <div class="d-flex">
                                                    <p class="mb-0">-&nbsp;&nbsp;</p>
                                                    <div class="blog__details__form pt-0 w-100">
                                                        <form onsubmit="return false"> 
                                                            <input v-model="payPoint" v-on:change="usePoint" type="number" :max="userAddr.point" min="0" step="100" spellcheck="false" class="text-right border mb-0" style="height: 30px; width: 150px;">
                                                        </form>
                                                    </div> 
                                                    <p class="mb-0">원</p>
                                                </div>
                                            </div>
                                            <div class="row justify-content-end">
                                                <p class="text-muted">(현재 적립금 : {{userAddr.point}}원)</p>
                                            </div>
                                            <!-- 수수료는 크리에이터 등급에 따라 다르므로 총계+수수료가 아니라
                                            총계 - 수수료 = 매출이 되어야함
                                            -->
                                            <div class="row justify-content-between mb-3">
                                                <h5 class="font-weight-bold">총계</h5>
                                                <h5 class="font-weight-bold">{{prcSum}}원</h5>
                                            </div>
                                            <div class="row justify-content-between">
                                                <p class="mb-0">적립 예정 적립금</p>
                                                <p class="mb-0">+ {{prcSum/gradePer}}원</p>
                                            </div>
                                            <div class="row justify-content-end">
                                                <p class="text-muted">현재 등급 {{grade}} ({{gradePer}}%)</p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="mx-3">
                                            <div class="row justify-content-center">
                                                <div class="d-flex align-items-center">
                                                    <input v-on:click="checkClick" type="checkbox" name="" id="agree">
                                                </div>
                                                <label for="agree" class="mb-0 ml-1"> (필수) 구매조건 및 개인정보취급방침 동의&nbsp;</label>
                                                <strong class="checkModal text-primary" data-toggle="modal" data-target="#checkModal">(보기)</strong>
                                            </div>
                                            <div class="row justify-content-center">
                                                <small class="text-danger">구매조건 및 결제대행 서비스 약관 동의하여야 합니다.</small>
                                            </div>
                                            <div class="row mt-3">
                                                <button id="payBtn" class="btn btn-danger w-100 font-weight-bold" disabled>결제</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="checkModal" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header d-flex justify-content-center border-bottom-0" style="position: relative;">
                            <h5 class="font-weight-bold mt-2 text-danger">구매조건 및 개인정보취급방침</h5>
                            <div class="modal_close" data-dismiss="modal"><i class="icon_close"></i></div>
                        </div>
                        <div class="modal-body border-bottom-0 pb-0">
                            <h5 class="font-weight-bold text-center">구매조건</h5>
                            <p class="mt-2 mx-2">
                                1.“회원”은 “회사”가 제공하는 절차에 의하여 유료서비스 이용계약(이하 “청약”을 신청합니다.
                                “회사”는 원칙적으로 “회원”의 청약 신청을 승낙합니다.
                                다만, 다음 각 호에 해당하는 경우에는 승낙하지 않거나 승낙을 유보할 수 있습니다.
                            </p>
                            <h5 class="font-weight-bold text-center mt-5">개인정보취급방침</h5>
                            <p class="mt-2 mx-2">
                                2. 개인정보보호법, 통신비밀보호법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등을 준수하고 있습니다. 
                                "회사"는 본 개인정보취급방침을 통하여 이용자가 제공하는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 
                                개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드리고자 합니다.
                            </p>
                        </div>
                        <div class="modal-footer border-top-0">
                            <div class="w-100 d-flex justify-content-center">
                                <div class="row mb-3">
                                    <div class="d-flex align-items-center">
                                        <input v-on:click="checkModalClick" type="checkbox" name="" id="agreeModal">
                                    </div>
                                    <label for="agreeModal" class="mb-0 ml-1">동의합니다.</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- body 의 body 끝 -->
    </div>
    <script>
        const pay = Vue.createApp({
            data(){
                return{
                    payPoint : 0,
                    lecDetails : [],
                    userAddr : {}
                }
            },
            computed :{
                prcSum : function(){
                    const ary = this.lecDetails;
                    let sum = 0;
                    for(val of ary){
                        sum += val.prc + val.kitPrc;
                    }
                    sum -= this.payPoint;
                    return sum;
                },
                grade : function(){
                    let uGrdCode = this.userAddr.uGrdCode;
                    if(uGrdCode ==='ao1'){
                        return '나무';
                    }
                },
                gradePer : function(){
                    let uGrdCode = this.userAddr.uGrdCode;
                    if(uGrdCode ==='ao1'){
                        return 10 ;
                    }
                }
            },
            methods : {
                delAll(){
                    this.payObject.lecList=[];
                },
                delSelect(index){
                    this.payObject.lecList.splice(index,1);
                },
                valiTel(){
                    if(/[^0-9]/g.test(event.target.value)){
                        event.target.value = event.target.value.replaceAll(/[^0-9]/g, "");
                        $('#telErr').removeClass('d-none');
                    }else{
                        $('#telErr').addClass('d-none');
                    }
                },
                addrSearch(){
                    new daum.Postcode({
                        oncomplete: function (data) {
                            var roadAddr = data.roadAddress; // 도로명 주소 변수
                            var extraRoadAddr = ''; // 참고 항목 변수

                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                                extraRoadAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if (data.buildingName !== '' && data.apartment === 'Y') {
                                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data
                                    .buildingName);
                            }
                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                            if (extraRoadAddr !== '') {
                                extraRoadAddr = ' (' + extraRoadAddr + ')';
                            }

                            // 우편번호와 주소 정보를 해당 필드에 넣는다.
                            document.getElementById('searchZip').value = data.zonecode;
                            document.getElementById("searchAddr").value = roadAddr;

                        },
                    }).open();

                },
                usePoint(){
                    if(this.payPoint > this.userAddr.point){
                        this.payPoint = this.userAddr.point;
                    }else if( this.payPoint < 0){
                        this.payPoint = 0;
                    }
                    
                },
                checkClick(){
                    if(event.target.checked){
                        $('#payBtn').removeAttr('disabled');
                    }else{
                        $('#payBtn').attr('disabled','false');
                    }
                },
                checkModalClick(){
                    agree.checked = true;
                    $('#checkModal').modal('hide');
                }
            },
            beforeCreate : function(){
            	console.log('${lecList}');

            	fetch("/user/lecturePay?lecList="+'${lecList}')
                .then(response => response.json())
                .then(result => {
                	this.lecDetails = result.lectureList;
					this.userAddr = result.userAddr;                
                })
				
                /*
            	beforeCreate

                */
               this.payObject = {
                   lecList : [
                       {
                           ttl:'제목1',
                           tlsnTerm : 3,
                           kitPrc : 4000,
                           prc : 30000,//키트 + 가 된 가격으로 와야함
                        },
                        {
                           ttl:'제목2',
                           tlsnTerm : 3,
                           kitPrc : 6000,
                           prc : 46000,//키트 + 가 된 가격으로 와야함
                        },
                        {
                           ttl:'제목3',
                           tlsnTerm : 12,
                           kitPrc : 16000,
                           prc : 66000,//키트 + 가 된 가격으로 와야함
                        }
                   ],
                   tel : '02020',
                   zip : 1233,
                   addr : '서성구',
                   detaAddr : '하양동',
                   point : 10000,
                   uGrdCode : 'ao1'
               }
            }
        });

        const mountPay = pay.mount('#pay');
    </script> 
</body>
</html>