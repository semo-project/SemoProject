<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.writer.model.vo.Writer" %>
<%
	Writer w = (Writer)request.getAttribute("w");

%>
<!DOCTYPE html>
<html lang="en">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<body class="sb-nav-fixed">
    
    <%@ include file="../common/adminTopNav.jsp" %>
    
    <div id="layoutSidenav">
        
        <%@ include file="../common/adminSideNav.jsp" %>

        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid">
                    <h1 class="mt-4">작가 대기 회원 보기</h1>
                    <br>

                    <div class="diyDiv mb-4">
                        <label>작가 대기 회원 작품</label>
                        <button class="btn btn-primary right"><a href="writerApprv.wr?pageId=1" style="color:white;">뒤로 가기</a></button>
                        <button class="btn btn-danger right" id="approvBtn">승인 하기</button>
                    </div>
                    
                    <table class="table table-bordered">
                        <tr>
                            <td style="width: 30%;">
                                <label>작가명</label>
                                <div class="diyDiv">
                                	<%=w.getWriterNickname() %>
                                </div>

                                <div class="dropdown-divider"></div>

                                <label>작품 설명</label>
                                <div class="diyDiv">
                                	<%=w.getRepWorkExp() %>
                                </div>

                                <div class="dropdown-divider"></div>

                                <label>은행 및 계좌번호</label>
                                <div class="diyDiv">
                                   	 작가 승인 시 확인 가능합니다.
                                </div>
                            </td>
                            <td>
                            	<img src="<%=contextPath %>/resources/author_request/<%=w.getChangeName() %>">
                            </td>
                        </tr>
                    </table>
                </div>
            </main>
            
            <%@ include file="../common/adminFooter.jsp" %>
            
        </div>
    </div>
    <script>
    	$(function() {
    		$("#approvBtn").click(function(){
    			var no = <%=w.getWriterNo()%>
    			location.href = "<%=contextPath%>/approvAction.wr?writerAprv=" + no;
    		});
    	});
    </script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/admin1.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/admin-datatables.js"></script>
</body>
</html>
