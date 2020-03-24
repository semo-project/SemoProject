<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member" %>
<%
	String contextPath = request.getContextPath();
	String msg = (String)request.getAttribute("msg");
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
  <link href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="<%= request.getContextPath() %>/resources/css/modern-business.css" rel="stylesheet">
  
  <link href="<%= contextPath %>/resources/css/bootstrap.css" rel="stylesheet">
  
  <link href="<%= contextPath %>/resources/css/bootstrap-reboot.css" rel="stylesheet">
  
  <link href="<%= contextPath %>/resources/css/bootstrap-grid.css" rel="stylesheet">
  
  <link href="<%= contextPath %>/resources/css/bootstrap-grid.min.css" rel="stylesheet">
  
  <!-- dropdown -->
  <link href="<%= contextPath %>/resources/css/mainMenu.css" rel="stylesheet">

<script>
	var msg = "<%=msg%>";
	
	<%-- $(function(){
		if(msg != null){
			alert(msg);
			<% session.removeAttribute("msg");%>
		}
	}); --%>
	
	function loginValidate(){
		
		if($("#userId").val().trim().length == 0){
			alert("아이디를 입력하세요");
			$("#userId").focus;
			return false;
		}
		if($("#userPwd").val().trim().length == 0){
			alert("비밀번호를 입력하세요");
			$("#userPwd").focus;
			return false;
		}
		
		return true;
	}
</script>
</head>
<body>
	<!-- 메뉴바 영역 -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <img alt="" src="<%=contextPath%>/resources/images/globe.png" width="4%" height="4%">
      <a class="navbar-brand" href="http://localhost:8888/semo/">세모웹툰</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive" style="display:block">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <div class="nav-link" onclick="about();">연재</div>
          </li>
          <li class="nav-item">
            <div class="nav-link" onclick="semoBoard();">세모게시판</div>
          </li>
          <li class="nav-item">
              <input id="searchform" type="text" name="search" placeholder="웹툰명을 입력해주세요">
              <input id="searchbtn" type="submit" value="검색">
          </li>
          
          <!-- 로그인 폼 영역(dropdown) -->
          
          <div class="loginArea-main">
	          <form id="loginForm-drop" action="<%=contextPath%>/login.me" method="post" onsubmit="return loginValidate();">
		          <li class="nav-item dropdown">
		            <a class="nav-link dropdown-toggle" href="#" id="test2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		             	 로그인
		            </a>
		            <div class="dropdown-menu dropdown-menu-center" aria-labelledby="test2"> 
		              <div class="loginArea" id="loginLogo" style="text-align: left;">로그인</div>
		              <div class="loginArea">
		                <input type="text" id="userId" placeholder="아이디">
		              </div>
		              <div class="loginArea">
		                <input type="password" id="userPwd" placeholder="비밀번호">
		              </div>
		              <div class="loginArea">
		                <label class="logCheck"> 
		                  <input type="checkbox" name="remember_me" >
		                  <i>
		                                     로그인 상태 유지
		                  </i>
		                </label>
		              </div>
		              <div class="loginBtn">
		                <button type="submit" class="lgBtn lgbtn-major lgBtn-wide lgBtn-mid">로그인</button>
		              </div>
		              <div class="login_links">
		                <a id="member_join" href="memberTerms.me">회원가입</a>
		                <a id="id_pw_find" href="idpwdFind.me">아이디/비밀번호 찾기</a>
		              </div>
		              <div class="login_driver">
		                <span>또는</span>
		              </div>
		              <button type="button" class="account_btn account_btn-naver oauth-connect" data-service="naver">네이버로 로그인 / 가입</button>
		              <button type="button" class="account_btn account_btn-kakao oauth-connect" data-service="kakao">카카오로 로그인 / 가입</button>
		
		              <p class="account_help">
		                "
		                    이용 중 도움이 필요하시면 ["
		                <a href="ko/help">고객지원</a>
		                "] 페이지로, 로그인에 문제가 있다면 "
		                <a href="semo:help@semo.com">semohelp@semo.com</a>
		                "으로 문의해 주세요.
		                "
		              </p>
		            </div>
		          </li>
	          </form>
          
          </div>
        </ul>
      </div>
    </div>
  </nav>

  <!-- 메인 슬라이드 영역 -->
  <header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" style="background-image: url('http://placehold.it/1900x1080')">
          <div class="carousel-caption d-none d-md-block">
            <h3>First Slide</h3>
            <p>This is a description for the first slide.</p>
          </div>
        </div>
        <!-- Slide Two - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('http://placehold.it/1900x1080')">
          <div class="carousel-caption d-none d-md-block">
            <h3>Second Slide</h3>
            <p>This is a description for the second slide.</p>
          </div>
        </div>
        <!-- Slide Three - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('http://placehold.it/1900x1080')">
          <div class="carousel-caption d-none d-md-block">
            <h3>Third Slide</h3>
            <p>This is a description for the third slide.</p>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </header>

  <!-- Page Content -->
  <div class="container">

    <h1 class="my-4">세모 연재 웹툰<button class="more-web" type="submit"><h6>더보기</h6></button></h1>


    <!-- Marketing Icons Section -->
    <div class="row">
      <div class="col-lg-4 mb-4">
        <div class="card h-100">
          <h4 class="card-header">웹툰제목1</h4>
          <div class="card-body">
            <!-- <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p> -->
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">바로가기</a>
          </div>
        </div>
      </div>
      <div class="col-lg-4 mb-4">
        <div class="card h-100">
          <h4 class="card-header">웹툰제목2</h4>
          <div class="card-body">
            <!-- <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis ipsam eos, nam perspiciatis natus commodi similique totam consectetur praesentium molestiae atque exercitationem ut consequuntur, sed eveniet, magni nostrum sint fuga.</p> -->
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">바로가기</a>
          </div>
        </div>
      </div>
      <div class="col-lg-4 mb-4">
        <div class="card h-100">
          <h4 class="card-header">웹툰제목3</h4>
          <div class="card-body">
            <!-- <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p> -->
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">바로가기</a>
          </div>
        </div>
      </div>
    </div>
    <!-- /.row -->

    <!-- Portfolio Section -->
    <h2>세모게시판</h2>

    <div class="semoboard-main">
      
    </div>
    
  </div>
  
  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="<%= request.getContextPath() %>/resources/js/jquery.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>