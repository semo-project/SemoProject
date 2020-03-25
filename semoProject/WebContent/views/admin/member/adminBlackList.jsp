<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.member.model.vo.*" %>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");

	String search = (String)request.getAttribute("search");

	PageInfo pi = (PageInfo)request.getAttribute("pi");

	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	// 활중 후 메시지
	String accusMessage = (String)session.getAttribute("accusMessage");
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
                    <h1 class="mt-4">블랙리스트</h1>
                    
                    <br>
                    
                    <button class="btn btn-light" type="button">신고된 회원</button>
                    &nbsp;
                    <button class="btn btn-dark" type="button" onclick="accusation();">활동 중지 회원</button>

                    <br><br>
                    <div class="card mb-4">
                        <div class="card-header"><i class="fas fa-table mr-1"></i>신고된 회원 목록
                            <button class="btn btn-primary" style="float:right;" id="searchBtn">검색</button>
                            <input type="text" class="search" id="blackSearch" style="float: right;" placeholder="id를 입력해주세요">
                        </div>
                        <div class="card-body">

                            <div class="table-responsive">
                                <table class="table table-bordered" id="memberTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th style="width: 10%;"></th>
                                            <th style="width: 45%;">Id</th>
                                            <th style="width: 45%;">Report Count</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                    	<% if(list.size() != 0) { %>
	                                    	<% for(Member m : list) { %>
	                                        <tr>
	                                            <td><input type="checkbox" name="accusCheck" value="<%=m.getMemberNo()%>"></td>
	                                            <td><%=m.getMemberId() %></td>
	                                            <td style="color: <% if (m.getAccusationCount() >= 5) {%> 
	                                            						red
	                                            				  <% } else { %>
	                                            				  		black
	                                            				  <% } %>;"><%=m.getAccusationCount() %></td>
	                                        </tr>
	                                        <% } %>
	                                    <% } else { %>
	                                    	<tr>
	                                    		<td colspan="3" style="text-align:center;">조회된 데이터가 없습니다</td>
	                                    	</tr>
	                                    <% } %>
                                    </tbody>
                                </table>

                                <button class="btn btn-danger" style="float: right;" id="goAccus">활동 중지</button>
                            </div>
                            
                            
							<br><br>
							
							<!-- 검색어를 받아온 게 있다면 -->
							<% if(search != null) { %>
							
							<!-- 페이징바 영역 -->
							<div class="pagingArea" align="center">
							
							<!-- 맨 처음으로 (<<) -->
							<button onclick="location.href='<%=contextPath%>/blackSearch.me?pageId=3&&search=<%=search %>';" class="btn btn-outline-primary"> &lt;&lt; </button>
							
							<!-- 이전페이지(<) -->
							<%if(currentPage == 1){ %>
							<button disabled class="btn btn-outline-primary"> &lt; </button>
							<%}else{ %>
							<button onclick="location.href='<%=contextPath%>/blackSearch.me?pageId=3&&currentPage=<%=currentPage-1%>&&search=<%=search %>';" class="btn btn-outline-primary"> &lt; </button>
							<%} %>
							
							<!-- 페이지 목록 -->
							<%for(int p=startPage; p<=endPage; p++){ %>
				
								<%if(currentPage == p){ %>
								<button disabled class="btn btn-primary"> <%=p%> </button>
								<%}else{ %>
								<button onclick="location.href='<%=contextPath%>/blackSearch.me?pageId=3&&currentPage=<%=p%>&&search=<%=search %>';" class="btn btn-outline-primary"> <%= p %> </button>
								<%} %>
				
							<%} %>
			
							<!-- 다음페이지(>) -->
							<%if(currentPage == maxPage){ %>
							<button disabled class="btn btn-outline-primary"> &gt; </button>
							<%}else{ %>
							<button onclick="location.href='<%=contextPath%>/blackSearch.me?pageId=3&&currentPage=<%=currentPage+1%>&&search=<%=search %>';" class="btn btn-outline-primary"> &gt; </button>
							<%} %>
			
			
							<!-- 맨 마지막으로 (>>) -->
							<button onclick="location.href='<%=contextPath%>/blackSearch.me?pageId=3&&currentPage=<%=maxPage%>&&search=<%=search %>'" class="btn btn-outline-primary"> &gt;&gt; </button>
			
							</div>
							
							<% } else { %>
							
							<!-- 페이징바 영역 -->
							<div class="pagingArea" align="center">
							
							<!-- 맨 처음으로 (<<) -->
							<button onclick="location.href='<%=contextPath%>/blackList.me?pageId=3';" class="btn btn-outline-primary"> &lt;&lt; </button>
							
							<!-- 이전페이지(<) -->
							<%if(currentPage == 1){ %>
							<button disabled class="btn btn-outline-primary"> &lt; </button>
							<%}else{ %>
							<button onclick="location.href='<%=contextPath%>/blackList.me?pageId=3&&currentPage=<%=currentPage-1%>';" class="btn btn-outline-primary"> &lt; </button>
							<%} %>
							
							<!-- 페이지 목록 -->
							<%for(int p=startPage; p<=endPage; p++){ %>
				
								<%if(currentPage == p){ %>
								<button disabled class="btn btn-primary"> <%=p%> </button>
								<%}else{ %>
								<button onclick="location.href='<%=contextPath%>/blackList.me?pageId=3&&currentPage=<%=p%>';" class="btn btn-outline-primary"> <%= p %> </button>
								<%} %>
				
							<%} %>
			
							<!-- 다음페이지(>) -->
							<%if(currentPage == maxPage){ %>
							<button disabled class="btn btn-outline-primary"> &gt; </button>
							<%}else{ %>
							<button onclick="location.href='<%=contextPath%>/blackList.me?pageId=3&&currentPage=<%=currentPage+1%>';" class="btn btn-outline-primary"> &gt; </button>
							<%} %>
			
			
							<!-- 맨 마지막으로 (>>) -->
							<button onclick="location.href='<%=contextPath%>/blackList.me?pageId=3&&currentPage=<%=maxPage%>'" class="btn btn-outline-primary"> &gt;&gt; </button>
			
							</div>
							
							<% } %>
                        </div>
                    </div>
                </div>
            </main>
            
            <%@ include file="../common/adminFooter.jsp" %>
            
        </div>
    </div>
    
    <script>
    
    	function accusation() {
    		location.href = "<%=contextPath%>/accusation.me?pageId=3";
    	}
    	$(function() {
    		var msg = "<%=accusMessage%>";
    		
    		if(msg != "null") {
    			alert(msg);
    			<% session.removeAttribute("accusMessage");%>
    			<% accusMessage = null; %>
    			msg = "null";
    		}
    		
    		$("#searchBtn").click(function() {
	    		var search = $("#blackSearch").val();
    			
	    		location.href = "<%=contextPath%>/blackSearch.me?pageId=3&&search=" + search;
    		});
    		$("#goAccus").click(function() {
    			var accusArr = new Array();
    			
    			$('input:checkbox[name=accusCheck]:checked').each(function() {
    				accusArr.push(this.value);
    			});
    			
    			if(accusArr.length >= 1) {
    				var accusNo = accusArr.join(", ");
    				location.href = "<%=contextPath%>/blackAccus.me?pageId=3&&accusNo=" + accusNo;
    			} else {
    				alert("활동중지 할 회원을 선택해주세요.");
    			}
    		});
    		
    	});
    </script>
</body>
</html>
