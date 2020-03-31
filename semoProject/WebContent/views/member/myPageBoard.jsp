<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.board.model.vo.Board, com.kh.board.model.vo.*" %>
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
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>My Page</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/modern-business.css" rel="stylesheet">

  <style>
    tr {text-align: center;}
    #bNum{width: 40px;}
    #date{width: 110px;}
    #title{width: 450px;}
    #count{width: 80px;}
    .listArea>tbody>tr:hover{
      cursor: pointer;
      background: skyblue;
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
      </div>
      <!-- Content Column -->
      <div class="col-lg-9 mb-4">
        <h2 align="center">내 게시글 보기</h2>
        <hr>
            <% if(list.isEmpty()) { %>
              <h1 align="center">조회된 리스트가 없습니다.</h1>
            <% } else { %>
        <table class="listArea" border="1" align="center">
          <thead>
            <tr>
              <th id="bNum"></th>
              <th id="date">날짜</th>
              <th id="title">제목</th>
              <th id="count">조회수</th>
            </tr>
          </thead>
          <tbody>
              <% for(Board b : list) { %>
                <tr>
                  <td><%= b.getListNo() %></td>
                  <td><%= b.getBoardWriteDate() %></td>
                  <td><%= b.getBoardTitle() %></td>
                  <td><%= b.getBoardCnt() %></td>
                </tr>
              <% } %>
            <% } %>
            <!-- <tr>
              <td>5</td>
              <td>2020-02-10</td>
              <td>테스트5</td>
              <td>0</td>
            </tr>
            <tr>
              <td>4</td>
              <td>2020-02-05</td>
              <td>테스트4</td>
              <td>0</td>
            </tr>
            <tr>
              <td>3</td>
              <td>2020-01-01</td>
              <td>테스트3</td>
              <td>0</td>
            </tr>
            <tr>
              <td>2</td>
              <td>2019-12-31</td>
              <td>테스트2</td>
              <td>0</td>
            </tr>
            <tr>
              <td>1</td>
              <td>2019-12-23</td>
              <td>테스트1</td>
              <td>0</td>
            </tr> -->
          </tbody>
        </table>
        <br><br>
        <!-- 페이징바 영역 -->
		<div class="pagingArea" align="center">
			<!-- 맨 처음으로 (<<) -->
			<button class="btn btn-simple" onclick="location.href='<%=contextPath%>/myBoard.me';"> &lt;&lt; </button>
			
			<!-- 이전페이지(<) -->
			<%if(currentPage == 1){ %>
			<button class="btn btn-simple" disabled> &lt; </button>
			<%}else{ %>
			<button class="btn btn-simple" onclick="location.href='<%=contextPath%>/myBoard.me?currentPage=<%=currentPage-1%>';"> &lt; </button>
			<%} %>
			
			<!-- 페이지 목록 -->
			<%for(int p=startPage; p<=endPage; p++){ %>
				
				<%if(currentPage == p){ %>
				<button class="btn btn-simple" disabled> <%=p%> </button>
				<%}else{ %>
				<button class="btn btn-simple" onclick="location.href='<%=contextPath%>/myBoard.me?currentPage=<%=p%>';"> <%= p %> </button>
				<%} %>
			
				
			<%} %>
			
			<!-- 다음페이지(>) -->
			<%if(currentPage == maxPage){ %>
			<button class="btn btn-simple" disabled> &gt; </button>
			<%}else{ %>
			<button class="btn btn-simple" onclick="location.href='<%=contextPath%>/myBoard.me?currentPage=<%=currentPage+1%>';"> &gt; </button>
			<%} %>
			
			
			<!-- 맨 마지막으로 (>>) -->
			<button class="btn btn-simple" onclick="location.href='<%=contextPath%>/myBoard.me?currentPage=<%=maxPage%>'"> &gt;&gt; </button>
		</div>
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