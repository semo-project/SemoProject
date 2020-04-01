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
        <h2 align="center">작가 등록 신청</h2>
        <hr>
        <div class="outer">
          <form action="author.me" method="POST" enctype="multipart/form-data">
            <input type="hidden" value="<%= loginUser.getMemberNo() %>" name="writer">
            <table>
              <tr>
                <td colspan="3">
                  <textarea name="introduce" id="introduce" cols="100" rows="24" style="resize: none; width: 100%;" placeholder="작가 등록 신청을 하실 당신을 환영합니다!&#13;&#10;저희 세모툰은 무분별하게 대충 그릴 예정인 이용자들을 먼저 배제하기 위해,&#13;&#10;작가님께서 그리신 만화를 먼저 올려주시면 관리자가 검토 후 세모툰의 작가로 임명해드릴 예정입니다.&#13;&#10;작가님께서 여기에 올리신 만화는 다른 용도로 이용하지 않으며, 자료는 최대 5일 후 삭제됩니다."></textarea>
                </td>
              </tr>
              <tr>
                <td>
                  <input id="file" name="file" type="file">
                </td>
                <td>
                  <select name="bank" id="bank">
                    <option value="국민">국민은행</option>
                    <option value="신한">신한은행</option>
                    <option value="기업">기업은행</option>
                    <option value="하나">하나은행</option>
                    <option value="카카오">카카오뱅크</option>
                    <option value="우체국">우체국</option>
                    <option value="농협">농협</option>
                    <option value="신협">신협</option>
                  </select>
                </td>
                <td>
                  <input id="bNum" name="bNum" type="text" placeholder="계좌번호('-' 제외하고 입력)" style="width:200px;">
                </td>
              </tr>
            </table>
            <br>
            <button class="btn btn-primary" type="submit" align="center">제출하기</button>
          </form>
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