<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.board.model.vo.Board" %>
<%
	Board b = (Board)request.getAttribute("b");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%= request.getContextPath()%>/resources/css/boardmain.css" rel="stylesheet">
<style>
	.outer{
		width:800px;
		height:500px;
		background:white;
		color:black;
		margin-left:15%;
		margin-top:50px;
	}
	.outer>table, .outer>table tr>*{
		border:1px solid white;
	}
	.outer>table{
		width:600px;
		height:300px;
	}
	.outer>table p{
		height:230px;
	}
	
	.replyArea{
		background:white;
		color:black;
		margin:auto;
		width:800px;
	}
	#boardReport{
		pointer:cursor;
	}
	#comUpBtn{
		background:red;
	}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	 <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">웹툰 TalkTalk
      <!-- <small>Subheading</small> -->
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="boardList.bo">세모게시판</a> > <a href="boardList.bo">웹툰 TalkTalk</a>
      </li>
    </ol>

    <!-- Content Row -->
    <div class="row">
      <!-- Sidebar Column -->
      <div class="col-lg-3 mb-4">
        <div class="list-group">
          <a href="boardList.bo" class="list-group-item">웹툰 TalkTalk</a>
          <a href="semoBoard.html" class="list-group-item">그림게시판</a>
          <a href="talkfree.html" class="list-group-item">수다수다 유머방</a>
        </div>
      </div>
    </div>
    <!-- /.row -->
    
      <!-- Content Column -->
      
      <div class="semoTalk">
          <table style="width: 600px;margoin-left: auto;margin-left: 25%;margin-top: -19%;">
              <tr style="border-bottom:1px solid rgb(163, 160, 160);">
                  <td>
                      <h2>웹툰TalkTalk</h2>
                  </td>
              </tr>
              <tr style="border:1px solid rgb(163, 160, 160); margin-top: 5px;">
                  <td>
                      <h6>웹툰에 대해 자유롭게 얘기해보아요!</h6>
                  </td>
              </tr>
          </table>
          
      </div>
      
</div>
		<div class="outer" style="margin-left:30%; margin-top: -0.1%;">
          <table>
          	<tr>
          		<th>No.<%=b.getBoardNo() %></th>
          		<th colspan="3" align="center"><%=b.getBoardTitle() %></th>
          		<th></th>
          		<th style="font-size:small;"><input type="button" id="boardReport" onclick="boardReport();" value="게시글신고"></th>
          	</tr>
          	<tr>
          		<th></th>
          		<th></th>
          		<th colspan="3"></th>
          		<th><%=b.getBoardWriteDate() %></th>
          	</tr>
          	<tr>
          		<th colspan="4"></th>
          		<th>작성자 : </th>
          		<th><%=b.getBoardWriter() %></th>
          	</tr>
          	<tr>
          		<th colspan="4"></th>
         		<th>조회수 : </th>
          		<th><%=b.getBoardCnt() %></th>          		          	
          	</tr>
          	<tr>
          		<td colspan="5">
          			<p><%=b.getBoardContent() %></p>
          		</td>
          	</tr>
          	<tr>
          		<th><button id="webBoardList" onclick="location.href='boardList.bo'">목록</button></th>
          	</tr>
          </table>
          
          <!-- 게시글 작성자일경우 수정,삭제 버튼 -->
          <div class="btns" align="right">
          	<% if(loginUser != null && loginUser.getMemberNickname().equals(b.getBoardWriter())) {%>
          		<button onclick="location.href='<%=contextPath%>/updateForm.bo?boardNo=<%=b.getBoardNo()%>'">수정</button>
				<button onclick="deleteWeb();">삭제</button>
			<% } %>
          </div>
		
		</div>
		
	<script>
      	function deleteWeb(){
      		if(confirm("정말로 삭제하시겠습니까?")){
      			location.href="<%=contextPath%>/webDelete.bo?boardNo=<%=b.getBoardNo()%>";
      		}
      	}
    </script>
      
		<!-- 댓글 작성 폼 -->
		<div class="commentArea">
			<!-- 댓글 작성 table -->
			<table border="1" align="center">
				<tr>
					<th>댓글</th>
					<% if(loginUser != null){ %>
						<td><textarea id="commentContent" rows="3" cols="60" style="resize:none"></textarea></td>
						<td><button id="addComment">댓글 작성</button>
					<%}else{ %>
						<td><textarea readonly rows="3" cols="60" style="resize:none"></textarea></td>
						<td><button disabled>댓글 작성</button>
					<% } %>
				</tr>
			</table>
			
			<!-- 댓글 리스트 area -->
			<div id="commentListArea" style="margin-bottom:5%;">
				<table id="commentList" border="1" align="center">
					 
				</table>
			</div>
		</div>
       
      
      
      <script>
      	$(function(){
      		selectCommentList();
      		setInterval(selectCommentList(), 2000);
      		
      		$("#addComment").click(function(){
	      		var content = $("#commentContent").val();
	      		var boardNo = <%=b.getBoardNo()%>;
	      		
	      		//댓글 작성 ajax
	      		$.ajax({
	      			url:"commentInsert.bo",
	      			data:{
	      				content:content,
	      				boardNo:boardNo
	      			},
	      			type:"post",
	      			success:function(result){
	      				if(result==1){
	      					selectCommentList();
	      					$("#commentContent").val("");
	      				}
	      			},
	      			error:function(){
	      				console.log("댓글 ajax 통신 실패");
	      			}
	      		});
      			
      		});
      		
      	});
      	
      	// 댓글 리스트 가져오는 ajax
      	function selectCommentList(){
      		var boardNo = <%=b.getBoardNo()%>;
      		var loginUser = <%=session.getAttribute("loginUser")%>;
      		
      		console.log(loginUser);
      		$.ajax({
      			url:"commentList.bo",
      			data:{boardNo:boardNo},
      			type:"get",
      			success:function(list){
      				var value="";
 					console.log(list); 
 					console.log(loginUser);
      				for(var i in list){
						value += '<tr>' + 
									'<td width="90px">' + list[i].commentWriter + '</td>' +    
									'<td width="330px">' + list[i].commentContent + '</td>' +
									'<td width="100px">' + list[i].commentDate + '</td>';
									
						if(loginUser != null && loginUser.getMemberNickname().equals(list[i].commentWriter)){
							value += '<td width="70px">' + '<button id="comUpBtn" style="border:0;">' + '[수정]' + '</button>' + '</td>' +
									 '<td width="70px">' + '<button id="comDelBtn" style="border:0;">' + '[삭제]' + '</button>' + '</td>';
						}			
							value += '</tr>';
					}
 					console.log(list);     				
      				
      				$("#commentList").html(value);
      			},
      			error:function(){
      				console.log("댓글 리스트  ajax 통신실패");
      			}
      		});
      		
      	}
      </script>
          
<!-- /.container -->
<!-- Bootstrap core JavaScript -->
  <script src="<%= request.getContextPath() %>/resources/js/jquery.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/js/bootstrap.bundle.min.js"></script>

</body>
</html>