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
	.btn10:hover{
		background:white;
		color:white;
		
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
        <a href="boardList.bo" style="font-family: 'Gugi'">세모게시판</a> > <a href="boardList.bo" style="font-family: 'Gugi'">웹툰 TalkTalk</a>
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
              <tr>
                  <td>
                      <h3 style="font-family: 'Gugi'">웹툰TalkTalk</h3>
                  </td>
              </tr>
              <tr style="border-bottom:1px solid rgb(163, 160, 160); margin-top: 5px;">
                  <td>
                      <h6>웹툰에 대해 자유롭게 얘기해보아요!</h6>
                  </td>
              </tr>
          </table>
         </div> 
	</div>
	
	<form id="insertForm" action="<%=contextPath%>/insertWebTalk.bo" method="post">
		<table align="center">
			<tr>
				<th>제목&nbsp;&nbsp;&nbsp;&nbsp;</th>
				<td><input type="text" name="title" style="width:500px"></td>
			</tr>
			<tr>
				<th><input type="hidden"></th>
				<td><input type="text" style="border:0px; height:1px;"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="18" name="content" style="resize:none; width:500px"></textarea>
				</td>
			</tr>
			<input type="hidden" name="writer" value="<%= loginUser.getMemberNo() %>">
		</table>
		
		<div class="btns" align="center">
			<button class="btn btn10 btn-warning" type="button" onclick="location.href='boardList.bo'">취소</button>
			<button class="btn btn10 btn-warning" type="submit">작성</button>
		</div>
		
	</form>
		
	    <!-- Bootstrap core JavaScript -->
		<script src="<%= request.getContextPath() %>/resources/js/jquery.min.js"></script>
		<script src="<%= request.getContextPath() %>/resources/js/bootstrap.bundle.min.js"></script>
		
	<!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>
</body>
</html>