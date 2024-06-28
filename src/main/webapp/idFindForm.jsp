<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 찾기</title>
<style>
body {
  font-family: Arial, sans-serif;
  background-color: #f0f0f0;
  margin: 0;
  padding: 0;
}

h1,h3 {
  text-align: center;
  margin-top: 25px;
  font-size:25px;
}

#idfindformArea {
	width:100%;
	box-sizing: border-box;
	margin: 20px auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	height: 280px;
}

div.body-wrapper{
	width:80%;
	text-align: center;
}

form {
  display: flex;
  flex-direction: column;
}

div:last-child {
display:flex;
justify-content:center;}

label {
  font-weight: bold;
    margin: 20px 0;
}

input[type="text"] {
  width: 400px;
  margin: 5px 0;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-sizing: border-box;
}

button#findBtn {
  width: 400px;
  padding: 10px;
  background-color: rgb(6, 10, 70);
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

button#findBtn:hover {
  background-color: rgba(6, 10, 70,0.7);
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
	input[type="text"], button#findBtn {
		width:380px;
	}
}
</style>
</head>
<body>
<div class="body-wrapper" >
<section id="idfindformArea">
<h1>아이디 찾기</h1>
<br><br>
<form name="idFindform" action="memberFindIdAction.mc" method="post" >

<div>
<input type="text" name="name" placeholder="이름을 입력해주세요.">
</div>

<div>
<input type="text" name="email" placeholder="이메일을 입력해주세요.">
</div>
<br>
<div>
<button id="findBtn">아이디 찾기</button>
</div>
</form>
</section>
</div>
</body>
</html>