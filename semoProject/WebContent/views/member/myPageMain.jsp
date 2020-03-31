<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  </style>
</head>

<body>

  <!-- Navigation -->
	<%@ include file="../common/menubar.jsp" %>

  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">마이페이지</h1>

    <ol style="background:lightseagreen;" class="breadcrumb">
      <li class="breadcrumb-item">
	    <a href="<%= contextPath %>" style="color:white;">메인</a>
      </li>
      <li class="breadcrumb-item active" style="color:white;">마이페이지</li>
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
        <h2 align="center">내 정보 보기</h2>
        <hr>
        <table border="1" align="center">
          <tr>
            <td colspan="3" rowspan="7" width="300" height="300" align="center"><img src="<%=contextPath%>/resources/images/defaultIcon.png" alt="프로필사진"></td>
            <th>이름</th>
            <td><%= loginUser.getMemberName() %></td>
          </tr>
          <tr>
            <th>아이디</th>
            <td><%= loginUser.getMemberId() %></td>
          </tr>
          <tr>
            <th>성별</th>
            <td>
            	<% if (loginUser.getGender().equals("M")) { %>
            	남자
            	<% } else { %>
            	여자
            	<% } %>
            </td>
          </tr>
          <tr>
            <th>전화번호</th>
            <td><%= loginUser.getPhone() %></td>
          </tr>
          <tr>
            <th>이메일</th>
            <td><%= loginUser.getEmail() %></td>
          </tr>
          <tr>
            <th>주소</th>
            <td><%= loginUser.getMemberAddress() %></td>
          </tr>
          <tr>
            <th>작가 신청 상태</th>
            <td>
            	<% if (loginUser.getApprovalFlag().equals("null")) { %>
            	미신청
            	<% } else if (loginUser.getApprovalFlag().equals("N")) { %>
            	대기
            	<% } else { %>
            	승인
            	<% } %>
			</td>
          </tr>
        </table>
      </div>
    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
      <br>
      <p class="m-0 text-center text-white"><a class="m-0 text-center text-white" href="<%=request.getContextPath() %>/list.no" >고객지원/공지사항</a></p>  
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="<%= request.getContextPath() %>/resources/js/jquery.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/js/bootstrap.bundle.min.js"></script>

</body>

</html>