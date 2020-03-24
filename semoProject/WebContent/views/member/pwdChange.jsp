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

	<div class="semologo2"><h1 style="margin-top:15%;">세모웹툰</h1></div>
    <h4 id="pwdF-h4">비밀번호 변경</h4>
    
    <form id="pwdChange" method="post" action="<%=request.getContextPath()%>/changePwd.me">
    	<input type="hidden" name="memberId" value="<%=id%>">
    	<table>
    		<tr>
    			<td>새 비밀번호</td>
    			<td><input type="password" name="newPwd" onkeyup="pwdValidate();" placeholder="영어,특수문자 포함 10글자 이상" min="10"></td>
    			<td><div id="newPwdspace"></div></td>
    		</tr>
    		<tr>
    			<td>비밀번호 확인</td>
    			<td><input type="password" onkeyup="pwdEqual();" name="newPwdCheck"></td>
    			<td><div id="pwdChkspace"></div></td>
     		</tr>
    	</table>
    	
    	<div class="btns" align="center">
    		<button type="submit" id="pwdChangeBtn">변경하기</button>
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
    		}else{
    			$("#newPwdspace").html("적합한 비밀번호입니다.");
    		}
    		
    	}
    	
    	function pwdEqual(){

    		var newPwd = $("input[name='newPwd']");
    		var newPwdCheck = $("input[name='newPwdCheck']");
    		
    		if(newPwdCheck.val() != newPwd.val()){
    			$("#pwdChkspace").html("비밀번호가 일치하지 않습니다.");
    		}else{
    			$("#pwdChkspace").html("비밀번호가 일치합니다.");
    		}
    	}

    </script>
</body>
</html>