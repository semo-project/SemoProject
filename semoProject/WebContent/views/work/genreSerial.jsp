<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.work.model.vo.PageInfo" %>
<%@page import="com.kh.work.model.vo.Work"%>    
<%
	
	ArrayList<Work> list = (ArrayList<Work>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">

 	<title>Modern Business - Start Bootstrap Template</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<!-- Bootstrap core CSS -->
	<link href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet">

	<!-- Custom styles for this template -->
	<link href="<%= request.getContextPath() %>/resources/css/modern-business.css" rel="stylesheet">
	
	<style>
  	.lzTab lzTab--hor{
     	padding-left: 8px;
     	margin-left: -16px;
     	margin-right: -16px;
     	scroll-padding-left: 16px;
     	white-space: nowrap;
     	overflow: hidden;
     	scroll-snap-type: mandatory;
    	position: sticky;
    	z-index: 6;
    	top: 0;
    	text-align: center;
    	font-size: 0;
    	line-height: 0;
    	width: 500px;
    
  	}
  	.lzTab--hor>[role = 'tab'] {
   		margin-left: 8px;
    	min-width: 48px;
    	height: 32px;
    	line-height: 32px;
    	border-radius: 16px;
    	margin: 6px 4px;
    	padding: 0 12px;
    	font-size: 12px;
    	scroll-snap-align: start;
    	display: inline-block;
    	font-weight: 400;

  	}

	</style>
</head>
<body>

   <!-- Navigation -->
  <%@ include file="../common/menubar.jsp" %>

  <!-- Page Content -->
 

   <div class="lzTab lzTab--hor" role="tablist" data-ga-event-category="연재_UI" style="text-align: center;
    padding-top: 40px; padding-bottom: 40px;">
 <div class="lzTab-hor" role="tablist" data-ga-event-category="연재_UI_종류" style="display: inline-flex;">
        <p style="padding-right: 30px;"><button  type="button" class="btn btn-secondary btn-lg" onclick="week()">요일별</button></p>
        <p style="padding-right: 30px;"><button  type="button" class="btn btn-secondary btn-lg" onclick="genre()">장르별</button></p>
       
      </div>
      <div class="lzTab" role="tablist" data-ga-event-category="연재_UI_장르">
     
        <button type="button" class="btn btn-dark" onclick="genrelist(this.value)" value="5"  >액션</button>
        <button type="button" class="btn btn-dark" onclick="genrelist(this.value)" value="3"  >판타지</button>
        <button type="button" class="btn btn-dark" onclick="genrelist(this.value)" value="2"  >개그</button>
        <button type="button" class="btn btn-dark" onclick="genrelist(this.value)" value="4"  >로맨스</button>
        <button type="button" class="btn btn-dark" onclick="genrelist(this.value)" value="6"  >미스터리</button>
        <button type="button" class="btn btn-dark" onclick="genrelist(this.value)" value="1"  >일상</button>
        <button type="button" class="btn btn-dark" onclick="genrelist(this.value)" value="7"  >기타</button>
        

      </div>
      
    </div>
    <hr>
    <div class="container">
    <p>장르별 전체 웹툰</p>
<hr>
   
        <div class="row">
       
        	<% if(list.isEmpty()){ %>
        	<div>
 					<div><p>조회된 리스트가 없습니다.</p></div>       	
        	</div>
        	<% }else{ %>
					<% for(Work w : list){ %>
					<div class="col-lg-4 col-sm-6 portfolio-item divWork" >
       					<div class="card h-100">
							<input type="hidden" class="wNo" id="wNo" value="<%=w.getWorkNo()%>">
							<div class="card h-100">
          						<a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
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
    </div>
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
 <!-- button java Script-->
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
 
 <script>
	 function genre(){
		 location.href="<%=request.getContextPath()%>/list.genre";
	 }
  </script>
	
	
	<script>
	 function week(){
		 location.href="<%=request.getContextPath()%>/list.week";
	 }
  </script>
  
   <script>
	 function genrelist(val) {
		 location.href="<%=contextPath%>/genre.fan?genre=" + val;
	 }
	</script>
	
	
	
	<script>
	$(function() {
		$(".divWork").click(function() {
			var val = $(this).children().children().eq(0).val();
			location.href="<%=contextPath%>/view.se?wno=" + val;
		});
	});
	
	</script>
	

	
</body>

</html>