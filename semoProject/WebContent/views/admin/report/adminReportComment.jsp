<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.PageInfo, java.util.ArrayList, com.kh.report.model.vo.Report" %>
<%
	ArrayList<Report> list = (ArrayList<Report>)request.getAttribute("list");

	String search = (String)request.getAttribute("search");

	PageInfo pi = (PageInfo)request.getAttribute("pi");

	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	// 신고 확인 후 메시지
	String confirmMessage = (String)session.getAttribute("confirmMessage");
%>

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<!DOCTYPE html>
<html lang="en">

    <body class="sb-nav-fixed">
        
        <%@ include file="../common/adminTopNav.jsp" %>
        <div id="layoutSidenav">
            
            <%@ include file="../common/adminSideNav.jsp" %>

            <div id="layoutSidenav_content">
                <main>

                    <div class="container-fluid">
                        <h1 class="mt-4">전체 신고 보기</h1>
                       
                        <br>

                        <button class="btn btn-dark" type="button" onclick="goReport();">게시글</button>
                        &nbsp;
                        <button class="btn btn-light" type="button">댓글</button>                        

                        <br><br>
                        <div class="card mb-4">
                            <div class="card-header"><i class="fas fa-table mr-1"></i>게시글 신고 목록
                                <button class="btn btn-primary" style="float:right;">검색</button>
                                <input type="text" class="search" id="memberSearch" style="float: right;">
                            </div>
                            <div class="card-body">

                                <div class="table-responsive">
                                    <table class="table table-bordered" id="memberTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>Reported Id</th>
                                                <th>Class</th>
                                                <th>Comment Class</th>
                                                <th>Date</th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                                        	<% for(Report r : list) { %>
                                            <tr>
                                                <td><input type="checkbox" name="reportCheck" value="<%=r.getReportNo()%>"></td>
                                                <td data-toggle="modal" data-target="#reportModal" data-comment="<%=r.getCommentContent()%>" 
																							   	   data-group="<%=r.getReportClassName()%>" 
																							       data-content="<%=r.getReportContent()%>"
																							       data-boardNo="<%=r.getWritingNo()%>"
													style="color:blue; cursor:pointer;">
													<%=r.getMemberId() %>
												</td>
                                                <td><%=r.getReportClassName() %></td>
                                                <td><% if(r.getReportGroupNo() == 2) {%>게시글 댓글
                                                	<% } else { %>웹툰 댓글 <%} %></td>
                                                <td><%=r.getReportDate() %></td>
                                            </tr>
                                            <% } %>
                                        </tbody>
                                    </table>
									<label style="color:gray;">아이디를 클릭하세요</label>
                                    <button class="btn btn-danger" style="float: right;">신고 확인</button>
                                </div>
                                <br>
							
								<!-- 검색어를 받아온 게 있다면 -->
								<% if(search != null) { %>
								
								<!-- 페이징바 영역 -->
								<div class="pagingArea" align="center">
								
								<!-- 맨 처음으로 (<<) -->
								<button onclick="location.href='<%=contextPath%>/search.re?pageId=6&&name=<%=search %>';" class="btn btn-outline-primary"> &lt;&lt; </button>
								
								<!-- 이전페이지(<) -->
								<%if(currentPage == 1){ %>
								<button disabled class="btn btn-outline-primary"> &lt; </button>
								<%}else{ %>
								<button onclick="location.href='<%=contextPath%>/search.re?pageId=6&&currentPage=<%=currentPage-1%>&&search=<%=search %>';" class="btn btn-outline-primary"> &lt; </button>
								<%} %>
								
								<!-- 페이지 목록 -->
								<%for(int p=startPage; p<=endPage; p++){ %>
					
									<%if(currentPage == p){ %>
									<button disabled class="btn btn-primary"> <%=p%> </button>
									<%}else{ %>
									<button onclick="location.href='<%=contextPath%>/search.re?pageId=6&&currentPage=<%=p%>&&search=<%=search %>';" class="btn btn-outline-primary"> <%= p %> </button>
									<%} %>
					
								<%} %>
				
								<!-- 다음페이지(>) -->
								<%if(currentPage == maxPage){ %>
								<button disabled class="btn btn-outline-primary"> &gt; </button>
								<%}else{ %>
								<button onclick="location.href='<%=contextPath%>/search.re?pageId=6&&currentPage=<%=currentPage+1%>&&search=<%=search %>';" class="btn btn-outline-primary"> &gt; </button>
								<%} %>
				
				
								<!-- 맨 마지막으로 (>>) -->
								<button onclick="location.href='<%=contextPath%>/search.re?pageId=6&&currentPage=<%=maxPage%>&&search=<%=search %>'" class="btn btn-outline-primary"> &gt;&gt; </button>
				
								</div>
								
								<% } else { %>
								
								<!-- 페이징바 영역 -->
								<div class="pagingArea" align="center">
								
								<!-- 맨 처음으로 (<<) -->
								<button onclick="location.href='<%=contextPath%>/list.re?pageId=6';" class="btn btn-outline-primary"> &lt;&lt; </button>
								
								<!-- 이전페이지(<) -->
								<%if(currentPage == 1){ %>
								<button disabled class="btn btn-outline-primary"> &lt; </button>
								<%}else{ %>
								<button onclick="location.href='<%=contextPath%>/list.re?pageId=6&&currentPage=<%=currentPage-1%>';" class="btn btn-outline-primary"> &lt; </button>
								<%} %>
								
								<!-- 페이지 목록 -->
								<%for(int p=startPage; p<=endPage; p++){ %>
					
									<%if(currentPage == p){ %>
									<button disabled class="btn btn-primary"> <%=p%> </button>
									<%}else{ %>
									<button onclick="location.href='<%=contextPath%>/list.re?pageId=6&&currentPage=<%=p%>';" class="btn btn-outline-primary"> <%= p %> </button>
									<%} %>
					
								<%} %>
				
								<!-- 다음페이지(>) -->
								<%if(currentPage == maxPage){ %>
								<button disabled class="btn btn-outline-primary"> &gt; </button>
								<%}else{ %>
								<button onclick="location.href='<%=contextPath%>/list.re?pageId=6&&currentPage=<%=currentPage+1%>';" class="btn btn-outline-primary"> &gt; </button>
								<%} %>
								
								<!-- 맨 마지막으로 (>>) -->
								<button onclick="location.href='<%=contextPath%>/list.re?pageId=6&&currentPage=<%=maxPage%>'" class="btn btn-outline-primary"> &gt;&gt; </button>
				
								</div>
								
								<% } %>
                            </div>
                        </div>
                    </div>
                </main>
                
                <%@ include file="../common/adminFooter.jsp" %>
            </div>
        </div>

            <!-- Modal -->
        <div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">신고 세부 내용</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <tr>
                                <td>
                                    <label class="modal-title-font">댓글 내용</label>
                                    <br>
                                    <label class="board-title"></label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label class="modal-title-font">분류</label>
                                    <br>
                                    <label class="board-group"></label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label class="modal-title-font">신고 내용</label>
                                    <br>
                                    <div class="diyDiv" style="height: 150px;">
                                    <label class="board-content"></label>
                                    </div>
                                </td>
                            </tr>
                        </table>                        
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary">댓글 원문 보러가기</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>                        
                        <!-- <button type="button" class="btn btn-primary" id="close_modal">다른 방식으로 모달 닫기</button> -->
                    </div>
                </div>
            </div>
        </div>
        
        <script>
        	function goReport() {
        		location.href = "<%=contextPath%>/list.re?pageId=6";
        	}
        </script>

        <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
	    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	    <script src="resources/js/admin1.js"></script>
	    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
	    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
	    <script src="resources/js/admin-datatables.js"></script>

        <script>
            $(function() {
            	// 모달
                $("#reportModal").on('show.bs.modal', function(event){
                	var comment = $(event.relatedTarget).data('comment');
                	var group = $(event.relatedTarget).data('group');
                	var content = $(event.relatedTarget).data('content');
                	
                	var modal = $(this);
                	modal.find(".board-comment").text(comment);
                	modal.find(".board-group").text(group);
                	modal.find(".board-content").text(content);
                	
                	// 게시글 원문 보러가기 위해
                });
            });
        </script>
    </body>
</html>
    