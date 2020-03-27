<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.common.PageInfo"%>
<%@page import="com.kh.episode.model.vo.Episode"%>
<%@page import="java.util.ArrayList"%>
<%
	ArrayList<Episode> list = (ArrayList<Episode>)request.getAttribute("list");

	String search = (String)request.getAttribute("search");

	PageInfo pi = (PageInfo)request.getAttribute("pi");

	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	// 승인 후 메시지
	String approvMsg = (String)session.getAttribute("approvMsg");
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
                    
                    <button class="btn btn-dark" type="button" onclick="goWorkApprov();">작품 등록 대기</button>
                    &nbsp;
                    <button class="btn btn-light" type="button">에피소드 등록 대기</button>
                    
                    
                    <br><br>
                    <div class="card mb-4">
                        <div class="card-header"><i class="fas fa-table mr-1"></i>에피소드 등록 신청 목록
                            <button class="btn btn-primary" style="float:right;" id="searchBtn">검색</button>
                            <input type="text" class="search" id="epApprovSearch" style="float: right; width:210px" placeholder="에피소드명을 입력하세요">
                            
                        </div>
                        <div class="card-body">

                            <div class="table-responsive">
                                <table class="table table-bordered" id="memberTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th style="width:20%">Writer</th>
                                            <th>Work</th>
                                            <th>Episode</th>
                                            <th>Regist Date</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                    	<% if(list.size() != 0) { %>
	                                    	<% for(Episode ep : list) { %>
	                                        <tr>
	                                            <td><input type="checkbox" name="approvCheck" value="<%=ep.getEpisodeNo()%>"></td>
	                                            <td><%=ep.getNickName() %></td>
	                                            <td><%=ep.getWorkTitle() %></td>
	                                            <td><a href="<%=contextPath%>/episodeApprovDetail.ep?pageId=5&&no=<%=ep.getEpisodeNo()%>"><%=ep.getEpisodeTitle() %></a></td>
	                                            <td><%=ep.getRegistDate() %></td>
	                                        </tr>
	                                        <% } %>
                                        <% } else { %>
                                        	<tr>
                                        		<td colspan="5" style="text-align:center;">조회된 데이터가 없습니다</td>
                                        	</tr>
                                        <% } %>
                                    </tbody>
                                </table>

                                <button class="btn btn-danger" style="float: right;" id="approvBtn">승인</button>
                                <!-- <input type="submit" class="btn btn-danger" style="float: right;" value="승인"> -->
                            </div>
                            
                            <% if(list.size() != 0) { %>
                            <!-- 검색어를 받아온 게 있다면 -->
							<% if(search != null) { %>
							
							<!-- 페이징바 영역 -->
							<div class="pagingArea" align="center">
							
							<!-- 맨 처음으로 (<<) -->
							<button onclick="location.href='<%=contextPath%>/epApprovSearch.ep?pageId=5&&search=<%=search %>';" class="btn btn-outline-primary"> &lt;&lt; </button>
							
							<!-- 이전페이지(<) -->
							<%if(currentPage == 1){ %>
							<button disabled class="btn btn-outline-primary"> &lt; </button>
							<%}else{ %>
							<button onclick="location.href='<%=contextPath%>/epApprovSearch.ep?pageId=5&&currentPage=<%=currentPage-1%>&&search=<%=search %>';" class="btn btn-outline-primary"> &lt; </button>
							<%} %>
							
							<!-- 페이지 목록 -->
							<%for(int p=startPage; p<=endPage; p++){ %>
				
								<%if(currentPage == p){ %>
								<button disabled class="btn btn-primary"> <%=p%> </button>
								<%}else{ %>
								<button onclick="location.href='<%=contextPath%>/epApprovSearch.ep?pageId=5&&currentPage=<%=p%>&&search=<%=search %>';" class="btn btn-outline-primary"> <%= p %> </button>
								<%} %>
				
							<%} %>
			
							<!-- 다음페이지(>) -->
							<%if(currentPage == maxPage){ %>
							<button disabled class="btn btn-outline-primary"> &gt; </button>
							<%}else{ %>
							<button onclick="location.href='<%=contextPath%>/epApprovSearch.ep?pageId=5&&currentPage=<%=currentPage+1%>&&search=<%=search %>';" class="btn btn-outline-primary"> &gt; </button>
							<%} %>
			
			
							<!-- 맨 마지막으로 (>>) -->
							<button onclick="location.href='<%=contextPath%>/epApprovSearch.ep?pageId=5&&currentPage=<%=maxPage%>&&search=<%=search %>'" class="btn btn-outline-primary"> &gt;&gt; </button>
			
							</div>
							
							<% } else { %>
							
							<!-- 페이징바 영역 -->
							<div class="pagingArea" align="center">
							
							<!-- 맨 처음으로 (<<) -->
							<button onclick="location.href='<%=contextPath%>/episodeApprov.ep?pageId=5';" class="btn btn-outline-primary"> &lt;&lt; </button>
							
							<!-- 이전페이지(<) -->
							<%if(currentPage == 1){ %>
							<button disabled class="btn btn-outline-primary"> &lt; </button>
							<%}else{ %>
							<button onclick="location.href='<%=contextPath%>/workApprov.wo?pageId=5&&currentPage=<%=currentPage-1%>';" class="btn btn-outline-primary"> &lt; </button>
							<%} %>
							
							<!-- 페이지 목록 -->
							<%for(int p=startPage; p<=endPage; p++){ %>
				
								<%if(currentPage == p){ %>
								<button disabled class="btn btn-primary"> <%=p%> </button>
								<%}else{ %>
								<button onclick="location.href='<%=contextPath%>/episodeApprov.ep?pageId=5&&currentPage=<%=p%>';" class="btn btn-outline-primary"> <%= p %> </button>
								<%} %>
				
							<%} %>
			
							<!-- 다음페이지(>) -->
							<%if(currentPage == maxPage){ %>
							<button disabled class="btn btn-outline-primary"> &gt; </button>
							<%}else{ %>
							<button onclick="location.href='<%=contextPath%>/episodeApprov.ep?pageId=5&&currentPage=<%=currentPage+1%>';" class="btn btn-outline-primary"> &gt; </button>
							<%} %>
			
			
							<!-- 맨 마지막으로 (>>) -->
							<button onclick="location.href='<%=contextPath%>/episodeApprov.ep?pageId=5&&currentPage=<%=maxPage%>'" class="btn btn-outline-primary"> &gt;&gt; </button>
			
							</div>
							
							<% } %>    
							<% } %>    	
                        </div>
                    </div>
                </div>
            </main>
            
            <%@ include file="../common/adminFooter.jsp" %>
        </div>
    </div>
    
    <script>
    	function goWorkApprov() {
    		location.href = "<%=contextPath%>/workApprov.wo?pageId=5";
    	}
    	
    	$(function() {
			var msg = "<%=approvMsg%>";
			
    		if(msg != "null") {
    			alert(msg);
    			<% session.removeAttribute("approvMsg");%>
    			<% approvMsg = null; %>
    			msg = "null";
	    		}
    		
            $("#searchBtn").click(function(){
               var search = $("#workApprovSearch").val();
               location.href = "<%=contextPath%>/workSearchApprov.wo?pageId=5&&search=" + search;
            });
            
        	// 승인처리
            $("#approvBtn").click(function() {
    			var approvArr = new Array();
    			
    			$('input:checkbox[name=approvCheck]:checked').each(function() {
    				approvArr.push(this.value);
    			});
    			
    			if(approvArr.length >= 1) {
    				var no = approvArr.join(", ");
    				location.href = "<%=contextPath%>/approvConfirm.ep?pageId=5&&no=" + no;
    			} else {
    				alert("승인할 작품을 선택해주세요");
    			}
    		});
        	
        	// 검색
    		$("#searchBtn").click(function(){
                var search = $("#epApprovSearch").val();
                location.href = "<%=contextPath%>/epApprovSearch.ep?pageId=5&&search=" + search;
             });
    	});
    	
    </script>
</body>
</html>
    