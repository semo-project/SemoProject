<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
	<link href="resources/css/admin_styles.css" rel="stylesheet" type="text/css"/>
	<script src="resources/js/admin1.js"></script>
</head>
<body class="sb-nav-fixed">
<!--여기가 맨 위에 상단바 (검색창이랑)-->

<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark"> 
	<a class="navbar-brand" href="#" onclick="goAdminMain();">Admin Page</a>
	<button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
    
	<!-- Navbar Search-->
	<form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
		<div class="input-group">
			<!-- 검색하는 부분 제거 -->
			<!-- <input class="form-control" type="text" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" />
			<div class="input-group-append">
				<button class="btn btn-primary" type="button"><i class="fas fa-search"></i></button>
			</div>
			 -->
		</div>
	</form>
    
	<!-- Navbar-->
	<ul class="navbar-nav ml-auto ml-md-0">
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
			<div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
				<a class="dropdown-item" href="#" onclick="adminLogOut();">Logout</a>
			</div>
		</li>
	</ul>
</nav>
       
	<script>
		function goAdminMain() {
			location.href = "<%=contextPath%>/main.ad";
		}
		function adminLogOut() {
			location.href = "<%=contextPath%>/logOut.ad";
		}
	</script>
	
	<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/chart-area.js"></script>
    <script src="resources/js/chart-bar.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
    <script src="assets/demo/datatables-demo.js"></script>
</body>
</html>