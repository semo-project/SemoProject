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
                    <h1 class="mt-4">작품 등록 및 승인</h1>
                    
                    <br>                        

                    <table class="table">
                        <tr>
                            <td class="workThumbnail">
                                <img class="img-thumbnail" src="assets/img/썸네일.PNG" alt="">
                            </td>
                            <td rowspan="2" style="width: 30%; ">
                                <div class="diyDiv" style="height:340px;">
                                    <label class="td30bold">작품 요약</label><br>
                                    복수를 꿈 꾸는 두 소녀의 이야기
                                </div>
                            </td>
                            <td rowspan="2" style="width: 40%;">
                                <div class="diyDiv" style="height:340px;">
                                    <label class="td30bold">줄거리</label><br>
                                    치사율 100%의 인싸 희귀병 소녀 '사랑' <br>
                                    누구보다 차분하고 두려움 없는 같은 반 소녀 '은조' <br>
                                    두 소녀가 가슴 속 칼을 품고 세상을 향한 복수를 꿈꾼다 <br>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="diyDiv-noPadding">
                                    <table class="width100">
                                        <tr>
                                            <td class="td30bold">작품명</td>
                                            <td>칼 가는 소녀</td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="diyDiv-noPadding">
                                    <table class="width100">
                                        <tr>
                                            <td class="td30bold">장르</td>
                                            <td>일상</td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="diyDiv-noPadding">
                                    <table class="width100">
                                        <tr>
                                            <td class="td30bold">작가명</td>
                                            <td>오리</td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                        <tr>
                           <td colspan="3">
                                <button class="btn btn-dark" style="float: right;">
                                    <a href="<%=contextPath%>/workApprov.wo?pageId=5" style="color:white;">목록으로</a>
                                </button>
                           </td> 
                        </tr>
                    </table>
                
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
