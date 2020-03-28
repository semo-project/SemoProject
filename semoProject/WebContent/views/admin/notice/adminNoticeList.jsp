<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.kh.notice.model.vo.Notice, java.text.SimpleDateFormat,java.util.Date" %>  

<% 
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sdf.format(date); // "2020-02-25"
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
                    <h1 class="mt-4">공지사항 관리</h1>
                    
                    <br>
                    <div class="diyDiv mb-4">
                        <label>수정이 불가하오니, 신중한 작성 부탁 드립니다.</label> 
                        <!-- 빈공간이지만 점점 추가될 예정이라 -->
                    </div>
                    
                    <div class="card mb-4">
                        <div class="card-header"><i class="fas fa-table mr-1"></i>공지사항 목록
                            <button class="btn btn-primary" style="float:right;">검색</button>
                            <input type="text" class="search" id="memberSearch" style="float: right;">
                        </div>
                        <div class="card-body">

                            <div class="table-responsive">
                                <table class="table table-bordered" id="memberTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>No</th>
                                            <th>Title</th>
                                            <th>Write Date</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                    
                                    <% if(list.isEmpty()){ %>
									<tr>
										<td colspan="4" style="text-align:center;">조회된 데이터가 없습니다.</td>
									</tr>
									<% }else{ %>
                                    
                                    	<% for(Notice n : list){ %>
                                    	<tr>
                                            <td><input type="checkbox"></td>
                                            <td><%= n.getNoticeNo() %></td>
                                            <td style="color:blue; cursor:pointer;" onclick="test();" value="<%=n.getNoticeNo()%>"><%= n.getNoticeTitle() %></td>
                                            <td><%= n.getNoticeDate() %></td>
                                        </tr>
                                        	<% } %>
										<% } %>	
										
                                    </tbody>
                                </table>
								
								<div style="float: right;" >
									<button class="btn btn-dark" type="button" id="insertBtn">작성하기</button>
				                    &nbsp;
				                    <!-- <button class="btn btn-dark" type="button" id="tr2">수정하기</button>
				                    &nbsp; -->
	                                <button class="btn btn-danger">삭제하기</button>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </main>
           
           	<%@ include file ="../common/adminFooter.jsp" %>
        </div>
    </div>
    
        <!-- Modal1-->
    	<form class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
    		  action="<%=request.getContextPath()%>/ainsert.no" method="POST" >
			<div class="modal-dialog" id=insertNotice role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">공지사항 작성</h5>
                    	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                       	 	<span aria-hidden="true">&times;</span>
                    	</button>
                	</div>
                <div class="modal-body">
                    <table class="table" id="dataTables">
                        <tr>
                            <td>
                                <label class="modal-title-font">공지사항 제목</label>
                                <br>
                                <input type="text" name="title" class="input" style="width:450px">
                            </td>
                        </tr>
                        <tr>                            
                        	<td>
                                <label class="modal-title-font">공지사항 작성일</label>
                                <br>
                                <%=today%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="modal-title-font">공지사항 내용</label>
                                <br>
                                <textarea style="resize:none" class="diyDiv" cols="57" rows="10" name = "content"> 
                                </textarea>
                            </td>
                        </tr>
                    </table>                        
                </div>
                <div class="modal-footer">
                    <button type="sumbit" class="btn btn-primary">공지사항 작성하기</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>                        
                </div>
            </div>
        </div>
    </form>

    <!-- Modal 2-->
    <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
    	 action=<%=contextPath %>/ainsert.no" method="post">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">공지사항 세부 내용</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <table class="table">
                        <tr>
                            <td>
                                <label class="modal-title-font">공지사항 제목</label>
                                <br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="modal-title-font">공지사항 내용</label>
                                <br>
                                <div class="diyDiv" style="height: 150px;">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label> 공지사항 수정 내용 </label>
                                <br>
                                <div style="height:250px;">
                                </div>
                            </td>
                        </tr>
                    </table>                        
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn1">공지사항 수정하기</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>                        
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
    <script src="assets/demo/datatables-demo.js"></script>

	<script>
	    $(function() {
	        $("#insertBtn").click(function() {
	            $("#exampleModal").modal("show");
	        });
	        $("#tr2").click(function() {
	            $("#exampleModal2").modal("show");
	        });
	        
	        function test() {
	        	alert("test");
	        }
	    });
	</script>
</body>
</html>