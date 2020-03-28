<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member" %>
<%
	String contextPath = request.getContextPath();
	//String msg = (String)request.getAttribute("msg");
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
	<link href="<%= contextPath %>/resources/css/mainMenu.css" rel="stylesheet">
	<link rel="shortcut icon" href="#">
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
	<style>
	.container-1{
  		width: 300px;
  		vertical-align: middle;
  		white-space: nowrap;
  		position: relative;
	}
	</style>
</head>
<body>
	<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-info fixed-top">
		<div class="container" style="margin:auto; padding:10px;">
			<img alt="" src="<%=contextPath%>/resources/images/globe.png" width="4%" height="4%"> &nbsp;&nbsp;
			<a class="navbar-brand" href="<%=contextPath %>">세모웹툰</a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
			<div class="collapse navbar-collapse" id="navbarResponsive">
		
			<ul class="navbar-nav">
				<a class="nav-link" href="<%=request.getContextPath()%>/list.week" style="float:left;">연재</a>
				<div class="nav-link" onclick="semoBoard();" style="cursor:pointer;">세모게시판</div>	
      		</ul>
      		
			<ul class="navbar-nav ml-auto">
        	<!-- 
          		<li class="nav-item">
            	<a class="nav-link" href="about();" style="float:left;">연재</a>
          	</li>
          	<li class="nav-item">
            	<div class="nav-link" onclick="semoBoard();" style="cursor:pointer;">세모게시판</div>
          	</li>
          	-->
          	<li class="nav-item">
              	<input id="searchform" type="search" name="search" placeholder=" Search work..." class="container-1" style="border-radius: 0.25rem; height:100%; margin:0">
              	<input id="searchbtn" type="submit" class="btn" value="검색" style="height:100%">
          	</li>
          
          
          
          <!-- 로그인 폼 영역(dropdown) -->
          
          <div class="loginArea-main" style="margin:auto; margin-left:10px;">
          	<% if(loginUser == null) { %>
	          <form id="loginForm-drop" action="<%=contextPath%>/login.me" method="post" onsubmit="return loginValidate();">
		          <li class="nav-item dropdown">
		            <a class="nav-link dropdown-toggle btn btn-warning" href="#" id="test2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">로그인</a>
		            <div class="dropdown-menu dropdown-menu-center" aria-labelledby="test2" style="width:300px"> 
		              <div class="loginArea" id="loginLogo" style="text-align: left;"><b>로그인</b></div>
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
		                <button type="submit" class="btn btn-sm btn-outline-warning lgBtn lgbtn-major lgBtn-wide lgBtn-mid">로그인</button>
		              </div>
		              <div class="login_links" style="text-align:center">
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
	          
	          <!-- 로그인이 되었다면 -->
	          <% } else { %>
	          <li class="nav-item dropdown" style="padding=0">
	            <a class="nav-link dropdown-toggle" href="#" id="test2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                <div class="media mt-4 comment_area2">
	                    <img class="userImg" src="<%=contextPath%>/resources/images/defaultIcon.png" width="25px" height="25px" margin-left="2px">
	                    <div class="media-body">
	                      <%=loginUser.getMemberName() %>
	                    </div>
	                  </div>
	            </a>
				<div class="dropdown-menu dropdown-menu-center" aria-labelledby="test2"> 
					<div class="loginArea" id="loginLogo" style="text-align: left; margin-top:0px" >
						<img class="userImg" src="<%=contextPath%>/resources/images/defaultIcon.png" width="25px" height="25px" margin-left="2px">
						<%= loginUser.getMemberName() %>
	              	 	<button class="btn btn-primary btn-sm" style="float:right; margin-right:5px;">로그아웃</button>
	              	 	<div class="dropdown-divider"></div>
	              	</div>
	              
	              	<!-- 관리자라면 -->
					<% if(loginUser != null & loginUser.getMemberId().equals("admin")) { %>
					<div class="adminPgIn drop-item">
						<a href="<%=contextPath %>/main.ad" style="margin-left:15px; color:blue">관리자 페이지로</a>
					</div>
					<!-- 관리자가 아니라면 -->
					<% } else { %>
					<div class="myCoin">
						보유 코인 : <%= loginUser.getMyCookieCount() %>개 <button>충전하기</button>
					</div>
					
					<div class="myPageIn">
	                	<a href="myPage.me">마이페이지</a>
					</div>
	              	<div class="writerPgIn">
	                  	<a href="">작가페이지</a>
	              	</div>	              
	              	<% } %>
	            </div>
	          </li>
	          <% } %>
          </div>
        </ul>
      </div>
    </div>
  </nav>
  
  <script>
  	function semoBoard(){
  		location.href="<%= request.getContextPath() %>/boardList.bo";
  	}
  </script>
  <script>
	 function about(){
		 location.href("<%=request.getContextPath()%>/list.week");
	 }
	</script>
  
</body>
</html>