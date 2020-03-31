<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    #hong th{
      text-align: center;
      width: 150px;
    }
    #hong td{
      width: 300px;
      text-align: center;
    }
    button{
      border-radius: 5px;
    }
    .modal{
      display: none;
      position: fixed;
      z-index: 1;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgb(0, 0, 0);
      background-color: rgba(0, 0, 0, 0.4);
    }
    .modal-content{
      background-color: #fefefe;
      margin: 15% auto;
      padding: 20px;
      border: 1px solid #888;
      width: 50%;
      max-width: fit-content;
    }
    #close:hover, #close:focus{
      color: black;
      text-decoration: none;
      cursor: pointer;
    }
    tr>td{
      text-align: right;
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
        <h2 align="center">내 정보 수정</h2>
        <hr>
        <form action="updateInfo.me" method="POST">
          <table id="hong" border="1" align="center">
          <input type="hidden" value="<%= loginUser.getMemberId() %>" name="userId" >
            <tr>
              <td colspan="3" width="300" height="300" rowspan="7" align="center"><img id="profileImg" width="300" height="300" src="<%=contextPath%>/resources/images/defaultIcon.png"alt="프로필사진""></td>
              <th>이름</th>
              <td><%= loginUser.getMemberName() %></td>
            </tr>
            <tr>
              <th>닉네임</th>
              <td><input type="text" name="nickname" value="<%= loginUser.getMemberNickname() %>"></td>
            </tr>
            <tr>
              <th>성별</th>
              <td>
              	<% if (loginUser.getGender().equals("M")) { %>
            		남자
            	<% } else { %>
            		여자
            	<% } %>
              </td>
            </tr>
            <tr>
              <th>전화번호</th>
              <td><input type="tel" name="phone" value="<%= loginUser.getPhone() %>"></td>
            </tr>
            <tr>
              <th>이메일</th>
              <td><input type="email" name="email" value="<%= loginUser.getEmail() %>"></td>
            </tr>
            <tr>
              <th>주소</th>
              <td><input type="text" name="address" value="<%= loginUser.getMemberAddress() %>"></td>
            </tr>
          </table>
          <div id="fileArea">
          	<!-- <input id="file1" name="file1" type="file" onchange="loadImg(this, 1);"></input> -->
          </div>
          <br>
          <div class="btns" align="center">
            <button type="reset" class="btn btn-simple">취소하기</button>
            <button id="modal" type="button" class="btn btn-simple" onclick="">비밀번호 변경</button>
            <button type="submit" class="btn btn-primary">적용하기</button>
          </div>
		  <!-- <script>
			 $(function(){
				$("#fileArea").hide(); 
				
				$("#profileImg").click(function(){
					$("#file1").click();
				});
			 });
			 
			 function loadImg(inputFile, num){
				 var reader = new FileReader();
				 
				 reader.readAsDataURL(inputFile.files[0]);
				 reader.onload = function(e){
					 switch(num){
					 case 1:
						 $("#profileImg").attr("src", e.target.result);
						 break;
					 }
				 }
			 } 
		  </script> -->
        </form>
      </div>
      
    </div>
      <div id="myModal" class="modal">
      	<form action="updatePwd.me" method="POST">
      	  <input type="hidden" value="<%= loginUser.getMemberId() %>">
          <div class="modal-content" style="display:block;">
          <h2 style="text-align:center;">비밀번호 변경</h2>
          <table>
          	<tr>
          	  <td>현재 비밀번호 : </td>
          	  <td><input type="password" style="width:220px;" name="userPwd"></td>
          	</tr>
          	<tr>
          	  <td>변경할 비밀번호 : </td>
          	  <td><input type="password" style="width:220px;" name="newPwd" placeholder="영어, 특수문자 포함 10자 이상" min="10"></td>
          	</tr>
          	<tr>
          	  <td>비밀번호 확인 : </td>
          	  <td><input type="password" style="width:220px;" name="checkPwd"></td>
          	</tr>
          </table>
          <br>
	      <button type="button" id="close" class="btn btn-simple">취소하기</button>
	      <button type="submit" class="btn btn-primary" onclick="return pwdValidate();">변경하기</button>
          </div>
      	</form>
      </div>
    
    <script>    
    var modal = document.getElementById("myModal");
    var btn = document.getElementById("modal");
    var span = document.getElementById("close");
    btn.onclick = function() {
      modal.style.display = "block";
    };

    span.onclick = function() {
      modal.style.display = "none";
    };

    window.onclick = function(event) {
      if (event.target == modal){
        modal.style.display = "none";
      }
    };
    </script>
    <script>
    function pwdValidate(){
    	
    	var userPwd = $("input[name='userPwd']");
    	var newPwd = $("input[name='newPwd']");
    	var checkPwd = $("input[name='checkPwd']");
    	if(userPwd.val().trim() == "" || newPwd.val().trim() == "" || checkPwd.val().trim() == ""){
           alert("모든 비밀번호를 입력해주세요");
           return false;
        }
    	
    	if(!check(/^[a-z\d!@#$%^&*]{10,}$/i, newPwd.val(), "유효한 비밀번호를 입력해주세요.")){
            return false;
        }
    	
        return true;
        
    }
    
    </script>
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