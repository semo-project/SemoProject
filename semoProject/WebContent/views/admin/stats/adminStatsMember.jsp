<%@page import="com.kh.admin.model.vo.MemberStats"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	// 그냥 남여 모두 10대 ~ 60대까지 빠짐없이 데이터가 있다고 생각하자..
	
	ArrayList<MemberStats> list = (ArrayList<MemberStats>)request.getAttribute("list");
	
	// 카운트 String으로 합치기 위한 StringBuilder
	StringBuilder female = new StringBuilder();
	StringBuilder male = new StringBuilder();
	
	// 연령대를 String으로 합치기 위한 StringBuilder
	StringBuilder age = new StringBuilder();
	
	// 카운트 수 String으로 묶어주기
	for(MemberStats ms : list) {
		// 여자면 female에 얹어주기
		if(ms.getGender().equals("F")) {
			female.append(", " + ms.getCount());
			// 연령대 합치기
			age.append(", \"" + (ms.getAge()*10) + "대\"");
		} else {
			male.append(", " + ms.getCount());
		}
	}

	// 앞에 ', '를 지워주기 위해
	String femaleCount = female.substring(2);
	String maleCount = male.substring(2);
	String ageList = age.substring(2);
	
	
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
                        
                        <button class="btn btn-dark" type="button" onclick="goVisit();">방문수</button>
                        &nbsp;
                        <button class="btn btn-light" type="button">성별/연령별</button>
                        &nbsp;
                        <!-- <button class="btn btn-dark" type="button" onclick="goCookieCount();">쿠키결제</button> -->

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
                
                <%@ include file="../common/adminFooter.jsp" %>
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
        <!-- <script src="resources/js/chart-bar.js"></script> -->
        <script src="resources/js/chart-pie.js"></script>
        <script>
			
        	Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
			Chart.defaults.global.defaultFontColor = '#292b2c';
			
			var ctx = document.getElementById("myBarChart");
			var myLineChart = new Chart(ctx, {
			  type: 'bar',
			  data: {
			    labels: [<%=ageList%>],
			    datasets: 
			     [{
			      label: "남자",
			      backgroundColor: "#ffc107",
			      borderColor: "rgba(2,117,216,1)",
			      data: [<%=maleCount%>],
			      
			    },
			    {
			      label: "여자",
			      backgroundColor: "#28a745",
			      borderColor: "rgba(2,117,216,1)",
			      data: [<%=femaleCount%>],
			    }],
			  },
			  options: {
			    scales: {
			      xAxes: [{
			        time: {
			          unit: 'age'
			        },
			        gridLines: {
			          display: false
			        },
			        ticks: {
			          maxTicksLimit: 6
			        }
			      }],
			      yAxes: [{
			        ticks: {
			          min: 0,
			          max: 15,
			          maxTicksLimit: 5
			        },
			        gridLines: {
			          display: true
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
    