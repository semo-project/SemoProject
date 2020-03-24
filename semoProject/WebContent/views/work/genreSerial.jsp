<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList, com.kh.board.model.vo.*" %>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
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
    padding: 8px;
    position: sticky;
    z-index: 6;
    top: 0;
    text-align: center;
    font-size: 0;
    line-height: 0;
    
  }
  .lzTab-hor{
    width: 500px;
  }
</style>
</head>

<body>

  <!-- Navigation -->
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
  <div class="container">
    <a class="navbar-brand" href="index.html">세모웹툰</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link" href="about.html">연재</a>
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
  <div class="container">

    
     
    <div class="lzTab lzTab--hor" role="tablist" data-ga-event-category="연재_UI" style="text-align: center;
    padding-top: 40px; padding-bottom: 40px;">
 <div class="lzTab-hor" role="tablist" data-ga-event-category="연재_UI_종류" style="display: inline-flex;">
   
        <p style="padding-right: 30px;"><button type="button" class="btn btn-secondary btn-lg" data-tab="1" role="tab" aria-controls="publish_category-1" data-go-on="click" data-ga-event-action="click_tab" data-ga-event-label="탭_요일별">요일별</button></p>
        <p style="padding-right: 30px;"><button type="button" class="btn btn-secondary btn-lg" data-tab="2" role="tab" aria-controls="publish_category-2" data-go-on="click" data-ga-event-action="click_tab" data-ga-event-label="탭_장르별">장르별</button></p>
        <p style="padding-right: 30px;"><button type="button" class="btn btn-secondary btn-lg" data-tab="3" role="tab" aria-controls="publish_category-3" data-go-on="click" data-ga-event-action="click_tab" data-ga-event-label="탭_작품별">작품별</button></p>
        <p style="padding-right: 30px;"><button type="button" class="btn btn-secondary btn-lg" data-tab="4" role="tab" aria-controls="publish_category-4" data-go-on="click" data-ga-event-action="click_tab" data-ga-event-label="탭_작가별">작가별</button></p>
      </div>
      <div class="lzTab" role="tablist" data-ga-event-category="연재_UI_장르">
        <button type="button" class="btn btn-dark" data-tab="1" role="tab" aria-controls="genre-1" data-go-on="click" data-ga-event-action="click_tab" data-ga-event-label="탭_전체">전체</button>
        <button type="button" class="btn btn-dark" data-tab="2" role="tab" aria-controls="genre-2" data-go-on="click" data-ga-event-action="click_tab" data-ga-event-label="탭_ㄱ">ㄱ</button>
        <button type="button" class="btn btn-dark" data-tab="3" role="tab" aria-controls="genre-3" data-go-on="click" data-ga-event-action="click_tab" data-ga-event-label="탭_ㄴ">ㄴ</button>
        <button type="button" class="btn btn-dark" data-tab="4" role="tab" aria-controls="genre-4" data-go-on="click" data-ga-event-action="click_tab" data-ga-event-label="탭_ㄷ">ㄷ</button>
        <button type="button" class="btn btn-dark" data-tab="5" role="tab" aria-controls="genre-5" data-go-on="click" data-ga-event-action="click_tab" data-ga-event-label="탭_ㄹ">ㄹ</button>
        <button type="button" class="btn btn-dark" data-tab="6" role="tab" aria-controls="genre-6" data-go-on="click" data-ga-event-action="click_tab" data-ga-event-label="탭_ㅁ">ㅁ</button>
        <button type="button" class="btn btn-dark" data-tab="7" role="tab" aria-controls="genre-7" data-go-on="click" data-ga-event-action="click_tab" data-ga-event-label="탭_ㅂ">ㅂ</button>
        <button type="button" class="btn btn-dark" data-tab="8" role="tab" aria-controls="genre-8" data-go-on="click" data-ga-event-action="click_tab" data-ga-event-label="탭_ㅇ">ㅇ</button>
        <button type="button" class="btn btn-dark" data-tab="9" role="tab" aria-controls="genre-9" data-go-on="click" data-ga-event-action="click_tab" data-ga-event-label="탭_ㅅ">ㅅ</button>
        <button type="button" class="btn btn-dark" data-tab="10" role="tab" aria-controls="genre-10" data-go-on="click" data-ga-event-action="click_tab" data-ga-event-label="탭_ㅈ">ㅈ</button>

        <button type="button" class="btn btn-dark" data-tab="11" role="tab" aria-controls="genre-11" data-go-on="click" data-ga-event-action="click_tab" data-ga-event-label="탭_ㅊ">ㅊ</button>
        <button type="button" class="btn btn-dark" data-tab="12" role="tab" aria-controls="genre-12" data-go-on="click" data-ga-event-action="click_tab" data-ga-event-label="탭_ㅋ">ㅋ</button>
        <button type="button" class="btn btn-dark" data-tab="13" role="tab" aria-controls="genre-13" data-go-on="click" data-ga-event-action="click_tab" data-ga-event-label="탭_ㅌ">ㅌ</button>
        <button type="button" class="btn btn-dark" data-tab="14" role="tab" aria-controls="genre-14" data-go-on="click" data-ga-event-action="click_tab" data-ga-event-label="탭_ㅍ">ㅍ</button>
        <button type="button" class="btn btn-dark" data-tab="15" role="tab" aria-controls="genre-15" data-go-on="click" data-ga-event-action="click_tab" data-ga-event-label="탭_ㅎ">ㅎ</button>
        <button type="button" class="btn btn-dark" data-tab="16" role="tab" aria-controls="genre-16" data-go-on="click" data-ga-event-action="click_tab" data-ga-event-label="탭_A-Z">A-Z</button>
        <button type="button" class="btn btn-dark" data-tab="17" role="tab" aria-controls="genre-17" data-go-on="click" data-ga-event-action="click_tab" data-ga-event-label="탭_0-9">0-9</button>
      </div>
      
    </div>
    <h3>장르별 전체 웹툰<em>[전체]</em></h3>
<hr>
    <div class="row">
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project One</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Two</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Three</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos quisquam, error quod sed cumque, odio distinctio velit nostrum temporibus necessitatibus et facere atque iure perspiciatis mollitia recusandae vero vel quam!</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Four</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Five</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Six</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque earum nostrum suscipit ducimus nihil provident, perferendis rem illo, voluptate atque, sit eius in voluptates, nemo repellat fugiat excepturi! Nemo, esse.</p>
          </div>
        </div>
      </div>
    </div>

   <!-- 페이징바 영역 -->
		<div class="pagingArea" align="center">
			<!-- 맨 처음으로 (<<) -->
			<button onclick="location.href='<%=contextPath%>/list.bo';"> &lt;&lt; </button>
			
			<!-- 이전페이지(<) -->
			<%if(currentPage == 1){ %>
			<button disabled> &lt; </button>
			<%}else{ %>
			<button onclick="location.href='<%=contextPath%>/list.bo?currentPage=<%=currentPage-1%>';"> &lt; </button>
			<%} %>
			
			<!-- 페이지 목록 -->
			<%for(int p=startPage; p<=endPage; p++){ %>
				
				<%if(currentPage == p){ %>
				<button disabled> <%=p%> </button>
				<%}else{ %>
				<button onclick="location.href='<%=contextPath%>/list.bo?currentPage=<%=p%>';"> <%= p %> </button>
				<%} %>
			
				
			<%} %>
			
			<!-- 다음페이지(>) -->
			<%if(currentPage == maxPage){ %>
			<button disabled> &gt; </button>
			<%}else{ %>
			<button onclick="location.href='<%=contextPath%>/list.bo?currentPage=<%=currentPage+1%>';"> &gt; </button>
			<%} %>
			
			
			<!-- 맨 마지막으로 (>>) -->
			<button onclick="location.href='<%=contextPath%>/list.bo?currentPage=<%=maxPage%>'"> &gt;&gt; </button>
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
		$(function(){
			$(".listArea>tbody>tr").click(function(){
				
				var bId = $(this).children().eq(0).text();
				
				location.href="<%=contextPath%>/detail.bo?bId=" + bId;
			});
		});
	</script>
</body>

</html>
