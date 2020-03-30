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
	    <h1 class="mt-4 mb-3">
	      <!-- <small>Subheading</small> -->
	    </h1>
	
	    <ol class="breadcrumb">
	      <li class="breadcrumb-item">
	        <a href="freeList.bo">세모게시판</a> > <a href="freeList.bo">수다수다 유머방</a>
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
	      
	      <div class="semoTalk">
	          <table style="width: 600px;margoin-left: auto;margin-left: 25%;margin-top: -19%;">
	              <tr style="border-bottom:1px solid rgb(163, 160, 160);">
	                  <td>
	                      <h2>수다수다 유머방</h2>
	                  </td>
	              </tr>
	              <tr style="border:1px solid rgb(163, 160, 160); margin-top: 5px;">
	                  <td>
	                      <h6>재미있는 유머들이 가득한 곳!</h6>
	                  </td>
	              </tr>
	          </table>
			</div>
		</div>
	<div class="outer">
		<form id="updateForm" action="<%=contextPath %>/freeUp.bo" method="post">
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
				<button type="submit" onclick="freeUpdate();">수정하기</button>
			</div>
		</form>
			
	</div>
	
	<script>
		function freeUpdate(){
			if(confirm("게시글을 수정하시겠습니까?")){
				location.href="<%=contextPath%>/freeUp.bo";
			}
		}
	</script>
</body>
</html>