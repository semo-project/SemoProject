<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <h1 class="mt-4 mb-3">공지사항
    <!-- <small>Subheading</small> -->
  </h1>

  <ol class="breadcrumb">
    <li class="breadcrumb-item">
      <a href="Notice_공지사항.html">공지시항/고객지원</a>
    </li>
  </ol>

  <!-- Content Row -->
  <div class="row">
    <!-- Sidebar Column -->
<%-- 	<%@ include file ="../common/noticeSideNav.jsp" %> !!!!!!!!!!!!!!!!!!!!!--%>
    <!-- Content Column -->
    


    <div class="mb-4" id="accordion" role="tablist" aria-multiselectable="true">
      <div class="card">
        <div class="card-header" role="tab" id="headingOne">
          <h5 class="mb-0">
            <div>
              <div><small>154</small>
                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">내 서제 편의성 개선 안내
                </a>
                <small>2020.03.01</small>
              </div>
            </div>
          </h5>
        </div>

        <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne">
          <div class="card-body">
            공지사항 내용 1
          </div>
        </div>
      </div>
      <div class="card">
        <div class="card-header" role="tab" id="headingTwo">
          <h5 class="mb-0">
            <div>
              <div><small>153</small>
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">세모 웹툰 개인정보처리방침 개정안내
              </a>
              <small>2020.02.01</small>
            </div>
          </h5>
        </div>
        <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo">
          <div class="card-body">
            안녕하세요.<br> 여러 개로 나뉘어져 있던 작품 장르들이 개편되었습니다!<br>더불어 개편된 장르명을 토대로 독자님들의 취향에 맞는 작품들을 <br>
            선택하실 수 있도록 취향 반영 기능이 업데이트 되었으니<br> 꼬옥 잊지 말고 이용해 보시기 바랍니다.<br><br>[변경된 장르 정보]<br><br>
            로맨스<br><br>BL드라마<br>판타지<br>개그<br>액션<br>학원<br>미스터리<br>백합<br>일상<br><br>[취향 설정 홈 메뉴 이용방법]<br><br><br>안드로이드 앱 : 왼쪽 상단 메뉴 > 설정 > 취향 설정<br>
            iOS 앱 : 하단 마이페이지 > 설정 > 취향 설정<br> Web 환경 : 오른쪽 상단 메뉴 > 내 정보 > 취향 설정 <br>감사합니다. 
          </div>
        </div>
      </div>
      <div class="card">
        <div class="card-header" role="tab" id="headingThree">
          <h5 class="mb-0">
            <div>
              <div><small>152</small>
                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">세모웹툰 개인정보처리방침 개정안내
                </a>
              <small>2020.01.01</small>
              </div>
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
  <div class="paging">
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