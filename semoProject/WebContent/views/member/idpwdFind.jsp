<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%= request.getContextPath()%>/resources/css/idFind-main.css" rel="stylesheet">
</head>
<body>

	<%@include file="../common/menubar.jsp" %>
	
	<div class="idpwdFindForm">
		<br>
  		<h1 align="center">세모웹툰</h1>
  		
  		<!-- 아이디 찾기 폼 -->
  		<form id="idfindForm" method="post" action="<%= request.getContextPath()%>/idfind.me">
	  		<div class="idFind">
		        아이디 찾기<hr align= "left" style="border: solid 0.3px darkgray; margin-top: -0.05px; width: 45%;">
		    </div>
		    <div class="idFind-userName">
		        이름 <input type="text" id="userName" name="userName" placeholder="이름을 입력하세요.">
		    </div>
		    <div class="idFind-Email">
		        이메일 <input type="email" id="email" name="email" placeholder="이메일을 입력하세요."><button id="email-veri">이메일 인증</button>
		    </div>
		    <div class="idFind-btn">
		        <button type="submit" id="idF-btn" name="idF-btn">아이디 찾기</button>
		    </div>
  		</form>
  		
  		<!-- 비밀번호 찾기폼 -->
  		<form id="pwdfindForm" method="post" action="<%= request.getContextPath()%>/idcheck.me">
		    <div class="pwdFind">
		        비밀번호 찾기<hr align= "left" style="border: solid 0.6px darkgray; margin-top: -0.05px; width: 45%;">
		    </div>
		    <div class="pwdFind-userId">
		        아이디 <input type="text" id="userFid" name="userFid" placeholder="아이디를 입력하세요.">
		    </div>
		    <div class="pwdFind-Email">
		        이메일 <input type="email" id="email" name="email" placeholder="이메일을 입력하세요.">
		    </div>
		    <div class="pwdFind-btn">
		        <button type="submit" id="pwdF-btn" name="pwdF-btn">아이디 확인</button>
		    </div>		
  		</form>
	</div>
	
</body>
</html>