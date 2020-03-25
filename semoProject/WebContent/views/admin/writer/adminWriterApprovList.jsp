<!-- 관리자 - 멤버 - 작가 승인 대기 - 조회 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.writer.model.vo.Writer, com.kh.member.model.vo.PageInfo" %>
<%
	ArrayList<Writer> list = (ArrayList<Writer>)request.getAttribute("list");
	
	// 검색 키워드
	String search = (String)request.getAttribute("search");
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	// 승인 후 메시지
	String approvMessage = (String)session.getAttribute("approvMessage");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
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
                    <h1 class="mt-4">전체 회원 보기</h1>
                    
                    <br>
                    
                    <button class="btn btn-dark" type="button" onclick="goMemberList();">전체 회원</button>
                    &nbsp;
                    <button class="btn btn-light" type="button">작가 대기 회원</button>

                    <br><br>
                    <div class="card mb-4">
                        <div class="card-header"><i class="fas fa-table mr-1"></i>작가 신청 목록
                            <button class="btn btn-primary" style="float:right;" id="searchBtn">검색</button>
                            <input type="text" class="search" id="writerSearch" style="float: right;"placeholder="이름을 입력해주세요" 
							value="<% if(search != null) { %> <%= search%> <% } %>">
                        </div>
                        <div class="card-body">

                            <div class="table-responsive"> 
                            <form method="post" action="<%=contextPath%>/approvAction.wr?pageId=1">
                                <table class="table table-bordered" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th style="width:23%">Name</th>
                                            <th style="width:23%">Id</th>
                                            <th style="width:23%">NickName</th>
                                            <th style="width:23%">Show Work</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                    	<% if(list.size() != 0) { %>
	                                   	 	<% for(Writer w : list) {%>
	                                        <tr>                                        	
	                                            <td><input type="checkbox" name="writerAprv" value="<%=w.getWriterNo()%>"></td>
	                                            <td><%=w.getWriterName() %></td>
	                                            <td><%=w.getWriterId() %></td>
	                                            <td><%=w.getWriterNickname() %></td>
	                                            <td><a href="approvDetail.wr?pageId=1&&no=<%=w.getWriterNo() %>">작품 보기</a></td>                                            
	                                        </tr>
	                                        <% } %>
	                                    <% } else { %>
	                                    	<tr>
	                                    		<td colspan="5" style="text-align:center;">조회된 데이터가 없습니다.</td>
	                                    	</tr>
	                                    <% } %>
                                    </tbody>                                
                                </table>
                                
                                <button class="btn btn-danger" type="submit" style="float: right;">승인</button>
                                </form>
                                <br><br>
                                
                                <!-- 검색어를 받아온 게 있다면 -->
							<% if(search != null) { %>
							
							<!-- 페이징바 영역 -->
							<div class="pagingArea" align="center">
							
							<!-- 맨 처음으로 (<<) -->
							<button onclick="location.href='<%=contextPath%>/aprvSearch.wr?pageId=1&&name=<%=search %>';" class="btn btn-outline-primary"> &lt;&lt; </button>
							
							<!-- 이전페이지(<) -->
							<%if(currentPage == 1){ %>
							<button disabled class="btn btn-outline-primary"> &lt; </button>
							<%}else{ %>
							<button onclick="location.href='<%=contextPath%>/aprvSearch.wr?pageId=1&&currentPage=<%=currentPage-1%>&&name=<%=search %>';" class="btn btn-outline-primary"> &lt; </button>
							<%} %>
							
							<!-- 페이지 목록 -->
							<%for(int p=startPage; p<=endPage; p++){ %>
				
								<%if(currentPage == p){ %>
								<button disabled class="btn btn-primary"> <%=p%> </button>
								<%}else{ %>
								<button onclick="location.href='<%=contextPath%>/aprvSearch.wr?pageId=1&&currentPage=<%=p%>&&name=<%=search %>';" class="btn btn-outline-primary"> <%= p %> </button>
								<%} %>
				
							<%} %>
			
							<!-- 다음페이지(>) -->
							<%if(currentPage == maxPage){ %>
							<button disabled class="btn btn-outline-primary"> &gt; </button>
							<%}else{ %>
							<button onclick="location.href='<%=contextPath%>/aprvSearch.wr?pageId=1&&currentPage=<%=currentPage+1%>&&name=<%=search %>';" class="btn btn-outline-primary"> &gt; </button>
							<%} %>
			
			
							<!-- 맨 마지막으로 (>>) -->
							<button onclick="location.href='<%=contextPath%>/aprvSearch.wr?pageId=1&&currentPage=<%=maxPage%>&&name=<%=search %>'" class="btn btn-outline-primary"> &gt;&gt; </button>
			
							</div>
							
							<!-- 검색어를 받아온 게 없다면 -->
							<% } else { %>
							
							<!-- 페이징바 영역 -->
							<div class="pagingArea" align="center">
							
							<!-- 맨 처음으로 (<<) -->
							<button onclick="location.href='<%=contextPath%>/writerApprv.wr?pageId=1';" class="btn btn-outline-primary"> &lt;&lt; </button>
							
							<!-- 이전페이지(<) -->
							<%if(currentPage == 1){ %>
							<button disabled class="btn btn-outline-primary"> &lt; </button>
							<%}else{ %>
							<button onclick="location.href='<%=contextPath%>/writerApprv.wr?pageId=1&&currentPage=<%=currentPage-1%>';" class="btn btn-outline-primary"> &lt; </button>
							<%} %>
							
							<!-- 페이지 목록 -->
							<%for(int p=startPage; p<=endPage; p++){ %>
				
								<%if(currentPage == p){ %>
								<button disabled class="btn btn-primary"> <%=p%> </button>
								<%}else{ %>
								<button onclick="location.href='<%=contextPath%>/writerApprv.wr?pageId=1&&currentPage=<%=p%>';" class="btn btn-outline-primary"> <%= p %> </button>
								<%} %>
				
							<%} %>
			
							<!-- 다음페이지(>) -->
							<%if(currentPage == maxPage){ %>
							<button disabled class="btn btn-outline-primary"> &gt; </button>
							<%}else{ %>
							<button onclick="location.href='<%=contextPath%>/writerApprv.wr?pageId=1&&currentPage=<%=currentPage+1%>';" class="btn btn-outline-primary"> &gt; </button>
							<%} %>
			
			
							<!-- 맨 마지막으로 (>>) -->
							<button onclick="location.href='<%=contextPath%>/writerApprv.wr?pageId=1&&currentPage=<%=maxPage%>'" class="btn btn-outline-primary"> &gt;&gt; </button>
			
							</div>
							
							<% } %>

                            </div>
                        </div>
                    </div>
                </div>
            </main>
            
            <%@ include file="../common/adminFooter.jsp" %>
        </div>
    </div>
    
    <script>
    	var msg = "<%=approvMessage%>";
    
    	function goMemberList() {
    		location.href = "<%=contextPath%>/list.me?pageId=1";
    	}
    	$(function() {
    		$("#searchBtn").click(function() {
    			var search = $("#writerSearch").val();
    			location.href="<%=contextPath%>/aprvSearch.wr?pageId=1&&search=" + search;
    		});
    		if(msg != "null") {
    			alert(msg);
    			<% session.removeAttribute("approvMessage"); %>
    			<% approvMessage = null; %>
    			msg = "null";
    		}
    	});

    </script>
</body>
</html>
