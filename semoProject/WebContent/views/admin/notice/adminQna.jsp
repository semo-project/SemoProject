<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.qna.model.vo.QNA"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<QNA> list = (ArrayList<QNA>)request.getAttribute("list"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
	<title>Admin Page</title>
	<link href="resources/css/admin_styles.css" rel="stylesheet" type="text/css"/>
	<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
</head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<body>
    <%@ include file="../common/adminTopNav.jsp" %>
    
    <div id="layoutSidenav">
        
        <%@ include file="../common/adminSideNav.jsp" %>
        
	<div id="layoutSidenav_content">
	    <main>
	        <div class="container-fluid">
	            <h1 class="mt-4">1 : 1 문의 관리</h1>
	
	            <br>
	            
	            <div class="card mb-4">
	                <div class="card-header"><i class="fas fa-table mr-1"></i>1:1문의 목록
	                    
	                </div>
	                <div class="card-body">
	
	                    <div class="table-responsive">
	                        <table class="table table-bordered" id="memberTable" width="100%" cellspacing="0">
	                            <thead>
	                                <tr>
	                                    <th>글 번호</th>
	                                    <th>작성자 아이디</th>
	                                    <th>문의 분류</th>
	                                    <th>제목</th>
	                                    <th>작성시간</th>
	                                    <th>답변여부</th>
	                                </tr>
	                            </thead>
	                            
	                            <tbody>
	                            <% if(list.size() != 0) { %>
	                            	<% for(QNA q : list) { %>
	                                <tr class="qnaTr" > 
	                                    <td><%=q.getQnaNo() %></td>
	                                    <td><%=q.getMemberId() %></td>
	                                    <td>
	                                    	<%if (q.getQnaContentNo() == 1) { %>로그인/계정
	                                    	<% } else if(q.getQnaContentNo() == 2) { %>컨텐츠
	                                    	<% } else { %>기타<%} %>
	                                    </td>
	                                    <td style="color:blue; cursor:pointer;"><%=q.getQnaTitle() %></td>
	                                    <td><%=q.getQnaDate() %></td>
	                                    <td><%=q.getQnaAnswerState() %></td>
	                                </tr>
	                                <% } %>
	                            <% } else { %>
	                            	<tr>
	                            		<td colspan="5" style="text-align:center;">조회된 데이터가 없습니다.</td>
	                            	</tr>
	                            <% } %>
	                            </tbody>
	                        </table>
	
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </main>
	        
	        <%@ include file="../common/adminFooter.jsp" %>
	    </div>
	</div>
	
	<script>
		// 디테일 보여주는 거
	    $(".qnaTr").click(function() {
	    	// 글 번호
	    	var no = $(this).children().eq(0).text();
	    	location.href = "<%=contextPath%>/adDetail.qna?pageId=8&&no=" + no;
	    });
	</script>	

</body>
</html>