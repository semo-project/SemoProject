<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member,java.util.ArrayList, com.kh.cookie.model.vo.Cookie, com.kh.board.model.vo.*" %>
<% 
	Member mem = (Member)request.getAttribute("mem");
	ArrayList<Cookie> list = (ArrayList<Cookie>)request.getAttribute("list");
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
  <link href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="<%= request.getContextPath() %>/resources/css/modern-business.css" rel="stylesheet">

  <style>
    table th, table td{
      text-align: center;
      width: 150px;
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
      </div>
      <!-- Content Column -->
      <div class="col-lg-9 mb-4">
        <h2 align="center">쿠키 충전 내역</h2>
        <hr>
        <table border="1" align="center">
          <tr>
            <th id="number">순번</th>
            <th>날짜</th>
            <th>결제수단/개수</th>
            <th>금액</th>
          </tr>
          <% if(list.isEmpty()) { %>
          	<tr>
            <td colspan="4"><h1>조회된 리스트가 없습니다.</h1></td>
            </tr>
          <% } else { %>
          	<% for(Cookie c : list) {%>
          		<tr>
          			<td><%= c.getListNo() %></td>
          			<td><%= c.getChargedDate() %></td>
          			<td><%= c.getPaymentMethod() %>/<%= c.getChargedCookies() %></td>
          			<td><%= c.getPaymentAmount() %></td>
          		</tr>
          	<% } %>
          <% } %>
          <!-- <tr>
            <td>5</td>
            <td>2020-02-10</td>
            <td>무통장입금/100개</td>
            <td>9,000원</td>
          </tr>
          <tr>
            <td>4</td>
            <td>2020-02-05</td>
            <td>신용카드/50개</td>
            <td>4,500원</td>
          </tr>
          <tr>
            <td>3</td>
            <td>2020-01-01</td>
            <td>카카오페이/30개</td>
            <td>2,700원</td>
          </tr>
          <tr>
            <td>2</td>
            <td>2019-12-31</td>
            <td>카카오페이/30개</td>
            <td>2,700원</td>
          </tr>
          <tr>
            <td>1</td>
            <td>2019-12-23</td>
            <td>무통장입금/10개</td>
            <td>900원</td>
          </tr> -->
        </table>
        <br><br>
      <!-- 페이징바 영역 -->
		<div class="pagingArea" align="center">
			<!-- 맨 처음으로 (<<) -->
			<button onclick="location.href='<%=contextPath%>/list.bo';"> &lt;&lt; </button>
			
			<!-- 이전페이지(<) -->
			<%if(currentPage == 1){ %>
			<button disabled> &lt; </button>
			<%}else{ %>
			<button onclick="location.href='<%=contextPath%>/list.bo?currentPage=<%=currentPage-1%>';"> &lt; </button>
			<%} %>
			
			<!-- 페이지 목록 -->
			<%for(int p=startPage; p<=endPage; p++){ %>
				
				<%if(currentPage == p){ %>
				<button disabled> <%=p%> </button>
				<%}else{ %>
				<button onclick="location.href='<%=contextPath%>/list.bo?currentPage=<%=p%>';"> <%= p %> </button>
				<%} %>
			
				
			<%} %>
			
			<!-- 다음페이지(>) -->
			<%if(currentPage == maxPage){ %>
			<button disabled> &gt; </button>
			<%}else{ %>
			<button onclick="location.href='<%=contextPath%>/list.bo?currentPage=<%=currentPage+1%>';"> &gt; </button>
			<%} %>
			
			
			<!-- 맨 마지막으로 (>>) -->
			<button onclick="location.href='<%=contextPath%>/list.bo?currentPage=<%=maxPage%>'"> &gt;&gt; </button>
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