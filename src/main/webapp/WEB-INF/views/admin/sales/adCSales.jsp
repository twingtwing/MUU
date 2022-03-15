<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	                      <select name="selectYear" class="select border px-3 py-2">
		                  	<c:forEach begin="${2016}" end="${thisyear }" var="y">
		                    	<option value="${y }"<c:if test="${search.selectYear eq y}">selected="selected"</c:if>>${y }년</option>
		                  	</c:forEach>
	                      </select>
	                      <div>
		                  	<select id="searchYear" class="border px-3 py-2">
		                    	<option value="yearId" <c:if test="${not empty search.yearId}">selected="selected"</c:if> >아이디</option>
		                        <option value="yearName" <c:if test="${not empty search.yearName}">selected="selected"</c:if> >이름</option>
		                   	</select>
		                    <input type="text" id="inputSearch" 
		                    <c:if test="${empty search.yearName}">name="yearId"</c:if>
		                    <c:if test="${not empty search.yearId}">value="${search.yearId}"</c:if>
		                    <c:if test="${not empty search.yearName}">name="yearName" value="${search.yearName}"</c:if>
		                    placeholder="검색" class="border px-3 py-2">
		                    <button type="submit" class="border px-3 py-2">검색</button>
	                      </div>
	                  </div>
	              </form>
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
                    <form id='Year' method = 'get' action = '/admin/adCSales'>
	                	<input type = 'hidden' name = 'pageYearNum' value = '${page.salesVo.pageYearNum }'>
	                	<input type = 'hidden' name = 'amountYear' value = '${page.salesVo.amountYear }'>
                    </form>
                    <div class="position-absolute" style="right: 1px;">
                      <button class="btn btn-danger">PDF다운</button>
                      <button id="yearExcel" class="btn btn-success">EXCEL다운</button>
                    </div>
                    
                  </div>
                </div>
				
				<!-- 월별 매출 -->
                 <div class="col-lg-12 pb-5 pt-3">
                  <h5 class="bg-dark px-3 py-2 mb-0 text-white" style="border-radius: 13px;">크리에이터별 월별 회사 매출 <span>(${thisyear }년)</span></h5>
                  <form id="monthFrm" action="/admin/adCSales" method="get">
	                  <div class="row mt-4 justify-content-between mb-3">
	                  	<select name="month" class="select border px-3 py-2">
			                <c:forEach begin="${1}" end="${thisMonth }" var="y">
			                	<option value="${y }"<c:if test="${search.month eq y}">selected="selected"</c:if>>${y }월</option>
			            	</c:forEach>
		                </select>
	                    <div>
	                      <select id="searchMonth" class="border px-3 py-2">
	                        <option value="monthId" <c:if test="${not empty search.monthId}">selected="selected"</c:if>>아이디</option>
	                        <option value="monthName" <c:if test="${not empty search.monthName}">selected="selected"</c:if>>이름</option>
	                      </select>
	                      <input id="inputMonth" type="text"
	                      	<c:if test="${empty search.monthName}">name="monthId"</c:if>
							<c:if test="${not empty search.monthId}">value="${search.monthId}"</c:if>
		                    <c:if test="${not empty search.monthName}">name="monthName" value="${search.monthName}"</c:if>
							placeholder="검색" class="border px-3 py-2">
	                      <button type="submit" class="border px-3 py-2">검색</button>
	                    </div>
	                  </div>
                  </form>
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
                    <form id='Month' method = 'get' action = '/admin/adCSales'>
	                	<input type = 'hidden' name = 'pageMonthNum' value = '${page.salesVo.pageMonthNum }'>
	                	<input type = 'hidden' name = 'amountMonth' value = '${page.salesVo.amountMonth }'>
                    </form>
                    <div class="position-absolute" style="right: 1px;">
                      <button class="btn btn-danger">PDF다운</button>
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
      	$('#searchYear').on('change',function(){
      		$('#inputSearch').attr('name',$('#searchYear').val());
      	})
      	
      	$('#searchMonth').on('change',function(){
      		$('#inputMonth').attr('name',$('#searchMonth').val());
      	})
      	
      	$(".year_ul .paginate_button a").on("click" , function(e) {
			e.preventDefault();
			
			$('#Year').find("input[name='pageYearNum']").val($(this).attr("href"));
			$('#Year').submit();
		});
      	
      	$(".month_ul .paginate_button a").on("click" , function(e) {
			e.preventDefault();
			
			$('#Month').find("input[name='pageMonthNum']").val($(this).attr("href"));
			$('#Month').submit();
		});
      	
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