<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="sb-nav-fixed">
    
    <%@ include file="../common/adminTopNav.jsp" %>
    
    <div id="layoutSidenav">
        
        <%@ include file="../common/adminSideNav.jsp" %>
        
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid">
                <h1 class="mt-4">자주묻는 질문 관리</h1>
                <!--
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                    <li class="breadcrumb-item active">전체 회원 보기</li>
                </ol>
                -->
                <br>
                
                <button class="btn btn-dark" type="button"><a id="tr2" style="color: white;">자주 묻는 질문 등록</a></button>
                &nbsp;
                <button class="btn btn-light" type="button">자주 묻는 질문 숨김</button>
                
                
                <br><br>
                <div class="card mb-4">
                    <div class="card-header"><i class="fas fa-table mr-1" id="tr2"></i>자주 묻는 질문 목록
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
                                        <th>제목</th>
                                        <th>Regist Date</th>
                                    </tr>
                                </thead>
                                
                                <tbody>
                                    <tr id="tr1">
                                        <td><input type="checkbox"></td>
                                        <td>154</td>
                                        <td><a href="Work_작품등록및승인_에피소드_등록.html">정기 결제 해지 방법</a></td>
                                        <td>2020.02.11</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>113</td>
                                        <td><a href="Work_작품등록및승인_에피소드_등록.html">코인 쿠폰 등록 </a></td>
                                        <td>2020.02.11</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>12</td>
                                        <td><a href="Work_작품등록및승인_에피소드_등록.html">보너스 코인 사용</a></td>
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

<!-- Modal-->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">자주묻는 질문 상세보기</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table">
                    <tr>
                        <td>
                            <label class="modal-title-font">자주묻는 질문 번호</label>
                            <br>
                            254
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="modal-title-font">자주 묻는 제목</label>
                            <br>
                            계정 로그인을 
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="modal-title-font">자주 묻는 내용</label>
                            <br>
                            <div style="height: 150px;">
                                공지사항에서 확인해
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="modal-title-font">자주 묻는 수정 내용</label>
                            <br>
                            <div class="diyDiv" style="height: 150px;">
                                혹시 모를 수정에
                            </div>
                        </td>
                    </tr>
                </table>                        
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">자주묻는질문 작성하기</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>                        
            </div>
        </div>
    </div>
</div>

<!-- Modal2-->
<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel2">자주묻는 질문 등록</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table">
                    <tr>
                        <td>
                            <label class="modal-title-font">자주묻는 질문 번호</label>
                            <br>
                            254
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="modal-title-font">자주 묻는 제목</label>
                            <br>
                            계정 로그인을 
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="modal-title-font">자주 묻는 내용</label>
                            <br>
                            <div class="diyDiv" style="height: 150px;">
                                공지사항에서 확인해
                            </div>
                        </td>
                    </tr>
                </table>                        
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">자주묻는질문 작성하기</button>
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