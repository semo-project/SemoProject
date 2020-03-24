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
                    <h1 class="mt-4">전체 작품 보기</h1>
                    
                    <br>
                    
                    <div>
                        <div class="diyDiv mb-4" style="display: inline-block;">
                            <label id="writerName">권경</label> 작가의 작품 목록
                            
                        </div>
                        <div class="diyDiv" style="display: inline-block; width: ;">
                            <label>신의 탑</label>
                        </div>
                    </div>
                    

                    <div class="card mb-4">
                        <div class="card-header"><i class="fas fa-table mr-1"></i>작가 별 작품 목록
                            <button class="btn btn-primary" style="float:right;">검색</button>
                            <input type="text" class="search" id="memberSearch" style="float: right;">
                            
                        </div>
                        <div class="card-body">

                            <div class="table-responsive">
                                <table class="table table-bordered" id="memberTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th style="width: 20%;"></th>
                                            <th style="width: 80%;">Episode</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td><a href="#">1화-어쩌고 저쩌고 굉장히 긴 제목 추후에 에피소드 화면과 연결될 거야</a></td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td><a href="#">1화</a></td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td><a href="#">1화</a></td>
                                        </tr>
                                    </tbody>
                                </table>

                                <button class="btn btn-danger" style="float: right;">숨김 처리</button>
                            </div>                                
                        </div>
                    </div>
                </div>
            </main>
            
            <%@ include file="../common/adminFooter.jsp" %>
            
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
    <script src="assets/demo/datatables-demo.js"></script>
</body>
</html>
