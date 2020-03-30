<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.bookmark.model.vo.Bookmark, com.kh.board.model.vo.*" %>
<%
	ArrayList<Bookmark> list = (ArrayList<Bookmark>)request.getAttribute("list");
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
        <a href="<%= contextPath %>">메인</a>
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
        <h2 align="center">즐겨찾기한 웹툰</h2>
        <hr>
        <div class="row" style="display:block;">
         <% if(list.isEmpty()) { %>
         	<h1 style="text-align:center;">조회된 리스트가 없습니다.</h1>
         <% } else { %>
          <% for(Bookmark b : list) { %>
            <div class="card h-100">
              <a href="<%= contextPath %>/work.wo?wNo=<%= b.getWorkNo() %>"><img src="<%= b.getThumbnailModify() %>" title="<%= b.getWorkTitle() %>" width="100%" height="71%"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="<%= contextPath %>/work.wo?wNo=<%= b.getWorkNo() %>"><%= b.getWorkTitle() %></a>
                </h4>
              </div>
            </div>
          <% } %>
         <% } %>
          <!-- <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
            <div class="card h-100">
              <a href="#"><img src="https://shared-comic.pstatic.net/thumb/webtoon/183559/thumbnail/thumbnail_IMAG06_cffe8f9f-1968-4c48-b7d5-7d40d48da340.jpg" title="신의 탑" alt="신의 탑" onerror="this.src='https://static-comic.pstatic.net/staticImages/COMICWEB/NAVER/img/common/non125_101.gif'" width="100%" height="71%"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">신의탑</a>
                </h4>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
            <div class="card h-100">
              <a href="#"><img src="https://shared-comic.pstatic.net/thumb/webtoon/739115/thumbnail/thumbnail_IMAG06_7b590828-5c9b-4b6e-879d-508c4149a636.jpg" title="앵무살수" alt="앵무살수" onerror="this.src='https://static-comic.pstatic.net/staticImages/COMICWEB/NAVER/img/common/non125_101.gif'" width="100%" height="71%"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">앵무살수</a>
                </h4>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
            <div class="card h-100">
              <a href="#"><img src="https://shared-comic.pstatic.net/thumb/webtoon/662774/thumbnail/thumbnail_IMAG06_32e93487-96da-407b-a437-ad3eab65c55d.jpg" title="고수" alt="고수" onerror="this.src='https://static-comic.pstatic.net/staticImages/COMICWEB/NAVER/img/common/non125_101.gif'" width="100%" height="71%"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">고수</a>
                </h4>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
            <div class="card h-100">
              <a href="#"><img src="https://shared-comic.pstatic.net/thumb/webtoon/20853/thumbnail/thumbnail_IMAG06_89061d8c-e491-42f1-8c15-40932e5eb939.jpg" title="마음의소리" alt="마음의소리" onerror="this.src='https://static-comic.pstatic.net/staticImages/COMICWEB/NAVER/img/common/non125_101.gif'" width="100%" height="71%"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">마음의 소리</a>
                </h4>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
            <div class="card h-100">
              <a href="#"><img src="https://shared-comic.pstatic.net/thumb/webtoon/697685/thumbnail/thumbnail_IMAG06_5ff9e83b-bdf6-4749-b33b-688183b47881.jpg" title="신과함께" alt="신과함께" onerror="this.src='https://static-comic.pstatic.net/staticImages/COMICWEB/NAVER/img/common/non125_101.gif'" width="100%" height="71%"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">신과 함께</a>
                </h4>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
            <div class="card h-100">
              <a href="#"><img src="https://shared-comic.pstatic.net/thumb/webtoon/720121/thumbnail/thumbnail_IMAG06_554b0b0a-e544-4630-ab8c-7a197f48085b.jpg" title="치즈인더트랩" alt="치즈인더트랩" onerror="this.src='https://static-comic.pstatic.net/staticImages/COMICWEB/NAVER/img/common/non125_101.gif'" width="100%" height="71%"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">치즈인더트랩</a>
                </h4>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
            <div class="card h-100">
              <a href="#"><img src="https://shared-comic.pstatic.net/thumb/webtoon/697679/thumbnail/thumbnail_IMAG06_9a844df7-d7ef-4ce9-9bcd-84254976f4b6.jpg" title="[드라마원작]쌉니다 천리마마트" alt="[드라마원작]쌉니다 천리마마트" onerror="this.src='https://static-comic.pstatic.net/staticImages/COMICWEB/NAVER/img/common/non125_101.gif'" width="100%" height="71%"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">쌉니다 천리마마트</a>
                </h4>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
            <div class="card h-100">
              <a href="#"><img src="https://shared-comic.pstatic.net/thumb/webtoon/608265/thumbnail/title_thumbnail_20140117174108_t125x101.jpg" title="질풍기획 시즌2" alt="질풍기획 시즌2" onerror="this.src='https://static-comic.pstatic.net/staticImages/COMICWEB/NAVER/img/common/non125_101.gif'" width="100%" height="71%"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">질풍기획 시즌2</a>
                </h4>
              </div>
            </div>
          </div> -->
        </div>
        <br><br>
        <!-- 페이징바 영역 -->
		<div class="pagingArea" align="center">
			<!-- 맨 처음으로 (<<) -->
			<button class="btn btn-simple" onclick="location.href='<%=contextPath%>/bookmark.me';"> &lt;&lt; </button>
			
			<!-- 이전페이지(<) -->
			<%if(currentPage == 1){ %>
			<button class="btn btn-simple" disabled> &lt; </button>
			<%}else{ %>
			<button class="btn btn-simple" onclick="location.href='<%=contextPath%>/bookmark.me?currentPage=<%=currentPage-1%>';"> &lt; </button>
			<%} %>
			
			<!-- 페이지 목록 -->
			<%for(int p=startPage; p<=endPage; p++){ %>
				
				<%if(currentPage == p){ %>
				<button class="btn btn-simple" disabled> <%=p%> </button>
				<%}else{ %>
				<button class="btn btn-simple" onclick="location.href='<%=contextPath%>/bookmark.me?currentPage=<%=p%>';"> <%= p %> </button>
				<%} %>
			
				
			<%} %>
			
			<!-- 다음페이지(>) -->
			<%if(currentPage == maxPage){ %>
			<button class="btn btn-simple" disabled> &gt; </button>
			<%}else{ %>
			<button class="btn btn-simple" onclick="location.href='<%=contextPath%>/bookmark.me?currentPage=<%=currentPage+1%>';"> &gt; </button>
			<%} %>
			
			
			<!-- 맨 마지막으로 (>>) -->
			<button class="btn btn-simple" onclick="location.href='<%=contextPath%>/bookmark.me?currentPage=<%=maxPage%>'"> &gt;&gt; </button>
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