<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <h1 class="mt-4">작품 등록 및 승인</h1>
                    <br>
                    
                    <button class="btn btn-light" type="button">작품 등록 대기</button>
                    &nbsp;
                    <button class="btn btn-dark" type="button" onclick="goEpisode();">에피소드 등록 대기</button>
                    
                    
                    <br><br>
                    <div class="card mb-4">
                        <div class="card-header"><i class="fas fa-table mr-1"></i>작품 등록 신청 목록
                            <button class="btn btn-primary" style="float:right;">검색</button>
                            <input type="text" class="search" id="memberSearch" style="float: right;">
                            
                        </div>
                        <div class="card-body">

                            <div class="table-responsive">
                                <table class="table table-bordered" id="memberTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>Writer</th>
                                            <th>Work</th>
                                            <th>Genre</th>
                                            <th>Request Date</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td>오리</td>
                                            <td><a href="<%=contextPath%>/approvDetail.wo?pageId=5">칼가는 소녀</a></td>
                                            <td>일상</td>
                                            <td>2020.02.11</td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td>오리</td>
                                            <td><a href="#">칼가는 소녀</a></td>
                                            <td>일상</td>
                                            <td>2020.02.11</td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td>오리</td>
                                            <td><a href="#">칼가는 소녀</a></td>
                                            <td>일상</td>
                                            <td>2020.02.11</td>
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
    	function goEpisode() {
    		location.href = "<%=contextPath%>/episodeApprov.wo?pageId=5";
    	}
    </script>
</body>
</html>
