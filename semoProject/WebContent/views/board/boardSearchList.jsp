<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.board.model.vo.*" %>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	
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
	#board_table2>tbody>tr:hover{
		cursor:pointer;
		text-align:center;
	}
	.searchFormArea{
		margin-top:3%;
	}
	.pagingArea{
		margin-top:2%;
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
		              <th width="150px">작성자</th>
		              <th width="150px">작성일</th>
		            </tr>
            	</thead>
            	<tbody>
            		<% if(list.isEmpty()){ %>
            		<tr>
            			<td colspan="4">조회된 게시물이 없습니다.</td>
            		</tr>
            		<% }else{ %>
            			<% for(Board b : list){ %>
            			<tr>
            				<td><%= b.getBoardNo() %></td>
            				<td><%= b.getBoardTitle() %></td>
            				<td><%= b.getBoardWriter() %></td>
            				<td><%= b.getBoardWriteDate() %></td>
            			</tr>
            			<% } %>
            		<% } %>
            	</tbody>
            </table>
            
            
            <form class="searchFormArea" align="center" method="post" action="<%= request.getContextPath()%>/searchBoardT.bo">
            	<td>
            		<select id="searchOption1" name="searchOption1">
            			<option value="boardTitle">제목</option>
            			<option value="boardWriter">작성자명</option>
            			<option value="boardContent">내용</option>
            		</select>
            	</td>
            	<td>
            		<input type="text" id="searchContent" name="searchContent">
            	</td>
            	<td>
            		<button type="submit" id="searchBtn1">검색</button>
            	</td>
            </form>
            
          </div>
      </div>
      
    </div>
</div>

<!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>
  
<!-- /.container -->
<!-- Bootstrap core JavaScript -->
  <script src="<%= request.getContextPath() %>/resources/js/jquery.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/js/bootstrap.bundle.min.js"></script>

	<script>
		$(function(){
			$("#board_table2>tbody>tr").click(function(){
				
				var boardNo = $(this).children().eq(0).text();
				
				location.href="<%=contextPath%>/webdetail.bo?boardNo=" + boardNo;
			});
		});
	</script>
	
	

</body>
</html>