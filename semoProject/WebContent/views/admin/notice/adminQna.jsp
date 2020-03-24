<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%@ include file="../common/adminTopNav.jsp" %>
    
    <div id="layoutSidenav">
        
        <%@ include file="../common/adminSideNav.jsp" %>
        
	<div id="layoutSidenav_content">
	    <main>
	        <div class="container-fluid">
	            <h1 class="mt-4">1:1문의 관리</h1>
	
	            <br>
	            
	            <button class="btn btn-dark" type="button"><a id="tr2" >1:1문의 답변</a></button>
	            &nbsp;
	            <button class="btn btn-dark" type="button"><a id="tr1" >1:1문의 수정</a></button>
	            
	            
	            <br><br>
	            <div class="card mb-4">
	                <div class="card-header"><i class="fas fa-table mr-1"></i>1:1문의 목록
	                    <button class="btn btn-primary" style="float:right;">검색</button>
	                    <input type="text" class="search" id="memberSearch" style="float: right;">
	                    
	                </div>
	                <div class="card-body">
	
	                    <div class="table-responsive">
	                        <table class="table table-bordered" id="memberTable" width="100%" cellspacing="0">
	                            <thead>
	                                <tr>
	                                    <th></th>
	                                    <th>번호</th>
	                                    <th>작성자 아이디</th>
	                                    <th>문의 분류</th>
	                                    <th>제목</th>
	                                    <th>작성시간</th>
	                                </tr>
	                            </thead>
	                            
	                            <tbody>
	                                <tr id="tr1" > 
	                                    <td><input type="checkbox"></td>
	                                    <td>154</td>
	                                    <td>test4@google.com</td>
	                                    <td>컨텐츠</td>
	                                    <td><a href="#">컨텐츠가 </a></td>
	                                    <td>2020.02.11</td>
	                                </tr>
	                                <tr>
	                                    <td><input type="checkbox"></td>
	                                    <td>153</td>
	                                    <td>test3@google.com</td>
	                                    <td>로그인/계정</td>
	                                    <td><a href="#">개인정보처리방침이</a></td>
	                                    <td>2020.02.11</td>
	                                </tr>
	                                <tr>
	                                    <td><input type="checkbox"></td>
	                                    <td>152</td>
	                                    <td>test2@google.com</td>
	                                    <td>계정</td>
	                                    <td><a href="#">쿠키 소멸이</a></td>
	                                    <td>2020.02.11</td>
	                                </tr>
	                            </tbody>
	                        </table>
	
	                        <button class="btn btn-danger" style="float: right;">삭제</button>
	                        <!-- <input type="submit" class="btn btn-danger" style="float: right;" value="승인"> -->
	                        </div>
	                        
	                    </div>
	                </div>
	            </div>
	        </main>
	        <footer class="py-4 bg-light mt-auto">
	            <div class="container-fluid">
	                <div class="d-flex align-items-center justify-content-between small">
	                    <div class="text-muted">Copyright &copy; Cookies</div>
	                    <div>
	                        <a href="#">Privacy Policy</a>
	                        &middot;
	                        <a href="#">Terms &amp; Conditions</a>
	                    </div>
	                </div>
	            </div>
	        </footer>
	    </div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="exampleModalLabel">1:1 문의 내용</h5>
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span>
	                </button>
	            </div>
	            <div class="modal-body">
	                <table class="table">
	                    <tr>
	                        <td>
	                            <label class="modal-title-font">작성자 아이디</label>
	                            <br>
	                            teat1@google.com
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <label class="modal-title-font">문의 분류</label>
	                            <br>
	                            컨텐츠
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <label class="modal-title-font">문의 제목</label>
	                            <br>
	                            컨텐츠가
	                        </td>
	                    </tr>
	
	                    <tr>
	                        <td>
	                            <label> 1:1 문의 내용 </label>
	                            <br>
	                            <div style="height:150px;">
	                            사용자가 문의한 내용
	                        </div>
	                    </td>
	                </tr>
	                <tr>
	                    <td>
	                        <label> 1:1 문의 관리자가 처음 내용 </label>
	                        <br>
	                        <div style="height:250px;">
	                            관리지가 처음 답변한 내용을 여기다가 
	                        </div>
	                    </td>
	                </tr>
	
	                <tr>
	                    <td>
	                        <label class="modal-title-font">1:1 문의 수정 내용</label>
	                        <br>
	                        <div class="diyDiv" style="height: 150px;">
	                                나중에 수정할 사항은 여기다가 입력
	                            </div>
	                        </td>
	                    </tr>
	
	                    
	                </table>                        
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-primary">답변완료</button>
	                <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>                        
	            </div>
	        </div>
	    </div>
	</div>
	<!-- Modal2-->
	<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="exampleModalLabel">1:1문의 답변 작성</h5>
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span>
	                </button>
	            </div>
	            <div class="modal-body">
	                <table class="table">
	                    <tr>
	                        <td>
	                            <label class="modal-title-font">작성자 아이디</label>
	                            <br>
	                            test02
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <label class="modal-title-font">문의 분류</label>
	                            <br>
	                            컨텐츠
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <label class="modal-title-font">1:1문의 제목</label>
	                            <br>
	                            컨텐츠가 
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <label> 1:1 문의 내용 </label>
	                            <br>
	                            <div style="height:250px;">
	                            사용자가 묻는 1:1 문의 내용
	                        </div>
	                    </td>
	                </tr>
	                <tr>
	                    <td>
	                        <label class="modal-title-font"> 1:1 답변 내용</label>
	                        <br>
	                        <div class="diyDiv" style="height: 150px;">
	                                    관리자가 답변할 내용
	                                </div>
	                            </td>
	                        </tr>
	
	
	
	                    </table>                        
	                </div>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-primary">답변완료</button>
	                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>                        
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
	    $("#tr1").click(function() {
	        $("#exampleModal").modal("show");
	    });
	});
	$(function() {
	    $("#tr2").click(function() {
	        $("#exampleModal2").modal("show");
	    });
	});    
	</script>




</body>
</html>