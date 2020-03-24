<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	<div class="joinSuccess">
		<img src="resources/images/globe.png" width="100px" height="100px">
		<div class="welcomeJoin">
			<h6>세모웹툰의 회원이 되신걸 환영합니다!</h6>
			세상 모든 웹툰을 즐겨보세요!
		</div>
		
		<div class="welcomeBtn">
			<button type="button" onclick="location.href ='<%=request.getContextPath()%>'">메인으로</button>
			<button type="button" onclick="location.href ='#'">만화 보러가기</button>
		</div>
	</div>
	<script></script>
</body>
</html>