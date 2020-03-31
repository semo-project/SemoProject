<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kh.member.model.vo.Member" %>
<%
	Member m = (Member)request.getAttribute("findUserName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%= request.getContextPath()%>/resources/css/idfind.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gugi&display=swap" rel="stylesheet">
</head>
<body>

	<%@include file="../common/menubar.jsp" %>
	
	<div class="semologo2"><h1 style="font-family: 'Gugi'; margin-top:12%; font-size:2.3em">세모웹툰</h1></div>
	  <h4 id="idF-h4">아이디찾기</h4>
	  <h6 id="idF-h6">회원님이 현재 가입한 아이디</h6>
	
	  <div class="idF-table">
	      <table border="1px solid darkgray">
	        <th>아이디</th>
	        <th>가입일</th>
	        <tr>
	            <td><%= m.getMemberId() %></td>
	            <td><%= m.getEnrollDate() %></td>
	        </tr>
	      </table>
	  </div>
	
	  <div class="pwdFind-btn">
	  <button type="button" id="pwdF-btn" name="pwdF-btn"><a href="views/member/idpwdFind.jsp">비밀번호 찾기</a></button>
	  <button type="button" id="lgF-btn" name="lgF-btn"><a href="views/member/loginForm.jsp">로그인</a></button>
	</div>
	
<br><br><br><br><br><br><br><br>
<!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Semo-Webtoon 2020</p>
    </div>
    <!-- /.container -->
  </footer>	
  
  <!-- Bootstrap core JavaScript -->
  <script src="<%= request.getContextPath() %>/resources/js/jquery.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/js/bootstrap.bundle.min.js"></script>
</body>
</html>