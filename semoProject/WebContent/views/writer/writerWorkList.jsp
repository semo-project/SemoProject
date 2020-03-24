<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.text.SimpleDateFormat,java.util.Date" %> 

<% 
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sdf.format(date); // "2020-02-25"
%>            
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
 <link href="resources/css/work_style.css" rel="stylesheet" type="text/css"/> 
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
        <li class="nav-item active dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Blog
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
            <a class="dropdown-item" href="blog-home-1.html">Blog Home 1</a>
            <a class="dropdown-item active" href="blog-home-2.html">Blog Home 2</a>
            <a class="dropdown-item" href="blog-post.html">Blog Post</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Other Pages
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
            <a class="dropdown-item" href="full-width.html">Full Width Page</a>
            <a class="dropdown-item" href="sidebar.html">Sidebar Page</a>
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
<br><br>
  

  <!-- Page Heading/Breadcrumbs -->

  <h1 class="mt-4 mb-3">김작가님의 작품

    <!-- <small>Subheading</small> -->
  </h1>
  

  

  <ol class="breadcrumb">
    <li class="breadcrumb-item">
      <a href="index.html">내 작품관리</a>
    </li>
    <li class="breadcrumb-item active">작품 리스트</li>
  </ol>
  
  <a href="#" class="btn btn-primary" id="tr1">작품등록 신청 </a><br><br>
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
  <div class="col-lg-9 mb-4">
    <div class="row">
      <!--one-->
      <div class="col-md-7">
        <a href="#">
          <img class="img-fluid rounded mb-3 mb-md-0" src="http://placehold.it/700x300" alt="">
        </a>
      </div>

      <div class="col-md-5">
        <h3>첫번째 작품</h3>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium veniam exercitationem expedita laborum at voluptate. Labore, v.</p>
        <a class="btn btn-primary" href="<%=request.getContextPath()%>/ep" >전체 목록 보기
          <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
      </div>
    </div>    
    <br>

    <div class="row">
      <!--two-->
      <div class="col-md-7">
        <a href="#">
          <img class="img-fluid rounded mb-3 mb-md-0" src="http://placehold.it/700x300" alt="">
        </a>
      </div>

      <div class="col-md-5">
        <h3>두번째 작품</h3>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium veniam exercitationem expedita laborum at voluptate. Labore, v.</p>
        <a class="btn btn-primary" onclick=episodeList();>전체 목록 보기
          <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
      </div>
    </div>  
  </div>    
  
</div>


<!-- M -->
<form class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
 action="<%= request.getContextPath()%>/insert.wr" method="POST" enctype="Multipart/form-data">
  <div class="modal-dialog" role="document">
      <div class="modal-content">
          <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">작품 등록 신청</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
              </button>
          </div>
          <div class="modal-body" >
              <table class="table">
                  <tr>
                    <td>
                      <div>등록 작품명:
                     <input type="text" name="title">
                      </div>
                    </td>
                  </tr>
                  
                  <tr>
                  	<td>
                  		<div>작품 시작일 : 
                  		<input type="date" name="startday" value="2020-04-01"></div>
                  		<div name ="requestday">작품등록신청일 : 
                  		<%=today%>
                  		</div>
                  	</td>
                  </tr>
                  <tr>
                    <td>
                      <div>연재 요일
                        <br>
                        <input type="checkbox" name="updateday" value="mon">월
                        <input type="checkbox" name="updateday" value="tue">화
                        <input type="checkbox" name="updateday" value="wed">수
                        <input type="checkbox" name="updateday" value="thr">목
                        <input type="checkbox" name="updateday" value="fri">금
                        <input type="checkbox" name="updateday" value="sat">토
                        <input type="checkbox" name="updateday" value="sun">일
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div>장르: 
                        <br>
                        <input type="checkbox" name="genre" value="10">일상
                        <input type="checkbox" name="genre" value="20">개그
                        <input type="checkbox" name="genre" value="30">판타지
                        <input type="checkbox" name="genre" value="40">기타 <br>
                        <input type="checkbox" name="genre" value="50">로맨스
                        <input type="checkbox" name="genre" value="60">액션
                        <input type="checkbox" name="genre" value="70">미스터리
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div>작품요약: 
                        <input type="text" name= "plot">
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div>줄거리:
                        <input type="text" height="150px" name="summary">
                      </div>
                    </td>
                  </tr>

                  <tr>
                    <td>
                      <div>이미지: 
                        <div style="height: 150px;">
                        	<input type='file' id="imgInput" name = "file1">
                        	<img id="image_section" style="height: 150px;">

                        	</div>
                      	</div>                  
                    </td>
                  </tr>
                                    
              </table>                        
          </div>
          <div class="modal-footer">
              <button type="submit" class="btn btn-secondary"  id="btnWrite" >작품신청하기</button>
             
              <!-- DB값 수정으로 보류  -->                        
          </div>
      </div>
  </div>
</form>


    <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-demo.js"></script>

<script>
  $(function() {
      $("#tr1").click(function(){
          $("#exampleModal").modal("show");
      });
  });


<%--    function qnaGo(){
		location.href="<%=request.getContextPath()%>/list.ep"								
	};
	  --%>
	
   


</script>

</div>



<!-- Footer -->
<footer class="py-5 bg-dark">
  <div class="container">
    <p class="m-0 text-center text-white" > Copyright &copy; Your Website 2019</p>
  </div>
</footer>




<script>
function readURL(input) {
	 if (input.files && input.files[0]) {
	  var reader = new FileReader();
	  
	  reader.onload = function (e) {
	   $('#image_section').attr('src', e.target.result);  
	  }
	  
	  reader.readAsDataURL(input.files[0]);
	  }
	}
	  
	$("#imgInput").change(function(){
	   readURL(this);
	});
	


</script>
</body>
</html>