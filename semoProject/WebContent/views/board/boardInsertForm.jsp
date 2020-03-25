<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%= request.getContextPath()%>/resources/css/boardmain.css" rel="stylesheet">
<style>
	.boardInsert{
		margin-top:4%;
	}
	.sidebar{
		display:block;
	}
	/* The Modal (background) */
    .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    /* Modal Content/Box */
    .modal-content {
        background-color: #fefefe;
        margin: 15% auto; /* 15% from the top and centered */
        padding: 20px;
        border: 1px solid #888;
        width: 50%; /* Could be more or less, depending on screen size */                          
    }
    /* The Close Button */
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }
    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
	
</style>
</head>
<body>
	
	<%@ include file="../common/menubar.jsp" %>
	
	<!-- 사이드바 -->
	<div class="sidebar">
		<!-- Page Heading/Breadcrumbs -->
	    <h1 class="mt-4 mb-3">그림게시판
	      <!-- <small>Subheading</small> -->
	    </h1>
	
	    <ol class="breadcrumb">
	      <li class="breadcrumb-item">
	        <a href="Notice_공지사항.html">세모게시판 > 웹툰 TalkTalk</a>
	      </li>
	    </ol>
	
	    <!-- Content Row -->
	    <div class="row">
	      <!-- Sidebar Column -->
	      <div class="col-lg-3 mb-4">
	        <div class="list-group">
	          <a href="semoBoard.html" class="list-group-item">그림게시판</a>
	          <a href="boardList.bo" class="list-group-item">웹툰 TalkTalk</a>
	          <a href="talkfree.html" class="list-group-item">수다수다 유머방</a>
        	</div>
      	  </div>
    	</div>
	</div>
	
	<div class="boardInsert">
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
	
	<form id="insertForm" action="<%=contextPath%>/insertWebTalk.bo" method="post">
		<table align="center">
			<tr>
				<th>제목</th>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="20" name="content" style="resize:none;"></textarea>
				</td>
			</tr>
			<input type="hidden" name="writer" value="<%= loginUser.getMemberNo() %>">
		</table>
		
		<div class="btns" align="center">
			<button type="button" onclick="location.href='boardList.bo'">취소</button>
			<button type="submit">작성</button>
		</div>
		
	</form>
		<!-- 모달창 -->
		<button id="okBtn">확인</button>
	    <button id="cancelBtn">취소</button>
	 
	    <!-- 모달 영역 -->
	    <div id="myModal" class="modal">
	    
	      <!-- 모달 내용 -->
	      <div class="modal-content">
	        <span class="close">&times;</span>                                                               
	        <p>게시물을 올리시겠습니끼?</p>
	        <div class="modalBtn">
	        	<button type="button">취소</button>
	        	<button type="button">확인</button>
	        </div>
	      </div>
	 
	    </div>
	<script>
		// Get the modal
	    var modal = document.getElementById('myModal');
	
	    // Get the button that opens the modal
	    var btn = document.getElementById("okBtn");
	
	    // Get the <span> element that closes the modal
	    var span = document.getElementsByClassName("close")[0];                                          
	
	    // When the user clicks on the button, open the modal 
	    btn.onclick = function() {
	        modal.style.display = "block";
	    }
	
	    // When the user clicks on <span> (x), close the modal
	    span.onclick = function() {
	        modal.style.display = "none";
	    }
	
	    // When the user clicks anywhere outside of the modal, close it
	    window.onclick = function(event) {
	        if (event.target == modal) {
	            modal.style.display = "none";
	        }
	    }
	</script>
</body>
</html>