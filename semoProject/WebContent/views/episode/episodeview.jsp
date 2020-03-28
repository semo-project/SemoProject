<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.util.ArrayList"%>
 <%@page import="com.kh.episode.model.vo.Episode"%>
   <%@page import="com.kh.work.model.vo.Work"%>
 <%
 ArrayList<Episode> list = (ArrayList<Episode>)request.getAttribute("list");
	Work w = (Work)request.getAttribute("w");

%>
 
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Modern Business - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/modern-business.css" rel="stylesheet">
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
      <li class="breadcrumb-item active">Portfolio Item</li>
    </ol>

    <!-- Portfolio Item Row -->
    <div class="row">

      <div class="col-md-8">
        <img class="img-fluid" src="http://placehold.it/750x500" alt="">
      </div>
      
      
      <div class="col-md-4">
        <h2 class="my-3"><%= w.getWorkTitle() %></h2>
        <h4><%= w.getGenreName() %></h4>
       <input type="hidden"<%= w.getWorkNo() %>><p><%= w.getApprovalDate() %></p>
        <p><button type="button" class="btn btn-secondary btn-block">첫회보기</button></p>
        
        <ul class="clear_g list_append" style="display: flex;margin-left: auto; width: 200px;">
          <li class="box_grade">
             <p class="star_rating">

				<a href="#" class="on" onclick="starscore(this.value)" value="1">★</a>
			
				<a href="#" class="on" onclick="starscore(this.value)" value="2">★</a>
			
				<a href="#" class="on" onclick="starscore(this.value)" value="3">★</a>
			
				<a href="#" onclick="starscore(this.value)" value="4">★</a>
			
				<a href="#" onclick="starscore(this.value)" value="5" data-value-declared>★</a>	
				


			</p>
        
	      </li>
	      
	    </ul>
	   <script>
	 function starscore(val) {
		 //location.href="<%=contextPath%>/genre.fan?star=" + val;
		 console.log(val);
	 }
	</script>
	
    
    <ul class="heart-share">
      <li class="heart-share1">
        
      
      </li>
      
        <button id='btn1'class="btn-secondary btn-lg">Share</button>
    </ul>
   
	
    <p><%= w.getWorkSummary() %></p>
    
      </div>

    </div>
    <!-- /.row -->

    <!-- Related Projects Row -->
    <hr>
    <h3 class="my-4">
    	<p>
    		<a class="btn_notice" href="#ex7">공지사항 </a>
    		<input type="hidden" value="<%= w.getWorkNo() %>">
    	</p>
    </h3>
        <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal2"  style="background: blueviolet;height: 30px;width: 78px; float: right;">웹툰 구매</button>
 
			<div id="ex7" class="modal">
  				<p>
  				<div id="noticeno">
				    <button type="button" class="close" data-dismiss="modal">&times;</button>
				    <h3>공지사항</h1>
				    
				    <!-- 댓글 관련 영역 -->
					<div >
						<!-- 댓글 리스트들 보여지는 div -->
						<div id="replyListArea">
							<table id="replyList" border="1" align="center">
								
							</table>
						</div>
						<br><br><br><br>
					</div>
					
				    <button type="button" style="color: white; background: #007AAE;height: 50px;width: 100px;text-align:center;margin-left: 38%;"" data-toggle="modal" data-dismiss="modal" data-target="#myModal3">작성</button>
				</div>
  				</p>
			</div>
      
    </div>
    <div class="modal fade" id="myModal3" role="dialog">
      <div class="modal-dialog modal-sm">
        <div class="modal-content" style="margin-top:100px; width:600px; height: 800px;" >
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" style="float: right;">&times;</button>
            
			             <!-- Comments Form -->
			        <div class="card my-4 replyArea" style=" width: max-content; margin-right: auto; margin-left: auto; width: 70%;">
			        <% if(loginUser != null){ %>
			          <h5 class="card-header" style="color: black;">댓글: </h5>
			          <div class="card-body">
			            <div class="wrap_spo">
			              <div class="box_check">
			                <input type="checkbox" class="inp_check" id="spoCheck">
			                <label for="spoCheck">
			                  <span class="ico_comm"></span>
			                  <span class="desc_spo" style="color: black;">댓글에 스포일러가 포함된 경우 체크해 주세요.</span>
			                </label>
			              </div>
			            </div>
			            <form>
			              <div class="form-group">
			                <textarea class="form-control" rows="3" id="replyContent" style="resize:none;"></textarea>
			              </div>
			              <button type="button" class="btn btn-primary" id="addReply">등록</button>
			            </form>
			          </div>
			        </div>
					<% }else{ %>
					 <h5 class="card-header" style="color: black;">댓글: </h5>
			          <div class="card-body">
			            <div class="wrap_spo">
			              <div class="box_check">
			                <input type="checkbox" class="inp_check" id="spoCheck">
			                <label for="spoCheck">
			                  <span class="ico_comm"></span>
			                  <span class="desc_spo" style="color: black;">댓글에 스포일러가 포함된 경우 체크해 주세요.</span>
			                </label>
			              </div>
			            </div>
			            <form>
			              <div class="form-group">
			                <textarea class="form-control" rows="3" readonly style="resize:none; font-size: 14px;">로그인한 사용자만 가능한 서비스입니다. 로그인 후 이용해주세요</textarea>
			              </div>
			              <button type="button" class="btn btn-primary" disabled>등록</button>
			            </form>
			          </div>
			        </div>
			       <% } %>
			            
                                       
                 <hr>
                 <button type="button" class="btn btn-default" data-dismiss="modal" data-target="#myModal3" style="color: white; background: blueviolet;height: 50px;width: 100px;  text-align:center;">구매 완료</button> 
   
        </div>
      </div>
      </div>
      </div>

    <!-- 이중 모달 구매 모달-->
    <div class="modal fade" id="myModal3" role="dialog">
      <div class="modal-dialog modal-sm">
        <div class="modal-content" style="margin-top:100px; width:600px; height: 800px;" >
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" style="float: right;">&times;</button>
            
            <div>
              <table>
                <tr>
                  <th>
                    <h4 class="modal-title" style="font-size:50px;"><strong>쿠키 구매</strong></h4>
                  </th>
                </tr>
                <tr>
                  <th><h5>나 혼자만 레벨업</h5></th>
                </tr>                
                <tr id="branchInfo">
                  <th scope="row" id="branchInfo" class="bran">내가 가진 쿠키  </th>
                  <td id="branchInfo"><b>9999쿠키</b></td>
                </tr>
                <tr id="branchInfo">
                  <th scope="row" id="branchInfo" class="bran">이용권</th>
                  <td id="branchInfo"><b>10 개</b></td>
                </tr>
              </table>

            </div>
          </div>
          
      <!-- 모달 지점안내 -->
          <div class="modal-body" style="height:200px; width:400px;">
               <table style="border:1px solid lightgray;width:100%;text-align:center;left-margin:10px;">				  
            <tbody>
              <div>
                <table>
                  <h3>이용권 충전</h3>
               
                  <tr id="branchInfo">
                      <th scope="row" id="branchInfo" class="bran"><input type="radio"></th>
                    <td id="branchInfo"><b>1쿠키</b>: 100캐시
                      
                    </td>
                  </tr>
                  <tr id="branchInfo">
                    <th scope="row" id="branchInfo" class="bran"><input type="radio"></th>
                  <td id="branchInfo"><b>10쿠키</b>: 900캐시
                    
                  </td>
                </tr>
                <tr id="branchInfo">
                  <th scope="row" id="branchInfo" class="bran"><input type="radio"></th>
                <td id="branchInfo"><b>1쿠키</b>: 100캐시
                  
                </td>
              </tr>
              <tr id="branchInfo">
                <th scope="row" id="branchInfo" class="bran"><input type="radio"></th>
              <td id="branchInfo"><b>1쿠키</b>: 100캐시
                
              </td>
            </tr>
            <tr id="branchInfo">
              <th scope="row" id="branchInfo" class="bran"><input type="radio"></th>
            <td id="branchInfo"><b>1쿠키</b>: 100캐시
              
            </td>
          </tr>
          <tr id="branchInfo">
            <th scope="row" id="branchInfo" class="bran"><input type="radio"></th>
          <td id="branchInfo"><b>1쿠키</b>: 100캐시
            
          </td>
        </tr>
             
          </table>                              
                 <hr>
                 <button type="button" class="btn btn-default" data-dismiss="modal" data-target="#myModal3" style="color: white; background: blueviolet;height: 50px;width: 100px; float:; text-align:center;">구매 완료</button>
            </div>
            </tbody>
        </table>
          </div>
          <div class="modal-footer">
            <p></p>규정안내
- 이 콘텐츠는 청약철회가 불가능한 상품으로서 결제(사용) 완료된 콘텐츠에 대한 구매 취소(청약철회)는 불가합니다.
  단, 법정대리인의 동의가 없는 미성년자의 결제는 취소될 수 있습니다.
- 발행자의 사정에 따라 업데이트가 지연될 수 있으며, 업데이트 지연을 이유로 한 구매 취소는 불가합니다.
- 발행자의 의사에 따라 판매 가격이 변경될 수 있으며, 콘텐츠의 가격 변경을 이유로 한 구매 취소는 불가합니다.</p>
          </div>
        </div>
      </div>
      </div>
      </div>
    </h3>
    <div class="sort_comm">
      <strong class="screen_out">웹툰 정렬순서 선택</strong>
      <span>
        <input type="radio" id="sortRecent" name="wtsort" class="inp_radio">
        <label for="sortRecent" class="label_radio">최신화부터</label>
        
      </span>
      <span class="ico_commico_bar"></span>
      <span>
        <input type="radio" id="sortOld" name="wtsort" class="inp_radio">
        <label for="sortOld" class="label_radio">첫화부터</label>
        
      </span>

    </div>
    <hr>
    <div class="row">
    
    
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
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

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
    
    starRating();</script>
    <!-- 하트 스크립트-->
    <script>
      (function() {
          const heart = document.getElementById('heart');
          heart.addEventListener('click', function() {
            heart.classList.toggle('red');
          });
        })();
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
	 <p><a class="btn" href="#ex7">도달창띄우기2</a></p>
 
<div id="ex7" class="modal">
  <p></p>
</div>
 
<script>
    $('a[href="#ex7"]').click(function(event) {
      event.preventDefault();
 
      $(this).modal({
        fadeDuration: 250
      });
    });
</script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
  <!-- Bootstrap core JavaScript -->
  <script src="../resources/js/jquery-1.11.3.min.js"></script>
<script src="../resources/js/star.js"></script>
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>

	
	$(function() {
		$(".btn_notice").click(function() {
			var val = $(this).eq(0).next().val();
			location.href="<%=contextPath%>/notice.ep?wno=" + val;
			
		});
	});
	
	</script>
	
	<script>
  $(function(){
		// 소스코드 : html문서 로딩 후 바로 실행
		//console.log("문서읽기 완료");
	 	 selectWnlistt();
		
		//window.setInterval(selectReplyList, 2000);
		
		$("#addReply").click(function(){
			// 댓글등록 버튼 클릭시 댓글 작성하기 기능수행하는 ajax
			
			// 전달할 값
			var content = $("#replyContent").val(); // 작성된 댓글 내용
			var wno = <%=w.getWorkNo()%>;
			
			if(content != ""){
				$.ajax({
					url:"ninsert.wr",
					data:{
						content:content,
						wno:wno
					},
					type:"post",
					success:function(result){
						if(result == 1){
							selectWnlist();
							$("#replyContent").val("");
						}
					},
					error:function(){
						console.log("댓글 작성 ajax 통신실패!!");	
					}					
				});
				
			}else{
				alert("댓글내용작성하세요");
			}
			
			
			
		});
		
	});
	
		$(function() {
			selectWnlist();
		});
		// 이 게시글에 딸려있는 댓글 리스트 조회하는 ajax
		function selectWnlist(){
			var wno = <%=w.getWorkNo()%>;
			
			$.ajax({
				url:"notice.ep",
				data:{wno:wno},
				type:"get",
				success:function(list){
					//console.log(list); // 객체 배열의 형태
					//console.log(1);
					var value = "";
					//for(var i=0; i<list.length; i++){
					for(var i in list){
						value += '<tr>' + 
									'<td width="100px">' + list[i].memberNo + '</td>' +    
									'<td width="100px">' + list[i].title + '</td>' +
									'<td width="300px">' + list[i].content + '</td>' +
									'<td width="100px">' + list[i].writeDate + '</td>' +
								 '</tr>';
								 
					/* 	value +='<div class="">' +
				          
							          '<div class="list_cmt">' +
							            '<span class="desc_info">' +
							            '<strong class="txt_nick">' + list[i].memberId + '</strong>'+
							            '<span class="txt_date">' + list[i].creationDate + '</span>'+
							            '<span class="txt_bar"></span>' +
							            '<button type="button" class="btn_comm_btn_report btn_report_parent">신고</button>'+
							          	'</span>'+
										'<textarea class="form-control" rows="3" cols="100">' + list[i].content + '</textarea>'+
							            '</div>'+
							          '</div>'; */
					}
					console.log(value);
					
					$("#replyList").html(value);
					
				},error:function(){
					console.log("댓글 리스트 조회 ajax 통신 실패!!");
				}
			});
		}
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
			  copyToClipboard('Hello World');
			  alert('Copied!');
			});
		</script>
		
		<script>
			$( ".star_rating a" ).click(function() {
		
			     $(this).parent().children("a").removeClass("on");
		
			     $(this).addClass("on").prevAll("a").addClass("on");
		
			     return false;
		
			});
	</script>
</body>

</html>
