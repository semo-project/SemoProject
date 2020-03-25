<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Admin</title>
	<link href="resources/css/admin_styles.css" rel="stylesheet" type="text/css"/>
</head>
<body class="sb-nav-fixed">
	<div id="layoutSidenav_nav">
		<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
	        <div class="sb-sidenav-menu">
	            <div class="nav">
	                <div class="sb-sidenav-menu-heading">Member</div>
	                <a class="nav-link" href="#" onclick="memberList();">
	                    <div class="sb-nav-link-icon"></div>
	                    	전체 회원 보기
	                </a>
	                <a class="nav-link" href="Member_전체작가보기.html">
	                    <div class="sb-nav-link-icon"></div>
	                    	전체 작가 보기
	                </a>
	                <a class="nav-link" href="Member_블랙리스트.html">
	                    <div class="sb-nav-link-icon"></div>
	                    	블랙리스트
	                </a>
	                
	                <div class="sb-sidenav-menu-heading">Work</div>
	                <a class="nav-link" href="Work_전체작품보기.html">
	                    <div class="sb-nav-link-icon"></div>
	                    	전체 작품 보기
	                </a>
	                <a class="nav-link" href="Work_작품등록및승인.html">
	                    <div class="sb-nav-link-icon"></div>
	                    	작품 등록 및 승인
	                </a>
	
	                <div class="sb-sidenav-menu-heading">Report</div>
	                <a class="nav-link" href="Report_신고관리.html">
	                    <div class="sb-nav-link-icon"></div>
	                    	전체 신고 보기
	                </a>
	
	                <div class="sb-sidenav-menu-heading">Service</div>
	                <a class="nav-link" href="#">
	                    <div class="sb-nav-link-icon"></div>
	                    	공지사항 관리
	                </a>
	                <a class="nav-link" href="#">
	                    <div class="sb-nav-link-icon"></div>
							1:1문의 관리
	                </a>
	                <a class="nav-link" href="#">
	                    <div class="sb-nav-link-icon"></div>
	                    	자주 묻는 질문 관리
	                </a>
	
	                <div class="sb-sidenav-menu-heading">Etc</div>
	                <a class="nav-link" href="Stats_통계관리.html">
	                    <div class="sb-nav-link-icon"></div>
	                    	통계 관리
	                </a>
	               
	            </div>
	        </div>
	    </nav>
	</div>

	<script>
		function memberList() {
			location.href = "<%=request.getContextPath()%>/list.me";
		}
	</script>
</body>
</html>