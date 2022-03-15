<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style type="text/css">
		.fa-caret-down, .fa-caret-up{
        	cursor: pointer;
        	float: right;
        }
        .year_table td,.year_table th{
        	text-align: center;
        }
	</style>
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
                  <li class="breadcrumb-item"><a href="/admin/home">매출</a></li>
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
              
                <!-- 년별 매출 -->
                <div class="col-lg-12 pb-5 pt-3">
                  <h5 class="bg-dark px-3 py-2 mb-0 text-white" style="border-radius: 13px;">크리에이터별 연도별 회사 매출</h5>
	              <form id="yearFrm" action="/admin/adCSales" method="get">
	                  <div class="row mt-4 justify-content-between mb-3">
	                      <select id="selectYear" name="selectYear" class="select border px-3 py-2">
		                  	<c:forEach begin="${2016}" end="${thisyear }" var="y">
		                    	<option value="${y }"<c:if test="${search.selectYear eq y}">selected="selected"</c:if>>${y }년</option>
		                  	</c:forEach>
	                      </select>
	                      <div>
		                  	<select id="searchYear" class="border px-3 py-2">
		                    	<option value="yearId" <c:if test="${empty search.yearName}">selected="selected"</c:if> >아이디</option>
		                        <option value="yearName" <c:if test="${not empty search.yearName}">selected="selected"</c:if> >이름</option>
		                   	</select>
		                    <input type="text" id="inputSearch" 
		                    <c:if test="${empty search.yearName}">name="yearId"</c:if>
		                    <c:if test="${not empty search.yearId}">value="${search.yearId}"</c:if>
		                    <c:if test="${not empty search.yearName}">name="yearName" value="${search.yearName}"</c:if>
		                    placeholder="검색" class="border px-3 py-2">
		                    <button type="button" class="btn bg-white border" style="width: 65px; height: 39px;" id="resetYear">초기화</button>
		                    <button id="yearBtn" type="button" class="border px-3 py-2">검색</button>
	                      </div>
	                  </div>
	                  <input type="hidden" name="searchYearFlag" id="searchYearFlag" value="${search.searchYearFlag }">
					  <input type="hidden" name="orderYearColumn" value="${search.orderYearColumn }">
					  <input type="hidden" name="orderYearBy" value="${search.orderYearBy }">
	                  <input type = 'hidden' name = 'pageYearNum' value = '${page.salesVo.pageYearNum }'>
	                  <input type = 'hidden' name = 'amountYear' value = '${page.salesVo.amountYear }'>
	                  <input type = 'hidden' name = 'pageMonthNum' value = '1'>
	                  <input type = 'hidden' name = 'amountMonth' value = '10'>
	              </form>
                  <div class="row">
                    <table class="year_table table table-bordered">
                      <tr style="background-color: #eeeeee;">
                      <!-- 클릭 이벤트,,,? -->
                        <th data-col="rank">
                        	순위
                        	<i class="fa fa-caret-up <c:if test="${search.orderYearColumn eq 'rank' and search.orderYearBy eq 'desc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>
                        </th>
                        <th data-col="id">
                        	아이디
                        	<i class="fa fa-caret-down <c:if test="${search.orderYearColumn eq 'id' and search.orderYearBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>
                        </th>
                        <th data-col="name">
                        	이름
                        	<i class="fa fa-caret-down <c:if test="${search.orderYearColumn eq 'name' and search.orderYearBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>
                        </th>
                        <th data-col="cre_cnt">
                        	강의 수
                        	<i class="fa fa-caret-down <c:if test="${search.orderYearColumn eq 'cre_cnt' and search.orderYearBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>
                        </th>
                        <th data-col="cnt">
                        	판매량
                        	<i class="fa fa-caret-down <c:if test="${search.orderYearColumn eq 'cnt' and search.orderYearBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>
                        </th>
                        <th data-col="pay">
                        	총 매출
                        	<i class="fa fa-caret-down <c:if test="${search.orderYearColumn eq 'pay' and search.orderYearBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>
                        </th>
                      </tr>
	                  <c:if test="${empty creYear }">
	                  	<tr>
	                  		<td colspan="6">해당 데이터가 없습니다.</td>
	                  	</tr>
	                  </c:if>    
                      <c:if test="${not empty creYear }">
	                      <c:forEach items="${creYear }" var="cre">
	                      	<tr>
	                      		<td>${cre.rank }</td>
	                      		<td>${cre.id }</td>
	                      		<td>${cre.name }</td>
	                      		<td><fmt:formatNumber>${cre.creCnt }</fmt:formatNumber> 개</td>
	                      		<td><fmt:formatNumber>${cre.cnt }</fmt:formatNumber> 개</td>
	                      		<td><fmt:formatNumber>${cre.pay }</fmt:formatNumber> 만 원</td>
	                      	</tr>
	                      </c:forEach>
                      </c:if>
                    </table>
                  </div>
                  <div class="row d-flex justify-content-center position-relative">
					<div class="dataTables_paginate paging_simple_numbers" id="zero_config_paginate">
                    	<ul class="pagination year_ul">
                        	<c:if test = "${page.prevYear }">
                            	<li class="paginate_button page-item previous" id="zero_config_previous">
                                	<a href=" ${page.startYear -1 }" aria-controls="zero_config" data-dt-idx="0" tabindex="0" class="page-link">
                                	<i class="mdi mdi-chevron-double-left"></i>previous</a>
                               	</li>
							</c:if>
                            <c:forEach var = "num" begin = "${page.startYear }" end = "${page.endYear }">
                            	<li class = "paginate_button page-item  ${page.salesVo.pageYearNum == num? 'active':'' }">
                                     	<a href="${num}"aria-controls="zero_config" data-dt-idx="${num}" tabindex="0"class="page-link">${num}</a>
                                </li>
                            </c:forEach>
                            <c:if test = "${page.nextYear }">
                            	<li class="paginate_button page-item next" id="zero_config_next">
                            		<a href="${page.endYear +1 }" aria-controls="zero_config" data-dt-idx="6" tabindex="0" class="page-link">
                                <i class="mdi mdi-chevron-double-right"></i>next</a></li>
                            </c:if>
                    	</ul>
                    </div>
                    <div class="position-absolute" style="right: 1px;">
                      <button id="yearExcel" class="btn btn-success">EXCEL다운</button>
                    </div>
                    
                  </div>
                </div>
				
				<!-- 월별 매출 -->
                 <div class="col-lg-12 pb-5 pt-3">
                  <h5 class="bg-dark px-3 py-2 mb-0 text-white" style="border-radius: 13px;">크리에이터별 월별 회사 매출 <span>(${thisyear }년)</span></h5>
                  <form id="monthFrm" action="/admin/adCSales" method="get">
	                  <div class="row mt-4 justify-content-between mb-3">
	                  	<select id="month" name="month" class="select border px-3 py-2">
			                <c:forEach begin="${1}" end="${thisMonth }" var="y">
			                	<option value="${y }"<c:if test="${search.month eq y}">selected="selected"</c:if>>${y }월</option>
			            	</c:forEach>
		                </select>
	                    <div>
	                      <select id="searchMonth" class="border px-3 py-2">
	                        <option value="monthId" <c:if test="${empty search.monthName}">selected="selected"</c:if>>아이디</option>
	                        <option value="monthName" <c:if test="${not empty search.monthName}">selected="selected"</c:if>>이름</option>
	                      </select>
	                      <input id="inputMonth" type="text"
	                      	<c:if test="${empty search.monthName}">name="monthId"</c:if>
							<c:if test="${not empty search.monthId}">value="${search.monthId}"</c:if>
		                    <c:if test="${not empty search.monthName}">name="monthName" value="${search.monthName}"</c:if>
							placeholder="검색" class="border px-3 py-2">
	                      	<button type="button" class="btn bg-white border" style="width: 65px; height: 39px;" id="resetMonth">초기화</button>
		                    <button id="monthBtn" type="button" class="border px-3 py-2">검색</button>
	                      </div>
	                  </div>
	                  <input type="hidden" name="searchMonthFlag" id="searchMonthFlag" value="${search.searchMonthFlag }">
					  <input type="hidden" name="orderMonthColumn" value="${search.orderMonthColumn }">
					  <input type="hidden" name="orderMonthBy" value="${search.orderMonthBy }">
	                  <input type = 'hidden' name = 'pageMonthNum' value = '${page.salesVo.pageMonthNum }'>
	                  <input type = 'hidden' name = 'amountMonth' value = '${page.salesVo.amountMonth }'>
	                  <input type = 'hidden' name = 'pageYearNum' value = '1'>
	                  <input type = 'hidden' name = 'amountYear' value = '10'>
                  </form>
                  <div class="row">
                    <table class="month_table table table-bordered">
                      <tr style="background-color: #eeeeee;">
                        <th data-col="rank">
                        	순위
                        	<i class="fa fa-caret-up <c:if test="${search.orderMonthColumn eq 'rank' and search.orderMonthBy eq 'desc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>
                        </th>
                        <th data-col="id">
                        	아이디
                        	<i class="fa fa-caret-down <c:if test="${search.orderMonthColumn eq 'id' and search.orderMonthBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>
                        </th>
                        <th data-col="name">
                        	이름
                        	<i class="fa fa-caret-down <c:if test="${search.orderMonthColumn eq 'name' and search.orderMonthBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>
                        </th>
                        <th data-col="cre_cnt">
                        	강의 수
                        	<i class="fa fa-caret-down <c:if test="${search.orderMonthColumn eq 'cre_cnt' and search.orderMonthBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>
                        </th>
                        <th data-col="cnt">
                        	판매량
                        	<i class="fa fa-caret-down <c:if test="${search.orderMonthColumn eq 'cnt' and search.orderMonthBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>
                        </th>
                        <th data-col="pay">
                        	총 매출
                        	<i class="fa fa-caret-down <c:if test="${search.orderMonthColumn eq 'pay' and search.orderMonthBy eq 'asc'}">fa-rotate-180</c:if> " aria-hidden="true"></i>
                      </tr>
                      <c:if test="${empty creMonth }">
	                  	<tr>
	                  		<td colspan="6">해당 데이터가 없습니다.</td>
	                  	</tr>
	                  </c:if>    
                      <c:if test="${not empty creMonth }">
	                      <c:forEach items="${creMonth }" var="cre">
	                      	<tr>
	                      		<td>${cre.rank }</td>
	                      		<td>${cre.id }</td>
	                      		<td>${cre.name }</td>
	                      		<td><fmt:formatNumber>${cre.creCnt }</fmt:formatNumber> 개</td>
	                      		<td><fmt:formatNumber>${cre.cnt }</fmt:formatNumber> 개</td>
	                      		<td><fmt:formatNumber>${cre.pay }</fmt:formatNumber> 만 원</td>
	                      	</tr>
	                      </c:forEach>
                      </c:if>
                    </table>
                  </div>
                  <div class="row d-flex justify-content-center position-relative">
                    <div class="dataTables_paginate paging_simple_numbers" id="zero_config_paginate">
                    	<ul class="pagination month_ul">
                        	<c:if test = "${page.prvMonth }">
                            	<li class="paginate_button page-item previous" id="zero_config_previous">
                                	<a href=" ${page.startMonth -1 }" aria-controls="zero_config" data-dt-idx="0" tabindex="0" class="page-link">
                                	<i class="mdi mdi-chevron-double-left"></i>previous</a>
                               	</li>
							</c:if>
                            <c:forEach var = "num" begin = "${page.startMonth }" end = "${page.endMonth }">
                            	<li class = "paginate_button page-item  ${page.salesVo.pageMonthNum == num? 'active':'' }">
                                     	<a href="${num}"aria-controls="zero_config" data-dt-idx="${num}" tabindex="0"class="page-link">${num}</a>
                                </li>
                            </c:forEach>
                            <c:if test = "${page.nextMonth }">
                            	<li class="paginate_button page-item next" id="zero_config_next">
                            		<a href="${page.endMonth +1 }" aria-controls="zero_config" data-dt-idx="6" tabindex="0" class="page-link">
                                <i class="mdi mdi-chevron-double-right"></i>next</a></li>
                            </c:if>
                    	</ul>
                    </div>
                    <div class="position-absolute" style="right: 1px;">
                      <button id="monthExcel" class="btn btn-success">EXCEL다운</button>
                    </div>
                    
                  </div>
                 </div>

              </div>
            </div>
          </div>
        </div>
      </div>
      <script type="text/javascript">
  	//검색 초기화
		$('#resetYear').click(()=>{
			$('#searchYearFlag').val('');
			$('#selectYear').val('${thisyear}');
			$('#searchYear').val('yearId');
			$('#inputSearch ').attr('name','yearId').val('');
		})	
		
		$('#resetMonth').click(()=>{
			$('#searchMonthFlag').val('');
			$('#month').val(Number('${thisMonth}'));
			$('#searchMonth').val('monthId');
			$('#inputMonth').attr('name','monthId').val('');
		})

		//페이징 처리
		$(".year_ul .paginate_button a").on("click", function(e) {
			e.preventDefault();
			if($('#searchYearFlag').val() !== 'Y'){
				$('#resetYear').click();
			}
			
			$('#yearFrm').find("input[name='pageYearNum']").val($(this).attr("href"));
		    $('#yearFrm').submit();
		});			
	      	
		$(".month_ul .paginate_button a").on("click", function(e) {
			e.preventDefault();
			if($('#searchMonthFlag').val() !== 'Y'){
				$('#resetMonth').click();
			}
			
			$('#monthFrm').find("input[name='pageMonthNum']").val($(this).attr("href"));
		    $('#monthFrm').submit();
		});	 	
  	
		$('.year_table .fa-caret-down').click((e)=>{
			$(e.currentTarget).toggleClass('fa-rotate-180')
			$('#yearFrm>input[name=orderYearColumn]').val(e.currentTarget.parentElement.dataset.col)
			$('#yearFrm>input[name=orderYearBy]').val('asc');
			
			if($('#searchYearFlag').val() !== 'Y'){
				$('#resetYear').click();
			}
			$('#yearFrm').submit();
		})
		
		$('.year_table .fa-caret-down.fa-rotate-180').click((e)=>{
			$(e.currentTarget).toggleClass('fa-rotate-180')
			$('#yearFrm>input[name=orderYearColumn]').val(e.currentTarget.parentElement.dataset.col)
			$('#yearFrm>input[name=orderYearBy]').val('desc');
			
			if($('#searchYearFlag').val() !== 'Y'){
				$('#resetYear').click();
			}
			$('#yearFrm').submit();
		})
		
		$('.year_table .fa-caret-up').click((e)=>{
			$(e.currentTarget).toggleClass('fa-rotate-180')
			$('#yearFrm>input[name=orderYearColumn]').val(e.currentTarget.parentElement.dataset.col)
			$('#yearFrm>input[name=orderYearBy]').val('desc');
			
			if($('#searchYearFlag').val() !== 'Y'){
				$('#resetYear').click();
			}
			$('#yearFrm').submit();
		})
		
		$('.year_table .fa-caret-up.fa-rotate-180').click((e)=>{
			$(e.currentTarget).toggleClass('fa-rotate-180')
			$('#yearFrm>input[name=orderYearColumn]').val(e.currentTarget.parentElement.dataset.col)
			$('#yearFrm>input[name=orderYearBy]').val('asc');
			
			if($('#searchYearFlag').val() !== 'Y'){
				$('#resetYear').click();
			}
			$('#yearFrm').submit();
		})
  
		$('.month_table .fa-caret-down').click((e)=>{
			$(e.currentTarget).toggleClass('fa-rotate-180')
			$('#monthFrm>input[name=orderMonthColumn]').val(e.currentTarget.parentElement.dataset.col)
			$('#monthFrm>input[name=orderMonthBy]').val('asc');
			
			if($('#searchMonthFlag').val() !== 'Y'){
				$('#resetMonth').click();
			}
			$('#monthFrm').submit();
		})
		
		$('.month_table .fa-caret-down.fa-rotate-180').click((e)=>{
			$(e.currentTarget).toggleClass('fa-rotate-180')
			$('#monthFrm>input[name=orderMonthColumn]').val(e.currentTarget.parentElement.dataset.col)
			$('#monthFrm>input[name=orderMonthBy]').val('desc');
			
			if($('#searchMonthFlag').val() !== 'Y'){
				$('#resetMonth').click();
			}
			$('#monthFrm').submit();
		})
		
		$('.month_table .fa-caret-up').click((e)=>{
			$(e.currentTarget).toggleClass('fa-rotate-180')
			$('#monthFrm>input[name=orderMonthColumn]').val(e.currentTarget.parentElement.dataset.col)
			$('#monthFrm>input[name=orderMonthBy]').val('desc');
			
			if($('#searchMonthFlag').val() !== 'Y'){
				$('#resetMonth').click();
			}
			$('#monthFrm').submit();
		})
		
		$('.month_table .fa-caret-up.fa-rotate-180').click((e)=>{
			$(e.currentTarget).toggleClass('fa-rotate-180')
			$('#monthFrm>input[name=orderMonthColumn]').val(e.currentTarget.parentElement.dataset.col)
			$('#monthFrm>input[name=orderMonthBy]').val('asc');
			
			if($('#searchMonthFlag').val() !== 'Y'){
				$('#resetMonth').click();
			}
			$('#monthFrm').submit();
		})
		
      $('#searchYear').on('change',function(){
      		$('#inputSearch').attr('name',$('#searchYear').val());
      	})

		$('#yearBtn').click((e)=>{
			e.preventDefault();
					
			$('#searchYearFlag').val('Y');
			$('#yearFrm').find("input[name='pageYearNum']").val(1);
			$('#yearFrm').submit();
		})	  
		
		$('#monthBtn').click((e)=>{
			e.preventDefault();
					
			$('#searchMonthFlag').val('Y');
			$('#monthFrm').find("input[name='pageYearNum']").val(1);
			$('#monthFrm').submit();
		})	
      	
      	$('#searchMonth').on('change',function(){
      		$('#inputMonth').attr('name',$('#searchMonth').val());
      	})
      	
     	// 엑셀 다운
      	$('#yearExcel').click(()=>{
      		$('#yearFrm').attr('action','/admin/yearCreExcel');
      		$('#yearFrm').submit();
      		$('#yearFrm').attr('action','/admin/adCSales');
      	})
      	
		$('#monthExcel').click(()=>{
			$('#monthFrm').attr('action','/admin/monthCreExcel');
			$('#monthFrm').submit();
			$('#monthFrm').attr('action','/admin/adCSales');
		})

      </script>
</body>
</html>