<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 찾기 결과</title>
<style>
body {
  font-family: Arial, sans-serif;
  background-color: #f0f0f0;
  margin: 0;
  padding: 0;
}

h1{
  text-align: center;
  margin: 30px;
}

#pwchangeformArea {
  width:400px;
  box-sizing:border-box;
  margin: 20px auto;
  background-color: #fff;
  padding: 20px;
  border-radius: 5px;
}
div.body-wrapper{
	width: 80%;
}

form {
  display: flex;
  flex-direction: column; 
}

h1{
font-size:25px;
}

label {
  font-size:14px;
}

input[type="password"] {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-sizing: border-box;
}

button {
  padding: 10px;
  background-color: rgb(6, 10, 70);
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  box-sizing: border-box;
}

button:hover {
  background-color: rgba(6, 10, 70,0.7);
}

.btn { 
  margin:13px 0  0 40%;
} 
 
a {
  text-align: center;
}

@media only screen and (max-width: 600px) {
	div.body-wrapper{
		width:100%;
	}
}

@media only screen and (max-width: 479px) {
	div.body-wrapper{
		width:100%;
		max-width: 100%;
	}
}
</style>
</head>
<body>
<div class="body-wrapper">
<section id="pwchangeformArea">
 <h1>비밀번호 변경</h1><br>
 <form name="pwchangeform" method="post" onsubmit="return validateForm()" action="memberPwChangeAction.mc">
<%
String pwValue = (String) request.getAttribute("pwValue");
%>

    <input type="hidden" name="oldpw" value="<%= pwValue %>">
    <input type="hidden" name="id" value="<%=request.getParameter("id") %>">
    <input type="hidden" name="name" value="<%=request.getParameter("name") %>">
    <input type="hidden" name="email" value="<%=request.getParameter("email") %>">
    	
	<div style="margin:5px 0px;">
	<label for="newpass" >변경할 비밀번호를 입력해주세요.</label>
	<input type="password" name="newpass" id="newpass" style="margin-top: 10px;" pattern="[a-zA-Z0-9!_\-!@#$%^&*]+" minlength="8" maxlength="15" placeholder="새 비밀번호">
	</div>
	<div id="newpwerrorMessages" style="color: red; display: none; margin:5px 0px;"></div>
	<div id="oldpwerrorMessages" style="color: red; display: none; margin:5px 0px;"></div>
	
	<div style="margin:5px 0px;">
	<input type="password" name="newpasscf" id="newpasscf" pattern="[a-zA-Z0-9!_\-!@#$%^&*]+" minlength="8" maxlength="15" placeholder="새 비밀번호 확인">
	</div>
	<div id="newpwcferrorMessages" style="color: red; display: none; margin:5px 0px;"></div>

 	<div class="btn" >
 	<button id="changeBtn" >비밀번호 변경</button>
	<button id="returnBtn" onclick="location.href='./memberLogin.mc'">로그인 페이지</button>
	</div>
	</form>
	<script>
		function validateForm() {
			// 모든 오류 메시지 초기화
			document.getElementById("newpwerrorMessages").innerHTML = "";
			document.getElementById("oldpwerrorMessages").innerHTML = "";
			document.getElementById("newpwcferrorMessages").innerHTML = "";
			
			   // 오류 메시지 영역 숨기기
	        document.getElementById("newpwerrorMessages").style.display = "none";
	        document.getElementById("oldpwerrorMessages").style.display = "none";
	        document.getElementById("newpwcferrorMessages").style.display = "none";
			
			const oldpass = "<%= pwValue %>";
			const newpass = document.getElementById("newpass").value;
			const newpasscf = document.getElementById("newpasscf").value;
			
			let isValid = true; // 모든 조건문이 실행되었는지를 나타내는 변수

			// 비밀번호 검사
			if (newpass === oldpass) {
				document.getElementById("oldpwerrorMessages").innerHTML = "●&nbsp 이전에 사용하던 비밀번호는 사용할 수 없습니다.";
				document.getElementById("oldpwerrorMessages").style.display = "block";
				isValid = false;
			}

			// 새 비밀번호 검사
			if (newpass === "") {
				document.getElementById("newpwerrorMessages").innerHTML = "●&nbsp 새 비밀번호를 입력해주세요.";
				document.getElementById("newpwerrorMessages").style.display = "block";
				isValid = false;
			}
			
			// 비밀번호 확인 검사
			if (newpasscf !== newpass) {
				document.getElementById("newpwcferrorMessages").innerHTML = "●&nbsp 새 비밀번호를 동일하게 입력해주세요.";
				document.getElementById("newpwcferrorMessages").style.display = "block";
				isValid = false;
			}

			// 모든 조건문이 한 번씩 실행되었는지 확인하고 결과 반환
			return isValid;
		}
		
	
	</script>
</section>
</div>
</body>
</html>
