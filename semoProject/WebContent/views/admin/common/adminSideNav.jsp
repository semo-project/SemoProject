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
	                <a href="<%=contextPath %>/list.me?pageId=1"
	                   class="nav-link
	                   <%if("1".equals(request.getParameter("pageId"))) { %> sideNavSelected <%} %>">
	                    <div class="sb-nav-link-icon"></div>
	                    	전체 회원 보기
	                </a>
	                <a href="<%=contextPath%>/adminList.wr?pageId=2"
	                   class="nav-link 
	                	<%if("2".equals(request.getParameter("pageId"))) { %> sideNavSelected <%} %>">
	                    <div class="sb-nav-link-icon"></div>
	                    	전체 작가 보기
	                </a>
	                <a href="<%=contextPath%>/blackList.me?pageId=3"
	                   class="nav-link 
	                   <%if("3".equals(request.getParameter("pageId"))) { %> sideNavSelected <%} %>">
	                    <div class="sb-nav-link-icon"></div>
	                    	블랙리스트
	                </a>
	                
	                <div class="sb-sidenav-menu-heading">Work</div>
	                <a href="<%=contextPath%>/list.wo?pageId=4"
	                   class="nav-link 
	                   <%if("4".equals(request.getParameter("pageId"))) { %> sideNavSelected <%} %>">
	                    <div class="sb-nav-link-icon"></div>
	                    	전체 작품 보기
	                </a>
	                <a href="<%=contextPath%>/workApprov.wo?pageId=5"
	                   class="nav-link 
	                   <%if("5".equals(request.getParameter("pageId"))) { %> sideNavSelected <%} %>">
	                    <div class="sb-nav-link-icon"></div>
	                    	작품 등록 및 승인
	                </a>
	
	                <div class="sb-sidenav-menu-heading">Report</div>
	                <a href="<%=contextPath%>/list.re?pageId=6"
	                   class="nav-link 
	                   <%if("6".equals(request.getParameter("pageId"))) { %> sideNavSelected <%} %>">
	                    <div class="sb-nav-link-icon"></div>
	                    	전체 신고 보기
	                </a>
	                
	                <div class="sb-sidenav-menu-heading">Service</div>
	                <a href="<%=contextPath%>/alist.no?pageId=7"
	                	class="nav-link
	                	<%if("7".equals(request.getParameter("pageId"))) { %> sideNavSelected <%} %>">	              
	                    <div class="sb-nav-link-icon"></div>
	                    	공지사항 관리
	                </a>
	                
					<a href="<%=contextPath%>/alist.qn?pageId=8"
	                	class="nav-link
	                	<%if("8".equals(request.getParameter("pageId"))) { %> sideNavSelected <%} %>">	              
							<div class="sb-nav-link-icon"></div>
							1 : 1  문의 관리
	                </a>
					
					<a href="<%=contextPath%>/acontent.no?pageId=9"
	                   class="nav-link 
	                   <%if("9".equals(request.getParameter("pageId"))) { %> sideNavSelected <%} %>">
	                    	<div class="sb-nav-link-icon"></div>
	                    	자주 묻는 질문 관리
	                </a>
	
	                <div class="sb-sidenav-menu-heading">Etc</div>
	                <a href="<%=contextPath%>/visit.st?pageId=10"
	                   class="nav-link 
	                   <%if("10".equals(request.getParameter("pageId"))) { %> sideNavSelected <%} %>">
	                    <div class="sb-nav-link-icon"></div>
	                    	통계 관리
	                </a>
	               
	            </div>
	        </div>
	    </nav>
	</div>
</body>
</html>