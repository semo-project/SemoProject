<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.kh.notice.model.vo.Notice" %>    

<% 
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");

%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css//bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/notice_style.css" rel="stylesheet" type="text/css"/>
</head>
<body>


<!-- Navigation -->
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
  <div class="container">
    <a class="navbar-brand" href="index.html">Start Bootstrap</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link" href="about.html">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="services.html">Services</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="contact.html">Contact</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Portfolio
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
            <a class="dropdown-item" href="portfolio-1-col.html">1 Column Portfolio</a>
            <a class="dropdown-item" href="portfolio-2-col.html">2 Column Portfolio</a>
            <a class="dropdown-item" href="portfolio-3-col.html">3 Column Portfolio</a>
            <a class="dropdown-item" href="portfolio-4-col.html">4 Column Portfolio</a>
            <a class="dropdown-item" href="portfolio-item.html">Single Portfolio Item</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Blog
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
            <a class="dropdown-item" href="blog-home-1.html">Blog Home 1</a>
            <a class="dropdown-item" href="blog-home-2.html">Blog Home 2</a>
            <a class="dropdown-item" href="blog-post.html">Blog Post</a>
          </div>
        </li>
        <li class="nav-item active dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Other Pages
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
            <a class="dropdown-item" href="full-width.html">Full Width Page</a>
            <a class="dropdown-item active" href="sidebar.html">Sidebar Page</a>
            <a class="dropdown-item" href="faq.html">FAQ</a>
            <a class="dropdown-item" href="404.html">404</a>
            <a class="dropdown-item" href="pricing.html">Pricing Table</a>
          </div>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Page Content -->
<div class="container">

  <!-- Page Heading/Breadcrumbs -->
  <h1 class="mt-4 mb-3">공지사항 </h1>

  <ol class="breadcrumb">
    <li class="breadcrumb-item">
      <a href="Notice_공지사항.html">공지시항/고객지원</a>
    </li>
  </ol>

  <!-- Content Row -->
  <div class="row">
    <!-- Sidebar Column -->
	<%@ include file ="common/noticeSideNav.jsp" %>
    <!-- Content Column -->
    

	<% if(list.isEmpty()){ %>
	
	<div style="height:215px; width:700px">
		<h3>존재하는 공지사항이 없습니다.</h3>
	</div>
	<% }else { %>
	
		<% for(Notice n : list){ %>
		<div class="mb-4" id="accordion" role="tablist" aria-multiselectable="true">
			<div class="card">
				<div class="card-header" role="tab" id="headingTwo">
				  <h5 class="mb-0">
				  <div>
				    <div>
				      <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
				      	<%= n.getNoticeTitle() %>
				     </a>
				     <small><%= n.getNoticeDate() %></small>
				      </div>
				    </div>
				  </h5>
				</div>
			
					<div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo">
						  <div class="card-body">
						  	<%=n.getNoticeContent() %>
						  </div>
					</div>
				</div>
					<% } %>
				<% } %>
		  	</div>
		</div><!-- /Content Row -->
	</div><!-- /Page Content -->



  <div class="paging" >
    <a href="#" class="bt first">처음 페이지</a>
    <a href="#" class="bt prev">이전 페이지</a>
    <a href="#" class="num on">1</a>
    <a href="#" class="num">2</a>
    <a href="#" class="num">3</a>
    <a href="#" class="num">4</a>
    <a href="#" class="num">5</a>
    <a href="#" class="bt next">다음 페이지</a>
    <a href="#" class="bt last">마지막 페이지</a>
  </div>

  <!-- /.row -->

</div>
<!-- /.container -->

<!-- Footer -->
<footer class="py-5 bg-dark">
  <div class="container">
    <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
  </div>
  <!-- /.container -->
</footer>

<!-- Bootstrap core JavaScript -->
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/bootstrap.bundle.min.js"></script>

</body>
</html>