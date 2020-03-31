<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<!-- Sidebar Column -->
   <div class="col-lg-3 mb-4">
   
     <div class="list-group">
       <a class="list-group-item" onclick="noticeGo();" style="cursor:pointer">
       	공지사항
       	</a>
       
       <a class="list-group-item" onclick="contextGo();"style="cursor:pointer">
      	 자주 묻는 질문
       </a>
       
       <a class="list-group-item" onclick="qnaGo();" style="cursor:pointer">
       1:1 문의
       </a>
       
     </div>
   </div>
   
   <script>
   function noticeGo(){
	   location.href="<%=request.getContextPath()%>/list.no"
   }
	function contextGo(){
		location.href = "<%=request.getContextPath()%>/list.co";								
	}
	function qnaGo(){
		location.href = "<%=request.getContextPath()%>/list.qn";								
	}
   
   </script>






</body>
</html>