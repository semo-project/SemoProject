<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="list-group">
          <a href="myPage.me" class="list-group-item">내 정보 보기</a>
          <a href="modifyInfo.me" class="list-group-item">내 정보 수정</a>
          <a href="addCookie.me" class="list-group-item">쿠키 충전</a>
          <a href="cookieLog.me" class="list-group-item">쿠키 충전 내역</a>
          <a href="bookmark.me" class="list-group-item">즐겨찾기한 웹툰</a>
          <a href="like.me" class="list-group-item">좋아요한 웹툰</a>
          <a href="question.me" class="list-group-item">문의글 확인</a>
          <a href="usedLog.me" class="list-group-item">웹툰 결제 내역</a>
          <a href="myBoard.me" class="list-group-item">내 게시글 보기</a>
          <a href="withdraw.me" class="list-group-item">회원 탈퇴</a>
          <% if (mem.getApprovalFlag().equals("N") || mem.getApprovalFlag().equals("null")) { %>
      		<a href="authorRequest.me" class="list-group-item">작가 등록 신청</a>
    	  <% } else { %>
      		<a href="#" class="list-group-item">내 작품 관리</a>
         	<a href="#" class="list-group-item">수익 관리</a>
      	  <% } %>
	</div>
</body>
</html>