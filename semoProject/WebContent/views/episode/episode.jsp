<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.kh.episode.model.vo.Episode" %>
<%
	Episode e = (Episode)request.getAttribute("e");
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
  <link href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="<%= request.getContextPath() %>/resources/css/modern-business.css" rel="stylesheet">
<style>
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
</style>
</head>

<body>


</div>
 <!-- Navigation -->
 <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
  <div class="container">
    <a class="navbar-brand" href="index.html">세모웹툰</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link" href="about.html">연재</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="services.html">세모게시판</a>
        </li>
        <li class="nav-item">
            <input id="searchform" type="text" name="search" placeholder="웹툰명을 입력해주세요">
            <input id="searchbtn" type="submit" value="검색">
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="test2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            로그인
          </a>
          <div class="dropdown-menu dropdown-menu-center" aria-labelledby="test2"> 
            <div class="loginArea" id="loginLogo" style="text-align: left;">로그인</div>
            <div class="loginArea">
              <input type="text" id="userId" placeholder="아이디">
            </div>
            <div class="loginArea">
              <input type="password" id="userPwd" placeholder="비밀번호">
            </div>
            <div class="loginArea">
              <label class="logCheck"> 
                <input type="checkbox" name="remember_me" >
                <i>
                  로그인 상태 유지
                </i>
              </label>
            </div>
            <div class="loginBtn">
              <button type="submit" class="lgBtn lgbtn-major lgBtn-wide lgBtn-mid" disabled>로그인</button>
            </div>
            <div class="login_links">
              <a id="member_join" href="member_join.html">회원가입</a>
              <a id="id_pw_find" href="id_pwd_find.html">아이디/비밀번호 찾기</a>
            </div>
            <div class="login_driver">
              <span>또는</span>
            </div>
            <button type="button" class="account_btn account_btn-naver oauth-connect" data-service="naver">네이버로 로그인 / 가입</button>
            <button type="button" class="account_btn account_btn-kakao oauth-connect" data-service="kakao">카카오로 로그인 / 가입</button>

            <p class="account_help">
              "
                  이용 중 도움이 필요하시면 ["
              <a href="ko/help">고객지원</a>
              "] 페이지로, 로그인에 문제가 있다면 "
              <a href="semo:help@semo.com">semohelp@semo.com</a>
              "으로 문의해 주세요.
              "
            </p>
          </div>
        </li>
      </ul>
    </div>
  </div>
</nav>

  <!-- Page Content -->
  <div class="menubar">

   

    <ol class="breadcrumb">
      <h1><a href="index.html" id="semoServiceLogo">logo</a></h1>
<dl class="list_info">
  <dd class="txt_title"><a href="만화창.html" class="link_title">나혼자만 레벨업</a></dd>
  <dt class="screen_out">회차</dt>
  <dd class="txt_episode"><span class="ico_comm ico_arrow">></span>1화</dd>
</dl>
<ul class="list_control">
  <li>
    <button type="button" class="btn_comm btn_like">좋아요 등록</button>
  </li>
  <li>
    <button type="button" class="btn_comm btn_nonstop">정주행켜기</button>
  </li>
  <li>
    <button type="button" class="btn_comm btn_fullscreen" data-go-on="click" >전체화면</button>
  </li>
  <li>
    <a href="/" class="btn_comm btn_close">작품홈으로</a>
  </li>
</ul>
</div>
    </ol>

    <div class="row"  id="semoweb">

      <!-- Post Content Column -->
      <div class="">
       
        <div class="">
          
        </div>
        <!-- Preview Image -->
        <img class="img-fluid rounded" src="http://placehold.it/900x300" alt="" 
        style="width: 100%;
        padding-right: 120px;
        padding-left: 120px;
        margin-right: auto;
        margin-left: auto;">

        <br>

<nav id="viewer-footer" class="viewer_footer viewer__footer--active">
  <ul id="episode-nav" class="viewer__nav">
    <li class="viewer__navItem" style="float: left;">
      <button class="viewer__navBtn--prev" type="button" disabled>이전화</button>
    </li>
    <li class="viewer__navItem" style="float:right">
      <button class="viewer__navBtn--next" type="button" disabled>다음화</button>
    </li>
  </ul>
</nav>

<br><br>
        <hr>

        
        <hr>
        <!-- Comments Form -->
        <div class="card my-4" style=" width: max-content; margin-right: auto; margin-left: auto; width: 80%;">
          <h5 class="card-header">댓글:
            <div class="sort_comments" >
              <strong class="screen_out">댓글 정렬순서 선택</strong>
              <span class="item_radio" style="font-variant: all-small-caps;">
                <input type="radio" id="sortRecent" name="cmtsort" class="inp_radio">
                <label for="sortRecent" class="label_radio">최신순</label>
                
              </span>
              
              <span class="item_radio on">
                <input type="radio" id="sortRecommend" name="cmtsort" class="inp_radio">
                <label for="sortRecommend" class="label_radio">추천순</label>
              
              </span>
            </div>
          </h5>
          <div class="card-body">
            <div class="wrap_spo">
              <div class="box_check">
                <input type="checkbox" class="inp_check" id="spoCheck">
                <label for="spoCheck">
                  <span class="ico_comm"></span>
                  <span class="desc_spo">댓글에 스포일러가 포함된 경우 체크해 주세요.</span>
                </label>
              </div>
            </div>
            <form>
              <div class="form-group">
                <textarea class="form-control" rows="3"></textarea>
              </div>
              <button type="submit" class="btn btn-primary">등록</button>
            </form>
          </div>
        </div>

        <!-- Single Comment -->
        <div class="">
          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
          <div class="list_cmt">
            <em class="ico_comm ico_best">베스트댓글</em>
            <span class="desc_info">
            <strong class="txt_nick">닉네임 피카츄</strong>
            <span class="txt_date">2020-03-12</span>
            <span class="txt_bar"></span>
            <button type="button" class="btn_comm_btn_report btn_report_parent">신고</button>
          </span>
          
            <span class="itemt_updown">
              <button type="button" class="btn_up">
                <span class="ico_comm ico_up">추천</span>
                <span class="num_up">999</span>
              </button>
              <button type="button" class="btn_down">
                <span class="ico_comm ico_down">반대</span>
                <span class="num_down">999</span>
              </button>
            </span>
            <textarea class="form-control" rows="3" cols="100"></textarea>
            <span class="" onclick="showReply();">
                답글
              <em class="emph_num">2</em>
              <span class="ico_comm ico_arrow" >open</span>
            </span>
          </div>
          
          <div id="reply1" class="info_reply" style="display:none;">
            <form action="#" id="">
              <fieldset class="fld_reply">
                <legend class="screen_out">위 댓글에 대한 답글 작성</legend>
                <div class="regist_cmt">
                  <div class="admit_opinion">
                    <label for="replyInput181818" class="screen_out">댓글 입력란</label>
                    <textarea name id="replyInput181818" cols="100" rows="2" class="tf_cmt" style="resize: none;"></textarea>
                  </div>
                  <button type="submit" class="btn_submit">등록</button>
                </div>
              </fieldset>
            </form>
          </div>

          <script>

            function showReply(){
                var reply1 = document.getElementById("reply1");
                console.log(reply1.style.display);
                if(reply1.style.display == "none"){
                  reply1.style.display = "block";
                }else{
                  reply1.style.display = "none";
                }

                return false;
            }
          </script>
          
        </div>

        <!-- Comment with nested comments -->
        <div class="media mb-4">
          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
          <div class="media-body">
            <h5 class="mt-0">Commenter Name</h5>
            나왜 여기서 이러고 있냐 개발 같은 ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ

            <div class="list_depth2">
              <span class="bg_comm"></span>
              <span class="desc_info">
                <strong class="txt_nick">집에보내줘 베이베</strong>
                <span class="txt_date">2020-03-12 21:02:18</span>
              <span class="txt_bar"></span>
              <button type="button" class="btn_comm btn_report btn_reprot_child">신고</button>
            </span>
            <p class="txt_cmt">ㅅㅂ 언제끝나 뒤질거 같아 ............</p>
            </div>

            <div class="media mt-4">
              <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
              <div class="media-body">
                <h5 class="mt-0">Commenter Name</h5>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
              </div>
            </div>

          </div>
        </div>

      </div>

     

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->
  <!-- 댓글 관련 영역 -->
	<div class="replyArea">
		
		<!-- 댓글 작성하는 table -->
		<table border="1" align="center">
			<tr>
				<th>댓글작성</th>
			
				<td><textarea id="replyContent" rows="3" cols="60" style="resize:none;"></textarea></td>
				<td><button id="addComment">댓글등록</button></td>
				
				<td><textarea readonly rows="3" cols="60" style="resize:none;">로그인한 사용자만 가능한 서비스입니다. 로그인 후 이용해주세요</textarea></td>
				<td><button disabled>댓글등록</button></td>
			
			</tr>
		</table>
		
		<!-- 댓글 리스트들 보여지는 div -->
		<div id="replyListArea">
	

			<table id="replyList" border="1" align="center">
				
			</table>
		</div>
		<br><br><br><br>
	</div>

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
    <script src="<%= request.getContextPath() %>/resources/js/jquery.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/js/bootstrap.bundle.min.js"></script>

<script>
		$(function(){
			// 소스코드 : html문서 로딩 후 바로 실행
			//console.log("문서읽기 완료");
			selectReplyList();
			
			setInterval(selectReplyList, 2000);
			
			$("#addComment").click(function(){
				// 댓글등록 버튼 클릭시 댓글 작성하기 기능수행하는 ajax
				
				// 전달할 값
				var content = $("#replyContent").val(); // 작성된 댓글 내용
				var eNo  = <%=e.getEpisodeNo()%>;
				
				$.ajax({
					url:"cinsert.ep",
					data:{
						content:content,
						eNo:eNo
					},
					type:"post",
					success:function(result){
						if(result == 1){
							selectReplyList();
							$("#replyContent").val("");
						}
					},
					error:function(){
						console.log("댓글 작성 ajax 통신실패!!");	
					}					
				});
				
				
			});
			
		});
		
		// 이 게시글에 딸려있는 댓글 리스트 조회하는 ajax
		function selectReplyList(){
			var eNo = <%=e.getEpisodeNo()%>;
			
			$.ajax({
				url:"clist.ep",
				data:{eNo:eNo},
				type:"get",
				success:function(list){
					console.log(list); // 객체 배열의 형태
					
					var value = "";
					//for(var i=0; i<list.length; i++){
					for(var i in list){
						value += '<tr>' + 
									'<td width="100px">' + list[i].memberNo + '</td>' +    
									'<td width="330px">' + list[i].content + '</td>' +
									'<td width="150px">' + list[i].creationDate + '</td>' +
								 '</tr>';
					}
					
					$("#contentList").html(value);
					
				},error:function(){
					console.log("댓글 리스트 조회 ajax 통신 실패!!");
				}
			});
		}
	</script>
	
	<script>
	// 댓글 좋아요 기능 ajax
	function like(){
		$.ajax({
		url: "BoardServlet",
		type: "POST",
		cache: false,
		dataType: "json",
		data: $('#like_form').serialize(), //아이디가 like_form인 곳의 모든 정보를 가져와 파라미터 전송 형태(표준 쿼리형태)로 만들어줌
		success:
		function(data){ //ajax통신 성공시 넘어오는 데이터 통째 이름 =data
		alert("'좋아요'가 반영되었습니다!") ; // data중 put한 것의 이름 like
		$("#like_result").html(data.like); //id값이 like_result인 html을 찾아서 data.like값으로 바꿔준다.
		},
		error:
		function (request, status, error){
		alert("ajax실패")
		}
		});
		}

		
	</script>

</body>

</html>
