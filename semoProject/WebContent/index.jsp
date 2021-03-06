<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.work.model.service.WorkService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.kh.work.model.vo.Work"%>
    
<%
   	 ArrayList<Work> list = new WorkService().selectList();

	//활중 된 아이디가 로그인을 시도했을 때 생성하는 메시지 받아오기
	String accusMsg = (String)session.getAttribute("accusMsg");

%>
<!DOCTYPE html>
<html lang="en">

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>세모 웹툰</title>

  <!-- Bootstrap core CSS -->
  <link href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="<%= request.getContextPath() %>/resources/css/modern-business.css" rel="stylesheet">

</head>

<body>

  <!-- Navigation -->
	<%@ include file="../views/common/menubar.jsp" %>

  <header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" style="background-image: url('resources/images/main/main1.png')">
          <div class="carousel-caption d-none d-md-block">
            <h3></h3>
            <p></p>
          </div>
        </div>
        <!-- Slide Two - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('resources/images/main/main2.png')">
          <div class="carousel-caption d-none d-md-block">
            <h3></h3>
            <p></p>
          </div>
        </div>
        <!-- Slide Three - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('resources/images/main/main3.png')">
          <div class="carousel-caption d-none d-md-block">
            <h3></h3>
            <p></p>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </header>

  <!-- Page Content -->
  <div class="container">

    <h1 class="my-4">전체 웹툰</h1>

    <!-- Marketing Icons Section -->
     <div class="row">
       
        	<% if(list.isEmpty()){ %>
        	<div>
 					<div><p>조회된 리스트가 없습니다.</p></div>       	
        	</div>
        	<% }else{ %>
					<% for(Work w : list){ %>
				<div class="col-lg-4 col-sm-6 portfolio-item divWork">
       					<div class="card h-100">
							<input type="hidden" class="wNo" id="wNo" value="<%=w.getWorkNo()%>">
							<div class="card h-100">
          						<a href="#"><img class="card-img-top" src="<%= contextPath %>/resources/work_upfiles/<%= w.getThumbnailModify() %>" alt=""></a>
          					<div class="card-body">
								<h4>
									<a href="#"><%= w.getWorkTitle() %></a>
								</h4>
							<p>											
							<%= w.getApprovalDate() %><br>
							조회수 : <%= w.getSerialCnt() %>
							
							</p>
					</div>
				 </div>
     		 </div>
     	</div>
						<% } %>
				<% } %>
      
        </div>
   

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
      <br>
      <p class="m-0 text-center text-white"><a class="m-0 text-center text-white" href="<%=request.getContextPath() %>/list.no" >고객지원/공지사항</a></p>     
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="<%= request.getContextPath() %>/resources/js/jquery.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/js/bootstrap.bundle.min.js"></script>
	<script>
	$(function() {
		$(".divWork").click(function() {
			var val = $(this).children().children().eq(0).val();
			location.href="<%=contextPath%>/view.se?wno=" + val;
		});
		
		// 활중 메시지 받아오기
		var msg = "<%=accusMsg%>";
		
		// 만약 활중메시지가 null이 아니면 알람창으로 띄우고 세션에 있는 거 지워주고 메시지도 null로
		if(msg != "null") {
			alert(msg);
			<% session.removeAttribute("accusMsg");%>
			<% accusMsg = null; %>
			msg = "null";
		}
	});
	
	</script>

</body>

</html>
