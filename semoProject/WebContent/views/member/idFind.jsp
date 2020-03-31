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
	tr.space {
  	  border-bottom: 10px solid #fff;
	}
</style>
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
	
	  <div class="pwdFind-btn" style="margin-left:45%;">
	  <button type="button" id="pwdF-btn" name="pwdF-btn"><a href="views/member/idpwdFind.jsp">비밀번호 찾기</a></button>
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