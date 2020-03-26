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
  <link rel="stylesheet" href="../css/group.css" type="text/css">
  

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
  <script language="javascript" type="text/javascript" src="https://stdpay.inicis.com/stdjs/INIStdPay.js" charset="UTF-8"></script>
  <script type="text/javascript">
    function getSignature(){
        /*
         url은 INIpayStdMakeSignature.jsp경로에 맞게 수정해준다.
         */
        $.ajax({
            url:"https://www.inicis.com/Support_new/stdpay/libs/INIpayStdMakeSignature.php"
            , data : $("#SendPayForm_id").serialize()
            , type :"POST"
            , dataType:"json"
            , contentType:"application/x-www-form-urlencoded;charset=UTF-8"
            , success:function(data, textStatus, jqXHR ) {
                jQuery("[name=signature]").val(data['signature']);
                INIStdPay.pay('SendPayForm_id');
            }
            , error:function(jqXHR,status,errorThrown ){
                //시크쳐 생성 통신 실패에 대한 에러 처리
                alert(errorThrown);
            }
            , complete:function(jqXHR,status){
            }
        });
    }
  
    function pay() {
        INIStdPay.pay('SendPayForm_id');
    }
  </script>
  
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

        <form id="SendPayForm_id" name="" method="POST" >
        <table id="purchase" align="center">
            <tr style='display:none;'>
		      <th class="td01">지불방법</th>
			  <td class="td02"> 
			    <select name=gopaymethod >
			      <option value="">[ 결제방법 선택 ]
				  <option value="Card">신용카드 결제
			  	  <option value="DirectBank">실시간 은행계좌이체 
			      <option value="VBank">무통장 입금 
				  <option value="HPP">핸드폰 결제
				  <option value="PhoneBill">받는전화결제 
			   	  <option value="OCBPoint">OK 캐쉬백포인트 결제
				  <option value="Culture">문화상품권 결제
				  <option value="TeenCash">틴캐시 결제
				  <option value="DGCL">스마트문화 상품권 결제
				  <option value="BCSH">도서문화 상품권 결제	
				  <option value="YPAY">옐로페이 결제
				  <option value="KPAY">케이페이 결제
				  <option value="EasyPay">간편 결제
				  <option value="EWallet">전자지갑 결제
				  <option value="POINT">포인트 결제
			      <option value="GiftCard">상품권 결제									
			    </select>
		      </td>
		    </tr>
          <tr>
          	<div>
              <input type="radio" name="price" value="900">10개 / 900원
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
          </tr>
        </table>
        <button type="submit" onclick="getSignature()">결제요청</button> 
        <input type="hidden" name="goodname" value="쿠키">
        <input type="hidden" name="buyername" value="<%= mem.getMemberName() %>">
        <input type="hidden" name=buyertel" value="<%= mem.getPhone() %>">
        <input type="hidden" name="buyeremail" value="<%= mem.getEmail() %>">
        <input type="hidden" name="acceptmethod" value="CARDPOINT:HPP(2):va_receipt:below1000:SKIN():KWPY_TYPE(0):KWPY_VAT(0):">
        <input type="hidden" name="nointerest" value="" >
        <input type="hidden" name="quotabase" value="2:3:4:5:6:7:8:9:10:11:12" >
        <input type="hidden" name="languageView" value="ko" >
        <input type="hidden" name="version" value="1.0" >
		<input type="hidden" name="mid" value="INIpayTest">
		<input type="hidden" name="oid" value="INIpayTest_1585016023790" >
		<input type="hidden" name="currency" value="WON" >
        <input type="hidden" name="timestamp" value="1585016023790" >
        <input type="hidden" name="signature" value="" >
        <input type="hidden" name="returnUrl" value="https://www.inicis.com/Support_new/stdpay/INIStdPaySample/INIStdPayReturn.php" >
        <input type="hidden" name="mKey" value="3a9503069192f207491d4b19bd743fc249a761ed94246c8c42fed06c3cd15a33" >
        <!--<input type="hidden" name="gopaymethod" value="" >-->
        <input type="hidden" name="offerPeriod" value="2016010120160331" >
        <input type="hidden" name="charset" value="UTF-8" >
        <input type="hidden" name="closeUrl" value="https://www.inicis.com/Support_new/stdpay/INIStdPaySample/close.php" >
        <input type="hidden" name="popupUrl" value="https://www.inicis.com/Support_new/stdpay/INIStdPaySample/popup.php" >
        <input type="hidden" name="vbankRegNo" value="" >
        <input type="hidden" name="merchantData" value="" >
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

</body>

</html>