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
                                <div class="card-header d-flex justify-content-start">
                                    <h5>강의정보</h5>
                                </div>
                                <div class="card-body pb-1">
                                    <div v-if="lectureDetail == null">
                                        <p class="text-center">선택한 강의가 없습니다.</p>
                                    </div>
                                    <!-- 반복 -->
                                    <div v-if="lectureDetail != null" class="card mb-4" style="border-radius: 20px; border: 2px solid #070720;">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    <img :src="lectureDetail.thumb" style="height: 200px; width: 200px; border-radius: 17px;" alt="강의 이미지">
                                                </div>
                                                <div class="col-lg-8">
                                                    <div class="row h-100 mx-2 d-flex align-content-between flex-wrap">
                                                        <div class="w-100 mt-3">
                                                            <h5 class="font-weight-bold">{{lectureDetail.ttl}}</h5>
                                                            <p class="text-right mr-2">( 수강기간 : {{lectureDetail.tlsnTerm}}개월 )</p>
                                                        </div>
                                                        <div class="w-100 mb-1">
                                                            <p v-if="lectureDetail.kitName!=null" class="text-right mr-2">키트 : {{commakitPrc}}원</p>
                                                            <p class="text-right mr-2">강의 : {{commalecPrc}}원</p>
                                                            <div class="row d-flex justify-content-end">
                                                                <h5 class="mr-4 font-weight-bold">총합 : {{commaPrc}}원</h5>
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
                                <a :href="'/user/userWishList?lec='+lectureDetail.ltNo" class="btn btn-outline-secondary">위시리스트로 이동</a>
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
                                            <a class="nav-link py-1 px-2" v-bind:class="[ addr == 'Y' ? 'active':'d-none']" href="#orgin" data-toggle="tab" ><small>기존배송지</small></a>
                                        </li>
                                        <li class="nav-items">
                                            <a class="nav-link py-1 px-2" v-bind:class="{ active : addr != 'Y'}" href="#another" data-toggle="tab" ><small>다른배송지</small></a>
                                        </li>
                                    </ul>
                                    <div class="tab-content border border-top-0">
                                        <div id="orgin" class="tab-pane fade" v-bind:class="[ addr == 'Y' ? 'active show':'d-none']">
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
                                        <div id="another" class="tab-pane fade" v-bind:class="{ 'active show' : addr != 'Y'}">
                                            <div class="blog__details__form pt-0 w-100">
                                                <form onsubmit="return false">  
                                                    <table class="table mb-0">
                                                        <tbody>
                                                            <tr>
                                                                <th class="text-center align-middle border-top-0">
                                                                    전화번호
                                                                </th>
                                                                <td class="border-top-0" colspan="2">
                                                                    <input id="tel_input" maxlength="11" v-on:change="valiTel" class="border mb-0 tel" type="text" spellcheck="false" style="height: 30px;">
                                                                    <div class="d-flex justify-content-end">
                                                                        <small id="telErr" class="d-none text-danger">숫자를 입력해주세요.</small>
                                                                        <small class="valErr d-none text-danger">값을 입력해주세요.</small>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th class="text-center align-middle">우편번호</th>
                                                                <td>
                                                                    <input v-on:click="addrSearch" id="searchZip" class="border mb-0" type="text" spellcheck="false" style="height: 30px;">
                                                                    <div class="d-flex justify-content-end">
                                                                        <small class="valErr d-none text-danger">값을 입력해주세요.</small>
                                                                    </div>
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
                                                                    <div class="d-flex justify-content-end">
                                                                        <small class="valErr d-none text-danger">값을 입력해주세요.</small>
                                                                    </div>
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
                                                <p class="text-muted">(현재 적립금 : {{comma(userAddr.point)}}원)</p>
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
                                                <p class="mb-0">+ {{comma(expPoint)}}원</p>
                                            </div>
                                            <div class="row justify-content-end">
                                                <p class="text-muted mb-0">현재 등급 <strong>{{grade}}</strong> ({{gradePer * 100}}%)</p>
                                            </div>
                                            <div class="row justify-content-end">
                                                <small class="text-muted">적립금은 7일이후에 적립됩니다.</small>
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
                                                <button id="payBtn" v-on:click="payAjax" class="btn btn-danger w-100 font-weight-bold" disabled>결제</button>
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
                                        <input v-on:click="checkModalClick" type="checkbox" id="agreeModal">
                                    </div>
                                    <label for="agreeModal" class="mb-0 ml-1">동의합니다.</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <form action="/user/sugangInsert" method="post" id="frm">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        	<input type="hidden" name ="ltNo" id="ltNo">
        	<input type="hidden" name ="tel" id="tel">
        	<input type="hidden" name ="zip" id="zip">
        	<input type="hidden" name ="addr" id="addr">
        	<input type="hidden" name ="detaAddr" id="detaAddr">
        	<input type="hidden" name ="usePoint" id="usePoint">
        	<input type="hidden" name ="pay" id="pay">
        	<input type="hidden" name ="shipStCode" id="shipStCode">
        	<input type="hidden" name ="num" id="num">
        </form>
        <!-- body 의 body 끝 -->
    </div>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script>
        const pay = Vue.createApp({
            data(){
                return{
                    payPoint : 0,
                    lectureDetail : {},
                    userAddr : {},
                    addr : 'N',
                }
            },
            computed :{
            	commakitPrc(){
            		if(this.lectureDetail.kitName != null){
	            		return String(this.lectureDetail.kitPrc).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            		}else{
            			return '';
            		}
            	},
            	commalecPrc(){
	            	return String(this.lectureDetail.prc).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            	},
            	commaPrc(){
            		let val = 0;
            		if(this.lectureDetail.kitName != null){
            			val = Number(this.lectureDetail.prc) + Number(this.lectureDetail.kitPrc);
            		}else{
            			val = Number(this.lectureDetail.prc);
            		}
            		return String(val).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            	},
                prcSum : function(){
                	let val = 0;
            		if(this.lectureDetail.kitName != null){
            			val = Number(this.lectureDetail.prc) + Number(this.lectureDetail.kitPrc) - Number(this.payPoint);
            		}else{
            			val = Number(this.lectureDetail.prc) - Number(this.payPoint);
            		}
            		return String(val).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                },
                grade : function(){
                    let uGrdCode = this.userAddr.uGrdCode;
                    if(uGrdCode ==='U01'){
                        return '일반';
                    }else if(uGrdCode ==='U02'){
                        return '새싹';
                    }else if(uGrdCode ==='U03'){
                        return '꽃';
                    }else{
                    	return '나무';
                    }
                },
                gradePer : function(){
                    let uGrdCode = this.userAddr.uGrdCode;
                    if(uGrdCode ==='U01'){
                        return 0.01;
                    }else if(uGrdCode ==='U02'){
                        return 0.03;
                    }else if(uGrdCode ==='U03'){
                        return 0.05;
                    }else{
                    	return 0.1;
                    }
                },
            	expPoint : function(){
            		let sum = Number(this.lectureDetail.prc) + Number(this.lectureDetail.kitPrc) - Number(this.payPoint);
                	return Math.round( sum * Number(this.gradePer));
                }
            },
            methods : {
            	comma(val){
            		val = Number(val);
            		return String(val).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            	},
            	
            	payAjax(){
            		let tag =  $('.tab-pane.fade.active.show')
            		let tel, zip, addr, detaAddr;
            		if(tag.attr('id') == 'another'){
            			if(!this.valForm()){
            				return;
            			}
            			const input = tag.find('input');
            			tel = input[0].value;
            			zip = input[1].value;
            			addr =input[2].value;
            			detaAddr =input[3].value;
            		}else{
            			const td = tag.find('td');
            			tel = td[0].innerText;
            			zip = td[1].innerText;
            			addr =td[2].innerText;
            			detaAddr =td[3].innerText;
            		}
            		$('#frm #ltNo').val(this.lectureDetail.ltNo);
            		$('#frm #tel').val(tel);
            		$('#frm #zip').val(zip);
            		$('#frm #addr').val(addr);
            		$('#frm #detaAddr').val(detaAddr);
            		$('#frm #usePoint').val(this.payPoint);
            		$('#frm #pay').val(this.prcSum.replaceAll(',',''));
            		if(this.lectureDetail.kitName != null){
            			$('#frm #shipStCode').val('D01');
            		}
            		$('#frm #num').val(this.lectureDetail.tlsnTerm);
            		//나중에 삭제
            		$('#frm').submit();
            		/*
            		var IMP = window.IMP;
        			IMP.init('imp47910912');
        			 IMP.request_pay({
        				   pg : 'html5_inicis', // 결제방식
        			       pay_method : 'card',	// 결제 수단
        			       merchant_uid : 'merchant_' + new Date().getTime(),
        			       name : '결제 테스트용',	// order 테이블에 들어갈 주문명 혹은 주문 번호
        			       amount : '100',	// 결제 금액
        			       //amount : $('#total').val(),
        			       buyer_email : this.userAddr.id,	// 구매자 email
        			       buyer_name :  this.userAddr.name,	// 구매자 이름
        			       buyer_tel : tel,	// 구매자 전화번호
        			       buyer_addr :  addr + ' ' +detaAddr,	// 구매자 주소
        			       buyer_postcode :  zip,	// 구매자 우편번호
        			       m_redirect_url : '/home'	// 결제 완료 후 보낼 컨트롤러의 메소드명
        			 }, function(rsp){
        				 if ( rsp.success ) { // 성공시
        						var msg = '결제가 완료되었습니다.';
//        						msg += '고유ID : ' + rsp.imp_uid;
//        						msg += '상점 거래ID : ' + rsp.merchant_uid;
//        						msg += '결제 금액 : ' + rsp.paid_amount;
//        						msg += '카드 승인번호 : ' + rsp.apply_num;
        						console.log('결제가 성공적으로 마무리되었습니다.');
        						window.alert(msg);
        						$('#frm').submit();
        				 } else { // 실패시
        						var msg = '결제에 실패하였습니다.';
        						msg += '에러내용 : ' + rsp.error_msg;
        						console.log('실패');
        						window.alert(msg);
        					}
        			 
        			 });
            		*/
            	},
            	valForm(){
            		const ary = $('#another input');
            		for(var input of ary){
            			if(input.value ==''){
            				console.log(input)
            				if($(input).attr('id')=='tel_input'){
            					$('#telErr').addClass('d-none');
            				}
            				$(input).closest('td').find('.valErr').removeClass('d-none');
            				return false;;
            			}else{
            				$(input).closest('td').find('.valErr').addClass('d-none');
            			}
            		}
            		return true;
            	},
                valiTel(){
                    if(/[^0-9]/g.test(event.target.value)){
                        event.target.value = event.target.value.replaceAll(/[^0-9]/g, "");
                        $('#telErr').removeClass('d-none');
                        $(event.target).closest('td').find('.valErr').addClass('d-none');
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
                        agreeModal.checked = true;
                    }else{
                        $('#payBtn').attr('disabled','false');
                        agreeModal.checked = false;
                    }
                },
                checkModalClick(){
                	if(!agree.checked){
	                    $('#payBtn').removeAttr('disabled');
	                    agree.checked = true;
	                    $('#checkModal').modal('hide');
                	}else if(agree.checked){
	                    $('#payBtn').attr('disabled','false');
	                    agree.checked = false;
                	}
                }
            },
            beforeCreate : function(){
            	$.ajax({
        			url : '/user/lecturePay',
        			data : {ltNo : '${ltNo}' },
        			dataType: 'JSON',
        			type : 'post',
        			beforeSend : (xhr) =>{
        			      xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        			},
        		})
        		.done(result=>{
                	this.lectureDetail = result.lectureDetail;
					this.userAddr = result.userAddr;
					if(this.userAddr.tel != null && this.userAddr.zip != null && this.userAddr.addr != null && this.userAddr.detaAddr != null){
						this.addr = 'Y';
					}
        		})
				
            }
        });

        const mountPay = pay.mount('#pay');
    </script> 
</body>
</html>