<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member" %>
<% Member mem = (Member)request.getAttribute("mem"); %>
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

	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

  <style>
    table th{
      text-align: center;
      width: 100px;
    }
    table td{
      width: 150px;
      text-align: center;
    }
    #purchase{
      width: 500px;
      height: 800px;
      font-size: 24px;
    }
    #purchase tr td:first-child{
      text-align: left;
    }
    #purchase tr td:nth-of-type(2){
      text-align: right;
    }
    #purchase tr td:last-child{
      box-sizing: border-box;
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
        <h2 align="center">쿠키 충전</h2>
        <hr>
          <table border="1" align="center">
	        <tr>
	          <td colspan="4" rowspan="4" width="200" height="200" align="center"><img src="<%= contextPath %>/resources/images/defaultIcon.png" alt="프로필사진"></td>
	          <th rowspan="2">이름/아이디</th>
	          <td rowspan="2"><%= mem.getMemberName() %>/<%= mem.getMemberId() %></td>
	        </tr>
	        <tr>
	        </tr>
	        <tr>
	          <th rowspan="2">현재 보유 쿠키</th>
	          <td rowspan="2"><%= mem.getMyCookieCount() %>개</td>
	        </tr>
	        <tr>
	        </tr>
	      </table>

        <hr>
		<form action="" method="POST">
           <div>
            <input type="radio" name="price" value="900" checked>10개 / 900원
          </div>
          <div>
            <input type="radio" name="price" value="1800">20개 / 1,800원
          </div>
          <div>
            <input type="radio" name="price" value="2700">30개 / 2,700원
          </div>
          <div>
            <input type="radio" name="price" value="4900">50개 / 4,900원
          </div>
          <div>
            <input type="radio" name="price" value="9000">100개 / 9,000원
          </div>
          <button type="button">결제요청</button> 
		</form>
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
  <script>
    $(function(){
    	$("form").on("click", "button", function(){
		  var IMP = window.IMP;
		  var amt = $('input[name="price"]:checked').val();
		  var payName = amt/90;
		  IMP.init('imp11743566');
		  IMP.request_pay({
		      pg : 'html5_inicis',
		      pay_method : 'vbank',
		      merchant_uid : 'merchant_' + new Date().getTime(),
		      name : '쿠키 ' + payName + '개',
		      amount : amt,
		      buyer_email : '<%= mem.getEmail() %>',
		      buyer_name : '<%= mem.getMemberName() %>',
		      buyer_tel : '<%= mem.getPhone() %>',
		      buyer_addr : '<%= mem.getMemberAddress() %>',
		  }, function(rsp) {
		      if ( rsp.success ) {
		          var msg = '결제가 완료되었습니다.';
		          msg += '고유ID : ' + rsp.imp_uid;
		          msg += '상점 거래ID : ' + rsp.merchant_uid;
		          msg += '결제 금액 : ' + rsp.paid_amount;
		          msg += '카드 승인번호 : ' + rsp.apply_num;
		      } else {
		          var msg = '결제에 실패하였습니다.';
		          msg += '에러내용 : ' + rsp.error_msg;
		      }
		
		      alert(msg);
		  });
    		
    	});
    });
  </script>
</body>

</html>