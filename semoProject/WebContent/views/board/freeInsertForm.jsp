<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member" %>
<%
	//Member loginUser = (Member)request.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%= request.getContextPath()%>/resources/css/boardmain.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gugi&display=swap" rel="stylesheet">
<style>
	.boardInsert{
		margin-top:4%;
	}
	.sidebar{
		display:block;
	}
</style>
</head>
<body>
	
	<%@ include file="../common/menubar.jsp" %>

  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">
      <!-- <small>Subheading</small> -->
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="freeList.bo" style="font-family: 'Gugi'">세모게시판</a> > <a href="freeList.bo" style="font-family: 'Gugi'">수다수다 유머방</a>
      </li>
    </ol>

    <!-- Content Row -->
    <div class="row">
      <!-- Sidebar Column -->
      <div class="col-lg-3 mb-4">
        <div class="list-group">
          <a href="boardList.bo" class="list-group-item">웹툰 TalkTalk</a>
          <a href="freeList.bo" class="list-group-item">수다수다 유머방</a>
        </div>
      </div>
    </div>
    <!-- /.row -->
    
      <!-- Content Column -->
      
      <div class="semoTalk" style="margin-top: 8%">
          <table style="width: 600px;margoin-left: auto;margin-left: 25%;margin-top: -19%;">
              <tr style="border-bottom:1px solid rgb(163, 160, 160);">
                  <td>
                      <h3 style="font-family: 'Gugi'">수다수다 유머방</h3>
                  </td>
              </tr>
              <tr style="border-bottom:1px solid rgb(163, 160, 160); margin-top: 5px;">
                  <td>
                      <h6>재미있는 유머들이 가득한 곳!</h6>
                  </td>
              </tr>
          </table>
	</div>
	
	<form id="insertForm" action="<%=contextPath%>/insertFree.bo" method="post">
		<table align="center">
			<tr>
				<th>제목</th>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="20" name="content" style="resize:none;"></textarea>
				</td>
			</tr>
			<input type="hidden" name="writer" value="<%= loginUser.getMemberNo() %>">
		</table>
		
		<div class="btns" align="center">
			<button type="button" onclick="location.href='freeList.bo'">취소</button>
			<button type="submit">작성</button>
		</div>
		
	</form>
		
		
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