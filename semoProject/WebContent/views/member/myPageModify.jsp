<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member" %>
<% Member mem = (Member)request.getAttribute("mem"); %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>My Page</title>

  <!-- Bootstrap core CSS -->
  <link href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="<%= request.getContextPath() %>/resources/css/modern-business.css" rel="stylesheet">

  <style>
    table th{
      text-align: center;
      width: 150px;
    }
    table td{
      width: 300px;
      text-align: center;
    }
    button{
      border-radius: 5px;
    }
  </style>
</head>

<body>

  <!-- Navigation -->
  <%@ include file="../common/menubar.jsp" %>
  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">마이페이지</h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">메인</a>
      </li>
      <li class="breadcrumb-item active">마이페이지</li>
    </ol>
    
    <!-- Content Row -->
    <div class="row">
      <!-- Sidebar Column -->
      <div class="col-lg-3 mb-4">
      	<%@ include file="myPageSidebar.jsp" %>
      	<%-- <div class="list-group">
          <a href="myPage.me" class="list-group-item">내 정보 보기</a>
          <a href="modifyInfo.me" class="list-group-item">내 정보 수정</a>
          <a href="addCookie.me" class="list-group-item">쿠키 충전</a>
          <a href="log.html" class="list-group-item">쿠키 충전 내역</a>
          <a href="bookmark.html" class="list-group-item">즐겨찾기한 웹툰</a>
          <a href="like.html" class="list-group-item">좋아요한 웹툰</a>
          <a href="question.html" class="list-group-item">문의글 확인</a>
          <a href="usedCookie.html" class="list-group-item">웹툰 결제 내역</a>
          <a href="myboard.html" class="list-group-item">내 게시글 보기</a>
          <a href="withdraw.html" class="list-group-item">회원 탈퇴</a>
          <% if (mem.getApprovalFlag().equals("N") || mem.getApprovalFlag().equals("null")) { %>
      		<a href="author.html" class="list-group-item">작가 등록 신청</a>
    	  <% } else { %>
      		<a href="#" class="list-group-item">내 작품 관리</a>
         	<a href="#" class="list-group-item">수익 관리</a>
      	  <% } %>
		</div> --%>
      </div>
      <!-- Content Column -->
      <div class="col-lg-9 mb-4">
        <h2 align="center">내 정보 수정</h2>
        <hr>
        <form action="updateInfo.me" method="POST">
          <table border="1" align="center">
          <input type="hidden" value="<%= mem.getMemberId() %>" name="userId" >
            <tr>
              <td colspan="3" width="300" height="300" rowspan="7" align="center"><img id="profileImg" width="300" height="300" src="<%=contextPath%>/resources/images/defaultIcon.png"alt="프로필사진""></td>
              <th>이름</th>
              <td><%= mem.getMemberName() %></td>
            </tr>
            <tr>
              <th>닉네임</th>
              <td><input type="text" name="nickname" value="<%= mem.getMemberNickname() %>"></td>
            </tr>
            <tr>
              <th>성별</th>
              <td>
              	<% if (mem.getGender().equals("M")) { %>
            		남자
            	<% } else { %>
            		여자
            	<% } %>
              </td>
            </tr>
            <tr>
              <th>전화번호</th>
              <td><input type="tel" name="phone" value="<%= mem.getPhone() %>"></td>
            </tr>
            <tr>
              <th>이메일</th>
              <td><input type="email" name="email" value="<%= mem.getEmail() %>"></td>
            </tr>
            <tr>
              <th>주소</th>
              <td><input type="text" name="address" value="<%= mem.getMemberAddress() %>"></td>
            </tr>
          </table>
          <div id="fileArea">
          	<!-- <input id="file1" name="file1" type="file" onchange="loadImg(this, 1);"></input> -->
          </div>
          <br>
          <div class="btns" align="center">
            <button type="reset">취소하기</button>
            <button type="submit">적용하기</button>
            <button type="button" onclick="">비밀번호 변경</button>
          </div>
		  <!-- <script>
			 $(function(){
				$("#fileArea").hide(); 
				
				$("#profileImg").click(function(){
					$("#file1").click();
				});
			 });
			 
			 function loadImg(inputFile, num){
				 var reader = new FileReader();
				 
				 reader.readAsDataURL(inputFile.files[0]);
				 reader.onload = function(e){
					 switch(num){
					 case 1:
						 $("#profileImg").attr("src", e.target.result);
						 break;
					 }
				 }
			 } 
		  </script> -->
        </form>
      </div>
    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->
  
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