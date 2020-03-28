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

  <title>Modern Business - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/modern-business.css" rel="stylesheet">
<style>
		.replyArea{
			background:black;
			color:white;
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
				    <button type="button" class="btn_comm btn_nonstop">정주행켜기</button>
				</li>
				<li>
				    <button type="button" class="btn_comm btn_fullscreen" data-go-on="click" >전체화면</button>
				</li>
				<li>
				    <a href="/" class="btn_comm btn_close">작품홈으로</a>
				</li>
			</ul>
	</div>
	    

    <div class="row"  id="semoweb">

      <!-- Post Content Column -->
      <div class="">
       
        <div class="">
          
        </div>
        <!-- Preview Image -->
        <img class="img-fluid rounded" src="http://placehold.it/900x300" alt="" 
        style="width: 100%;
        padding-right: 120px;
        padding-left: 120px;
        margin-right: auto;
        margin-left: auto;">

        <br>

<nav id="viewer-footer" class="viewer_footer viewer__footer--active">
  <ul id="episode-nav" class="viewer__nav">
    <li class="viewer__navItem" style="float: left;">
      <button  class="viewer__navBtn--prev" type="button" disabled >이전화</button>
    </li>
    <li class="viewer__navItem" style="float:right">
      <button class="viewer__navBtn--next" type="button" disabled>다음화</button>
    </li>
  </ul>
</nav>

<br><br>
        <hr>
</div>
        
        <hr>
        <!-- Comments Form -->
        <div class="card my-4 replyArea" style=" width: max-content; margin-right: auto; margin-left: auto; width: 70%;">
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
        </div>
       <% } %>

     	 
   
	
	<!-- 댓글 관련 영역 -->
	<div >
		
		
		
		<!-- 댓글 리스트들 보여지는 div -->
		<div id="replyListArea">
			<table id="replyList" border="1" align="center">
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
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
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
						value += '<tr>' + 
									'<td width="100px">' + list[i].memberId + '</td>' +    
									'<td width="330px">' + list[i].content + '</td>' +
									'<td width="150px">' + list[i].creationDate + '</td>' +
									'<td><button type="button" data-toggle="modal" data-target="#myModal2" >신고</button></td>'+
								 '</tr>';
								 
					/* 	value +='<div class="">' +
				          
							          '<div class="list_cmt">' +
							            '<span class="desc_info">' +
							            '<strong class="txt_nick">' + list[i].memberId + '</strong>'+
							            '<span class="txt_date">' + list[i].creationDate + '</span>'+
							            '<span class="txt_bar"></span>' +
							            '<button type="button" class="btn_comm_btn_report btn_report_parent">신고</button>'+
							          	'</span>'+
										'<textarea class="form-control" rows="3" cols="100">' + list[i].content + '</textarea>'+
							            '</div>'+
							          '</div>'; */
					}
					console.log(value);
					
					$("#replyList").html(value);
					
				},error:function(){
					console.log("댓글 리스트 조회 ajax 통신 실패!!");
				}
			});
		}
	</script>
 
   
</body>

</html>
