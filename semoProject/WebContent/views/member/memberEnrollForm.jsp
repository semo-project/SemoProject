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
  				<td><input type="text" name="memberId" required></td>
  				<td width="200px">
  					<button type="button" id="idCheckBtn" onclick="checkId();">중복확인</button>
  				</td>
  			</tr>
  			<tr>
  				<td>비밀번호 : </td>
  				<td><input type="password" name="memberPwd" required></td>
  				<td></td>
  			</tr>
  			<tr>
  				<td>비밀번호 확인 : </td>
  				<td><input type="password" name="pwdCheck" required></td>
  				<td></td>
  			</tr>
  			<tr>
  				<td>이름 : </td>
  				<td><input type="text" name="memberName" required></td>
  				<td></td>
  			</tr>
  			<tr>
  				<td width="200px">닉네임 : </td>
  				<td><input type="text" name="memberNickname" required></td>
  				<td width="200px">
  					<button type="button" id="nicknameChk" onclick="checkNick();">중복확인</button>
  				</td>
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
  
  <script>
  	function checkId(){
  		
  		var memberId = $("enrollForm input[name=memberId]");
  		
  		$.ajax({
  			url:"idCheck.me",
  			data:{userId:memberId.val()},
  			type:"post",
  			success:function(result){
  				if(result==1){
  					alert("사용불가능한 아이디입니다.");
  					memberId.focus();
  				}else{
  					if(confirm("사용가능한 아이디입니다.")){
  						memberId.attr("readonly", "true");
  						$("#joinBtn").removeAttr("disabled");
  					}else{
  						memberId().focus();
  					}
  				}
  			},
  			error:function(){
  				console.log("아이디 중복체크 ajax 통신실패");
  			}
  		});
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