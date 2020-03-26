<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%= request.getContextPath()%>/resources/css/logForm.css" rel="stylesheet">
</head>
<body>

	<%@include file="../common/menubar.jsp" %>
	
	<form class="logForm_home">
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
        <button type="submit" class="lgBtn lgbtn-major lgBtn-wide lgBtn-mid" disabled>로그인</button>
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
  </form>

<!-- Bootstrap core JavaScript -->
  <script src="<%= request.getContextPath() %>/resources/js/jquery.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/js/bootstrap.bundle.min.js"></script>
</body>
</html>