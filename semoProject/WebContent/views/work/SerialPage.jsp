<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="../common/menubar.jsp"%>

	<div class="outer">
		<br>
		<h2 align="center">사진 게시판</h2>
		<br>
		
	 		<button onclick="Location.href='<%=contextPath %>/insertForm.th';">작성하기</button>
		
	</div>

</body>
</html>