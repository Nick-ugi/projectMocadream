<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 찾기 결과</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    margin: 0;
    padding: 0;
  }
  
div.body-wrapper{
	width:80%;
}

  .container {
  	width:400px;
  	box-sizing:border-box;
    max-width: 800px;
    margin: 20px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 5px;
  }

  h1 {
    text-align: center;
    font-size:25px;
    color: #333;
  }

  .id-list {
  	border : 1px solid rgb(6, 10, 70);
  	border-radius: 5px;
  	padding: 10px 0;
  }

  .id-box {
    padding: 0px;
    border-radius: 5px;
    
  }
	
  .id-box p {
   padding:2px 20px;
    font-size : 16px;
    height:fix-center;
  }
  
  .btn1 {
  	margin: 20px 30px;
	width: 160px;
	padding: 8px;
	border: none;
	border-radius: 5px;
	background-color: rgb(6, 10, 70);
	color: #fff;
	cursor: pointer;
	margin-top:15px;
}
.btn1:hover{
 background-color: rgba(6, 10, 70,0.7);
}
.btn {
	display:flex;
	justify-content : center;
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
	.container {
		width:380px;
	}
}
</style>
</head>
<body>
<div class="body-wrapper">
<div class="container">
 <%
        // 전달받은 아이디 리스트 가져오기
        List<String> idList = (List<String>) request.getAttribute("idList");
        int size = (idList != null) ? idList.size() : 0;

        if (size > 0) {
    %>
    <h1 style="font-size:25px; text-align: center; margin: 30px;">아이디 찾기 결과</h1>
    
<!--     <p style="font-size: 16px;">아이디 찾기가 완료되었습니다.</p> -->
    <p style="font-size: 16px; margin: 40px 0 10px 0;">가입된 아이디가 <span style="color:rgb(6, 10, 70)"><%= size %></span>개 있습니다.</p>
    <div class="id-list">
   
    
    <%
            for (int i = 0; i < size; i++) {
                String id = idList.get(i);
             // 아이디의 세 번째 글자까지 '*'로 변경
           String maskedId = id.substring(0, 3).replaceAll(".", "*") + id.substring(3);
    %>
   
    <div class="id-box">
        <p><%=maskedId%></p>
    </div>
    
    <%
            }
    %>
    <%
        } else {
    %>
    <p>일치하는 회원 정보가 없습니다. <br> 이름과 이메일을 확인해주세요.</p>
    <%
        }
    %>
    </div>
 	
 	
 	<div class="btn">
 	<a href="./memberLogin.mc"><button id="returnBtn" class="btn1">로그인 페이지로<br>돌아가기</button></a>
	</div>
</div>
</div>

</body>
</html>
