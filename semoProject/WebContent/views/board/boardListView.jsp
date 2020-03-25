<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.board.model.vo.*" %>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
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
    <h1 class="mt-4 mb-3">그림게시판
      <!-- <small>Subheading</small> -->
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="Notice_공지사항.html">세모게시판 > 웹툰 TalkTalk</a>
      </li>
    </ol>

    <!-- Content Row -->
    <div class="row">
      <!-- Sidebar Column -->
      <div class="col-lg-3 mb-4">
        <div class="list-group">
          <a href="semoBoard.html" class="list-group-item">그림게시판</a>
          <a href="boardList.bo" class="list-group-item">웹툰 TalkTalk</a>
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
          <div class="board_div2">
            <table id="board_table2" style="margin-left:13.5%;">
            <colgroup>
              <col style="width: 30%;">
              <col style="width: 15%;">
            </colgroup>
            	<thead>
		            <tr>
		              <th width="100px">글번호</th>
		              <th width="300px">글제목</th>
		              <th width="100px">조회수</th>
		              <th width="150px">작성자</th>
		              <th width="150px">작성일</th>
		            </tr>
            	</thead>
            	<tbody>
            		<% if(list.isEmpty()){ %>
            		<tr>
            			<td colspan="5">조회된 게시물이 없습니다.</td>
            		</tr>
            		<% }else{ %>
            			<% for(Board b : list){ %>
            			<tr>
            				<td><%= b.getBoardNo() %></td>
            				<td><%= b.getBoardTitle() %></td>
            				<td><%= b.getBoardCnt() %></td>
            				<td><%= b.getBoardWriter() %></td>
            				<td><%= b.getBoardWriteDate() %></td>
            			</tr>
            			<% } %>
            		<% } %>
            	</tbody>
            </table>
        	<% if(loginUser != null) { %>
        		<button class="write_btn" onclick="location.href='<%=contextPath%>/insertForm.bo';">작성하기</button>
        	<% } %>
        	
        	<!-- 페이징바 영역 -->
		    <div class="pagingArea" align="center">
		    	  <!-- 맨 처음 -->
		    	  <button onclick="location.href='<%=contextPath%>/boardList.bo';"> &lt;&lt; </button>
		    	  
		    	  <!-- 이전page -->
		    	  <%if(currentPage == 1){ %>
		    	  		<button disable> &lt; </button>
		    	  <%}else{ %>
		    	  		<button onclick="location.href='<%=contextPath %>/boardList.bo?currentPage=<%=currentPage-1%>';"> &lt; </button>
		    	  <% } %>
		    	  
		    	  <!-- 페이지목록 -->
		    	  <%for(int p=startPage; p<=endPage; p++){ %>
		    	  		<%if(currentPage == p){%>
		    	  			<button disabled> <%=p %></button>
		    	  		<%}else{ %>
		    	  			<button onclick="location.href='<%=contextPath%>/boardList.bo?currentPage=<%=p %>';"> <%=p %></button>
		    	  		<%} %>
		    	  <%} %>
		    	  
		    	  <!-- 다음page -->
		    	  <%if(currentPage == maxPage){ %>
		    	  		<button disabled> &gt; </button>
		    	  <%}else{ %>
		    	  		<button onclick="location.href='<%=contextPath%>/boardList.bo?currentPage=<%=currentPage+1%>';"> &gt; </button>
		    	  <%} %>
		    	  
		    	  <!-- 맨 마지막으로 -->
		    	  <button onclick="location.href='<%=contextPath%>/boardList.bo?currentPage=<%=maxPage%>';"> &gt;&gt; </button>		
		    </div>
        	
          </div>
      </div>
      
    </div>
</div>
<!-- /.container -->
	<script>
		$(function(){
			$(".board_table2>tbody>tr").click(function(){
				
				var boardNo = $(this).children().eq(0).text();
				
				location.href="<%=contextPath%>/detail.bo?boardNo=" + boardNo;
			});
		});
	</script>

</body>
</html>