<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
 <link href="resources/css/writerincome_style.css" rel="stylesheet" type="text/css"/>
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
  <h1 class="mt-4 mb-3">작가 수입관리
    <!-- <small>Subheading</small> -->
  </h1>

  <ol class="breadcrumb">
    <li class="breadcrumb-item">
      <a href="Notice_공지사항.html">수익관리</a>
    </li>
  </ol>

  <!-- Content Row -->
  <div class="row">
    
    <!-- Sidebar Column -->
    <div class="col-lg-3 mb-4">
      <div class="list-group">
        <a href="Notice_공지사항.html" class="list-group-item">내 정보 수정</a>
        <a href="Notice_자주 묻는 질문.html" class="list-group-item">쿠기 충전</a>
        <a href="Notice_11문의.html" class="list-group-item">쿠키 충전 내역</a>
        <a href="#" class="list-group-item">즐겨찾기한 웹툰</a>
        <a href="#" class="list-group-item">좋아요 웬툰</a>
        <a href="#" class="list-group-item">문의글 확인</a>
        <a href="#" class="list-group-item">웹툰 결제 내역</a>
        <a href="#" class="list-group-item">내 게시글 보기</a>
        <a href="#" class="list-group-item">내 작품관리</a>
        <a href="#" class="list-group-item">수익 관리</a>
      </div>
    </div>
    <!-- Content Column -->
    


    <div class="mb-4" id="accordion" role="tablist" aria-multiselectable="true">
      <div class="card">
        <div class="card-header" role="tab" id="headingOne" style="background-color:white;">
          <h5 class="mb-0">
            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">전체
              쿠키 : 5,3545,315
            </a>
          </h5>
        </div>
      </div>


      <div class="card">
        <div class="card-header" role="tab" id="headingTwo">
          <h5 class="mb-0">
            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">나혼자만 레벨업
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 쿠키 : 2,1345,315
            </a>
          </h5>
        </div>
        <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo">
          <div class="card-body">
            각 화별 쿠키 갯수 :
          </div>
        </div>
      </div>
      <div class="card">
        <div class="card-header" role="tab" id="headingThree">
          <h5 class="mb-0">
            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">세모웹툰 개인정보처리방침 개정안내(2019.12.05)
            </a>
          </h5>
        </div>
        <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree">
          <div class="card-body">
            공지 3 내용
          </div>
        </div>
      </div>
    </div>

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
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


</body>
</html>