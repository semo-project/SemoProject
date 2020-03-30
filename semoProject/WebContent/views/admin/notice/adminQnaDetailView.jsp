<%@page import="com.kh.qna.model.vo.QNA"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	QNA q = (QNA)request.getAttribute("qna");

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
                    <h1 class="mt-4">1 : 1 문의 관리</h1>
                    
                    <br>
                    
                    <form method="post" action="adAnswer.qna?pageId=8">
	                    <div class="card mb-4">
	                    
	                        <div class="card-header">
	                        	<label><strong><%=q.getQnaTitle() %></strong> &nbsp;&nbsp;(질문자 아이디 : <strong><%=q.getMemberId() %></strong>)</label>
	                        	<input type="hidden" name="hiddenNo" value="<%=q.getQnaNo()%>">
	                        	<label style="float:right;">
	                        		문의일자 ( <%=q.getQnaDate() %> )
	                        	</label>
	                        </div>
	                        
	                        <div class="card-body">
	
	                            <div class="table-responsive">
	                                <textarea class="diyDiv mb-4" style="width:100%; height:200px; resize:none;" readonly><%=q.getQnaContent() %>
									</textarea>
									<%if(q.getQnaAnswerState().equalsIgnoreCase("Y")) { %>
										<textarea class="diyDiv mb-4" style="width:100%; height:200px; resize:none;" readonly><%=q.getQnaAnswerContent() %></textarea>
									<%} else { %>
										<textarea class="diyDiv mb-4" style="width:100%; height:200px; resize:none; background:white;" name="answer" placeholder="답변을 등록해주세요."></textarea>
									<%} %>
									<div>
										<span>
											<button class="btn btn-dark" type="button" onclick="goList();">목록으로</button>
										</span>
										<%if(q.getQnaAnswerState().equalsIgnoreCase("N")) { %>
											<span style="float: right;" >
												<button class="btn btn-warning" type="submit">답변하기</button>
		                                	</span>
										<%} %>										
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
    
    <script>
    	function goList() {
    		location.href = "<%=contextPath%>/alist.qn?pageId=8";
    	}
    </script>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
    <script src="assets/demo/datatables-demo.js"></script>

</body>
</html>