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

	<div class="semologo2"><h1>세모웹툰</h1></div>
    <h4 id="pwdF-h4">비밀번호 변경</h4>
    
    <form id="pwdChange" method="post" action="<%=request.getContextPath()%>/changePwd.me">
    	<input type="hidden" name="memberId">
    	<table>
    		<tr>
    			<td>새 비밀번호</td>
    			<td><input type="password" name="newPwd" placeholder="영어,특수문자 포함 10글자 이상" min="10"></td>
    		</tr>
    		<tr>
    			<td>비밀번호 확인</td>
    			<td><input type="password" name="newPwdCheck"></td>
     		</tr>
    	</table>
    	
    	<button id="hiddenBtn" style="display: none"></button>
    </form>
    
    	<div class="btns" align="center">
    		<button type="submit" onclick="return pwdValidate();">변경하기</button>
    	</div>
    <script>
    	function pwdValidate(){
    		var currentPwd = $("input[name='currentPwd']");
    		var newPwd = $("input[name='newPwd']");
    		var newPwdCheck = $("input[name='newPwdCheck']");
    		var memberId = '<%=id%>';
    		
    		console.log(memberId);
    		
    		if(newPwd.val().trim() == ""){
    			alert("새 비밀번호를 입력해주세요");
    			return;
    		}
    		if(newPwdCheck.val().trim() == ""){
    			alert("비밀번호 확인을 입력해주세요.");
    			return;
    		}
    		
    		if(newPwd.val() != newPwdCheck.val()){
    			alert("비밀번호가 다릅니다. 다시 입력해주세요");
    			newPwdCheck.val("").focus();
    			return;
    		}
    		
    		$('[name=memberId]').val(memberId);
    		$("#hiddenBtn").click();
    	}
    </script>
</body>
</html>