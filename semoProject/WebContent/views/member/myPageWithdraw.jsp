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
    }
    .close{
      color: #aaa;
      float: right;
      font-size: 28px;
      font-weight: bold;
    }
    .close:hover, .close:focus{
      color: black;
      text-decoration: none;
      cursor: pointer;
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
        <h2 align="center">회원 탈퇴</h2>
        <hr>
        <div class="outer">
          <h2>탈퇴 안내</h2>
          <p>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>
          <br>
          <p>1. 사용하고 계신 아이디(아이디)는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</p>
          <br>
          <p>2. 탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</p>
          <br>
          <p>3. 탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</p>
          <br>
          <p>탈퇴 후에는 아이디 (아이디)로 다시 가입할 수 없으며 아이디와 데이터, 쿠키는 복구할 수 없습니다.
            게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.</p>
          <br><br>
          <label><input type="checkbox"> 안내 사항을 모두 확인하였으며, 이에 동의합니다.</label>
          <br><br><br>

          
        </div>
        <button align="center" id="modal" class="btn btn-primary" onclick="withdraw();" disabled>탈퇴하기</button>
        <div id="myModal" class="modal">
      
          <div class="modal-content">
            <span class="close">&times;</span>
            <p>회원 탈퇴가 완료되었습니다.</p>
          </div>
      
        </div>
      </div>
    </div>
    <!-- /.row -->
    
  </div>
  <!-- /.container -->
  <script>
	  $(function(){
	      $("input:checkbox").change(function(){
	        console.log($(this).prop("checked"));
	        if($(this).prop("checked")){
	          $("#modal").removeAttr("disabled");
	        } else {
	          $("#modal").attr("disabled", "true");
	        }
	      });
	    });
  
  	  function withdraw(){

			var modal = document.getElementById("myModal");
				var btn = document.getElementById("modal");
				var span = document.getElementsByClassName("close")[0];
				var pwd = prompt("비밀번호를 입력해주세요");
				if (pwd == "<%= loginUser.getMemberPwd() %>") {
					var bool = confirm("정말로 탈퇴하시겠습니까?");
					if (bool) {
						location.href="<%= contextPath %>/delete.me";
					} else {
						alert("회원탈퇴를 취소했습니다.");
					}
					
				} else {
					alert("비밀번호가 일치하지 않습니다.");
				}

			}
		</script>
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