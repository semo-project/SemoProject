<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.kh.episode.model.vo.Episode"%>
<%
	Episode e = (Episode)request.getAttribute("e");    
%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>세모웹툰</title>

  <!-- Bootstrap core CSS -->
  <link href="resources/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="resources/css/modern-business.css" rel="stylesheet">
<style>
.snip1535 {
  background-color: black;
  border: none;
  color: #ffffff;
  cursor: pointer;
  display: inline-block;
  font-family: 'BenchNine', Arial, sans-serif;
  font-size: 1em;
  font-size: 22px;
  line-height: 1em;
  margin: 15px 40px;
  outline: none;
  padding: 12px 40px 10px;
  position: relative;
  text-transform: uppercase;
  font-weight: 700;
}
.snip1535:before,
.snip1535:after {
  border-color: transparent;
  -webkit-transition: all 0.25s;
  transition: all 0.25s;
  border-style: solid;
  border-width: 0;
  content: "";
  height: 24px;
  position: absolute;
  width: 24px;
}
.snip1535:before {
  border-color: black;
  border-right-width: 2px;
  border-top-width: 2px;
  right: -5px;
  top: -5px;
}
.snip1535:after {
  border-bottom-width: 2px;
  border-color: black;
  border-left-width: 2px;
  bottom: -5px;
  left: -5px;
}
.snip1535:hover,
.snip1535.hover {
  background-color: black;
}
.snip1535:hover:before,
.snip1535.hover:before,
.snip1535:hover:after,
.snip1535.hover:after {
  height: 100%;
  width: 100%;
}
		.replyArea{
			background:black;
			color:black;
			margin:auto;
			width:800px;
		}
  
  #semoweb{
    overflow: hidden;
    position: relative;
    min-width: 978px;
    min-width: 800px;
    
    
  }
  .screen_out{
    overflow: hidden;
    position: absolute;
    width: 0;
    height: 0;
    line-height: 0;
    text-indent: -9999px;
  }
  .btn_comm{
    width: 60px;
    height: 60px;
    border-left: 1px solid #d8d8d8;
    display: block;
    border: 0px;
    background-repeat: no-repeat;
    background-position: center;
    font-size: 1px;
    color: transparent;
    margin: 0;
    padding: 0;
    font: inherit;
  }
  .list_info{
    display: inline-flex;
  }
  .list_control{
    float: right;
    margin-left: auto!important;
   display: flex;
  }
  .viewer__footer--active{
    bottom: 0;
  }
  .viewer__footer{
    background: #fff;
    border-top: 1px solid #d8d8d8;
    height: 60px;
    left: 0;
    position: fixed;
    text-align: center;
    width: 100%;
    z-index: 900;
    
  }
  .item_updown{
    top: 27px;
    position: absolute;
    right: 11px;
    height: 16px;
    line-height: 16px;
  }
  .item_radio{
    margin-left: 300px;
  }
  .btn_report{
    width: 14px;
    display: inline-block;
    overflow: hidden;
    height: 11px;
    vertical-align: top;
  }
</style>
</head>

<body>

	<!-- Navigation -->
	<%@ include file="../common/menubar.jsp" %>

	<!-- Page Content -->
	<div class="menubar">

		<ol class="breadcrumb">
			<h1><a href="index.html" id="semoServiceLogo">logo</a></h1>
			<dl class="list_info">
				<h5 class="txt_title"><a href="만화창.html" class="link_title">&nbsp;&nbsp;&nbsp;&nbsp;<%= e.getWorkTitle() %></a></h5>
				<dt class="screen_out">회차</dt>
				<p class="txt_episode"><span class="ico_comm ico_arrow">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= e.getEpisodeTitle() %> >></span><%=e.getEpisodeNo()%>화</p>
			</dl>
			<ul class="list_control">
				<li>
					<button type="button" class="btn_comm btn_like">좋아요 등록</button>
				</li>
				
				<li>
				    <a href="/" class="btn_comm btn_close">작품홈으로</a>
				</li>
			</ul>
	</div>
	    

    <div class="row"  id="semoweb" style="margin-left: auto;
    width: 1000px;
    margin-right: auto;">

      <!-- Post Content Column -->
      <div class="">
       
        <div class="">
          
        </div>
        <!-- Preview Image -->
        <img class="img-fluid rounded" src="<%= contextPath %>/resources/images/<%= e.getEpisodeModify() %>" alt="" 
        style="width: 100%;
        padding-right: 120px;
        padding-left: 120px;
        margin-right: auto;
        margin-left: auto;">

        <br><br><br>
        <hr>
        <nav id="viewer-footer" class="viewer_footer viewer__footer--active">
  <ul id="episode-nav" class="viewer__nav"  style="list-style:none;">
    <li class="viewer__navItem" style="float: left;">
      <button  class="snip1535" type="button" disabled >이전화</button>
    </li>
    <li class="viewer__navItem" style="float:right">
      <button class="snip1535" type="button" disabled>다음화</button>
    </li>
  </ul>
</nav>
</div>
</div>

        
        <hr>
        <!-- Comments Form -->
        <div class="card my-4 replyArea" style=" width: max-content; margin-right: auto; margin-left: auto; width: 600px;">
        <% if(loginUser != null){ %>
          <h5 class="card-header" style="color: black;">댓글: </h5>
          <div class="card-body">
            <div class="wrap_spo">
              <div class="box_check">
                <input type="checkbox" class="inp_check" id="spoCheck">
                <label for="spoCheck">
                  <span class="ico_comm"></span>
                  <span class="desc_spo" style="color: black;">댓글에 스포일러가 포함된 경우 체크해 주세요.</span>
                </label>
              </div>
            </div>
            <form>
              <div class="form-group">
                <textarea class="form-control" rows="3" id="replyContent" style="resize:none;"></textarea>
              </div>
              <button type="button" class="btn btn-primary" id="addReply">등록</button>
            </form>
          </div>
        </div>
		<% }else{ %>
		 <h5 class="card-header" style="color: black;">댓글: </h5>
          <div class="card-body">
            <div class="wrap_spo">
              <div class="box_check">
                <input type="checkbox" class="inp_check" id="spoCheck">
                <label for="spoCheck">
                  <span class="ico_comm"></span>
                  <span class="desc_spo" style="color: black;">댓글에 스포일러가 포함된 경우 체크해 주세요.</span>
                </label>
              </div>
            </div>
            <form>
              <div class="form-group">
                <textarea class="form-control" rows="3" readonly style="resize:none; font-size: 14px;">로그인한 사용자만 가능한 서비스입니다. 로그인 후 이용해주세요</textarea>
              </div>
              <button type="button" class="btn btn-primary" disabled>등록</button>
            </form>
          </div>
        
       <% } %>

     	 
   
	
	<!-- 댓글 관련 영역 -->
	<div >
		<!-- 댓글 리스트들 보여지는 div -->
		<div id="replyListArea">
			 <table align="center " border="1" align="center" style="width: 600px; margin-left: auto;
    margin-right: auto;
    text-align: center;">
                   
                   <tr>
                      <th width="90px">작성자</th>
                      <th width="200px">제목</th>
                      <th width="100px">작성일</th>
                   </tr>
			<table id="replyList" border="1" align="center" style="width: 600px; text-align: center;" >
				<tr>
				
				</tr>
				<div>
				
				</div>
			</table>
		</div>
		<br><br><br><br>
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
  <script src="resources/js/jquery.min.js"></script>
  <script src="resources/js/bootstrap.bundle.min.js"></script>
  
  <script>
  $(function(){
		// 소스코드 : html문서 로딩 후 바로 실행
		//console.log("문서읽기 완료");
		selectReplyList();
		
		//window.setInterval(selectReplyList, 2000);
		
		$("#addReply").click(function(){
			// 댓글등록 버튼 클릭시 댓글 작성하기 기능수행하는 ajax
			
			// 전달할 값
			var content = $("#replyContent").val(); // 작성된 댓글 내용
			var eNo = <%=e.getEpisodeNo()%>;
			
			if(content != ""){
				$.ajax({
					url:"rinsert.bo",
					data:{
						content:content,
						eNo:eNo
					},
					type:"post",
					success:function(result){
						if(result == 1){
							selectReplyList();
							$("#replyContent").val("");
						}
					},
					error:function(){
						console.log("댓글 작성 ajax 통신실패!!");	
					}					
				});
				
			}else{
				alert("댓글내용작성하세요");
			}
			
			
			
		});
		
	});
	
		$(function() {
			selectReplyList();
		});
		// 이 게시글에 딸려있는 댓글 리스트 조회하는 ajax
		function selectReplyList(){
			var eNo = <%=e.getEpisodeNo()%>;
			
			$.ajax({
				url:"rlist.bo",
				data:{eNo:eNo},
				type:"get",
				success:function(list){
					//console.log(list); // 객체 배열의 형태
					//console.log(1);
					var value = "";
					//for(var i=0; i<list.length; i++){
					for(var i in list){
						value +=  '<tr>' + 
		                           '<td width="90px">' + list[i].memberId + '</td>' +    
		                           '<td width="200px" class="contentArea">' + list[i].content + '</td>' +
		                           '<td width="100px">' + list[i].creationDate + '</td></tr>';
					
					}
					//console.log(value);
					
					$("#replyList").html(value);
					
				},error:function(){
					console.log("댓글 리스트 조회 ajax 통신 실패!!");
				}
			});
		}
	</script>
	
	<script src="<%= request.getContextPath() %>/resources/js/jquery.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/js/bootstrap.bundle.min.js"></script>
 
   
</body>

</html>
