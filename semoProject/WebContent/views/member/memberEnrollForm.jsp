<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

  <div class="semoMember">
  	<br>
  	<h1 align="center">세모웹툰</h1>
  
  	<form id="enrollForm" method="post" action="<%=request.getContextPath()%>/insertMember.me">
  		<table>
  			<tr>
  				<td width="200px">아이디 : </td>
  				<td><input type="text" name="memberId" id="memberId" onkeyup="checkId();" required></td>
  				<td><div id="idValidation"></div></td>
  			</tr>
  			<tr>
  				<td>비밀번호 : </td>
  				<td><input type="password" name="memberPwd" id="memberPwd" onkeyup="validation();" required></td>
  				<td><div id="pwdValidation"></div></td>
  			</tr>
  			<tr>
  				<td>비밀번호 확인 : </td>
  				<td><input type="password" name="pwdCheck" id="pwdCheck" onkeyup="valiCheck();" required></td>
  				<td><div id="pwdCheckVali"></div></td>
  			</tr>
  			<tr>
  				<td>이름 : </td>
  				<td><input type="text" name="memberName" required></td>
  				<td></td>
  			</tr>
  			<tr>
  				<td width="200px">닉네임 : </td>
  				<td><input type="text" name="nickName" id="nickName" onkeyup="checkNickname();" required></td>
  				<td><div id="nickNameChk"></div></td>
  			</tr>
  			<tr>
  				<td>주소 : </td>
  				<td><input type="text" name="memberAddress"></td>
  				<td></td>
  			</tr>
  			<tr>
  				<td>전화번호 : </td>
  				<td><input type="text" name="phone" placeholder="-포함하여 입력해주세요">
  				<td></td>
  			</tr>
  			<tr>
  				<td>나이 : </td>
  				<td><input type="number" name="age"></td>
  				<td></td>
  			</tr>
  			<tr>
  				<td>성별 : </td>
  				<td><input type="radio" name="gender" value="M">남
  					<input type="radio" name="gender" value="F">여
  				</td>
  				<td></td>
  			</tr>
  			<tr>
  				<td>이메일 : </td>
  				<td><input type="email" name="email"></td>
  				<td></td>
  			</tr>
  		</table>
  		<br>
  		
  		<div class="memberJoinBtn" align="center">
  			<button type="submit" id="joinBtn">회원가입</button>
  		</div>
  	</form>
  </div>
  
  <!-- Bootstrap core JavaScript -->
  <script src="<%= request.getContextPath() %>/resources/js/jquery.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/js/bootstrap.bundle.min.js"></script>
  
  <script>
  	function checkId(){
  		
  		var memberId = $("#enrollForm input[name=memberId]");
  		
  		if(memberId.val() == ""){
  			alert("아이디를 입력해주세요");
  			return false;
  		}else{
	  		$.ajax({
	  			url:"enrollIdCheck.me",
	  			data:{memberId:memberId.val()},
	  			type:"get",
	  			success:function(result){
	  				
	  				if(result == 1){
	  					$("#idValidation").html("이미 가입된 회원이거나 탈퇴한 회원입니다.");
	  					memberId.focus();
	  				}else{
	  					$("#idValidation").html("사용 가능한 아이디입니다.");
	  				}
	  			},
	  			error:function(){
	  				console.log("아이디 중복체크 ajax 통신실패");
	  			}
	  		});
  			
  		}
  		
  	}
  	
  	function validation(){
  		
  		var chk = RegExp(/^[a-z\d!@#$%^&*]{8,12}$/i);

  		if(!chk.test($("#memberPwd").val())){
  			// 정규표현식과 일치하지 않을 경우
	  		$("#pwdValidation").html("비밀번호 양식에 맞지 않습니다.");  				
  			
  		}else{
  			var userPwd = $("#memberPwd").val();
  			var position = userPwd.search($("#memberId").val());
  			
  			if(position != -1){
	  			// 정규표현식과 일치하지만 아이디와 동일한 값이 있을 경우
	  			$("#pwdValidation").html("비밀번호 양식에 맞지 않습니다.");  				
  			}else{
  				// 정규표현식과 일치하고 아이디와 동일한 값이 없을 경우
	  			$("#pwdValidation").html("적합한 비밀번호입니다.");	
  			}
  			
  		}
  	}
  	
  	function valiCheck(){
  		if($("#memberPwd").val() != $("#pwdCheck").val()) {       
  			$("#pwdCheckVali").html("동일한 비밀번호를 입력해주세요.");
  			$("#pwdCheck").focus();
        }else{
        	$("#pwdCheckVali").html("비밀번호가 일치합니다.");
        	
        }
  		
  	}
  	
	function checkNickname(){
  		
  		var nickName = $("#enrollForm input[name=nickName]");
  		

  		if(nickName.val() == ""){
  			return false;
  		}else{
	  		$.ajax({
	  			url:"nickNameCheck.me",
	  			data:{nickName:nickName.val()},
	  			type:"get",
	  			success:function(result){
	  				
	  				if(result == 1){
	  					$("#nickNameChk").html("이미 존재하는 닉네임입니다.");
	  					nickName.focus();
	  				}else{
	  					$("#nickNameChk").html("사용 가능한닉네임입니다.");
	  				}
	  			},
	  			error:function(){
	  				console.log("닉네임 중복체크 ajax 통신실패");
	  			}
	  		});
  		}
  		console.log(nickName);
  	}
  </script>
  
<!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

</body>
</html>