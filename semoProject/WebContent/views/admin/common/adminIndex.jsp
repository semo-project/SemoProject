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
<head>
<meta charset="utf-8" />
	<title>Admin Page</title>
	<link href="resources/css/admin_styles.css" rel="stylesheet" type="text/css"/>
	<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
</head>
    <body class="sb-nav-fixed">
    
    <%@ include file="adminTopNav.jsp" %>
    
    <div id="layoutSidenav">   
    
    <%@ include file="adminSideNav.jsp" %>
   
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">Semo Webtoon</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Today : </li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">회원 관리</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="<%=contextPath%>/list.me?pageId=1">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">작품 관리</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="<%=contextPath%>/list.wo?pageId=4">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">신고 관리</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="<%=contextPath%>/list.re?pageId=6">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">고객 서비스</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="<%=contextPath%>/alist.no?pageId=7">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>	
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header"><i class="fas fa-chart-area mr-1"></i>달 별 방문수</div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header"><i class="fas fa-chart-bar mr-1"></i>연령별 성별 회원 수</div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                
                <%@ include file="adminFooter.jsp" %>
            </div>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="resources/js/chart-area.js"></script>
        
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>
        
        <!-- <script src="resources/js/chart-bar.js"></script>-->
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
    