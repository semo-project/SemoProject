<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.util.ArrayList"%>
 <%@page import="com.kh.work.model.vo.Episode"%>
   <%@page import="com.kh.work.model.vo.Work"%>
 <%
 ArrayList<Episode> list = (ArrayList<Episode>)request.getAttribute("list");
	Work w = (Work)request.getAttribute("w");

%>
 
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Modern Business - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/modern-business.css" rel="stylesheet">
<style>
  .star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('/image/starpic.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}
.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
#heart {
      color: grey;  
      font-size: 50px;
    }
    
    #heart.red {
      color: red;
    }
  .heart-share{
    display: flex;
  }
  .heart-share1{
    width: 50px;
  }
</style>
</head>

<body>

  <!-- Navigation -->
  <%@ include file="../common/menubar.jsp" %>
  

  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Portfolio Item
      <small>Subheading</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">Home</a>
      </li>
      <li class="breadcrumb-item active">Portfolio Item</li>
    </ol>

    <!-- Portfolio Item Row -->
    <div class="row">

      <div class="col-md-8">
        <img class="img-fluid" src="http://placehold.it/750x500" alt="">
      </div>
      
      
      <div class="col-md-4">
        <h3 class="my-3"><%= w.getWorkTitle() %></h3>
       <input type="hidden"<%= w.getWorkNo() %>><p><%= w.getApprovalDate() %></p>
        <h4><%= w.getGenreName() %></h4>
        <p><button type="button" class="btn btn-secondary btn-block">첫회보기</button></p>
        
        <ul class="clear_g list_append" style="display: flex;margin-left: auto;">
          <li class="box_grade">
            <span class="star-input">
              <span class="input">
                  <input type="radio" name="star-input" value="1" id="p1">
                  <label for="p1">1</label>
                  <input type="radio" name="star-input" value="2" id="p2">
                  <label for="p2">2</label>
                  <input type="radio" name="star-input" value="3" id="p3">
                  <label for="p3">3</label>
                  <input type="radio" name="star-input" value="4" id="p4">
                  <label for="p4">4</label>
                  <input type="radio" name="star-input" value="5" id="p5">
                  <label for="p5">5</label>
                </span>
                <output for="star-input"><b>0</b>점</output>						
            </span>
        
      </li>
      
    </ul>
    
    <ul class="heart-share">
      <li class="heart-share1">
        
        <i class="fa fa-heart" id="heart" ></i>
      </li>
      <li class="heart-share1">
        <button class="btn_comm btn_share id="btn" type="button"><img class="btn-img" src="/image/새 폴더 (2)/공유하기.png"></button></li>
    </ul>
    <p><%= w.getWorkSummary() %></p>
    
      </div>

    </div>
    <!-- /.row -->

    <!-- Related Projects Row -->
    <hr>
    <h3 class="my-4">공지사항 휴재 여러개 공지사항글
      <div class="container" style="margin-bottom:7px;margin-left:15px;">
        <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal2"  style="background: blueviolet;height: 30px;width: 78px; float: right;">웹툰 구매</button>
        
    <!-- Modal -->
    <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content" style="margin-top:200px; width:600px;">
        <div class="modal-header">
          <h3>세모웹툰 유료서비스 서비스 약관</h3>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="font-size:20px;"><strong></strong></h4>
        </div>
        
    <!-- 모달 지점안내 -->
        <div class="modal-body" style="height:500px; width:600px;">
             <div style=" margin-left: 20px; border:1px solid lightgray; width:550px; height:300px; overflow: auto;margin-top:10px; margin-bottom:40px;">
        <p>제1장 총칙
    제1조 (목적)
    이 약관은 (주)semo(이하 "회사"라 합니다)가 제공하는 semo 웹툰 서비스(이하 “서비스”라 합니다) 내에서 유료서비스의 이용과 관련하여 회사와 회원의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
    
    제2조 (약관의 적용)
    본 약관은 회원이 서비스 내에서 유료로 제공되는 서비스를 이용하고자 하는 경우, 본 약관에 별도로 동의한 회원에게 적용됩니다.
    
    제3조 (정의)
    ① 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
    1. “회원”이라 함은 본 약관에 따라 회사와 이용계약을 체결하여 회사 또는 판매자가 제공하는 유료서비스를 이용하는 자를 말합니다.
    2. “유료서비스”라 함은 회사 또는 판매자가 유료로 제공하는 웹툰 작품 등 각종 온라인 디지털콘텐츠 및 이를 이용하는데 수반되는 관련 서비스를 말합니다.
    3. “캐시”는 회원이 유료서비스 이용 시 사용할 수 있는 결제수단을 말하고, ”캐시”는 아래와 같은 종류가 있습니다.
    가. 쿠키캐시 : semo 내결제 서비스를 이용하여 회사가 운영하는 웹사이트, 모바일 플랫폼 및 제휴사 서비스 등에서 재화 또는 용역을 구매할 수 있는 선불전자지급수단으로, 충전된 캐시는 마지막으로 이용한 날로부터 육십(60)개월이 경과하는 동안 해당 수단을 한번도 적립하거나 사용하지 않은 경우 자동소멸됩니다. 다음캐시의 사용 등에 관한 자세한 사항은 카카오 전자금융거래 이용약관(https://cash.daum.net/Skyline-section/agreement.daum)에서 확인하실 수 있습니다.
    나. 웹툰캐시 : 서비스에서 웹툰 작품을 열람하기 위해 충전하여 사용할 수 있는 지급수단으로, 충전된 웹툰캐시는 마지막으로 이용한 날로부터 육십(60)개월이 경과하는 동안 해당 수단을 한번도 사용하지 않은 경우 자동 소멸됩니다. 단, 서비스 내에서 회사 및 제3자가 진행하는 이벤트 활동 등을 통하여 리워드로 지급받거나 쿠폰 등을 통하여 충전한 웹툰캐시의 경우에는 지급 시 명시된 기간 내에만 사용이 가능합니다.
    ② 본 약관에서 사용되는 용어 중 본 조에서 정하지 아니한 부분은 관계 법령 및 일반 관례에 따릅니다.
    제4조 (신원정보 등의 제공)
    회사는 이 약관의 내용, 상호, 대표자 성명, 전화번호, 팩스번호, 사업자등록번호 등을 회원이 쉽게 알 수 있도록 유료서비스 화면에 순차적으로 게시합니다. 다만, 대표자 성명, 팩스번호, 사업자등록번호 및 이 약관은 회원이 유료서비스 화면에서 순차적으로 연결된 화면을 통하여 볼 수 있도록 할 수 있습니다.
    
    제5조 (약관의 게시, 개정 등)
    ① 회사는 본 약관의 내용을 회원이 쉽게 확인할 수 있도록 서비스 초기 화면 또는 별도의 연결화면에 게시합니다.
    ② 회사는 「콘텐츠산업진흥법」, 「전자상거래등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」 등 관계 법령을 위반하지 않는 범위에서 이 약관을 개정할 수 있습니다.
    ③ 회사가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행 약관과 함께 회사가 운영하는 서비스 내의 적절한 장소에 개정약관의 적용일자 15일 전부터 적용일 이후 상당한 기간 동안 공지합니다. 다만, 회원에게 불리한 약관의 개정의 경우에는 적용일자 30일 전부터 공지하고, 회원이 가입 시 제공한 전자우편, 서비스 내 팝업 화면 등의 전자적 수단을 통하여 고지합니다.
    ④ 회사가 전항에 따라 개정약관을 공지 또는 통지하면서 회원에게 약관 변경 적용일 까지 거부의사를 표시하지 아니할 경우, 약관의 변경에 동의한 것으로 간주한다는 뜻을 명확하게 공지 또는 통지하였음에도 회원이 명시적으로 거부의 의사표시를 하지 아니한 경우 회원이 개정약관에 동의한 것으로 봅니다.
    ⑤ 회원이 개정약관의 적용에 동의하지 않는 경우 회사는 개정 약관의 내용을 적용할 수 없으며, 이 경우 회원은 이용계약을 해지할 수 있습니다. 다만, 기존 약관을 적용할 수 없는 특별한 사정이 있는 경우에는 회사는 이용계약을 해지할 수 있습니다.
    제6조 (회원에 대한 통지)
    ① 회사가 회원에 대한 통지를 하는 경우 이 약관에 별도 규정이 없는 한 서비스 내 공지 화면, 회원이 제공한 전자우편, 전자쪽지, 팝업 화면 등으로 할 수 있습니다.
    ② 회사는 회원 전체에 대한 통지의 경우 7일 이상 회사가 운영하는 서비스 내의 게시판 등에 게시함으로써 제1항의 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 제1항의 방법으로 통지합니다.
    ③ 회사는 회원의 연락처 미기재, 변경 후 미수정 등으로 인하여 개별 통지가 어려운 경우에 한하여 전항의 공지를 함으로써 개별 통지를 한 것으로 간주합니다.
    제2장 이용계약 체결 및 유료서비스 이용
    제7조 (유료서비스의 내용 등의 게시)
    ① 회사는 다음 사항을 해당 유료서비스의 이용초기화면이나 그 포장, FAQ 등에 회원이 알기 쉽게 표시합니다.
    1. 유료서비스의 명칭 또는 제호
    2. 유료서비스의 내용, 이용방법, 이용료 기타 이용조건
    ② 회사의 유료서비스의 이용가능기기 및 이용에 필요한 최소한의 기술사양은 권장사양정보에 따릅니다.
    ③ 회사는 유료서비스를 제공함에 있어 유료서비스의 교환•반품•보증과 그 대금 환불의 조건 및 절차에 관한 사항을 제공합니다.
    제8조 (이용계약의 성립 등)
    ① 회원은 회사가 제공하는 다음 또는 이와 유사한 절차에 의하여 이용신청을 합니다. 회사는 계약 체결 전에 각 호의 사항에 관하여 회원이 정확하게 이해하고 실수 또는 착오 없이 거래할 수 있도록 정보를 제공합니다.
    1. 유료서비스의 내용, 이용방법, 이용료 및 기타 이용조건 확인 및 선택
    2. 결제방법의 선택 및 결제정보의 입력
    3. 유료서비스의 이용신청에 관한 확인 또는 회사의 확인에 대한 동의
    ② 회사는 회원의 이용신청이 다음 각 호에 해당하는 경우에는 승낙하지 않거나 승낙을 유보할 수 있습니다.
    1. 실명이 아니거나 타인의 명의를 이용한 경우
    2. 허위의 정보를 기재하거나, 회사가 제시하는 내용을 기재하지 않은 경우
    3. 미성년자가 「청소년보호법」에 의해서 이용이 금지되는 유료서비스를 이용하고자 하는 경우
    4. 서비스 관련 설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우
    5. 카카오 또는 Daum 회원 자격을 상실하는 경우
    6. 기타 회원의 귀책사유로 승인이 불가능하다고 판단되는 경우
    ③ 이용계약의 성립시기는 가입완료, 구매완료를 신청절차 상에서 표시한 시점으로 합니다.
    ④ 회원이 유료서비스를 이용하기 위해서는 이 약관에 동의 후 회사가 정한 해당 유료서비스에 따른 이용조건에 따라 이용요금을 지급하여야 합니다.
    제9조 (미성년자 이용계약에 관한 특칙)
    ① 회사는 회원에 대하여 「청소년보호법」 등에 따른 등급 및 연령 준수를 위해 이용제한이나 등급별 제한을 할 수 있고, 성인인증 절차를 거치도록 할 수 있습니다. 또한 회사는 회원이 만19세 미만 열람 불가의 작품을 이용하고자 하는 경우, 관계 법령에 따라 1년 단위로 회원의 나이 및 본인 여부를 확인합니다.
    ② 회사는 만 19세 미만의 미성년 회원이 유료서비스를 이용하고자 하는 경우에 부모 등 법정대리인의 동의를 얻거나, 계약체결 후 추인을 얻지 않으면 미성년자 본인 또는 법정대리인이 그 계약을 취소할 수 있다는 내용을 계약체결 전에 고지하는 조치를 취합니다.
    제10조 (본인인증)
    회원은 회사의 정책에 따라 서비스 이용 시작 후 최초로 결제하는 시점 또는 회원이 기다리면 무료 이용권을 최초로 이용하는 시점 중 빠른 시점에 실명에 대한 확인을 하여야 합니다.
    
    제11조 (지급방법)
    ① 회원은 유료서비스에 대하여 다음 각 호의 방법 중 가능한 방법을 선택하여 결제할 수 있으며, 회사는 회원이 선택한 결제 방법에 대하여 어떠한 명목의 수수료도 추가하여 징수하지 않습니다. 단, 회원이 선택한 결제수단의 제공업체가 별도로 존재하는 경우, 회원은 해당 결제수단을 이용하기 전에 해당 결제수단에서 요구되는 절차를 이행하여야 합니다.
    1. 선불카드, 직불카드, 신용카드 등의 각종 카드결제
    2. 전화 또는 휴대전화를 이용한 결제
    3. 폰뱅킹, 인터넷뱅킹, 메일뱅킹, 온라인 무통장 입금 등의 각종 계좌이체
    4. 전자화폐에 의한 결제
    5. 캐시에 의한 결제
    6. 앱마켓 등을 통한 인앱결제(In-app purchase)
    7. 회사와 계약을 맺었거나 회사가 인정한 상품권에 의한 결제
    8. 캐시백, 신용카드 등의 포인트에 의한 결제
    9. 기타 전자적 지급방법에 의한 대금지급 등
    ② 회사의 정책 및 전항의 결제수단 제공업체(이동통신사, 카드사 등)의 기준에 따라 각 회원의 월 누적 결제액 및 충전한도가 제한될 수 있습니다. 해당 기준을 초과한 경우 유료서비스의 추가 이용은 불가능할 수 있습니다.
    제12조 (유료서비스의 제공 및 중단)
    ① 회사는 유료서비스를 연중무휴, 1일 24시간 제공함을 원칙으로 합니다.
    ② 회사는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 운영상 상당한 이유가 있는 경우 유료서비스의 제공을 일시적으로 중단할 수 있고, 이 경우 회사는 제6조(회원에 대한 통지)에 정한 방법으로 회원에게 통지합니다. 다만, 회사가 사전에 통지할 수 없는 불가피한 사유가 있는 경우 사후에 통지할 수 있습니다.
    ③ 회사는 유료서비스의 제공에 필요한 경우 정기점검을 실시할 수 있으며, 정기점검시간은 별도로 유료서비스 제공화면에 공지한 바에 따릅니다.
    ④ 사업종목의 전환, 사업의 포기, 분할·합병 등의 이유로 유료서비스를 제공할 수 없게 되는 경우에 회사는 제6조(회원에 대한 통지)에서 정한 방법으로 회원에게 통지하고, 이 약관에서 정한 바 또는 회사가 별도로 통지하는 바에 따라 회원에게 보상합니다.
    제13조 (유료서비스의 변경)
    ① 회사는 상당한 이유가 있는 경우에 운영상, 기술상의 필요에 따라 제공하고 있는 전부 또는 일부의 유료서비스를 변경할 수 있습니다. 다만, 변경된 내용이 중대하거나 회원에게 불리한 경우에는 회사가 해당 유료서비스를 제공받는 회원에게 제6조(회원에 대한 통지)에서 정한 방법으로 통지합니다.
    ② 회사는 전항에 따른 서비스 변경에 대한 동의를 거절한 회원에 대하여는 변경 전 서비스를 제공합니다. 다만, 변경 전 서비스 제공이 불가능할 경우 회사는 해당 회원에게 해당 서비스의 제공을 중지하거나 계약을 해지할 수 있습니다. 이 경우 환불 등은 제19조(회원의 이용계약 해지 또는 해제)에 따라 진행됩니다.
    제3장 계약당사자의 의무
    제14조 (회사의 의무)
    ① 회사는 관계 법령과 본 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 계속적이고 안정적으로 유료서비스를 제공하기 위하여 최선을 다하여 노력합니다.
    ② 회사는 회원이 안전하게 유료서비스를 이용할 수 있도록 개인정보(신용정보 포함)보호를 위한 보안시스템을 갖추며, 개인정보처리방침을 공지하고 이를 준수합니다.
    ③ 회사는 유료서비스 이용과 관련하여 회원으로부터 제기된 의견이나 불만이 정당하다고 인정할 경우에는 이를 처리하여야 합니다. 회원이 제기한 의견이나 불만사항에 대해서는 회원에게 처리과정 및 결과를 전달합니다.
    ④ 회사는 전자상거래등에서의 소비자보호에 관한 법률에 따라 아래 각 호의 항목을 각 호에 명시된 기간동안 보관합니다.
    1. 계약 또는 청약철회 등에 관한 기록: 5년
    2. 대금결제 및 재화 등에 공급에 관한 기록: 5년
    3. 소비자의 불만 또는 분쟁처리에 관한 기록: 3년
    제15조 (회원의 의무)
    ① 회원은 유료서비스 이용 전에 반드시 회사 또는 판매자가 제공하는 유료서비스의 상세 내용과 거래의 조건을 정확하게 확인한 후 구매를 하여야 합니다. 거래의 내용과 조건을 확인하지 않고 구매하여 발생한 손실 또는 손해는 회원에게 귀속됩니다.
    ② 회원은 본 약관 및 회사가 유료서비스와 관련하여 회원에게 고지하는 내용을 준수하여야 하며, 본 약관 및 고지 내용을 위반하거나 이행하지 아니하여 발생하는 손실, 손해에 대하여 책임을 부담합니다.
    ③ 회원은 유료 서비스 이용을 위한 이용 대금 결제 시 회사가 정하는 방식에 따라 캐시 등을 사용하여야 합니다.
    ④ 회원은 유료서비스를 이용할 때 다음 각호에 해당하는 행위를 해서는 안 됩니다.
    1. 회사가 제공하는 유료서비스 이용방법에 의하지 아니하고 비정상적인 방법으로 유료서비스를 이용하거나 시스템에 접근하는 행위
    2. 타인의 명의, 카드정보, 계좌정보 등을 도용하여 회사가 제공하는 유료서비스를 이용하는 행위
    3. 회사가 정하지 않은 비정상적인 방법으로 캐시를 취득하거나 사용하는 행위
    4. 회사가 게시한 정보의 무단 변경 또는 회사가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시하는 행위
    5. 회사 및 기타 제3자의 저작권 등 지적재산권에 대한 침해행위
    6. 회사 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
    7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서 양속에 반하는 정보를 유료서비스에 공개 또는 게시하는 행위
    8. 기타 불법적이거나 부당한 행위
    제16조 (저작권의 귀속)
    ① 서비스에 따라 제공되는 각 웹툰 작품에 대한 저작권 등 지식재산권은 회사, 각 작품의 제공자(작가 또는 발행처)에게 귀속되고, 회원은 서비스 이용을 위해서 결제 대금을 지급한 작품에 한하여 서비스에 정해진 기간 등 조건에 따라 각 웹툰 작품의 이용을 허락 받습니다.
    ② 회원은 서비스를 이용하는 과정에서 회사, 각 작품 또는 발행처의 작가에게 지식재산권이 귀속되는 작품 또는 정보를 지식재산권의 권리자로부터 사전 승낙을 받지 아니하고 복제, 전송, 출판, 배포, 방송 기타 방법으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다. 다만, 저작권법 및 콘텐츠산업진흥법 등에서 이를 허용한 경우에는 그러하지 않습니다.
    제17조 (휴면회원 전환)
    회사는 회원이 1년 이상 서비스 이용을 위해 로그인을 하지 않은 경우, 회원의 ID를 휴면계정으로 전환하고 회원의 개인정보를 별도로 보관∙관리하고 회원의 서비스 이용을 제한할 수 있습니다.
    
    제4장 청약철회, 계약해지 및 이용제한 등
    제18조 (회원의 청약철회)
    ① 회원은 본 이용계약에 따라 서비스를 이용하기 위해 유료 결제를 한 날로부터 7일 이내에 회사에 대해 서비스의 이용에 관한 청약을 철회할 수 있습니다. 다만, 회사가 회원에게 사전에 합의한 내용과 다르게 서비스를 제공하거나 서비스를 제공하지 아니하는 경우, 회원은 유료 결제를 한 날로부터 3개월 이내 또는 해당 사실을 알거나 알 수 있었던 날로부터 30일 이내에 회사에 대해 서비스의 이용에 관한 청약을 철회할 수 있습니다.
    ② 제1항에도 불구하고, 「문화산업진흥 기본법」 제2조 제5호의 디지털콘텐츠의 제공이 개시된 경우에는 회사의 의사에 반하여 서비스의 이용에 관한 청약을 철회할 수 없습니다. 다만, 가분적 디지털콘텐츠로 구성된 계약의 경우에는 제공이 개시되지 아니한 부분에 대하여는 철회가 가능합니다.
    제19조 (회원의 이용계약 해지 또는 해제)
    ① 회원은 다음 각 호의 사유가 있을 때 전화, 전자우편 등으로 회사에게 의사표시를 발송하여 본 이용계약을 해지 또는 해제할 수 있습니다.
    1. 회사에게 서비스의 하자 보완을 요청하였으나 회사가 이를 보완∙수정하지 않거나 보완∙수정할 수 없는 경우, 회원은 서비스의 하자 보완을 요청한 날로부터 1개월 이후 회사에게 이용계약의 해지 또는 해제를 통보할 수 있습니다.
    2. 회원이 본 약관 또는 카카오계정 약관, 카카오 서비스 약관, 카카오 통합 약관 또는 카카오 통합서비스약관(계정통합 진행한 경우) 및 Daum 서비스 약관(이하 통칭하여 “카카오 서비스 약관들”이라 합니다)의 변경에 동의하지 않아 서비스 이용을 중지하고자 하는 경우 회원은 회사에게 이용계약의 해지 또는 해제를 통보할 수 있습니다.
    3. 회원이 서비스를 더 이상 이용하지 않고자 하는 경우 회원은 회사에게 이용계약의 해지 또는 해제를 통보할 수 있습니다.
    ② 회사는 회원으로부터 본 이용계약의 해제 또는 해지의 의사표시를 수령한 날로부터 3 영업일 이내에 회원이 서비스 이용을 위해 지급하고 사용하지 않은 유료 결제대금을 회원이 해당 대금을 결제한 방법과 동일한 방법으로 이를 환급하여야 하며, 동일한 방법으로 환불이 불가한 경우 이를 사전에 회원에게 고지합니다. 다만, 회원의 수납 확인이 필요한 결제수단으로 이용 대금을 결제한 경우 회사는 수납 확인일로부터 3 영업일 이내에 이를 회원에게 환급하도록 합니다.
    ③ 회사가 전항에 따라 회원에게 유료 결제대금을 환급하는 경우, 회사는 회원이 서비스 이용으로부터 얻은 이익 및 환불수수료(10% 또는 1,000원 중 큰 금액)에 해당하는 금액을 공제한 나머지 대금을 회원에게 환급할 수 있습니다. 또한, 회사가 회원에게 무상으로 지급한 캐시는 환불 대상에서 제외됩니다.
    ④ 회사는 제2항에 따라 회원에게 결제 대금을 환급함에 있어서 회원이 신용카드 또는 전자화폐 등의 결제수단으로 이용 대금을 지급한 때에는 지체없이 당해 결제수단을 제공한 사업자로 하여금 이용 대금의 청구를 정지 또는 취소하도록 요청합니다. 다만, 제2항 단서 및 제3항의 경우는 그러하지 아니할 수 있습니다.
    ⑤ 회사는 앱마켓 결제(인앱결제)에 있어 해당 앱마켓에 대하여 대금지급의 정지∙취소 요청 등 「전자상거래등에서의 소비자보호에 관한 법률」에 따른 관련 조치를 취합니다. 다만, 위와 같은 회사의 요청에 따른 해당 앱마켓의 조치에 관하여는 해당 앱마켓의 정책을 참조하여 주시기 바랍니다.
    ⑥ 회사와 서비스 이용을 위한 대금 지급 받은 자가 동일인이 아닌 경우, 회사와 서비스 이용을 위한 대금 지급을 받는 자는 청약철회 또는 계약해제, 해지로 인한 결제 대금 환급과 관련한 의무의 이행에 있어서 연대하여 책임을 집니다.
    제20조 (회사의 이용계약 해지 또는 해제)
    ① 회사는 회원이 카카오 서비스 약관들 또는 본 약관에 명시된 회원의 의무를 위반하였을 경우, 회원에 대하여 본 이용 계약을 해제 또는 해지하거나 일정한 기간을 정하여 회원의 유료서비스의 이용을 제한할 수 있습니다.
    ② 제1항의 해제, 해지는 회사가 정해진 통지 방법에 따라 회원에게 그 의사를 표시한 때에 효력이 발생합니다.
    ③ 회사가 본 조에 따라 회원의 귀책사유로 본 이용계약을 해지 또는 해제하는 경우, 회사는 회원이 서비스 이용으로부터 얻은 이익 및 환불수수료(10% 또는 1,000원 중 큰 금액)에 해당하는 금액을 공제한 나머지 대금을 회원에게 환급할 수 있습니다.
    제21조 (과오금)
    ① 회원에게 유료서비스 이용을 위한 대금이 잘못 과금된 경우, 회사는 회원이 대금을 결제한 방법과 동일한 방법으로 잘못 과금된 금액 전액을 환불하여야 합니다. 다만, 동일한 방법으로 환불이 불가능할 때는 사전에 이를 회원에게 고지합니다.
    ② 회사의 책임 있는 사유로 회원에게 과오금이 발생한 경우, 회사는 비용, 수수료 등에 관계없이 잘못 과금된 금액 전액을 환불합니다. 다만, 회원의 책임 있는 사유로 과오금된 경우, 회원은 합리적인 범위 내에서 회사가 잘못 과금된 대금을 환불하는데 소요되는 비용은 부담하여야 합니다.
    ③ 회사는 본 조에 규정되지 않은 과오금된 대금의 환불은 관계 법령에서 정하는 바에 따릅니다.
    제5장 기타
    제22조 (책임제한)
    ① 회사가 관계 법령의 변경, 천재지변 또는 이에 준하는 불가항력으로 인하여 유료서비스를 제공할 수 없는 경우에는 유료서비스 제공에 관한 책임이 면제됩니다.
    ② 회사는 회원의 귀책사유로 인한 유료서비스 이용의 장애에 대하여는 책임을 지지 않습니다.
    ③ 회사는 회원이 유료서비스와 관련하여 게재한 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는 책임을 지지 않습니다.
    제23조 (약관의 해석)
    이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 「정보통신망 이용촉진 및 정보보호에 관한 법률」, 「콘텐츠산업진흥법」, 「전자상거래등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 문화체육관광부장관이 정하는 「디지털콘텐츠 이용자보호지침」 및 기타 관계 법령, 카카오 서비스 약관들 또는 상관례에 따릅니다.
    
    제24조 (준거법 및 분쟁 해결)
    ① 이 약관과 관련된 사항에 대하여는 대한민국법을 준거법으로 합니다.
    ② 회사와 회원 간에 발생한 분쟁에 대해서는 상호 신의성실에 바탕한 협의로 해결하도록 하되, 상호 협의가 어려울 경우 민사소송법 상의 관할법원에 제소하여 분쟁을 해결합니다.
    부칙
    이 약관은 2019년 6월 11일부터 적용됩니다.
    </p>
    </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-toggle="modal" data-dismiss="modal" data-target="#myModal3"style="color: white; background: blueviolet;height: 50px;width: 100px;text-align:center;margin-right:43%;">구매 동의</button>
        </div>
      </div>
    </div>
    </div>
    </div>

    <!-- 이중 모달 구매 모달-->
    <div class="modal fade" id="myModal3" role="dialog">
      <div class="modal-dialog modal-sm">
        <div class="modal-content" style="margin-top:100px; width:600px; height: 800px;" >
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" style="float: right;">&times;</button>
            
            <div>
              <table>
                <tr>
                  <th>
                    <h4 class="modal-title" style="font-size:50px;"><strong>쿠키 구매</strong></h4>
                  </th>
                </tr>
                <tr>
                  <th><h5>나 혼자만 레벨업</h5></th>
                </tr>                
                <tr id="branchInfo">
                  <th scope="row" id="branchInfo" class="bran">내가 가진 쿠키  </th>
                  <td id="branchInfo"><b>9999쿠키</b></td>
                </tr>
                <tr id="branchInfo">
                  <th scope="row" id="branchInfo" class="bran">이용권</th>
                  <td id="branchInfo"><b>10 개</b></td>
                </tr>
              </table>

            </div>
          </div>
          
      <!-- 모달 지점안내 -->
          <div class="modal-body" style="height:200px; width:400px;">
               <table style="border:1px solid lightgray;width:100%;text-align:center;left-margin:10px;">				  
            <tbody>
              <div>
                <table>
                  <h3>이용권 충전</h3>
               
                  <tr id="branchInfo">
                      <th scope="row" id="branchInfo" class="bran"><input type="radio"></th>
                    <td id="branchInfo"><b>1쿠키</b>: 100캐시
                      
                    </td>
                  </tr>
                  <tr id="branchInfo">
                    <th scope="row" id="branchInfo" class="bran"><input type="radio"></th>
                  <td id="branchInfo"><b>10쿠키</b>: 900캐시
                    
                  </td>
                </tr>
                <tr id="branchInfo">
                  <th scope="row" id="branchInfo" class="bran"><input type="radio"></th>
                <td id="branchInfo"><b>1쿠키</b>: 100캐시
                  
                </td>
              </tr>
              <tr id="branchInfo">
                <th scope="row" id="branchInfo" class="bran"><input type="radio"></th>
              <td id="branchInfo"><b>1쿠키</b>: 100캐시
                
              </td>
            </tr>
            <tr id="branchInfo">
              <th scope="row" id="branchInfo" class="bran"><input type="radio"></th>
            <td id="branchInfo"><b>1쿠키</b>: 100캐시
              
            </td>
          </tr>
          <tr id="branchInfo">
            <th scope="row" id="branchInfo" class="bran"><input type="radio"></th>
          <td id="branchInfo"><b>1쿠키</b>: 100캐시
            
          </td>
        </tr>
             
          </table>                              
                 <hr>
                 <button type="button" class="btn btn-default" data-dismiss="modal" data-target="#myModal3" style="color: white; background: blueviolet;height: 50px;width: 100px; float:; text-align:center;">구매 완료</button>
            </div>
            </tbody>
        </table>
          </div>
          <div class="modal-footer">
            <p></p>규정안내
- 이 콘텐츠는 청약철회가 불가능한 상품으로서 결제(사용) 완료된 콘텐츠에 대한 구매 취소(청약철회)는 불가합니다.
  단, 법정대리인의 동의가 없는 미성년자의 결제는 취소될 수 있습니다.
- 발행자의 사정에 따라 업데이트가 지연될 수 있으며, 업데이트 지연을 이유로 한 구매 취소는 불가합니다.
- 발행자의 의사에 따라 판매 가격이 변경될 수 있으며, 콘텐츠의 가격 변경을 이유로 한 구매 취소는 불가합니다.</p>
          </div>
        </div>
      </div>
      </div>
      </div>
    </h3>
    <div class="sort_comm">
      <strong class="screen_out">웹툰 정렬순서 선택</strong>
      <span>
        <input type="radio" id="sortRecent" name="wtsort" class="inp_radio">
        <label for="sortRecent" class="label_radio">최신화부터</label>
        <span ></span>
      </span>
      <span class="ico_commico_bar"></span>
      <span>
        <input type="radio" id="sortOld" name="wtsort" class="inp_radio">
        <label for="sortOld" class="label_radio">첫화부터</label>
        <span ></span>
      </span>

    </div>
    <hr>
    <div class="row">
    
    
        <% if(list.isEmpty()){ %>
        	<div>
 					<div><p>조회된 리스트가 없습니다.</p></div>       	
        	</div>
        <% }else{ %>
			<% for(Episode e : list){ %>	
      		<div class="col-md-3 col-sm-6 mb-4 divEpisode">
      				<input type="hidden" class="eNo" id="eNo" value="<%=e.getEpisodeNo()%>">
        		<a href="#">
          			<img class="img-fluid" src="http://placehold.it/500x300" alt="">
        		</a>
        				<p>											
							<%= e.getWorkTitle() %>	 <%= e.getEpisodeTitle() %> >> <%=e.getEpisodeNo()%>화 <br>
							<%= e.getApprovalDate() %> <br>
							조회수 : <%= e.getViewsCnt() %>
							
						</p>
      </div>

      		<% } %>
		<% } %>

    </div>
    
    <!-- /.row -->
    <ul class="pagination justify-content-center">
      <li class="page-item">
        <a class="page-link" href="#" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
          <span class="sr-only">Previous</span>
        </a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#">1</a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#">2</a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#">3</a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
          <span class="sr-only">Next</span>
        </a>
      </li>
    </ul>

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
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!--별점 스크립트-->
  <script>var starRating = function(){
    var $star = $(".star-input"),
        $result = $star.find("output>b");
      
        $(document)
      .on("focusin", ".star-input>.input", 
        function(){
            $(this).addClass("focus");
       })
         
         .on("focusout", ".star-input>.input", function(){
          var $this = $(this);
          setTimeout(function(){
              if($this.find(":focus").length === 0){
                 $this.removeClass("focus");
              }
           }, 100);
        })
      
        .on("change", ".star-input :radio", function(){
          $result.text($(this).next().text());
        })
        .on("mouseover", ".star-input label", function(){
          $result.text($(this).text());
        })
        .on("mouseleave", ".star-input>.input", function(){
          var $checked = $star.find(":checked");
            if($checked.length === 0){
                $result.text("0");
              } else {
                $result.text($checked.next().text());
            }
        });
    };
    
    starRating();</script>
    <!-- 하트 스크립트-->
    <script>
      (function() {
          const heart = document.getElementById('heart');
          heart.addEventListener('click', function() {
            heart.classList.toggle('red');
          });
        })();
      </script>
      
      	<script>
	$(function() {
		$(".divEpisode").click(function() {
			var val = $(this).children().eq(0).val();
			location.href="<%=contextPath%>/episode.de?eNo=" + val;
			
			//console.log(val);
		});
	});
	
	</script>
</body>

</html>
