<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.board.model.vo.Board" %>
<%
	Board b = (Board)request.getAttribute("b");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%= request.getContextPath()%>/resources/css/boardmain.css" rel="stylesheet">
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<div class="container">
	
	    <!-- Page Heading/Breadcrumbs -->
	    <h1 class="mt-4 mb-3">웹툰 TalkTalk
	      <!-- <small>Subheading</small> -->
	    </h1>
	
	    <ol class="breadcrumb">
	      <li class="breadcrumb-item">
	        <a href="boardList.bo">세모게시판</a> > <a href="boardList.bo">웹툰 TalkTalk</a>
	      </li>
	    </ol>
	
	    <!-- Content Row -->
	    <div class="row">
	      <!-- Sidebar Column -->
	      <div class="col-lg-3 mb-4">
	        <div class="list-group">
	          <a href="boardList.bo" class="list-group-item">웹툰 TalkTalk</a>
	          <a href="semoBoard.html" class="list-group-item">그림게시판</a>
	          <a href="talkfree.html" class="list-group-item">수다수다 유머방</a>
	        </div>
	      </div>
	    </div>
	    <!-- /.row -->
	    
	      <!-- Content Column -->
	      
	      <div class="semoTalk">
	          <table style="width: 600px;margoin-left: auto;margin-left: 25%;margin-top: -19%;">
	              <tr style="border-bottom:1px solid rgb(163, 160, 160);">
	                  <td>
	                      <h2>웹툰TalkTalk</h2>
	                  </td>
	              </tr>
	              <tr style="border:1px solid rgb(163, 160, 160); margin-top: 5px;">
	                  <td>
	                      <h6>웹툰에 대해 자유롭게 얘기해보아요!</h6>
	                  </td>
	              </tr>
	          </table>
			</div>
		</div>
	<div class="outer">
		<form id="updateForm" action="<%=contextPath %>/update.bo" method="post">
			<input type="hidden" name="boardNo" value=<%=b.getBoardNo() %>>
			<table align="center">
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" value="<%= b.getBoardTitle() %>"></td>
				</tr>
				<tr>
					<th></th>
					<td>
						<textarea rows="15" name="content" style="resize:none;"><%=b.getBoardContent()%></textarea>
					</td>
				</tr>
			</table>
			
			<div class="btns" align="center">
				<button type="submit" onclick="webUpdate();">수정하기</button>
			</div>
		</form>
			
	</div>
	
	<script>
		function webUpdate(){
			if(confirm("게시글을 수정하시겠습니까?")){
				location.href="<%=contextPath%>/update.bo";
			}
		}
	</script>
</body>
</html>