<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	button{
	  background:lightseagreen;
	  color:#fff;
	  border:none;
	  position:relative;
	  height:60px;
	  font-size:1em;
	  padding:0 2em;
	  cursor:pointer;
	  transition:800ms ease all;
	  outline:none;
	  height:30px;
	}
	button:hover{
	  background:#fff;
	  color:#1AAB8A;
	}
	button:before,button:after{
	  content:'';
	  position:absolute;
	  top:0;
	  right:0;
	  height:2px;
	  width:0;
	  background: #1AAB8A;
	  transition:400ms ease all;
	}
	button:after{
	  right:inherit;
	  top:inherit;
	  left:0;
	  bottom:0;
	}
	button:hover:before,button:hover:after{
	  width:100%;
	  transition:800ms ease all;
	}
</style>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gugi&display=swap" rel="stylesheet">
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	<div class="joinSuccess" style="margin-top: 130px;">
		<img src="resources/images/globe.png" width="220px" height="220px" style="margin-left: 660px; margin-bottom:50px;">
		<div class="welcomeJoin">
			<h6 style="text-align:center; font-size:2em; font-family:'Gugi';">세모웹툰의 회원이 되신걸 환영합니다!</h6>
			<p style="text-align:center; font-size:1.7em; margin-top:3%; font-family:'Gugi';">세상 모든 웹툰을 즐겨보세요!</p>
		</div>
		
		<div class="welcomeBtn" align="center" style="margin-top:3%; margin-left:20px;">
			<button type="button" onclick="location.href ='<%=request.getContextPath()%>'">메인으로</button>
			<button type="button" onclick="location.href ='#'" style="margin-left:3%;">만화 보러가기</button>
		</div>
	</div>
	<script></script>
</body>
</html>