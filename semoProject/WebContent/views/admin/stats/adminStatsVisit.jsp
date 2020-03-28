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
                        
                        <button class="btn btn-light" type="button">방문수</button>
                        &nbsp;
                        <button class="btn btn-dark" type="button" onclick="goMemberStats();">성별/연령별</button>
                        &nbsp;
                        <!-- <button class="btn btn-dark" type="button" onclick="goCookieCount();">쿠키결제</button> -->

                        <br><br>

                        <div class="card mb-4">
                            <div class="card-header"><i class="fas fa-chart-area mr-1"></i>달 별 방문수 통계</div>
                            <div class="card-body"><canvas id="myAreaChart" width="100%" height="30"></canvas></div>
                            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                        </div>
                    </div>
                </main>
                
                <%@ include file="../common/adminFooter.jsp" %>
            </div>
        </div>
        
        <script>
        	function goMemberStats() {
        		location.href = "<%=contextPath%>/member.st?pageId=10";
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
    