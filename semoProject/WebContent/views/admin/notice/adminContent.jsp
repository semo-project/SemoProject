<%@page import="com.kh.content.model.vo.Content"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Content> list = (ArrayList<Content>)request.getAttribute("list");

	//공지사항 삭제
	String deleteMsg = (String)session.getAttribute("deleteMsg");
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
<body class="sb-nav-fixed">
    
    <%@ include file="../common/adminTopNav.jsp" %>
    
    <div id="layoutSidenav">
        
        <%@ include file="../common/adminSideNav.jsp" %>
        
	    <div id="layoutSidenav_content">
	        <main>
	            <div class="container-fluid">
	                <h1 class="mt-4">자주 묻는 질문 관리</h1>
	
	                <br>
	                <div class="card mb-4">
	                    <div class="card-header"><i class="fas fa-table mr-1" id="tr2"></i>자주 묻는 질문 목록
	                    </div>
	                    <div class="card-body">
	
	                        <div class="table-responsive">
	                            <table class="table table-bordered" id="memberTable" width="100%" cellspacing="0">
	                                <thead>
	                                    <tr>
	                                        <th>번호</th>
	                                        <th>제목</th>
	                                    </tr>
	                                </thead>
	                                
	                                <tbody>
	                                <% if(list.size() != 0) {%>
	                                	<% for(Content c : list) { %>
	                                    <tr class="contentTr">
	                                        <td><%=c.getContactNo() %></td>
	                                        <td style="color:blue; cursor:pointer;"><%=c.getContactTitle() %></td>
	                                    </tr>
	                                    <% } %>
	                                <% } else { %>
	                                	<tr>
	                                		<td colspan="2" style="text-align: center">조회된 데이터가 없습니다.</td>
	                                	</tr>
	                                <% } %>
	                                </tbody>
	                            </table>
	                            
	                            <div style="float: right;" >
									<button class="btn btn-dark" type="button" id="insertBtn">작성하기</button>
                                </div>
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
	    $(".contentTr").click(function() {
	    	// 글 번호
	    	var no = $(this).children().eq(0).text();
	    	location.href = "<%=contextPath%>/adContentDetail.no?pageId=9&&no=" + no;
	    });
		$("#insertBtn").click(function() {
			location.href = "<%=contextPath%>/adInsertForm.no?pageId=9";
		});
		
		$(function() {
			// 삭제 메시지
			var msg = "<%=deleteMsg%>";
    		
    		if(msg != "null") {
    			alert(msg);
    			<% session.removeAttribute("deleteMsg");%>
    			<% deleteMsg = null; %>
    			msg = "null";
    		}
		});
	</script>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
	<script src="assets/demo/datatables-demo.js"></script>

</body>
</html>