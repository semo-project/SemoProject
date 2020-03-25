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
                    
                    <button class="btn btn-dark" type="button" onclick="goMemberList();">전체 회원</button>
                    &nbsp;
                    <button class="btn btn-light" type="button">작가 대기 회원</button>

                    <br><br>
                    <div class="card mb-4">
                        <div class="card-header"><i class="fas fa-table mr-1"></i>작가 신청 목록
                            <button class="btn btn-primary" style="float:right;">검색</button>
                            <input type="text" class="search" id="memberSearch" style="float: right;">
                            
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
                                            <th>Show Work</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                        <tr>
                                            <td><input type="checkbox" id="writerAprv"></td>
                                            <td>권경민</td>
                                            <td>kwon1234</td>
                                            <td>권경</td>
                                            <td><a href="Member_작가대기회원_작품보기.html">작품 보기</a></td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox" id="writerAprv"></td>
                                            <td>권경민</td>
                                            <td>kwon1234</td>
                                            <td>권경</td>
                                            <td><a href="#">작품 보기</a></td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox" id="writerAprv"></td>
                                            <td>권경민</td>
                                            <td>kwon1234</td>
                                            <td>권경</td>
                                            <td><a href="#">작품 보기</a></td>
                                        </tr>
                                    </tbody>
                                </table>

                                <button class="btn btn-danger" style="float: right;">승인</button>
                                <!-- <input type="submit" class="btn btn-danger" style="float: right;" value="승인"> -->
                            </div>
                            
                        </div>
                    </div>
                </div>
            </main>
            
            <%@ include file="../common/adminFooter.jsp" %>
        </div>
    </div>
    
    <script>
    	function goMemberList() {
    		location.href = "<%=contextPath%>/list.me";
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
