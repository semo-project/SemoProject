<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<body class="sb-nav-fixed">

	<%@ include file="../common/adminTopNav.jsp" %>

    <div id="layoutSidenav">
        
        <%@ include file="../common/adminSideNav.jsp" %>

        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid">
                    <h1 class="mt-4">전체 회원 보기</h1>
                    
                    <br>
                    
                    <button class="btn btn-light" type="button">전체 회원</button>
                    &nbsp;
                    <button class="btn btn-dark" type="button" onclick="goWriterApprv();">작가 대기 회원</button>

                    <br><br>
                    <div class="card mb-4">
                        <div class="card-header"><i class="fas fa-table mr-1"></i>전체 회원 목록
                            <button class="btn btn-primary" style="float:right;">검색</button>
                            <input type="text" class="search" id="memberSearch" style="float: right;">
                        </div>
                        <div class="card-body">

                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Id</th>
                                            <th>Phone</th>
                                            <th>Gender</th>
                                            <th>Age</th>
                                            <th>Ent Date</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                        <tr>
                                            <td>홍길동</td>
                                            <td>hong1234</td>
                                            <td>010-1111-2222</td>
                                            <td>F</td>
                                            <td>27</td>
                                            <td>2017.12.14</td>
                                        </tr>
                                        <tr>
                                            <td>홍길동</td>
                                            <td>hong1234</td>
                                            <td>010-1111-2222</td>
                                            <td>F</td>
                                            <td>27</td>
                                            <td>2017.12.14</td>
                                        </tr>
                                        <tr>
                                            <td>홍길동</td>
                                            <td>hong1234</td>
                                            <td>010-1111-2222</td>
                                            <td>F</td>
                                            <td>27</td>
                                            <td>2017.12.14</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </main>
            
            <%@ include file = "../common/adminFooter.jsp" %>
        </div>
    </div>
    
    <script>
    	function goWriterApprv() {
    		location.href = "<%=contextPath%>/writerApprv.wr";
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
