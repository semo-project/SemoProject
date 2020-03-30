<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.kh.notice.model.vo.Notice" %>  
<%
	Notice n = (Notice)request.getAttribute("notice");
%>
<!DOCTYPE html>
<html>
<head>
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
                    <h1 class="mt-4">공지사항 관리</h1>
                    
                    <br>
                    <form method="post" action="<%=contextPath%>/adUpdate.no?pageId=7">
                    <div class="card mb-4">
                        <div class="card-header">
                        	<input type="hidden" name="no" value="<%=n.getNoticeNo()%>">
                        	<input type="text" class="form-control" name="title" value="<%=n.getNoticeTitle() %>">
                        </div>
                        <div class="card-body">

                            <div class="table-responsive">	
                                <textarea name="content" class="diyDiv mb-4" style="width:100%; height:450px; resize:none;"><%=n.getNoticeContent() %></textarea>
								<div>
									<button class="btn btn-dark" style="float: right;" type="submit">수정하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    </form>
                </div>
            </main>
           
           	<%@ include file ="../common/adminFooter.jsp" %>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
    <script src="assets/demo/datatables-demo.js"></script>

</body>
</html>