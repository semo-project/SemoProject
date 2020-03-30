<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.work.model.vo.Work" %>
<%
	Work w = (Work)request.getAttribute("work");
%>
<!DOCTYPE html>
<html lang="en">
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
                    <h1 class="mt-4">작품 등록 및 승인</h1>
                    
                    <br>                        

                    <table class="table">
                        <tr>
                            <td class="workThumbnail">
                                <img class="img-thumbnail" src="<%=contextPath %>/resources/work_upfiles/<%=w.getThumbnailModify() %>" alt="">
                            </td>
                            <td rowspan="2" style="width: 30%; ">
                                <div class="diyDiv" style="height:340px;">
                                    <label class="td30bold">작품 요약</label><br>
									<%=w.getWorkSummary() %>
                                </div>
                            </td>
                            <td rowspan="2" style="width: 40%;">
                                <div class="diyDiv" style="height:340px;">
                                    <label class="td30bold">줄거리</label><br>
                                    <%=w.getWorkPlot() %>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="diyDiv-noPadding">
                                    <table class="width100">
                                        <tr>
                                            <td class="td30bold">작품명</td>
                                            <td><%=w.getWorkTitle() %></td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="diyDiv-noPadding">
                                    <table class="width100">
                                        <tr>
                                            <td class="td30bold">장르</td>
                                            <td><%=w.getGenre() %></td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="diyDiv-noPadding">
                                    <table class="width100">
                                        <tr>
                                            <td class="td30bold">작가명</td>
                                            <td><%=w.getNickName() %></td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                        <tr>
                           <td colspan="3">
                                <button class="btn btn-dark" style="float: right;">
                                    <a href="<%=contextPath%>/workApprov.wo?pageId=5" style="color:white;">목록으로</a>
                                </button>
                           </td> 
                        </tr>
                    </table>
                
                </div>
            </main>
            
            <%@ include file="../common/adminFooter.jsp" %>
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
