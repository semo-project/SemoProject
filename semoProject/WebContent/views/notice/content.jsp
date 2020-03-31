<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/notice_style.css" rel="stylesheet" type="text/css"/>
</head>
<body>




<!-- Navigation -->
<%@ include file="../common/menubar.jsp" %>


<!-- Page Content -->
<div class="container">

  <!-- Page Heading/Breadcrumbs -->
 <h1 class="mt-4 mb-3">자주 묻는 질문</h1>

 <ol class="breadcrumb" style="background:lightseagreen">
   <li class="breadcrumb-item">
     <a href="#" style="font-family: 'Gugi'; color:white">자주 묻는 질문</a>
   </li>
 </ol>

 <!-- Content Row -->
 <div class="row">
   <!-- Sidebar Column -->
   <%@ include file ="common/noticeSideNav.jsp" %>
   
  

      <!-- Content Column -->            
  

      <div class="mb-4" id="accordion" role="tablist" aria-multiselectable="true">

        <div class="contact_list_head">
          </div>

        <div class="card">
          
          <div class="card-header" role="tab" id="headingOne">
            
            <h5 class="mb-0">
              
              <a data-toggle="collapOne" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">정기 결제(월월충전) 해지와 결제 수단 변경방법
              </a>
            </h5>
          </div>
  
          <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne">
            <div class="card-body">
				              1. 정기결제를 해지하고 싶어요<br><br>
				
				등록하신 정기결제는 [내 정보] 페이지의 [정기결제 관리] 메뉴에서 해지신청 하실 수 있습니다.<br>
				
				해지신청을 하실 경우 다음 결제 예정일부터 결제가 진행되지 않으며, 
				해지가 완료되기 전 해지 신청의 철회 또한 동일한 메뉴에서 가능합니다.<br>
				
				- 결제일 당일 취소나 미사용 상품의 결제취소는 [결제/환불]경로로 문의해 주시면 확인 후 답변 드리겠습니다.<br>
				
				2. 정기결제 수단을 변경하고 싶어요<br><br>
				
				등록하신 결제수단은 레진코믹스 [내 정보] 페이지의 [정기결제 관리] 메뉴에서 변경하실 수 있습니다.<br>
				
				더 궁금하신 점이 있거나 도움이 필요하실 경우 하단의 [문의하기] 버튼을 눌러주세요.<br>
				감사합니다.
				
				
				※ 1:1 상담신청을 위한 문의내용에 개인정보를 입력하시는 경우,
				고객서비스 제공을 위한 개인정보 수집 이용에 동의한 것으로 간주되며, 해당 정보는 목적달성시까지 보관됩니다.<br>
				단, 관련법령에서 별도의 보관기간을 정하는 경우 해당 시점까지 보관합니다.<br>
				상담신청 시 불필요한 개인정보가 입력되지 않도록 주의를 부탁드립니다.<br>
            </div>
          </div>
        </div>
        <div class="card">
          <div class="card-header" role="tab" id="headingTwo">
            <h5 class="mb-0">
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">코인 쿠폰 등록이 안돼요.
              </a>
            </h5>
          </div>
          <div id="collapsTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo">
            <div class="card-body">
              이벤트 및 제휴사를 통해 받은 레진코믹스 코인/보너스코인 쿠폰은 아래 경로에서 등록하실 수 있습니다. <br>
              <br>
              레진코믹스 웹 사이트: 코인 충전 메뉴 맨 하단의 [쿠폰 코드 입력] (쿠폰 등록 바로가기)<br>
              안드로이드 앱: 왼쪽 상단 메뉴 중 [쿠폰 등록] 메뉴 선택 <br>
              ※ 아이폰 기기 등의 'IOS 앱'에서는 쿠폰 등록이 가능하지 않습니다. 모바일 웹 사이트를 이용해 주세요. <br>
              <br>
              [쿠폰 등록 시 유의사항] <br>
              1. 쿠폰은 등록 제한이 있으니 쿠폰 정보를 확인해 주세요. (예: 1계정에 동일 종류 쿠폰은 1번만 등록 가능)<br>
              2. 잘못된 쿠폰번호를 반복적으로 시도하는 경우 입력 제한이 발생됩니다. 일정 시간이 지난 후 정확한 쿠폰번호를 입력해 주세요. <br>
              3. 쿠폰 번호는 16자리, 기프트 카드의 PIN번호는 12자리입니다. 잘못된 쿠폰 오류가 발생한다면 레진코믹스 쿠폰이 맞는지 확인해 주세요.<br>
              4. 쿠폰은 유효기간이 존재하며, 제공되는 쿠폰별로 유효기간이 상이 할 수 있습니다.<br>
              5. '이미 등록한 쿠폰입니다' 메시지가 발생하는 경우 앱/웹사이트를 새로고침 또는 재접속하여 잔여 코인을 확인해 주세요. <br>
              <br>
              쿠폰 등록에 다른 궁금함이나 이용에 문제가 있는 경우 아래 [문의하기] 버튼을 눌러 문의해 주시면 자세한 안내로 도움드리겠습니다. <br>
              <br>
              ※ 1:1 상담신청을 위한 문의내용에 개인정보를 입력하시는 경우, <br>
              고객서비스 제공을 위한 개인정보 수집 이용에 동의한 것으로 간주되며, 해당 정보는 목적달성시까지 보관됩니다. <br>
              단, 관련법령에서 별도의 보관기간을 정하는 경우 해당 시점까지 보관합니다.<br>
              상담신청 시 불필요한 개인정보가 입력되지 않도록 주의를 부탁드립니다.<br>
            </div>
          </div>
        </div>
        <div class="card">
          <div class="card-header" role="tab" id="headingThree">
            <h5 class="mb-0">
              <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">보너스 코인은 어떻게 사용하나요?
              </a>
            </h5>
          </div>
          <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree">
            <div class="card-body">
              보너스 코인이란?<br><br>
              코인 상품 구매 시 보너스로 증정되거나, 이벤트를 통해 지급되는 무상코인입니다.<br><br><br><br>
              보너스 코인 사용 기간은 어디에서 확인할 수 있나요? <br>
              이벤트 진행 시 주의사항 또는 보너스 코인을 지급 받은 '선물함' 또는 '코인 충전 내역'에서 확인 가능합니다.<br>
              등록 절차가 있다면 코인 등록의 유효기간 및 코인 등록 후 ‘사용 유효기간’을 [선물함]에서 꼭 확인해 주세요. <br><br><br>
              ※ 웹사이트: 내 정보 페이지 내 [소멸 예정 보너스 코인]<br>
              ※ App: 설정 - [소멸 예정 보너스 코인]<br><br><br><br>
              보너스 코인은 어떤 차이점이 있나요?<br><br>
              '보너스 코인'은 등록 및 사용 유효기간이 있습니다. (예: 2019년 12월 31일까지만 사용 가능)<br>
              등록 및 사용 유효기간이 지날 경우 기간 만료로 삭제되니 꼭! 확인해 주세요.<br><br>
              작품 전용 보너스 코인은 무엇인가요?<br>
              <전용 보너스 코인>이란 해당 작품을 구매하실 때에만 사용 가능한 보너스 코인입니다.<br><br>
              모든 보너스 코인에 작품 제한이 있는 것이 아니며, 이벤트에 따라 설정되어 있을 수 있고, <br><br>
              해당 내용은 이벤트 진행 시 사전 안내해 드리거나 지급 시 선물함에서 안내 되니 꼭 확인해 주세요.<br><br><br>
              ※ 작품 전용이란 해당 작품 구매에만 사용하실 수 있다는 의미이며, 해당 작품 구매 시 가장 먼저 소진됩니다.<br><br><br>
              보너스 코인과 일반 코인 중 어떤 코인이 먼저 소진되나요? <br><br>
              유효기간이 있는 보너스 코인이 먼저 소진됩니다.<br><br>
              유효기간이 각각 다른 보너스 코인을 등록한 경우 만료기간이 짧은 보너스 코인 먼저 소진됩니다.<br><br><br><br>
            </div>
          </div>
        </div>
      </div>





 </div>

 </div>
 <!-- /.row -->

</div>
<!-- /.container -->


<br><br><br><br><br><br>
<!-- Footer -->
<footer class="py-5 bg-dark">
  <div class="container">
    <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
  </div>
  <!-- /.container -->
</footer>

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script>

$("#headingThree").on("click",function(){
    $("#collapseThree").toggle(100);
})
$("#headingTwo").on("click",function(){
    $("#collapsTwo").toggle(100);
})
$("#headingOne").on("click",function(){
    $("#collapseOne").toggle(100);
})
		
</script>






</body>
</html>