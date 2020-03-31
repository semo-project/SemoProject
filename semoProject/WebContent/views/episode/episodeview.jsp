<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.util.ArrayList"%>
 <%@page import="com.kh.episode.model.vo.Episode, com.kh.episode.model.vo.EpNotice, com.kh.work.model.vo.Work"%>
 <%
	ArrayList<Episode> list = (ArrayList<Episode>)request.getAttribute("list");
	Work w = (Work)request.getAttribute("w");
	EpNotice en = (EpNotice)request.getAttribute("en");
%>
 
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <meta charset="utf-8"> <meta name="viewport" content="width=device-width"> <title>세모웹툰</title>



  <title>세모웹툰</title>

  <!-- Bootstrap core CSS -->
  <link href="resources/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <!-- <link href="css/modern-business.css" rel="stylesheet"> -->
<style>

  .star-input>.input,
.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('../resources/images/grade_img.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}
.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
#row{
	 width: 1000px;
    height: 800px;
    margin-left: auto;
    margin-right: auto;
}
#heart {
      color: grey;  
      font-size: 50px;
    }
    
    #heart.red {
      color: red;
    }
  .heart-share{
    display: flex;
  }
  .heart-share1{
    width: 50px;
  }
  
   *{
            margin: 0;
            padding: 0;
        }
        body{
            font: 17px 'Nanum Gothic', sans-serif;
        }
        a{
            text-decoration: none;
        }
        li{
            list-style:none;
        }

        /*BODY*/
        #noticeno {
            width: 450px;
            margin: 0 auto;
            box-sizing: border-box;
            /*outline: 1px dashed black;*/
            }
        #noticeno h3{
            font-size: 17px;
            text-align: center;
            margin: 10px 180px;
            padding: 10px;
            color: #fff;
            background: #007AAE;
            border-radius: 30px;
        }
        #noticeno ul{
            width: 100%;
        }

        #noticeno ul li{
            line-height: 30px; /*li 세로간격*/;
            padding-left: 20px;
        }
        #noticeno ul li:first-child{
            border-top: 2px solid #6a6a6a;
            border-bottom: 2px solid #6a6a6a;
            padding-left: 150px;
        }
        #noticeno ul li:last-child{
            border-bottom: 1px solid #000;
        }
        #noticeno ul li:nth-child(2n){
            background: #94d8f6;
            border-radius: 20px;
        }
        #noticeno ul li span{
            display: inline-block;
            float: right;
            width: 150px;
            text-align: center;
        }
        
        .replyArea{
			background:black;
			color:white;
			margin:auto;
			width:800px;
		}
  
  #semoweb{
    overflow: hidden;
    position: relative;
    min-width: 978px;
    min-width: 800px;
    
    
  }
  .screen_out{
    overflow: hidden;
    position: absolute;
    width: 0;
    height: 0;
    line-height: 0;
    text-indent: -9999px;
  }
  .btn_comm{
    width: 60px;
    height: 60px;
    border-left: 1px solid #d8d8d8;
    display: block;
    border: 0px;
    background-repeat: no-repeat;
    background-position: center;
    font-size: 1px;
    color: transparent;
    margin: 0;
    padding: 0;
    font: inherit;
  }
  .list_info{
    display: inline-flex;
  }
  .list_control{
    float: right;
    margin-left: auto!important;
   display: flex;
  }
  .viewer__footer--active{
    bottom: 0;
  }
  .viewer__footer{
    background: #fff;
    border-top: 1px solid #d8d8d8;
    height: 60px;
    left: 0;
    position: fixed;
    text-align: center;
    width: 100%;
    z-index: 900;
    
  }
  .item_updown{
    top: 27px;
    position: absolute;
    right: 11px;
    height: 16px;
    line-height: 16px;
  }
  .item_radio{
    margin-left: 300px;
  }
  .btn_report{
    width: 14px;
    display: inline-block;
    overflow: hidden;
    height: 11px;
    vertical-align: top;
    
  }
  .star_rating {font-size:0; letter-spacing:-4px;}

	.star_rating a {
	
	    font-size:22px;
	
	    letter-spacing:0;
	
	    display:inline-block;
	
	    margin-left:5px;
	
	    color:#ccc;
	
	    text-decoration:none;
	
	}
	
	.star_rating a:first-child {margin-left:0;}
	
	.star_rating a.on {color:#777;}
	
	 #modal3 {
      display:none;
      background-color:#FFFFFF;
      position:absolute;
      top:500px;
      left:200px;
      padding:10px;
      border:2px solid #E2E2E2;
      z-Index:9999
   }
	</style>
</head>

<body>

  <!-- Navigation -->
  <%@ include file="../common/menubar.jsp" %>
  

  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Portfolio Item
      <small>Subheading</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">Home</a>
      </li>
      <li class="breadcrumb-item active"><%= w.getWorkTitle() %></li>
    </ol>

    <!-- Portfolio Item Row -->
    <div class="row">

      <div class="col-md-8">
        <img class="img-fluid" src="<%= contextPath %>/resources/work_upfiles/<%= w.getThumbnailModify() %>" alt="">
      </div>
      
      
      <div class="col-md-4">
        <h2 class="my-3"><%= w.getWorkTitle() %></h2>
        <h4><%= w.getGenreName() %></h4>
       <input type="hidden"<%= w.getWorkNo() %>><p>연재일:<%= w.getApprovalDate() %></p>
        <p><button type="button" class="btn btn-secondary btn-block" onClick="location.href= 'http://localhost:8888/semo/episode.de?eNo=1'">첫회보기</button></p>
        <% if(loginUser != null){ %>
        <ul class="clear_g list_append" style="display: flex;margin-left: 100px; width: 200px;">
          <li class="box_grade">
             <p class="star_rating">

				<a href="#" class="on"  id="star1";>★</a>
			
				<a href="#" class="on"  id="star2";>★</a>
				
				<a href="#" class="on"  id="star3";>★</a>
				 
				<a href="#"  class="on" id="star4";>★</a>
		
				<a href="#"  class="on" id="star5";>★</a>	
				
				<%if(loginUser != null){ %>
				<input type="hidden" id="tttt" value="<%= loginUser.getMemberNo() %>">
				<%}else{ %>
				<input type="hidden" id="tttt" value="">
				<%} %>
			</p>
	      </li>
	    </ul>
	    <% }else{ %>
	    <ul class="clear_g list_append" style="display: flex;margin-left: 100px; width: 200px;">
          <li class="box_grade">
             <p class="star_rating">

			
			</p>
	      </li>
	    </ul>
	    <% } %>
	    <script>
	 $('.on').click(function(){
	    var star = $(this).attr("id");
	    
	    if($("#tttt").val() != ""){
		    location.href="<%=contextPath%>/star.gr?star=" + star + "&wno=<%= w.getWorkNo() %>" +"&mno=" + $("#tttt").val();
	    }
	   
	    
	});
	
	 
	</script>
    
    <ul >
     <li >
     	
	</li>
     
      <li>
      		<button id='btn1' class="btn btn-secondary btn-lg">share</button>

      </li>
        
    </ul>
   
	
    <p><%= w.getWorkSummary() %></p>
    
      </div>

    </div>
    <!-- /.row -->

    <!-- Related Projects Row -->
    <hr>
    <div class="sort_comm" style="float: right;">
     
        <button class="btn btn-dark" type="button" onclick="episodelist1();">최신화부터</button>
    
        <button class="btn btn-dark" type="button" onclick="episodelist2();">첫화부터</button>
      

    </div>
		<h3>
			<button id="noticeBtn" class="btn btn-dark">공지사항</button>
		</h3>
            
            <!-- 공지사항 모달 -->
            <div id="modal3">
            <h3 align="center">공지사항</h3>
                <table align="center">
                   <tr>
                      <th colspan="3"><hr></th>
                   </tr>
                   <tr>
                      <th>No.</th>
                      <th>제목</th>
                      <th>작성일</th>
                   </tr>
                </table>
                <table id="noticeList">
                	
                </table>
                <textarea rows="1" cols="20"></textarea>
                <button class="" type="button" id="Btn" align="center">글쓰기</button> 
                <br>
                   
                <button class="btn btn-warning" type="submit" id="repOkBtn" align="center">확인</button>
                <button class="btn btn-warning" type="submit" id="repXBtn" align="center">취소</button>
                <!-- <button class="repCloseBtn">닫기</button> -->
            </div>
  
    </div>
</h3>
    <hr>
    <div class="row" style="margin-left: 80px; margin-right: 80px;">
   
    
    
        <% if(list.isEmpty()){ %>
        	<div>
 					<div><p>조회된 리스트가 없습니다.</p></div>       	
        	</div>
        <% }else{ %>
			<% for(Episode e : list){ %>	
      		<div class="col-md-3 col-sm-6 mb-4 divEpisode">
      				<input type="hidden" class="eNo" id="eNo" value="<%=e.getEpisodeNo()%>">
        		<a href="#">
          			<img class="img-fluid" src="http://placehold.it/500x300" alt="">
        		</a>
        				<p>											
							<font size="5";fack="궁서체"><%= e.getWorkTitle() %></font>	 <%= e.getEpisodeTitle() %> >> <%=e.getEpisodeNo()%>화 <br>
							<%= e.getApprovalDate() %> <br>
							조회수 : <%= e.getViewsCnt() %>
							
						</p>
      </div>

      		<% } %>
		<% } %>

    </div>
    
    <!-- /.row -->
    <ul class="pagination justify-content-center">
      <li class="page-item">
        <a class="page-link" href="#" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
          <span class="sr-only">Previous</span>
        </a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#">1</a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#">2</a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#">3</a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
          <span class="sr-only">Next</span>
        </a>
      </li>
    </ul>

  </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="resources/js/jquery.min.js"></script>
  <script src="resources/js/bootstrap.bundle.min.js"></script>

  <!--별점 스크립트-->
  <script>var starRating = function(){
    var $star = $(".star-input"),
        $result = $star.find("output>b");
      
        $(document)
      .on("focusin", ".star-input>.input", 
        function(){
            $(this).addClass("focus");
       })
         
         .on("focusout", ".star-input>.input", function(){
          var $this = $(this);
          setTimeout(function(){
              if($this.find(":focus").length === 0){
                 $this.removeClass("focus");
              }
           }, 100);
        })
      
        .on("change", ".star-input :radio", function(){
          $result.text($(this).next().text());
        })
        .on("mouseover", ".star-input label", function(){
          $result.text($(this).text());
        })
        .on("mouseleave", ".star-input>.input", function(){
          var $checked = $star.find(":checked");
            if($checked.length === 0){
                $result.text("0");
              } else {
                $result.text($checked.next().text());
            }
        });
    };
    
    starRating();
    </script>
    
      
      	<script>
	$(function() {
		$(".divEpisode").click(function() {
			var val = $(this).children().eq(0).val();
			location.href="<%=contextPath%>/episode.de?eNo=" + val;
			
			//console.log(val);
		});
	});
	
	</script>
	

  <!-- Bootstrap core JavaScript -->
  <script src="resources/js/jquery-1.11.3.min.js"></script>
<script src="resources/js/star.js"></script>
  <script src="resources/js/jquery.min.js"></script>
  <script src="resources/js/bootstrap.bundle.min.js"></script>
<%-- <script>

	
	$(function() {
		$(".btn_notice").click(function() {
			var val = $(this).eq(0).next().val();
		
			location.href="<%=contextPath%>/notice.ep?wno=" + val;
		});
	});
	
	</script> --%>
	
	<script>
		$('input[name=bbb]').length
	</script>

		<script>
			$( ".star_rating a" ).click(function() {
		
			     $(this).parent().children("a").removeClass("on");
		
			     $(this).addClass("on").prevAll("a").addClass("on");
		
			     return false;
		
			});
	</script>
	
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
			function copyToClipboard(val) {
			  var t = document.createElement("textarea");
			  document.body.appendChild(t);
			  t.value = val;
			  t.select();
			  document.execCommand('copy');
			  document.body.removeChild(t);
			}
			$('#btn1').click(function() {
			  copyToClipboard('http://localhost:8888/semo/');
			  alert('복사되었습니다.');
			});
	</script>
	
	 <script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/modal3.js"></script>
   <script type="text/javascript">
      // 모달창 인스턴트 생성
      var myModal3 = new Example.Modal({
          id: "modal3" // 모달창 아이디 지정
      });
     
      // 모달 창 여는 버튼에 이벤트 걸기
      $("#noticeBtn").click(function() {
          
          
          $.ajax({
				url:"notice.ep",
				data:{wno:wno},
				type:"get",
				success:function(list){
					console.log(list); // 객체 배열의 형태
					
					var value = "";
					//for(var i=0; i<list.length; i++){
					for(var i in list){
						value += '<tr>' + 
									'<td width="50px">' + list[i].noticeNo + '</td>' +    
									'<td width="100px">' + list[i].title + '</td>' +
									'<td width="200px">' + list[i].content+ '</td>' +
									'<td width="100px">' + list[i].writerDate + '</td>' +
								 '</tr>';
					}
					
					$("#noticeList").html(value);
					
				},error:function(){
					console.log("댓글 리스트 조회 ajax 통신 실패!!");
				}
			});
          
          myModal3.show(); // 모달창 보여주기
      });
     
      // 모달 창 안에 있는 확인 버튼에 이벤트 걸기
      $("#repOkBtn").click(function() {
             myModal3.hide(); // 모달창 감추기
      });
      
      // 모달 창 안에 있는 취소 버튼에 이번트 걸기
      $("#repXBtn").click(function(){
         myModal3.hide();
      });
   </script>
        
        <!-- 공지사항 창 -->
        <script>
        // 이 게시글에 딸려있는 댓글 리스트 조회하는 ajax
        /*
        $("#noticeBtn").click(function(){
			var wno = <%= w.getWorkNo()%>;
			   

		function selectWnList(){
			
			$.ajax({
				url:"notice.ep",
				data:{wno:wno},
				type:"get",
				success:function(list){
					console.log(list); // 객체 배열의 형태
					
					var value = "";
					//for(var i=0; i<list.length; i++){
					for(var i in list){
						value += '<tr>' + 
									'<td width="50px">' + list[i].noticeNo + '</td>' +    
									'<td width="100px">' + list[i].title + '</td>' +
									'<td width="200px">' + list[i].content+ '</td>' +
									'<td width="100px">' + list[i].writerDate + '</td>' +
								 '</tr>';
					}
					
					$("#noticeList").html(value);
					
				},error:function(){
					console.log("댓글 리스트 조회 ajax 통신 실패!!");
				}
			});
		}
	});
        */
	</script>
	<%-- 
	<script>
	 function noticeList(val) {
		 location.href="<%=contextPath%>/notice.ep?wno=" + val;
	 }
	</script> --%>
	<script>
	$(function() {
		$(".divWork").click(function() {
			var val = $(this).children().children().eq(0).val();
			location.href="<%=contextPath%>/view.se?wno=" + val;
		});
	});
	
	</script>
	
	 <script>
	 function episodelist1() {
		 location.href="<%=contextPath%>/episo.de?wno=<%=w.getWorkNo()%>";
		 
	 }
	</script>
	<script>
	 function episodelist2() {
		 location.href="<%=contextPath%>/episo.as?wno=<%=w.getWorkNo()%>";
		 
	 }
	</script>
	
	<script src="<%= request.getContextPath() %>/resources/js/jquery.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/js/bootstrap.bundle.min.js"></script>
	
	
</body>

</html>
