<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.board.model.vo.Board, com.kh.member.model.vo.Member, com.kh.board.model.vo.Comment" %>
<%
	Board b = (Board)request.getAttribute("b");

	Comment c = new Comment();
	Member m = new Member();
	Member loginUser2 = (Member)session.getAttribute("loginUser");
	
	if(loginUser2 != null) {
		m = loginUser2;
	}
	
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
	commentArea>table tr{
		margin-top:5px;
	}
	#modal {
		display:none;
		background-color:#FFFFFF;
		position:absolute;
		top:500px;
		left:200px;
		padding:10px;
		border:2px solid #E2E2E2;
		z-Index:9999
	}
	#modal2 {
		display:none;
		background-color:#FFFFFF;
		position:absolute;
		top:500px;
		left:200px;
		padding:10px;
		border:2px solid #E2E2E2;
		z-Index:9999
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
        <a href="freeList.bo">세모게시판</a> > <a href="freeList.bo">수다수다 유머방</a>
      </li>
    </ol>

    <!-- Content Row -->
    <div class="row">
      <!-- Sidebar Column -->
      <div class="col-lg-3 mb-4">
        <div class="list-group">
          <a href="boardList.bo" class="list-group-item">웹툰 TalkTalk</a>
          <a href="freeList.bo" class="list-group-item">수다수다 유머방</a>
        </div>
      </div>
    </div>
    <!-- /.row -->
    
      <!-- Content Column -->
      
      <div class="semoTalk">
          <table style="width: 600px;margoin-left: auto;margin-left: 25%;margin-top: -19%;">
              <tr style="border-bottom:1px solid rgb(163, 160, 160);">
                  <td>
                      <h2>수다수다 유머방</h2>
                  </td>
              </tr>
              <tr style="border:1px solid rgb(163, 160, 160); margin-top: 5px;">
                  <td>
                      <h6>재미있는 유머들이 가득한 곳!</h6>
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
          		<th></th>
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
          		<th><button id="freeBoardList" onclick="location.href='freeList.bo'">목록</button></th>
          	</tr>
          </table>
          
          <!-- 게시글 작성자일경우 수정,삭제 버튼 -->
          <div class="btns" align="right">
          	<% if(loginUser != null && loginUser.getMemberNickname().equals(b.getBoardWriter())) {%>
          		<button onclick="location.href='<%=contextPath%>/freeUpdateForm.bo?boardNo=<%=b.getBoardNo()%>'">수정</button>
				<button onclick="deleteFree();">삭제</button>
			<% }else if(loginUser != null && loginUser.getMemberNickname() != (b.getBoardWriter())){ %>
				<button id="reportBtn">게시글 신고</button>
				
				<!-- 게시글 신고 모달 -->
				<div id="modal">
	    			<table>
	    				<tr>
		    				<th><h4>신고하기</h4></th>
	    				</tr>
	    				<tr>
	    					<th colspan="3"><hr></th>
	    				</tr>
	    				<tr>
	    					<td>제 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목 : </td>
	    					<td align="left"><%=b.getBoardTitle()%></td>
	    				</tr>
	    				<tr>
	    					<td>작&nbsp;성&nbsp;자  : </td>
	    					<td><%=b.getBoardWriter()%></td>
	    				</tr>
	    				<tr>
	    					<th colspan="3"><hr></th>
	    				</tr>	
	    				<tr>
	    					<td></td>
	    					<td><input type="radio" name="reportList" id="advertise" value="advertise"><label style="margin-left:4px;">부적절한 홍보 게시글</label></td>
	    					<td style="width:40px;"></td>
	    				</tr>
	    				<tr>
	    					<td></td>
	    					<td><input type="radio" name="reportList" id="salacity" value="salacity"><label style="margin-left:4px;">음란성 또는 청소년에게 부적합한 내용</label></td>
	    				</tr>
	    				<tr>
	    					<td></td>
	    					<td><input type="radio" name="reportList" id="defamation" value="defamation"><label style="margin-left:4px;">명예훼손/사생활 침해 및 욕설 등</label></td>
	    				</tr>
	    				<tr>
	    					<td></td>
	    					<td><input type="radio" name="reportList" id="etc" value="etc"><label style="margin-left:4px;">기타</label>
	    					</td>
	    				</tr>
	    				<tr>
	    					<th colspan="3"><hr></th>
	    				</tr>
	    				<tr>
	    					<td rowspan="2" colspan="3"><textarea name="reportContent" id="reportContent" placeholder="내용을 입력하세요." style="resize:none; width:400px; height:100px; margin-left:3%;"></textarea></td>
	    				</tr>
	    			</table>
	    			<br>
	    			<button class="btn btn-warning" type="submit" id="repOkBtn" align="center">확인</button>
	    			<button class="btn btn-warning" type="submit" id="repXBtn" align="center">취소</button>
	    			<!-- <button class="repCloseBtn">닫기</button> -->
				</div>
	    			
	          </div>
	          <%}else{ %>
	          		<input type="hidden">
	          <%} %>
		</div>
		
		<!-- 댓글 신고 모달 -->
				<div id="modal2">
	    			<table>
	    				<tr>
		    				<th><h4>신고하기</h4></th>
	    				</tr>
	    				<tr>
	    					<th colspan="3"><hr></th>
	    				</tr>
	    				<tr id="conwriterRep" class="conwriterRep">
	    					<td>작&nbsp;성&nbsp;자  : </td>
	    					<td>
	    						
	    					</td>
	    				</tr>
	    				<tr id="contentRep" class="contentRep">
	    					<td>내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용 : </td>
	    					<td align="left">
	    						
	    					</td>
	    				</tr>
	    				<tr>
	    					<th colspan="3"><hr></th>
	    				</tr>	
	    				<tr>
	    					<td></td>
	    					<td><input type="radio" name="comRepList" id="advertise" value="advertise"><label style="margin-left:4px;">부적절한 홍보 게시글</label></td>
	    					<td style="width:40px;"></td>
	    				</tr>
	    				<tr>
	    					<td></td>
	    					<td><input type="radio" name="comRepList" id="salacity" value="salacity"><label style="margin-left:4px;">음란성 또는 청소년에게 부적합한 내용</label></td>
	    				</tr>
	    				<tr>
	    					<td></td>
	    					<td><input type="radio" name="comRepList" id="defamation" value="defamation"><label style="margin-left:4px;">명예훼손/사생활 침해 및 욕설 등</label></td>
	    				</tr>
	    				<tr>
	    					<td></td>
	    					<td><input type="radio" name="comRepList" id="etc" value="etc"><label style="margin-left:4px;">기타</label>
	    					</td>
	    				</tr>
	    				<tr>
	    					<th colspan="3"><hr></th>
	    				</tr>
	    				<tr>
	    					<td rowspan="2" colspan="3"><textarea name="comRepContent" id="comRepContent" placeholder="내용을 입력하세요." style="resize:none; width:400px; height:100px; margin-left:3%;"></textarea></td>
	    				</tr>
	    			</table>
	    			<br>
	    			<button class="btn btn-warning" type="submit" id="comRepBtn" align="center">확인</button>
	    			<button class="btn btn-warning" type="submit" id="comRepXBtn" align="center">취소</button>
	    			<!-- <button class="repCloseBtn">닫기</button> -->
				</div>
				
	<script>
      	function deleteFree(){
      		if(confirm("정말로 삭제하시겠습니까?")){
      			location.href="<%=contextPath%>/freeDelete.bo?boardNo=<%=b.getBoardNo()%>";
      		}
      	}
    </script>
    
    <!-- 게시글 신고 모달 -->
    <script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/modal.js"></script>
	<script type="text/javascript">
		// 모달창 인스턴트 생성
		var myModal = new Example.Modal({
	    	id: "modal" // 모달창 아이디 지정
		});
	  
		// 모달 창 여는 버튼에 이벤트 걸기
		$("#reportBtn").click(function() {
	    	myModal.show(); // 모달창 보여주기
		});
	  
		// 모달 창 안에 있는 확인 버튼에 이벤트 걸기
		$("#repOkBtn").click(function() {
	  	  	myModal.hide(); // 모달창 감추기
		});
		
		// 모달 창 안에 있는 취소 버튼에 이번트 걸기
		$("#repXBtn").click(function(){
			myModal.hide();
		});
	</script>
	


	<script>
		$(function(){
			$("#repOkBtn").click(function(){
				
				var boardNo = <%=b.getBoardNo()%>;
				var reporterNo = "<%=m.getMemberNo()%>";
				var boardWriter = "<%=b.getBoardWriter()%>";
				var reportRadio = $('input[name="reportList"]:checked').val();
				var reportContent = $("#reportContent").val();
				
				$.ajax({
					url:"boardReport.bo",
					data:{
						boardNo:boardNo,
						reporterNo:reporterNo,
						boardWriter:boardWriter,
						reportRadio:reportRadio,
						reportContent:reportContent
					},
					type:"post",
					success:function(result){
						if(result > 0){
							myModal.hide();
							alert("신고가 완료되었습니다.");
						}
					},
					error:function(){
						console.log("게시판신고 ajax 실패");
					}
				});
			});
		});
	</script>
      
		<!-- 댓글 작성 폼 -->
		<div class="commentArea">
			<!-- 댓글 작성 table -->
			<table border="0" align="center">
				<tr>
					<th>댓글</th>
					<% if(loginUser != null){ %>
						<td><textarea id="commentContent" rows="3" cols="60" style="resize:none"></textarea></td>
						<td><button class="btn btn-warning" id="addComment">댓글 작성</button>
					<%}else{ %>
						<td><textarea readonly rows="3" cols="60" style="resize:none"></textarea></td>
						<td><button class="btn btn-warning" disabled>댓글 작성</button>
					<% } %>
				</tr>
			</table>
			
			<!-- 댓글 리스트 area -->
			<div id="commentListArea">
				<table id="commentList" border="0" align="center" style="margin-top:10px;">
					 
				</table>
			</div>
		</div>
     
      <script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/modal2.js"></script>
      <script>
      var m = "<%=m.getMemberNickname()%>";
      var c = "<%=c.getCommentContent()%>";
      
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
      		
      		$.ajax({
      			url:"commentList.bo",
      			data:{boardNo:boardNo},
      			type:"get",
      			success:function(list){
      				var value="";
 					
      				for(var i in list){
						value += '<tr style="margin-top:5px;">' + 
									'<td width="90px">' + list[i].commentWriter + '</td>' +    
									'<td width="239px" class="contentArea">' + list[i].commentContent + '</td>' +
									'<td width="100px">' + list[i].commentDate + '</td>';
									
						if(m != null && m == list[i].commentWriter){
							/* 댓글 삭제 버튼 */
							value += '<td width="70px">' + '<button class="comDelBtn" style="border:0; background-color: white;" value="' + list[i].commentNo + '">' + 
									 '<img style="width:10px; height:10px; border-radius:10px; margin-bottom:5px;" src="resources/images/xxxx.jpeg">' +
									 '</button>' + '</td>' +
									 '</tr>';
						}else{
							/* 댓글 신고 버튼 */
							value += '<td width="70px">' + '<button class="comRepBtn" style="border:0; background-color: white;" value="' + list[i].commentNo + '">' + 
									 '<img style="width:10px; height:10px; border-radius:10px; margin-bottom:5px;" src="resources/images/report.png">' + 
									 '</button>' + '</td>'+
									 '</tr>';							
						}		
						
					}
 					
      				$("#commentList").html(value);
      				
      			},
      			error:function(){
      				console.log("댓글 리스트  ajax 통신실패");
      			}
      		});
      	}
      	/* 댓글 삭제 기능 */
      	$(document).on("click",".comDelBtn",function commentDel(){
      		var comdel = $(this).val();
      		
      		if(confirm("정말로 삭제하시겠습니까?")){
      			$.ajax({
      	             url:"comDelete.bo",
      	            data : {
      	               comdel:comdel
      	            },
      	            type : "POST",
      	            success : function(result) {
      	            	if(result > 0){
      	            		alert("댓글이 삭제되었습니다.");
      	            		selectCommentList();
      	            	}
      	            },
      	            error : function() {
      	               console.log("ajax 통신 실패!!");
      	            }
      	         });
      		}
      	});
      	
      </script>
        
       <!-- 댓글 신고 모달 -->
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/modal2.js"></script>
		<script type="text/javascript">
			
		// 모달창 인스턴트 생성
			var myModal2 = new Example.Modal({
		    	id: "modal2" // 모달창 아이디 지정
			});
		  	
			// 모달 창 여는 버튼에 이벤트 걸기
			$(document).on("click",".comRepBtn",function commentRep() {
		    	myModal2.show(); // 모달창 보여주기
		    	var memberNo = "<%=m.getMemberNo()%>";
		    	var comReportNo = $(this).val();
		    	
		    	var commentWriter = $("#conwriterRep").val();
		    	var commentContent = $("#contentRep").val();
		    	$.ajax({
		    		url:"comReport.bo",
		    		data:{
		    			comReportNo:comReportNo,
		    			commentWriter:commentWriter,
		    			commentContent:commentContent
		    		},
		    		type:"post",
		    		success:function(c){
		    			console.log(c);
		    			var value1 ="";
		    			var value2 ="";
		    			
    					value1 = '<td>작&nbsp;성&nbsp;자  : </td>' +
    					'<td>' + c.commentWriter + '</td>'; 
						
    					$("#conwriterRep").html(value1);
    					
		    			value2 = '<td>내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용 : </td>' + 
    							 '<td align="left">' + c.commentContent + '</td>';
    					
		    			$("#contentRep").html(value2);
		    			
		    		},
		    		error:function(){
		    			console.log("댓글신고 ajax 통신 실패");
		    		}
		    	});
		    	
				// 모달 창 안에 있는 확인 버튼에 이벤트 걸기
			    $("#comRepBtn").click(function(){
			    	
			    	var comRepRadio = $('input[name="comRepList"]:checked').val();
					var comRepContent = $("#comRepContent").val();
					
					console.log(comReportNo);
					console.log(comRepRadio);
					console.log(comRepContent);
					
					$.ajax({
						url:"comRepSend.bo",
						data:{
							comReportNo:comReportNo,
							comRepRadio:comRepRadio,
							comRepContent:comRepContent,
							memberNo:memberNo
						},
						type:"post",
						success:function(result){
							if(result > 0){
								myModal2.hide(); // 모달창 감추기
								alert("신고가 완료되었습니다.");
							}
						},
						error:function(){
							console.log("댓글신고 ajax 통신실패");
						}
					});
			    });
			});
			
			
			// 모달 창 안에 있는 취소 버튼에 이번트 걸기
			$("#comRepXBtn").click(function(){
				myModal2.hide();
			});
		</script>  
<!-- /.container -->
<!-- Bootstrap core JavaScript -->
  <script src="<%= request.getContextPath() %>/resources/js/jquery.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/js/bootstrap.bundle.min.js"></script>

</body>
</html>