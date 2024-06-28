<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style type="text/css">
body {
	font-family: Arial, sans-serif;
	background-color: #f9f9f9;
	margin: 0;
	padding: 0;
}

p {
    text-align: right;
    margin-right: 20px;
}

textarea {
	resize: none;
	height: 300px;
	display: block;

}


#insertformArea {
    margin: 0 auto;
    width: 900px;
	padding-top: 30px; 
}

h1 {
    text-align: left;
    padding-left: 20%;
    margin-bottom: 20px;
}

form table {
    margin: auto;
    width: 80%;
}

form table tr td label {
    display: inline-block;
    width: 150px;
    font-weight: bold;
}

form table tr td input[type="text"],
form table tr td input[type="file"],
form table tr td textarea {
    width: 95%;
    padding: 8px;
    border: 1px solid #868e96;
    border-radius: 5px;
    margin: 1.5px 0;
}

form table tr td input[type="submit"],
form table tr td input[type="button"],
form table tr td input[type="reset"] {
    color: #343a40;
	background-color: #dee2e6;
	border: none;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
 	border-radius: 5px;
}

form table tr td input[type="submit"]:hover,
form table tr td input[type="button"]:hover,
form table tr td input[type="reset"]:hover {
    opacity: 0.8;
}

section {
    text-align: center;
    width: 900px;
    margin: 0 auto;
}

a {
    text-decoration: none;
    color: brown;
}

a:hover {
    text-decoration: underline;
}
.r_title {
	color: #343a40;
	background-color: #dee2e6;
	border: 3px solid white;
	width: 180px;
	vertical-align: middle;
}

/*css수정 0405.1200*/
.r_title.r_title_top {
	border-radius: 20px 0 0 0;
}

.r_title.r_title_bottom {
	border-radius: 0 0 0 20px;
}

input, textarea {
	outline: none;
}

td {
	padding:0;
}

form table tr td textarea {
	margin-left: 5px;
}

div.body-wrapper {
    width: 100%;
}

@media only screen and (max-width: 1279px) {  
	 #inputformArea {
	    max-width:100%;
	}
}

@media only screen and (max-width: 900px) {
	 #inputformArea {
	    max-width:100%;
	}
}

@media only screen and (max-width: 840px) {
	#inputformArea {
	    max-width:100%;
	}
    form table tr td textarea {
    	margin-left: 0;
	}
}

@media screen and (max-width: 479px) {
    table#mobile-tb {
    	width: 300px;
    }
    td#mobile-td1, td#mobile-td2, td#mobile-td3, td#mobile-td4 {
    	width: 40%;
    }
    
    td#mobile-td1-con, td#mobile-td2-con, td#mobile-td3-con, td#mobile-td4-con {
    	width: 60%;
    }

    form table tr td label.label {
        width: 60px;
    }
    
    form table tr td textarea {
    	margin-left: 0;
	}
	table {
		font-size: 14px; 
 	}
   
}
</style>
</head>
<body>
<%@ include file="/common/cookies.jsp" %>
<div class="body-wrapper">
	<section id="inputformArea">
	<form name="insertRoom" action="insertRoom.mc" method="post" enctype="multipart/form-data">
		<table id="mobile-tb">
			<tr>
				<td colspan="2" style="padding-left: 10px;">
					<h1 style="font-size:25px; padding: 8px 0 15px 0;">방 추가</h1>
				</td>
			</tr>
			<tr>
			<td id="mobile-td1" class="r_title r_title_top"><label class="label" for = "R_NAME">룸 이름</label></td><td id="mobile-td1-con" class="td_padding"><input type="text" name="R_NAME" id = "R_NAME"/></td>
			</tr>
			<tr>
			<td id="mobile-td2" class="r_title"><label class="label" for = "R_MAX">수용인원</label></td><td id="mobile-td2-con" class="td_padding"><input type="text" name="R_MAX" id = "R_MAX"/></td>
			</tr>
			<tr>
			<td id="mobile-td3" class="r_title"><label class="label" for = "R_DESC">룸 설명</label></td><td id="mobile-td3-con" class="td_padding"><textarea name="R_DESC" id = "R_DESC"></textarea></td>
			</tr>
			<tr>
			<td id="mobile-td4" class="r_title r_title_bottom"><label class="label" for = "R_FILE">룸 사진</label></td><td id="mobile-td4-con" class="td_padding"><input type="file" name="R_FILE" id = "R_FILE"/></td>
			</tr>
			<tr>
				<td colspan="2" style="padding-top: 10px;">
					<input type="submit" value="등록">
					<input type="reset" value="다시쓰기" >
                    <input type="button" value="돌아가기" onClick="javascript:history.go(-1)">
				</td>
			</tr>
	</table>
	</form>
	</section>
	<br><br>
</div>
</body>
</html>