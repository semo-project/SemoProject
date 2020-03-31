<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");
	String id = (String)request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%= request.getContextPath() %>/resources/css/pwdChange.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gugi&display=swap" rel="stylesheet">
<style>
	
	button{
	  background:lightseagreen;
	  color:#fff;
	  border:none;
	  position:relative;
	  height:60px;
	  font-size:1em;
	  padding:0 2em;
	  cursor:pointer;
	  transition:800ms ease all;
	  outline:none;
	  height:30px;
	}
	button:hover{
	  background:#fff;
	  color:#1AAB8A;
	}
	button:before,button:after{
	  content:'';
	  position:absolute;
	  top:0;
	  right:0;
	  height:2px;
	  width:0;
	  background: #1AAB8A;
	  transition:400ms ease all;
	}
	button:after{
	  right:inherit;
	  top:inherit;
	  left:0;
	  bottom:0;
	}
	button:hover:before,button:hover:after{
	  width:100%;
	  transition:800ms ease all;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	var msg = "<%=msg%>";
	
	$(function(){
		if(msg != "null"){
			alert(msg);
		}
		
		if(msg == "변경을 완료했습니다."){
			window.close();
		}
	});
</script>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

	<div class="semologo2"><h1 style="font-family: 'Gugi'; margin-top:12%; font-size:2.3em">세모웹툰</h1></div>
    <h4 id="pwdF-h4" style="margin-top:50px; margin-left:38.5%;">비밀번호 변경</h4>
    
    <form id="pwdChange" style="margin-left:38.5%; margin-top:3%;" method="post" action="<%=request.getContextPath()%>/changePwd.me">
    	<input type="hidden" name="memberId" value="<%=id%>">
    	<table>
    		<tr>
    			<td>새 비밀번호 : </td>
    			<td></td>
    			<td></td>
    			<td></td>
    			<td><input type="password" name="newPwd" onkeyup="pwdValidate();" placeholder="영어,특수문자 포함 10글자 이상" min="10" style="width:250px;"></td>
    			<td><div id="newPwdspace"></div></td>
    		</tr>
    		<tr>
    			<td>비밀번호 확인 : </td>
    			<td></td>
    			<td></td>
    			<td></td>
    			<td><input type="password" onkeyup="pwdEqual();" name="newPwdCheck" style="width:250px;"></td>
    			<td><div id="pwdChkspace"></div></td>
     		</tr>
    	</table>
    	
    	<div class="btns" align="center">
    		<button type="submit" id="pwdChangeBtn" style="margin-top:3%; margin-right:62%;">변경하기</button>
    	</div>
    </form>
    
    <script>
    	function pwdValidate(){
    		var newPwd = $("input[name='newPwd']");
    		var newPwdCheck = $("input[name='newPwdCheck']");
    		var memberId = '<%=id%>';
    		
    		var chk = RegExp(/^[a-z\d!@#$%^&*]{8,12}$/i);
    		
    		if(!chk.test(newPwd.val())){
    			$("#newPwdspace").html("비밀번호 양식에 맞지 않습니다.");
    			$("#newPwdspace").css("color", "red");
    		}else{
    			$("#newPwdspace").html("적합한 비밀번호입니다.");
    			$("#newPwdspace").css("color", "limegreen");
    		}
    		
    	}
    	
    	function pwdEqual(){

    		var newPwd = $("input[name='newPwd']");
    		var newPwdCheck = $("input[name='newPwdCheck']");
    		
    		if(newPwdCheck.val() != newPwd.val()){
    			$("#pwdChkspace").html("비밀번호가 일치하지 않습니다.");
    			$("#pwdChkspace").css("color", "red");
    		}else{
    			$("#pwdChkspace").html("비밀번호가 일치합니다.");
    			$("#pwdChkspace").css("color", "limegreen");
    		}
    	}

    </script>
    <!-- Bootstrap core JavaScript -->
  <script src="<%= request.getContextPath() %>/resources/js/jquery.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/js/bootstrap.bundle.min.js"></script>
</body>
</html>