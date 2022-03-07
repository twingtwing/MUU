<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.left-sidebar{
	background-color: #1F262D;
	height:100vh;
	margin:0;
}
i{
	margin-right: 1rem;
}
</style>
</head>
<body>
<aside class="left-sidebar h-100" data-sidebarbg="skin5">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav" class="p-t-30">
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/admin/home" aria-expanded="false"><i class="mdi mdi-view-dashboard"></i><span class="hide-menu">홈</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-chart-bar"></i><span class="hide-menu">매출</span></a>
                            <ul aria-expanded="false" class="collapse  first-level">
                                <li class="sidebar-item ml-5"><a href="/admin/adTSales" class="sidebar-link"><span class="hide-menu"> - 기간별 매출</span></a></li>
                                <li class="sidebar-item ml-5"><a href="/admin/adCSales" class="sidebar-link"><span class="hide-menu"> - 크리에이터 매출</span></a></li>
                                <li class="sidebar-item ml-5"><a href="/admin/adASales" class="sidebar-link"><span class="hide-menu"> - 기타 통계</span></a></li>
                            </ul>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/admin/adBadLi" aria-expanded="false"><i class="mdi mdi-pencil"></i><span class="hide-menu">공지사항</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/admin/adFaqL" aria-expanded="false"><i class="fa fa-question" aria-hidden="true"></i><span class="hide-menu">F A Q</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/admin/adQstL" aria-expanded="false"><i class="fa fa-comments" aria-hidden="true"></i><span class="hide-menu">문의글 관리</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/admin/adUserL" aria-expanded="false"><i class="mdi mdi-face"></i><span class="hide-menu">유저 관리</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/admin/adCreL" aria-expanded="false"><i class="m-r-10 mdi mdi-face-profile"></i><span class="hide-menu">크리에이터 관리</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-alert"></i><span class="hide-menu">신고 관리</span></a>
                            <ul aria-expanded="false" class="collapse  first-level">
                                <li class="sidebar-item ml-5"><a href="/admin/adLRepL" class="sidebar-link"><span class="hide-menu"> - 강의 신고</span></a></li>
                                <li class="sidebar-item ml-5"><a href="/admin/adRRepL" class="sidebar-link"><span class="hide-menu"> - 리뷰 신고</span></a></li>
                            </ul>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-camcorder"></i><span class="hide-menu">강의 관리</span></a>
                            <ul aria-expanded="false" class="collapse  first-level">
                                <li class="sidebar-item ml-5"><a href="/admin/adLecL" class="sidebar-link"><span class="hide-menu"> - 강의 관리</span></a></li>
                                <li class="sidebar-item ml-5"><a href="/admin/adLecAL" class="sidebar-link"><span class="hide-menu"> - 강의 등록</span></a></li>
                            </ul>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/admin/adRef" aria-expanded="false"><i class="mdi mdi-receipt"></i><span class="hide-menu">환불 관리</span></a></li>
                    </ul>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>
</body>
</html>