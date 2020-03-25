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
<title>Menubar</title>
	<!-- Dropdown -->
	<link href="<%= contextPath %>/resources/css/bootstrap.css" rel="stylesheet">
	<link href="<%= contextPath %>/resources/css/mainMenu.css" rel="stylesheet">
	<link href="<%= contextPath %>/resources/css/bootstrap-reboot.css" rel="stylesheet">
	<link href="<%= contextPath %>/resources/css/bootstrap-grid.min.css" rel="stylesheet">
	<link href="<%= contextPath %>/resources/css/bootstrap-grid.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
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
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <img alt="" src="<%=contextPath%>/resources/images/globe.png" width="4%" height="4%">
      <a class="navbar-brand" href="http://localhost:8888/semo/">세모웹툰</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="about.html">연재</a>
          </li>
          <li class="nav-item">
            <div class="nav-link" onclick="semoBoard();">세모게시판</div>
          </li>
          <li class="nav-item">
              <input id="searchform" type="text" name="search" placeholder="웹툰명을 입력해주세요">
              <input id="searchbtn" type="submit" value="검색">
          </li>
          <div class="loginArea-main">
          	<% if(loginUser == null) { %>
	          <form id="loginForm-drop" action="<%=contextPath%>/login.me" method="post" onsubmit="return loginValidate();">
		          <li class="nav-item dropdown">
		            <a class="nav-link dropdown-toggle" href="#" id="test2" data-toggle="dropdown"
		            aria-haspopup="true" aria-expanded="false">로그인</a>
		            <div class="dropdown-menu dropdown-menu-center" aria-labelledby="test2"> 
		              <div class="loginArea" id="loginLogo" style="text-align: left;">로그인</div>
		              <div class="loginArea">
		                <input type="text" id="userId" name="userId" placeholder="아이디">
		              </div>
		              <div class="loginArea">
		                <input type="password" id="userPwd" name="userPwd" placeholder="비밀번호">
		              </div>
		              <div class="loginArea">
		                <label class="logCheck"> 
		                  <input type="checkbox" name="remember_me" >
		                  <i>로그인 상태 유지</i>
		                </label>
		              </div>
		              <div class="loginBtn">
		                <button type="submit" class="lgBtn lgbtn-major lgBtn-wide lgBtn-mid">로그인</button>
		              </div>
		              <div class="login_links">
		                <a id="member_join" href="member_join.html">회원가입</a>
		                <a id="id_pw_find" href="id_pwd_find.html">아이디/비밀번호 찾기</a>
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
	          <% } else { %>
	          <li class="nav-item dropdown">
	            <a class="nav-link dropdown-toggle" href="#" id="test2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                <div class="media mt-4 comment_area2">
	                    <img class="userImg" src="<%=contextPath%>/resources/images/defaultIcon.png" width="25px" height="25px" margin-left="2px">
	                    <div class="media-body">
	                      <%= loginUser.getMemberName() %>
	                    </div>
	                  </div>
	            </a>
	            <div class="dropdown-menu dropdown-menu-center" aria-labelledby="test2"> 
	              <div class="loginArea" id="loginLogo" style="text-align: left;">
	              	<img class="userImg" src="<%=contextPath%>/resources/images/defaultIcon.png" width="25px"
	              	 height="25px" margin-left="2px"><%= loginUser.getMemberName() %>
	              	 <button>로그아웃</button>
	              </div>
	              <div class="myCoin">
	                  보유 코인 : <%= loginUser.getMyCookieCount() %>개 <button>충전하기</button>
	              </div>
	              <div class="myPageIn">
	                  <a href="myPage.me">마이페이지</a>
	              </div>
	              <div class="writerPgIn">
	                  <a href="">작가페이지</a>
	              </div>
	              <div class="adminPgIn">
	                  <a href="">관리자페이지</a>
	              </div>
	            </div>
	          </li>
	          <% } %>
          </div>
        </ul>
      </div>
    </div>
  </nav>
</body>
</html>