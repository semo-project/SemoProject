<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.episode.model.vo.Episode" %>
<%
	Episode ep = (Episode)request.getAttribute("episode");
%>
<!DOCTYPE html>
<html lang="en">

    <body class="sb-nav-fixed">
       
       <%@ include file="../common/adminTopNav.jsp" %>
        <div id="layoutSidenav">
            
            <%@ include file="../common/adminSideNav.jsp" %>

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">
                            	작품 등록 및 승인

                            <button class="btn btn-dark" style="float: right;" onclick="goEpisodeApprov();">목록으로</button>
                        </h1>
                        
                        <br>

                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><%=ep.getWorkTitle() %></li>
                            <li class="breadcrumb-item"><%=ep.getEpisodeTitle() %></li>
                        </ol>

                        <div>
                            <img src="<%=contextPath %>/resources/episode_upfiles/<%=ep.getEpisodeModify() %>" alt="">
                        </div>

                    </div>
                </main>
                
                <%@ include file="../common/adminFooter.jsp" %>
            </div>
        </div>
        
        <script>
        	function goEpisodeApprov() {
        		location.href = "<%=contextPath%>/episodeApprov.ep?pageId=5";
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
