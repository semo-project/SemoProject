<%@page import="com.kh.common.PageInfo"%>
<%@page import="com.kh.work.model.vo.Work"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Work> list = (ArrayList<Work>)request.getAttribute("list");

	String search = (String)request.getAttribute("search");

	PageInfo pi = (PageInfo)request.getAttribute("pi");

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
                    <h1 class="mt-4">전체 작품 보기</h1>
                    <br>
                    
                    <div class="diyDiv mb-4">
                        <label for=""></label> 
                        <!-- 빈공간이지만 점점 추가될 예정이라 -->
                    </div>

                    <div class="card mb-4">
                        <div class="card-header"><i class="fas fa-table mr-1"></i>세모웹툰 전체 작품 목록
                            <button class="btn btn-primary" style="float:right;" id="searchBtn">검색</button>
                            <input type="text" class="search" id="workSearch" style="float: right;" placeholder="작품명을 입력하세요">
                            
                        </div>
                        <div class="card-body">

                            <div class="table-responsive">
                                <table class="table table-bordered" id="memberTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th style="width: 35%;">Work</th>
                                            <th style="width: 35%;">Writer</th>
                                            <th style="width: 30%;">Work List</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                    	<%for(Work w : list) { %>
                                        <tr>
                                            <td><%=w.getWorktitle() %></td>
                                            <td><%=w.getNickName() %></td>
                                            <td><a href="<%=contextPath%>/writerList.wo?pageId=4&&no=<%=w.getWriterNo()%>">작품 리스트 보기</a></td>
                                            <!-- 그리고 보내줄 때 작가 번호도 보내줘야 함 일단 뺌 -->
                                        </tr>
                                        <%} %>
                                    </tbody>
                                </table>
                                <br><br>
							
							<!-- 검색어를 받아온 게 있다면 -->
							<% if(search != null) { %>
							
							<!-- 페이징바 영역 -->
							<div class="pagingArea" align="center">
							
							<!-- 맨 처음으로 (<<) -->
							<button onclick="location.href='<%=contextPath%>/adWorkSearch.wo?pageId=1&&search=<%=search %>';" class="btn btn-outline-primary"> &lt;&lt; </button>
							
							<!-- 이전페이지(<) -->
							<%if(currentPage == 1){ %>
							<button disabled class="btn btn-outline-primary"> &lt; </button>
							<%}else{ %>
							<button onclick="location.href='<%=contextPath%>/adWorkSearch.wo?pageId=1&&currentPage=<%=currentPage-1%>&&search=<%=search %>';" class="btn btn-outline-primary"> &lt; </button>
							<%} %>
							
							<!-- 페이지 목록 -->
							<%for(int p=startPage; p<=endPage; p++){ %>
				
								<%if(currentPage == p){ %>
								<button disabled class="btn btn-primary"> <%=p%> </button>
								<%}else{ %>
								<button onclick="location.href='<%=contextPath%>/adWorkSearch.wo?pageId=1&&currentPage=<%=p%>&&search=<%=search %>';" class="btn btn-outline-primary"> <%= p %> </button>
								<%} %>
				
							<%} %>
			
							<!-- 다음페이지(>) -->
							<%if(currentPage == maxPage){ %>
							<button disabled class="btn btn-outline-primary"> &gt; </button>
							<%}else{ %>
							<button onclick="location.href='<%=contextPath%>/adWorkSearch.wo?pageId=1&&currentPage=<%=currentPage+1%>&&search=<%=search %>';" class="btn btn-outline-primary"> &gt; </button>
							<%} %>
			
			
							<!-- 맨 마지막으로 (>>) -->
							<button onclick="location.href='<%=contextPath%>/adWorkSearch.wo?pageId=4&&currentPage=<%=maxPage%>&&search=<%=search %>'" class="btn btn-outline-primary"> &gt;&gt; </button>
			
							</div>
							
							<% } else { %>
							
							<!-- 페이징바 영역 -->
							<div class="pagingArea" align="center">
							
							<!-- 맨 처음으로 (<<) -->
							<button onclick="location.href='<%=contextPath%>/list.wo?pageId=4';" class="btn btn-outline-primary"> &lt;&lt; </button>
							
							<!-- 이전페이지(<) -->
							<%if(currentPage == 1){ %>
							<button disabled class="btn btn-outline-primary"> &lt; </button>
							<%}else{ %>
							<button onclick="location.href='<%=contextPath%>/list.wo?pageId=4&&currentPage=<%=currentPage-1%>';" class="btn btn-outline-primary"> &lt; </button>
							<%} %>
							
							<!-- 페이지 목록 -->
							<%for(int p=startPage; p<=endPage; p++){ %>
				
								<%if(currentPage == p){ %>
								<button disabled class="btn btn-primary"> <%=p%> </button>
								<%}else{ %>
								<button onclick="location.href='<%=contextPath%>/list.wo?pageId=4&&currentPage=<%=p%>';" class="btn btn-outline-primary"> <%= p %> </button>
								<%} %>
				
							<%} %>
			
							<!-- 다음페이지(>) -->
							<%if(currentPage == maxPage){ %>
							<button disabled class="btn btn-outline-primary"> &gt; </button>
							<%}else{ %>
							<button onclick="location.href='<%=contextPath%>/list.wo?pageId=4&&currentPage=<%=currentPage+1%>';" class="btn btn-outline-primary"> &gt; </button>
							<%} %>
			
			
							<!-- 맨 마지막으로 (>>) -->
							<button onclick="location.href='<%=contextPath%>/list.wo?pageId=4&&currentPage=<%=maxPage%>'" class="btn btn-outline-primary"> &gt;&gt; </button>
			
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
    	$(function(){
            $("#searchBtn").click(function(){
               var search = $("#workSearch").val();
               location.href = "<%=contextPath%>/adWorkSearch.wo?pageId=4&&search=" + search;
            });
         });
    </script>
    
</body>
</html>
