<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css//bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/notice_style.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<!-- Navigation -->
  <%@ include file="../common/menubar.jsp" %>

<!-- Page Content -->
<div class="container">

  <!-- Page Heading/Breadcrumbs -->
  <h1 class="mt-4 mb-3">1:1 문의 </h1>

  <ol class="breadcrumb">
    <li class="breadcrumb-item">
      <a href="index.html">공지사항/고객지원</a>
    </li>
    <li class="breadcrumb-item active">공지사항/고객지원</li>
  </ol>

  <!-- Content Row -->
  <div class="row">
    <!-- Sidebar Column -->
	<%@ include file ="common/noticeSideNav.jsp" %>
	
	
    <!-- Content Column -->
    <div class="col-lg-9 mb-4">
      <!---->

      <form name="sentMessage" id="contactForm" novalidate method="post" action="<%=request.getContextPath()%>/qnaList.qna">
        <input type="hidden" value="<%= loginUser.getMemberNo() %>" name = "membernumber">
        <div class="control-group form-group">
          <div class="controls">
            <p class="help-block"></p>
          </div>
        </div>
        <div class="control-group form-group">
          <div class="controls">
          
            <label>문의 분류(필수 ):</label>
            <select name="qnaselect" class="form-control">
                <option>선택</option>
                <option value="1">로그인/계정</option>
                <option value="2">컨텐츠</option>
                <option value="3">기타</option>
            </select>
          </div>
        </div>
        <div class="control-group form-group">
          <div class="controls">
            <label>제목(필수):
            <input type="text" name="title" class="form-control"></label>
          </div>
        </div>
        <div class="control-group form-group">
          <div class="controls">
            <label type ="text">내용(필수):
            <textarea rows="10" cols="100" name="content" class="form-control" id="content" maxlength="999" style="resize:none"></textarea></label>
          </div>
        </div>
        <div id="success"></div>


        <!-- For success/fail messages -->
        <button type="submit" class="btn btn-primary" id="sendMessageButton">문의하기</button>
        <!-- 문의하기 끝. -->
        
        
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
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


</body>
</html>