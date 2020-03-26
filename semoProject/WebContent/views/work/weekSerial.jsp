<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList"%>
<%@page import="com.kh.work.model.vo.PageInfo" %>
<%@page import="com.kh.work.model.vo.Work"%>
<%

	String contextPath = request.getContextPath();
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
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
  <div class="container">
    <a class="navbar-brand" href="http://localhost:8888/semo/">세모웹툰</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link" href="http://localhost:8888/semo/">연재</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="services.html">세모게시판</a>
        </li>
        <li class="nav-item">
            <input id="searchform" type="text" name="search" placeholder="웹툰명을 입력해주세요">
            <input id="searchbtn" type="submit" value="검색">
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="test2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            로그인
          </a>
          <div class="dropdown-menu dropdown-menu-center" aria-labelledby="test2"> 
            <div class="loginArea" id="loginLogo" style="text-align: left;">로그인</div>
            <div class="loginArea">
              <input type="text" id="userId" placeholder="아이디">
            </div>
            <div class="loginArea">
              <input type="password" id="userPwd" placeholder="비밀번호">
            </div>
            <div class="loginArea">
              <label class="logCheck"> 
                <input type="checkbox" name="remember_me" >
                <i>
                  로그인 상태 유지
                </i>
              </label>
            </div>
            <div class="loginBtn">
              <button type="submit" class="lgBtn lgbtn-major lgBtn-wide lgBtn-mid" disabled>로그인</button>
            </div>
            <div class="login_links">
              <a id="member_join" href="member_join.html">회원가입</a>
              <a id="id_pw_find" href="id_pwd_find.html">아이디/비밀번호 찾기</a>
            </div>
            <div class="login_driver">
              <span>또는</span>
            </div>
            <button type="button" class="account_btn account_btn-naver oauth-connect" data-service="naver">네이버로 로그인 / 가입</button>
            <button type="button" class="account_btn account_btn-kakao oauth-connect" data-service="kakao">카카오로 로그인 / 가입</button>
 
            <p class="account_help">
              "
                  이용 중 도움이 필요하시면 ["
              <a href="ko/help">고객지원</a>
              "] 페이지로, 로그인에 문제가 있다면 "
              <a href="semo:help@semo.com">semohelp@semo.com</a>
              "으로 문의해 주세요.
              "
            </p>
          </div>
        </li>
      </ul>
    </div>
  </div>
 </nav>

  <!-- Page Content -->
 

   
    <div class="lzTab lzTab--hor" role="tablist" data-ga-event-category="연재_UI" style="text-align: center;
    padding-top: 40px; padding-bottom: 40px;">
      <div class="lzTab-hor" role="tablist" data-ga-event-category="연재_UI_종류" style="display: inline-flex;">
        <p style="padding-right: 30px;"><button  type="button" class="btn btn-secondary btn-lg" onclick="week()">요일별</button></p>
        <p style="padding-right: 30px;"><button  type="button" class="btn btn-secondary btn-lg" onclick="genre()">장르별</button></p>
        <p style="padding-right: 30px;"><button  type="button" class="btn btn-secondary btn-lg" data-tab="3" role="tab" aria-controls="publish_category-3" data-go-on="click" data-ga-event-action="click_tab" data-ga-event-label="탭_작품별">작품별</button></p>
        <p style="padding-right: 30px;"><button  type="button" class="btn btn-secondary btn-lg" data-tab="4" role="tab" aria-controls="publish_category-4" data-go-on="click" data-ga-event-action="click_tab" data-ga-event-label="탭_작가별">작가별</button></p>
      </div>
      <div class="lzTab" role="tablist" data-ga-event-category="연재_UI_요일">
        <button type="button" class="btn btn-dark" onclick="week(this.value)" value="월" id="dayButton" >월</button>
        <button type="button" class="btn btn-dark" onclick="week(this.value)" value="화" id="dayButton" >화</button>
        <button type="button" class="btn btn-dark" onclick="week(this.value)" value="수" id="dayButton">수</button>
        <button type="button" class="btn btn-dark" onclick="week(this.value)" value="목" id="dayButton">목</button>
        <button type="button" class="btn btn-dark" onclick="week(this.value)" value="금" id="dayButton">금</button>
        <button type="button" class="btn btn-dark" onclick="week(this.value)" value="토" id="dayButton">토</button>
        <button type="button" class="btn btn-dark" onclick="week(this.value)" value="일" id="dayButton">일</button>
       	 
     
      </div>
      
    </div>
    <hr>
    <div class="container">
    <p>요일별 전체 웹툰</p>
<hr>

        <div class="row">
       
        	<% if(list.isEmpty()){ %>
        	<div>
 					<div><p>조회된 리스트가 없습니다.</p></div>       	
        	</div>
        	<% }else{ %>
					<% for(Work w : list){ %>
				<div class="col-lg-4 col-sm-6 portfolio-item divWork">
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
	 function week(val) {
		 location.href="<%=contextPath%>/week.mon?day=" + val;
	 }
	</script>
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
	$(function() {
		$(".divWork").click(function() {
			var val = $(this).children().children().eq(0).val();
			location.href="<%=contextPath%>/view.se?wno=" + val;
		});
	});
	
	</script>
	
</body>

</html>
