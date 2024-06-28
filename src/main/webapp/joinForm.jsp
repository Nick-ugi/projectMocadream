<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css">
<link rel="stylesheet" href="./css/modal.css">
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<script>
	$(function() {
		$("#idchkbtn").click(function() {
			// 아이디 필드의 값을 가져옴
			let idValue = document.getElementById("id").value.trim();

			// 아이디 값이 비어있는지 확인
			if (idValue === "") {
				alert("중복체크를 하시려면 아이디를 입력해주세요.");
				return; // 빈 문자열이면 중복 체크를 실행하지 않음
			}

			let idval = {
				"id" : idValue
			};
			$.ajax({
				url : "IdCheck",
				type : "post",
				data : JSON.stringify(idval),
				contentType : 'application/json; charset=utf-8',
				cache : false,
				success : function(data) {
					console.log('success');
					alert(data.map.id + '는 ' + data.map.str);

				},
				error : function() {
					alert('error');
				}
			});
		});
	});
</script>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f9f9f9;
}

#joinformArea {
	width: 400px;
	box-sizing:border-box;
	margin: 20px auto;
	padding: 20px;
	background-color: #fff;
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
	padding: 8px;
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
	width: 100%;
	padding: 7.5px;
	border: none;
	border-radius: 5px;
	background-color: rgb(6, 10, 70);
	color: #fff;
	cursor: pointer;
}

a {
	text-decoration: none;
	color: rgb(7, 10, 60);
}

a:hover {
	text-decoration: underline;
}

#idbox {
	position: relative;
}

label{
	font-size: 14px;
}

.btn1 {
	width: 150px;
	padding: 8px;
	border: none;
	border-radius: 5px;
	background-color: rgb(6, 10, 70);
	color: #fff;
	cursor: pointer;
}

#idchkbtn {
	width: 30%;
	height: 33px;
	bottom: 0;
	right: 0;
	margin-top: 5px; border-radius : 0 5px 5px 0;
	border: none;
	background-color: rgb(6, 10, 70);
	color: #fff;
	cursor: pointer;
	font-size: 12px;
	float: right;
	border-radius: 0 5px 5px 0;
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
#iderrorMessages, 
#pwerrorMessages, 
#pwcferrorMessages, 
#nameerrorMessages, 
#emailerrorMessages, 
#addrerrorMessages, 
#telerrorMessages, 
#postcodeerrorMessages {
	color: red;
	font-size: 12px;
	margin: 10px 0;
	display: none;
	padding-left: 30px;
	font-weight: bold;
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
			<form name="joinform" method="post" onsubmit="return validateForm()" action="memberJoinAction.mc">
				<table>
					<tr>
						<td colspan="2">
							<h2>회원가입</h2>
						</td>
					</tr>
					<tr>
						<td>
							<label for="id" style="font-size: 14px;">아이디 </label><br>
							<div id="idbox">
								<input type="text" name="id" id="id" pattern="[a-zA-Z0-9]+" minlength="6" maxlength="20" style="width: 70%; border-radius: 5px 0 0 5px;" placeholder="아이디" />
								<button type="button" id="idchkbtn">중복확인</button>
							</div>
						</td>
					</tr>
					<tr>
						<td>
								<label for="pw" >비밀번호 </label><br> 
							<input type="password" name="pw" id="pw" pattern="[a-zA-Z0-9!_\-!@#$%^&*]+" minlength="8" maxlength="15" placeholder="비밀번호" />
						</td>
					</tr>
					<tr>
						<td>
							<label for="pwcf">비밀번호 확인 </label><br> 
							<input type="password" name="pwcf" id="pwcf" pattern="[a-zA-Z0-9!_\-!@#$%^&*]+" minlength="8" maxlength="15" placeholder="비밀번호확인" />
						</td>
					</tr>
					<tr id="pwcferrorMessages">
						<td colspan="2" style="color: red"></td>
					</tr>
					<tr>
						<td>
							<label for="name">이름 </label><br> 
							<input type="text" name="name" id="name" pattern="[가-힣a-zA-Z\s]+" placeholder="이름" maxlength="6" />
						</td>
					</tr>
					<tr>
						<td>
							<label for="tel">전화번호 </label><br> 
							<input type="text" name="tel" id="tel" placeholder="휴대전화번호 예시 : 000-0000-0000" pattern="(010)-[0-9]{4}-[0-9]{4}" />
						</td>
					</tr>
					<tr>
						<td>
							<label for="email">이메일 주소 </label><br> 
							<input type="text" name="email" id="email" pattern="[a-zA-Z0-9_]+[@][a-zA-Z]+[.][a-zA-Z]+[.]*[a-zA-Z]*" placeholder="이메일" maxlength="100" />
						</td>
					</tr>
					<section>
						<tr id="iderrorMessages">
							<td colspan="2" style="color: red"></td>
						</tr>
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
						<tr id="errorMessages">
							<td colspan="2" style="color: red"></td>
						</tr>
					</section>
					<section id="addr">
						<td><b style="font-size: 14px;">주소</b></td>
						<tr>
							<td>
								<input type="button" name="adrbtn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" />
								<br>
								<input type="text" name="addNum" id="sample6_postcode" placeholder="우편번호" readonly />
							</td>
						</tr>
						<tr>
							<td>
								<label for="addr1"></label>
								<input type="text" name="addr1" id="sample6_address" placeholder="주소" readonly />
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" name="addr2" id="sample6_detailAddress" placeholder="상세주소" />
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" name="cmt" id="sample6_extraAddress" placeholder="참고항목" readonly />
							</td>
						</tr>
					</section>
					<tr id="postcodeerrorMessages">
						<td colspan="2" style="color: red"></td>
					</tr>
					<tr>
						<td id="btns">
							<button id="registerBtn" class="btn1" type="submit">회원가입</button>
							&nbsp;&nbsp;
						</td>
					</tr>
				</table>
			</form>
			<br>
			<script>
				function validateForm() {
					// 모든 오류 메시지 숨기기
					document.getElementById("errorMessages").style.display = "none";
					document.getElementById("iderrorMessages").style.display = "none";
					document.getElementById("pwerrorMessages").style.display = "none";
					document.getElementById("pwcferrorMessages").style.display = "none";
					document.getElementById("nameerrorMessages").style.display = "none";
					document.getElementById("telerrorMessages").style.display = "none";
					document.getElementById("emailerrorMessages").style.display = "none";
					document.getElementById("postcodeerrorMessages").style.display = "none";

					const id = document.getElementById("id").value;
					const pw = document.getElementById("pw").value;
					const pwcf = document.getElementById("pwcf").value;
					const name = document.getElementById("name").value;
					const tel = document.getElementById("tel").value;
					const email = document.getElementById("email").value;
					const postcode = document
							.getElementById("sample6_postcode").value;
					const address = document.getElementById("sample6_address").value;

					let isValid = true; // 모든 조건문이 실행되었는지를 나타내는 변수

					// 아이디 검사
					if (id == "") {
						document.getElementById("iderrorMessages").innerHTML = "●&nbsp 아이디를 입력해주세요.";
						document.getElementById("iderrorMessages").style.display = "block";
						document.getElementById("iderrorMessages").focus();
						isValid = false; // 해당 조건문이 실행됨
					}

					// 비밀번호 검사
					if (pw == "") {
						document.getElementById("pwerrorMessages").innerHTML = "●&nbsp 비밀번호를 입력해주세요.";
						document.getElementById("pwerrorMessages").style.display = "block";
						isValid = false; // 해당 조건문이 실행됨
					}

					// 비밀번호 확인 검사
					if (pwcf != pw) {
						document.getElementById("pwcferrorMessages").innerHTML = "●&nbsp 비밀번호를 동일하게 입력해주세요.";
						document.getElementById("pwcferrorMessages").style.display = "block";
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

					// 주소 검사
					if (postcode == "") {
						document.getElementById("postcodeerrorMessages").innerHTML = "●&nbsp 주소를 입력해주세요.";
						document.getElementById("postcodeerrorMessages").style.display = "block";
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
								document
										.getElementById("sample6_detailAddress")
										.focus();
							},
						}).open();
			}
		</script>
	</div>
</body>
</html>