<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="vo.Mc_users"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
Mc_users mcuser = (Mc_users) request.getAttribute("myPage");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css">
<link rel="stylesheet" href="./css/modal.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>정보수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f9f9f9;
}

#joinformArea {
	width: 400px;
	box-sizing:border-box;
	margin: 20px auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
}
div.body-wrapper{
width:80%;
}
h2 {
	text-align: center;
	font-size: 25px;
	margin: 30px;
}

table {
	width: 100%;
	margin: auto;
}

td {
	text-align: left;
	padding: 10px;
}

label {
	font-size: 14px;
}

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 8px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
}

input[type="button"] {
	width: 30%;
	padding: 7.5px;
	margin-top:5px;
	border: none;
	border-radius: 5px;
	background-color: rgb(6, 10, 70);
	color: #fff;
	cursor: pointer;
}

input[type="button"]:hover {
	background-color: rgba(6,10,70,0.7);
}

a {
	text-decoration: none;
}

a:hover {
	color: rgba(6,10,70,0.7);
	text-decoration: underline;
}

#idbox {
	position: relative;
}

.btn1{
	width: 30%;
	padding: 5px;
	text-align: center;
	border: none;
	border-radius: 5px;
	background-color: rgb(6, 10, 70);
	color: #fff;
	cursor: pointer;
	font-size: 14px;
	box-sizing: border-box;
}

#btns {
	text-align: center;
}

#hiddenDiv {
	display: none; /* 초기에는 숨겨진 상태로 설정 */
	width: 200px;
	height: 100px;
	background-color: lightblue;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

#errorMessages, 
#pwerrorMessages, 
#nameerrorMessages, 
#emailerrorMessages, 
#addrerrorMessages, 
#telerrorMessages {
	color: red;
	font-size: 12px;
	margin: 10px 0;
	display: none;
	padding-left: 30px;
	font-weight: bold;
	color: red;
}

input[type="button"]:hover,
input[type="submit"]:hover,
button[type="button"]:hover  {
	background-color:rgba(6,10,70,0.7);
}

.selectButton {
	width: 100%;
	padding: 12px;
	text-align: center;
	border: none;
	border-radius: 5px;
	background-color: rgb(6, 10, 70);
	color: #fff;
	cursor: pointer;
	font-size: 14px;
	box-sizing: border-box;
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
		<section id="joinformArea">
			<h2>내 정보수정</h2>
			<form action="myPageModifyProAction.mc" onsubmit="return validateForm()" method="post" name="modifyform">
				<table>
					<tr>
						<td><label for="id">아이디</label> <br> 
						<input type="text" class="id" pattern="[a-zA-Z0-9]+" name="id" id="id" value="<%=mcuser.getId()%>" style="border-radius: 5px;" readonly></td>
					</tr>
					<tr>
						<td><label for="pw">비밀번호</label> <br> 
						<input name="pw" type="password" class="pw" pattern="[a-zA-Z0-9!_\-!@#$%^&*]+" id="pw" minlength="8" maxlength="15" value="<%=mcuser.getPw()%>"></td>
					</tr>
					<tr>
						<td><label for="name">이름</label> <br> 
						<input name="name" type="text" class="name" pattern="[가-힣a-zA-Z\s]+" maxlength="6" id="name" maxlength="6" value="<%=mcuser.getName()%>"></td>
					</tr>
					<tr>
						<td><label for="tel">휴대전화번호</label><br> 
						<input name="tel" type="text" class="tel" pattern="(010)-[0-9]{4}-[0-9]{4}" id="tel" value="<%=mcuser.getTel()%>"></td>
					</tr>
					<tr>
						<td><label for="email">이메일</label><br> 
						<input name="email" type="text" class="email" pattern="[a-zA-Z0-9_]+[@][a-zA-Z]+[.][a-zA-Z]+[.]*[a-zA-Z]*" maxlength="100" id="email" value="<%=mcuser.getEmail()%>"></td>
					</tr>
					<section>
						<tr id="pwerrorMessages">
							<td colspan="2" style="color: red"></td>
						</tr>
						<tr id="nameerrorMessages">
							<td colspan="2" style="color: red"></td>
						</tr>
						<tr id="telerrorMessages">
							<td colspan="2" style="color: red"></td>
						</tr>
						<tr id="emailerrorMessages">
							<td colspan="2" style="color: red"></td>
						</tr>
					</section>
					<tr>
						<td><label for="myaddr">현 주소</label><br> 
						<input name="myaddr" type="text" class="myaddr" id="myaddr" value="<%=mcuser.getAddr()%>" readonly></td>
					</tr>
					<section id="addr">
						<td style="padding:10px 10px 0 10px;"><label for="newAddr" >주소</label><br></td>
						<tr>
							<td style="padding: 0px 10px;">
								<input type="text" class="addNum" name="addNum" id="sample6_postcode" style="width: 70%; border-radius: 5px 0px 0px 5px;" placeholder="우편번호" readonly />
							 	<input type="button" name="adrbtn" style="float:right; border-radius: 0px 5px 5px 0px;" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" />
							</td>
						</tr>
						<tr>
							<td style="padding: 0px 10px;"> 
							<input type="text" class="addr1" name="addr1" id="sample6_address" style="margin-top: 8px;" placeholder="주소" readonly /></td>
						</tr>
						<tr>
							<td style="padding: 0px 10px;">
							<input type="text" name="addr2" class="addr2" id="sample6_detailAddress" style="margin-top: 8px;" placeholder="상세주소" /></td>
						</tr>
						<tr>
							<td style="padding: 0px 10px;">
							<input type="text" name="cmt" id="sample6_extraAddress" style="margin-top: 8px;" placeholder="참고항목" readonly /></td>
						</tr>
					</section>
					<tr>
						<td id="btns">
							<br><button id="registerBtn" class="selectButton" type="submit">수정</button>
						</td>
					</tr>
				</table>
			</form><br>
			<table >
				<tr>
					<td style="text-align:center; font-weight: bold;font-size: 14px;">
						<a href="javascript:history.go(-1)">메인으로</a> | <a style="font-weight: bold; font-size: 14px; cursor: pointer;" class="modal_btn" >회원탈퇴</a>
					</td>
				</tr>
			</table><br>
	<div class="modal">
		<div class="modal-content">
			<form action="memberDeleteAction.mc" method="POST">
				<fieldset>
					<table class="md-table">
					<tr class="md-tr">
						<td class="md-td"><label for="id"> 회원탈퇴를 하시겠습니까 ?</label></td>
					</tr>
					<tr class="md-tr">
					<td class="md-td">
					<button type="submit" class="btn1">네</button>
					<button type="button" class="close_btn btn1">아니요</button>
					</td>
					</tr>
				</table></fieldset>
			</form>
		</div>
	</div>
			<script>
			const modal = document.querySelector('.modal');
			const modalOpen = document.querySelector('.modal_btn');
			const modalClose = document.querySelector('.close_btn');
	
			//열기 버튼을 눌렀을 때 모달팝업이 열림
			modalOpen.addEventListener('click',function(){
			    modal.style.display = 'block';
			});
			//닫기 버튼을 눌렀을 때 모달팝업이 닫힘
			modalClose.addEventListener('click',function(){
			    modal.style.display = 'none';
			});
			
    		</script>
			<script>
				function validateForm() {
					// 모든 오류 메시지 숨기기
					document.getElementById("pwerrorMessages").style.display = "none";
					document.getElementById("nameerrorMessages").style.display = "none";
					document.getElementById("telerrorMessages").style.display = "none";
					document.getElementById("emailerrorMessages").style.display = "none";

					const pw = document.getElementById("pw").value;
					const name = document.getElementById("name").value;
					const tel = document.getElementById("tel").value;
					const email = document.getElementById("email").value;

					let isValid = true; // 모든 조건문이 실행되었는지를 나타내는 변수

					// 비밀번호 검사
					if (pw == "") {
						document.getElementById("pwerrorMessages").innerHTML = "●&nbsp 비밀번호를 입력해주세요.";
						document.getElementById("pwerrorMessages").style.display = "block";
						isValid = false; // 해당 조건문이 실행됨
					}

					// 이름 검사
					if (name == "") {
						document.getElementById("nameerrorMessages").innerHTML = "●&nbsp 이름을 입력해주세요.";
						document.getElementById("nameerrorMessages").style.display = "block";
						isValid = false; // 해당 조건문이 실행됨
					}

					// 전화번호 검사
					if (tel == "") {
						document.getElementById("telerrorMessages").innerHTML = "●&nbsp 전화번호를 입력해주세요.";
						document.getElementById("telerrorMessages").style.display = "block";
						isValid = false; // 해당 조건문이 실행됨
					}

					// 이메일 검사
					if (email == "") {
						document.getElementById("emailerrorMessages").innerHTML = "●&nbsp 이메일을 입력해주세요.";
						document.getElementById("emailerrorMessages").style.display = "block";
						isValid = false; // 해당 조건문이 실행됨
					}

					// 모든 조건문이 한 번씩 실행되었는지 확인하고 결과 반환
					return isValid;
				}
			</script>
		</section>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
			function sample6_execDaumPostcode() {
				new daum.Postcode(
						{
							oncomplete : function(data) {
								var addr = "";
								var extraAddr = "";

								if (data.userSelectedType === "R") {
									addr = data.roadAddress;
								} else {
									addr = data.jibunAddress;
								}

								if (data.userSelectedType === "R") {
									if (data.bname !== ""
											&& /[동|로|가]$/g.test(data.bname)) {
										extraAddr += data.bname;
									}
									if (data.buildingName !== ""
											&& data.apartment === "Y") {
										extraAddr += extraAddr !== "" ? ", "
												+ data.buildingName
												: data.buildingName;
									}
									if (extraAddr !== "") {
										extraAddr = " (" + extraAddr + ")";
									}
									document
											.getElementById("sample6_extraAddress").value = extraAddr;
								} else {
									document
											.getElementById("sample6_extraAddress").value = "";
								}

								document.getElementById("sample6_postcode").value = data.zonecode;
								document.getElementById("sample6_address").value = addr;
								document.getElementById(
										"sample6_detailAddressInfo").focus();
							},
						}).open();
			}
		</script>
	</div>
</body>
</html>