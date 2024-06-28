<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<style>
body {
  font-family: Arial, sans-serif;
  background-color: #f0f0f0;
  margin: 0;
  padding: 0;
}

#loginFormArea {
  width: 100%;
  box-sizing:border-box;
  margin: 20px auto;
  background-color: #fff;
  padding: 20px;
  border-radius: 5px;
}

div.body-wrapper{
	width:80%;
	text-align: center;
}

fieldset {
	border: none;
	height: 100%;
}

table {
	width: 100%;
	margin: auto;
}

td {
	text-align: center;
	padding: 5px;
	width: 100%;
	font-size: 14px;
}

label {
	font-weight: bold;
}

input[type="text"], input[type="password"] {
	width: 400px;
	padding: 12px;
	background: transparent;
	border: none;
	border-bottom: 1.5px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
}

input[type="text"]:focus, input[type="password"]:focus {
	border-bottom: solid 1.5px rgb(7, 10, 60);
	outline: none;
}

a {
 	text-decoration: none; 
}

a:hover {
	text-decoration: underline;
}

#selectButton {
	width: 400px;
	padding:10px 0;
	text-align: center;
	border: none;
	border-radius: 5px;
	background-color: rgb(6, 10, 70);
	color: #fff;
	cursor: pointer;
	font-size: 18px;
	box-sizing: border-box;
}

h1 {
	text-align: center;
}

#selectButton:hover {
	background-color:rgba(6,10,70,0.7);
}

@media only screen and (max-width: 600px) {
	div.body-wrapper{
		width:100%;
	}
}

@media only screen and (max-width: 479px) {
	div.body-wrapper{
		width:100%;
	}
	input[type="text"], input[type="password"], #selectButton {
		width:350px;
	}
}
</style>
</head>
<body>
<div class="body-wrapper">
	<section id="loginFormArea">
	<h1 style="font-size: 25px; margin: 30px;">로그인</h1>
	<br>
		<form action="login" onsubmit="return validateForm()" method="POST">
			<fieldset>
				<table>
					<tr>
						<td>
						<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요." /><br></td>
					</tr>
					<tr>
						<td><input type="password" name="pw" id="pw" placeholder="비밀번호를 입력해주세요." /><br></td>
					</tr>
					<tr>
						<td style="text-align: center;"><br><input type="submit" value="로그인" id="selectButton"><br> <br></td>
					</tr>
				</table>
				<table>
				<tr>
					<td>
						<a style="text-align: center; font-size: 14px; color: rgb(6, 10, 70); " href="idFindForm.jsp">아이디 찾기</a> | 
						<a style="text-align: center; font-size: 14px; color: rgb(6, 10, 70); " href="pwFindForm.jsp">비밀번호 찾기</a>
					</td>
				</tr>
				</table>
			</fieldset>
		</form>
		<script>
			function validateForm() {
				const id = document.getElementById("id").value;
				const pw = document.getElementById("pw").value;
				
				let isValid = true; // 모든 조건문이 실행되었는지를 나타내는 변수 -->

				// 아이디 검사 
				if (id == "" || pw == "") {
					alert("아이디 또는 비밀번호가 존재하지 않습니다.");
					document.getElementById("id").focus();
					isValid = false; // 해당 조건문이 실행됨 -->
				}
				return isValid;
			}
		</script>
	</section>
</div>
</body>
</html>