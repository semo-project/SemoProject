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
                    
                    <div class="diyDiv mb-4">
                        <label for=""></label> 
                        <!-- 빈공간이지만 점점 추가될 예정이라 -->
                    </div>

                    <div class="card mb-4">
                        <div class="card-header"><i class="fas fa-table mr-1"></i>세모웹툰 전체 작품 목록
                            <button class="btn btn-primary" style="float:right;">검색</button>
                            <input type="text" class="search" id="memberSearch" style="float: right;">
                            
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
                                        <tr>
                                            <td>신의 탑</td>
                                            <td>권경</td>
                                            <td><a href="<%=contextPath%>/writerList.wo?pageId=4">작품 리스트 보기</a></td>
                                            <!-- 그리고 보내줄 때 작가 번호도 보내줘야 함 일단 뺌 -->
                                        </tr>
                                        <tr>
                                            <td>신의 탑</td>
                                            <td>권경</td>
                                            <td><a href="Work_전체작품보기_작품리스트.html">작품 리스트 보기</a></td>
                                        </tr>
                                        <tr>
                                            <td>신의 탑</td>
                                            <td>권경</td>
                                            <td><a href="Work_전체작품보기_작품리스트.html">작품 리스트 보기</a></td>
                                        </tr>
                                    </tbody>
                                </table>
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
