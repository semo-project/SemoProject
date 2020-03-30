<%@page import="com.kh.admin.model.vo.VisitStats"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<VisitStats> list = (ArrayList<VisitStats>)request.getAttribute("list");
%>
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
        <!--<script src="resources/js/chart-area.js"></script>  -->
        <script>
	        Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	        Chart.defaults.global.defaultFontColor = '#292b2c';
	
	        // Area Chart Example
	        var ctx = document.getElementById("myAreaChart");
	        var myLineChart = new Chart(ctx, {
	          type: 'line',
	          data: {
	            labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
	            datasets: [{
	              label: "누적 방문 수",
	              lineTension: 0.3,
	              backgroundColor: "rgba(2,117,216,0.2)",
	              borderColor: "rgba(2,117,216,1)",
	              pointRadius: 5,
	              pointBackgroundColor: "rgba(2,117,216,1)",
	              pointBorderColor: "rgba(255,255,255,0.8)",
	              pointHoverRadius: 5,
	              pointHoverBackgroundColor: "rgba(2,117,216,1)",
	              pointHitRadius: 50,
	              pointBorderWidth: 2,
	              data: [10000, 30162, 26263, 0,0,0,0,0,0,0,0,0],
	            }],
	          },
	          options: {
	            scales: {
	              xAxes: [{
	                time: {
	                  unit: 'month'
	                },
	                gridLines: {
	                  display: false
	                },
	                ticks: {
	                  maxTicksLimit: 12
	                }
	              }],
	              yAxes: [{
	                ticks: {
	                  min: 0,
	                  max: 40000,
	                  maxTicksLimit: 5
	                },
	                gridLines: {
	                  color: "rgba(0, 0, 0, .125)",
	                }
	              }],
	            },
	            legend: {
	              display: false
	            }
	          }
	        });
        </script>
    </body>
</html>
    