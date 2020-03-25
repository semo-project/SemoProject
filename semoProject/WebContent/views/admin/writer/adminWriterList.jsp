<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.writer.model.vo.Writer, com.kh.member.model.vo.PageInfo, java.util.ArrayList" %>
<%
	ArrayList<Writer> list = (ArrayList<Writer>)request.getAttribute("list");
	
	// 검색 키워드
	String search = (String)request.getAttribute("search");
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");

	// 해제 후 메시지
	String restMessage = (String)session.getAttribute("restMessage");
	
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
                    <h1 class="mt-4">전체 작가 보기</h1>
                    
                    <br>
                    <!-- <form method="post" action=""> -->
                    <button class="btn btn-primary" type="button" onclick="goRest();">작가 해제하기</button>
                    &nbsp;
                    <!-- <button class="btn btn-primary" type="button" onclick="goRest();">휴면 계정 전환</button> -->

                    <br><br>
                    <div class="card mb-4">
                        <div class="card-header"><i class="fas fa-table mr-1"></i>전체 작가 목록
                            <button class="btn btn-primary" style="float:right;" id="searchBtn">검색</button>
                            <input type="text" class="search" id="writerSearch" style="float: right;" placeholder="이름을 입력해주세요">
                        </div>
                        <div class="card-body">

                            <div class="table-responsive">
                                <table class="table table-bordered" id="memberTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>Name</th>
                                            <th>Id</th>
                                            <th>NickName</th>
                                            <th>Bank</th>
                                            <th>Account Number</th>
                                            <th>Work List</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                    	<% if(list.size() != 0) { %>
	                                    	<%for(Writer w : list) { %>
	                                        <tr>
	                                            <td><input type="checkbox" id="writerAprv" name="checkWriter" value="<%=w.getWriterNo()%>"></td>
	                                            <td><%=w.getWriterName() %></td>
	                                            <td><%=w.getWriterId() %></td>
	                                            <td><%=w.getWriterNickname() %></td>
	                                            <td><%=w.getBankName() %></td>
	                                            <td><%=w.getAccountNo() %></td>
	                                            <td><a href="<%=contextPath%>/writerList.wo?pageId=4&&no=<%=w.getWriterNo()%>">작품 리스트 보기</a></td>
	                                        </tr>
	                                        <% } %>
	                                    <% } else { %>
	                                    	<tr>
	                                    		<td colspan="7" style="text-align:center;">조회된 데이터가 없습니다.</td>
	                                    	</tr>
	                                    <% } %>
                                    </tbody>
                                </table>
                                
                                <br><br>
                                
                                 <!-- 검색어를 받아온 게 있다면 -->
							<% if(search != null) { %>
							
							<!-- 페이징바 영역 -->
							<div class="pagingArea" align="center">
							
							<!-- 맨 처음으로 (<<) -->
							<button onclick="location.href='<%=contextPath%>/writerSearch.wr?pageId=2&&search=<%=search %>';" class="btn btn-outline-primary"> &lt;&lt; </button>
							
							<!-- 이전페이지(<) -->
							<%if(currentPage == 1){ %>
							<button disabled class="btn btn-outline-primary"> &lt; </button>
							<%}else{ %>
							<button onclick="location.href='<%=contextPath%>/writerSearch.wr?pageId=2&&currentPage=<%=currentPage-1%>&&search=<%=search %>';" class="btn btn-outline-primary"> &lt; </button>
							<%} %>
							
							<!-- 페이지 목록 -->
							<%for(int p=startPage; p<=endPage; p++){ %>
				
								<%if(currentPage == p){ %>
								<button disabled class="btn btn-primary"> <%=p%> </button>
								<%}else{ %>
								<button onclick="location.href='<%=contextPath%>/writerSearch.wr?pageId=2&&currentPage=<%=p%>&&search=<%=search %>';" class="btn btn-outline-primary"> <%= p %> </button>
								<%} %>
				
							<%} %>
			
							<!-- 다음페이지(>) -->
							<%if(currentPage == maxPage){ %>
							<button disabled class="btn btn-outline-primary"> &gt; </button>
							<%}else{ %>
							<button onclick="location.href='<%=contextPath%>/writerSearch.wr?pageId=2&&currentPage=<%=currentPage+1%>&&search=<%=search %>';" class="btn btn-outline-primary"> &gt; </button>
							<%} %>
			
			
							<!-- 맨 마지막으로 (>>) -->
							<button onclick="location.href='<%=contextPath%>/writerSearch.wr?pageId=2&&currentPage=<%=maxPage%>&&search=<%=search %>'" class="btn btn-outline-primary"> &gt;&gt; </button>
			
							</div>
							
							<!-- 검색어를 받아온 게 없다면 -->
							<% } else { %>
							
							<!-- 페이징바 영역 -->
							<div class="pagingArea" align="center">
							
							<!-- 맨 처음으로 (<<) -->
							<button onclick="location.href='<%=contextPath%>/adminList.wr?pageId=2';" class="btn btn-outline-primary"> &lt;&lt; </button>
							
							<!-- 이전페이지(<) -->
							<%if(currentPage == 1){ %>
							<button disabled class="btn btn-outline-primary"> &lt; </button>
							<%}else{ %>
							<button onclick="location.href='<%=contextPath%>/adminList.wr?pageId=2&&currentPage=<%=currentPage-1%>';" class="btn btn-outline-primary"> &lt; </button>
							<%} %>
							
							<!-- 페이지 목록 -->
							<%for(int p=startPage; p<=endPage; p++){ %>
				
								<%if(currentPage == p){ %>
								<button disabled class="btn btn-primary"> <%=p%> </button>
								<%}else{ %>
								<button onclick="location.href='<%=contextPath%>/adminList.wr?pageId=2&&currentPage=<%=p%>';" class="btn btn-outline-primary"> <%= p %> </button>
								<%} %>
				
							<%} %>
			
							<!-- 다음페이지(>) -->
							<%if(currentPage == maxPage){ %>
							<button disabled class="btn btn-outline-primary"> &gt; </button>
							<%}else{ %>
							<button onclick="location.href='<%=contextPath%>/adminList.wr?pageId=2&&currentPage=<%=currentPage+1%>';" class="btn btn-outline-primary"> &gt; </button>
							<%} %>
			
			
							<!-- 맨 마지막으로 (>>) -->
							<button onclick="location.href='<%=contextPath%>/adminList.wr?pageId=2&&currentPage=<%=maxPage%>'" class="btn btn-outline-primary"> &gt;&gt; </button>
			
							</div>
							
							<% } %>

                            </div>                            
                        </div>
                    </div>
                    <!-- </form> -->
                </div>
            </main>
            
            <%@ include file="../common/adminFooter.jsp" %>
            
        </div>
    </div>
    <script>
    
    	var msg = "<%=restMessage%>";
    	
    	$(function() {
    		$("#searchBtn").click(function(){
    			var search = $("#writerSearch").val();
    			location.href = "<%=contextPath%>/writerSearch.wr?pageId=2&&search=" + search;
    		});
    		if(msg != "null") {
    			alert(msg);
    			<% session.removeAttribute("restMessage"); %>
    			<% restMessage = null;%>
    			msg = "null";
    		}
    	});
    	function goRest() {
    		var restArr = new Array();
    		
    		$('input:checkbox[name=checkWriter]:checked').each(function() {
    			restArr.push(this.value);
    		});
    		
    		if(restArr.length >= 1) {
    			var restNo = restArr.join(", ");
    			location.href = "<%=contextPath%>/rest.wr?pageId=2&&restNo=" + restNo;
    		} else {
    			alert("작가를 선택해주세요.");
    		}    		
    	}
    </script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/admin1.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/admin-datatables.js"></script>
</body>
</html>
    