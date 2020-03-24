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
                        <h1 class="mt-4">통계 관리</h1>
                        <br>
                        
                        <button class="btn btn-dark" type="button" onclick="goVisit();">방문수</button>
                        &nbsp;
                        <button class="btn btn-light" type="button">성별/연령별</button>
                        &nbsp;
                        <button class="btn btn-dark" type="button" onclick="goCookieCount();">쿠키결제</button>

                        <br><br>

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card mb-4"> <!-- 얘만 남겨두면 크게 차지할 수 있는데 안 예쁘네-->
                                    <div class="card-header"><i class="fas fa-chart-bar mr-1"></i>성별/연령별 회원 통계</div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="50"></canvas></div>
                                    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2019</div>
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
        
        <script>
        	function goVisit() {
        		location.href = "<%=contextPath%>/visit.st?pageId=10";
        	}
        	function goCookieCount() {
        		location.href = "<%=contextPath%>/cookie.st?pageId=10";
        	}
        </script>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="resources/js/chart-area.js"></script>
        <script src="resources/js/chart-bar.js"></script>
        <script src="resources/js/chart-pie.js"></script>
    </body>
</html>
    