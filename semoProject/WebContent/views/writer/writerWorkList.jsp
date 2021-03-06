<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member" %>
<%@ page import =" java.util.ArrayList, com.kh.work.model.vo.Work, java.text.SimpleDateFormat, java.util.Date, com.kh.member.model.vo.Member" %> 


<% 
	Member mem = (Member)request.getAttribute("mem"); 
	ArrayList<Work> list = (ArrayList<Work>)request.getAttribute("list");
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sdf.format(date); // "2020-02-25"
%>            
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
 <link href="resources/css/work_style.css" rel="stylesheet" type="text/css"/> 
</head>
<body>





<!-- Navigation -->
	<%@ include file="../common/menubar.jsp" %>

<!-- Page Content -->
<div class="container">
<br><br>
  

  <!-- Page Heading/Breadcrumbs -->

  <h1 class="mt-4 mb-3">내 작품관리

    <!-- <small>Subheading</small> -->
  </h1>
  

  

  <ol class="breadcrumb" style="background:lightseagreen">
    <li class="breadcrumb-item">
      <a href="index.html" style="font-family: 'Gugi'; color:white">내 작품관리</a>
    </li>
    <li class="breadcrumb-item active"style="font-family: 'Gugi'; color:white">작품 리스트</li>
  </ol>
  
  
  <a href="#" class="btn btn-primary" id="tr1">작품등록 신청 </a><br><br>
     <!-- Content Row -->
  <div class="row">
    
    <!-- Sidebar Column -->
      <div class="col-lg-3 mb-4">
        <%@ include file="../member/myPageSidebar.jsp" %>
      </div>



 <!-- 작품리스트 -->
<div class="col-lg-9 mb-4">
         <% if(list.isEmpty()) { %>
         	<br>
          	<h1 align="center"> 등록된 작품이 없습니다.</h1>
         	<% } else { %>
	<div class="row">
	
  
			<% for(Work w : list) { %>
		<input type="hidden" value="<%= w.getWriterNo() %>">
		
		<div class="col-md-7">
			<br>
	    	<img style="width: 450px;height: 200px;border-top-width: 19px;" src="<%=request.getContextPath()%>/resources/work_upfiles/<%= w.getThumbnailModify() %>">	
	    	<br>	
		</div>
		

		
		
		<div class="col-md-5">
		<br><br>
  			<h3><%=w.getWorkTitle() %></h3>
			<p><%=w.getWorkSummary() %></p>


			</a>
  		</div>
		<% } %>
	<% } %>
	</div>    
	
	<br>
</div>
<script>
   $(function() {
      $(".divEpisode").click(function() {
         var val = $(this).children().eq(0).val();

         console.log(val);
         location.href="<%=request.getContextPath() %>/list.ep?wNo=" + val;
         
      });
   });
   
   </script>


<!-- M -->
<form class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
 action="<%= request.getContextPath()%>/insert.wr" method="POST" enctype="Multipart/form-data">
<input type="hidden" value="<%= loginUser.getMemberNo() %>" name = "writerNo">
  <div class="modal-dialog" role="document">
      <div class="modal-content">
          <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">작품 등록 신청</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
              </button>
          </div>
          <div class="modal-body" >
              <table class="table">
                  <tr>
                    <td>
                     <div>등록 작품명:
                     <input type="text" name="title">
                     </div>
                    </td>
                  </tr>
                  
                  <tr>
                  	<td>
                  		<div>작품 시작일 : 
                  		<input type="date" name="startday" value="2020-04-01"></div>
                  		<div name ="requestday" value="<%=today%>">
                  		
                  		</div>
                  	</td>
                  </tr>
                  <tr>
                    <td>
                      <div>연재 요일
                        <br>
                        <input type="checkbox" name="updateday" value="월">월
                        <input type="checkbox" name="updateday" value="화">화
                        <input type="checkbox" name="updateday" value="수">수
                        <input type="checkbox" name="updateday" value="목">목
                        <input type="checkbox" name="updateday" value="금">금
                        <input type="checkbox" name="updateday" value="토">토
                        <input type="checkbox" name="updateday" value="일">일
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div>장르: 
                        <br>
                        <input type="checkbox" name="genre" value="1">일상
                        <input type="checkbox" name="genre" value="2">개그
                        <input type="checkbox" name="genre" value="3">판타지
                        <input type="checkbox" name="genre" value="7">기타 <br>
                        <input type="checkbox" name="genre" value="4">로맨스
                        <input type="checkbox" name="genre" value="5">액션
                        <input type="checkbox" name="genre" value="6">미스터리
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div>작품요약:<br>                   
                        <textarea type="text" name="plot" cols="59" rows="5" style="resize:none;"> </textarea>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div>줄거리:
                        <!-- <input type="text" height="150px" name="summary"> -->
                        <textarea type="text" name="summary" cols="59" rows="8" style="resize:none;"> </textarea>
                      </div>
                    </td>
                  </tr>

                  <tr>
                    <td>
                      <div>이미지: 
                        <div style="width: 450px;height: 200px;border-top-width: 19px;">
                        	<input type='file' id="imgInput" name = "file1">
                        	<img id="image_section" style="height: 150px;">

                        	</div>
                      	</div>                  
                    </td>
                  </tr>
                                    
              </table>                        
          </div>
          <div class="modal-footer">
              <button type="submit" class="btn btn-secondary"  id="btnWrite" >작품신청하기</button>
             
              <!-- DB값 수정으로 보류  -->                        
          </div>
      </div>
  </div>
</form>
  <script src="<%= request.getContextPath() %>/resources/js/jquery.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/js/bootstrap.bundle.min.js"></script>


<script>
  $(function() {
      $("#tr1").click(function(){
          $("#exampleModal").modal("show");
      });
  });


<%--    function episodeGo(){
		location.href="<%=request.getContextPath()%>/list.ep"								
	};
	   --%>
	
   


</script>

</div>



<!-- Footer -->
<footer class="py-5 bg-dark">
  <div class="container">
    <p class="m-0 text-center text-white" > Copyright &copy; Your Website 2019</p>
  </div>
</footer>




<script>
function readURL(input) {
	 if (input.files && input.files[0]) {
	  var reader = new FileReader();
	  
	  reader.onload = function (e) {
	   $('#image_section').attr('src', e.target.result);  
	  }
	  
	  reader.readAsDataURL(input.files[0]);
	  }
	}
	  
	$("#imgInput").change(function(){
	   readURL(this);
	});
	


</script>
</body>
</html>


