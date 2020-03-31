<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.kh.notice.model.vo.Notice" %>    

<% 
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	int idx = 0;
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css//bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/notice_style.css" rel="stylesheet" type="text/css"/>
</head>
<body>


<!-- Navigation -->
<%@ include file="../common/menubar.jsp" %>

<!-- Page Content -->
<div class="container">

  <!-- Page Heading/Breadcrumbs -->
  <h1 class="mt-4 mb-3">공지사항 </h1>

  <ol class="breadcrumb" style="background:lightseagreen">
    <li class="breadcrumb-item" style="font-family: 'Gugi'; color:white">
      <a href="#">공지시항/고객지원</a>
    </li>
  </ol>

  <!-- Content Row -->
  <div class="row">
    <!-- Sidebar Column -->
	<%@ include file ="common/noticeSideNav.jsp" %>
    <!-- Content Column -->
    

	<% if(list.isEmpty()){ %>
	
	<div style="height:215px; width:700px">
		<h3>존재하는 공지사항이 없습니다.</h3>
	</div>
	<% }else { %>
	
		<% for(Notice n : list){ %>
		<div class="mb-4" id="accordion" role="tablist" aria-multiselectable="true">
			<div class="card">
				<div class="card-header" role="tab" id="headingTwo">
				  <h5 class="mb-0">
				  <div>
					<div>
				      	<a class="collapsed" data-toggle="collapse" data-target="#collapse<%=idx %>" aria-expanded="false" aria-controls="collapseTwo" style="cursor:pointer">
				      		<%= n.getNoticeTitle() %>
				     	</a>
				     	
				     	<small><%= n.getNoticeDate() %></small>
					</div>
				    </div>
				  </h5>
				</div>
			
					<div id="collapse<%=idx %>" class="collapse" role="tabpanel" aria-labelledby="headingTwo">
						  <div class="card-body">
						  	<%=n.getNoticeContent() %>
						  </div>
					</div>
				</div>
					<% idx++; } %>
				<% } %>
		  	</div>
		</div><!-- /Content Row -->
	</div><!-- /Page Content -->
	</div>
</div>

</div>



</div>
<!-- /.container -->
</div>


<br><br><br><br><br><br>
<!-- Footer -->
<footer class="py-5 bg-dark">
  <div class="container">
    <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
  </div>
  <!-- /.container -->
</footer>

<!-- Bootstrap core JavaScript -->
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/bootstrap.bundle.min.js"></script>

</body>
</html>