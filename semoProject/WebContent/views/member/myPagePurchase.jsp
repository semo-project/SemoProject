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
      width: 100px;
    }
    table td{
      width: 150px;
      text-align: center;
    }
    #purchase{
      width: 500px;
      height: 800px;
      font-size: 24px;
    }
    #purchase tr td:first-child{
      text-align: left;
    }
    #purchase tr td:nth-of-type(2){
      text-align: right;
    }
    #purchase tr td:last-child{
      box-sizing: border-box;
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
        <h2 align="center">쿠키 충전</h2>
        <hr>
        <table border="1" align="center">
          <tr>
            <td colspan="4" rowspan="4" width="200" height="200" align="center"><img src="<%= contextPath %>/resources/images/defaultIcon.png" alt="프로필사진"></td>
            <th rowspan="2">이름/아이디</th>
            <td rowspan="2"><%= mem.getMemberName() %>/<%= mem.getMemberId() %></td>
          </tr>
          <tr>
          </tr>
          <tr>
            <th rowspan="2">현재 보유 쿠키</th>
            <td rowspan="2"><%= mem.getMyCookieCount() %>개</td>
          </tr>
          <tr>
          </tr>
        </table>

        <hr>

        <table id="purchase" align="center">
          <tr>
            <td>10개</td>
            <td>900원</td>
            <td><button>+</button></td>
          </tr>
          <tr>
            <td>20개</td>
            <td>1,800원</td>
            <td><button>+</button></td>
          </tr>
          <tr>
            <td>30개</td>
            <td>2,900원</td>
            <td><button>+</button></td>
          </tr>
          <tr>
            <td>50개</td>
            <td>4,900원</td>
            <td><button>+</button></td>
          </tr>
          <tr>
            <td>100개</td>
            <td>9,000원</td>
            <td><button>+</button></td>
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
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="<%= request.getContextPath() %>/resources/js/jquery.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/js/bootstrap.bundle.min.js"></script>

</body>

</html>