<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>mocadream 이용안내</title>
<style>
body {
	background-color: #fff;
	font-family: Arial, sans-serif;
}

div.way-div {
	margin-bottom: 15px;
}

img.way-img {
	width: 100%;
	height: 500px;
}

p.p-sub {
	margin: 2px;
	text-align: center;
}

p.p-title {
	margin: 20px 0;
	font-weight: bolder;
	font-size: 18px;
	text-align: left;
}

div.body-wrapper {
	width: 80%;
	background-color: white;
	margin: 0 auto;
	margin-bottom: 5%;
}

ul.ul {
	padding-left: 10%;
}

li.star-li {
	list-style-type: none;
}

div.right {
	text-align: right;
}

.btn {
	padding: 8px 12px;
	margin: 0 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #fff;
	cursor: pointer;
}

.btn:hover {
	background-color: #f0f0f0;
}

.btn.active {
	background-color: #dee2e6;
	cursor: default;
	font-weight: bolder;
}

td {
    padding: 0;
    white-space: normal;
    height: 0;
    vertical-align: baseline;
    border-top: 0;
    border-bottom: 0;
}

td.type01 {
	padding: 5px;
}


table {
	text-align: left;
}
tr {
	border-top: 0;
    border-bottom: 0;
}
b.bTag {
	font-weight: bold;
}
div.right {
	padding-right: 0;
}
@media only screen and (max-width: 1279px) {  
	img.way-img {
		height: 450px;
	}
	ul.ul {
		padding: 0 5%;
	}
}
@media only screen and (max-width: 767px) {  
	ul.ul-text, ul.star-ul, ul.ul, p, table {
		font-size: 14px;
	}
	img.way-img {
		height: 350px;
	}
	ul.ul {
		padding: 0 5%;
	}
}

@media only screen and (max-width: 479px) {
	p.p-title {
		font-size: 16.5px;
	}
	img.way-img {
		height: 250px;
	}
	ul.ul {
		padding-left: 0;
	}
}
</style>
</head>
<body>
<div class="body-wrapper">
	<div class="way-div" style="text-align: center; margin: 50px 0px;">
		<section style="font-size:25px;">MocaDream 이용 안내</section>
	</div>
	<div style="text-align:center;">
		<img class="way-img" src="roompic/5.jpg">
	</div>
	<br>
	<div class="way-div">
		<p class="p-sub">
			<b class="bTag">무료 이용인 만큼 회원가입 후 이용 가능</b>하며<br> 간단한 정리정돈을 셀프서비스로 대체하여 인건비를
			줄이고 좀 더 나은 환경을 여러분께 제공해 드립니다.
		</p>
	</div>
	<br>

	<div class="way-div" style="border-top: 1px solid #dee2e6">
		<p class="p-title">운영시간</p>
		<ul class="ul-text ul">
			<li class="star-li" style="margin-bottom:7px;"><b class="bTag">open : 09 : 00</b></li>
			<li class="star-li"><b class="bTag">close : 21 : 00</b></li>
		</ul>
	</div>

	<div class="way-div" style="border-top: 1px solid #dee2e6">
		<p class="p-title">예약 및 사용</p>
		<ul class="ul">
			<li class="star-li">회원가입 후 예약 가능합니다.</li>
			<li class="star-li"><b class="bTag">예약신청 &#10143; 방 선택 &#10143; 날짜 선택 &#10143; 이용 가능한 시간 검색 &#10143; 시간 선택 &#10143; 이용시간 선택 후 예약 신청</b></li>
			<li class="star-li" style="padding-left:8px;">&#9745;기본예약 시간단위는 1시간이며, 최대 3시간까지 이용하실 수 있습니다. 반드시 시간 검색 후 선택하셔야 예약 가능합니다.</li>
			<li class="star-li" style="padding-left:8px;">&#9745; 이용당일 : mocadream 공간 도착 &#10143; 관리자에게 방문 알리기 &#10143; 해당 룸 이용</li>
			<li class="star-li" style="padding-left:8px;">&#9745; 자세한 이용방법은 예약 후 안내문자가 전송됩니다.</li>
		</ul>
	</div>

	<div class="way-div">
		<ul class="star-ul ul">
			<li class="star-li" style="color: red;">&#9733; 예약 신청 후 미사용 시 경고 1회 처리됩니다. 3회 경고 시 제재 회원으로 이용이 불가합니다.</li>
			<li class="star-li">&#9733; 퇴실시 기본정리(쓰레기, 의자, 사용하신 물품 제자리)는 선택사항이 아닌 필수 사항 입니다.</li>
			<li class="star-li">&#9733; 정리상태가 지나치게 부족하여 다음 이용자의 불만이 접수 될 경우, 경고처리 1회 발생할 수 있습니다.</li>
			<li class="star-li">&#9733; 쾌적한 이용환경을 위해 불편하시겠지만 많은 협조 부탁드립니다.</li>
		</ul>
	</div>

	<div class="way-div" style="border-top: 1px solid #dee2e6">
		<p class="p-title">편의시설 이용안내</p>
		<table style="border: 1px solid lightgray; width:100%;" cellpadding="5px" cellspacing="0">
			<tr>
				<td class="type01">사전도착 대기공간(소파라운지)</td>
			</tr>
			<tr>
				<td class="type01">인터넷 (5G Wifi &amp; *유선LAN)<br>※유선인터넷 사용시 랜케이블 개별지참
				</td>
			</tr>
			<tr>
				<td class="type01">믹스커피 또는 각종 티백류 등 간단한 음료<br>※외부 음료 반입이 가능하며, 다음분을 위한 뒷정리는 필수입니다
				</td>
			</tr>
			<tr>
				<td class="type01">회의용 대형모니터(표준형 HDMI 포함)<br>※10~12인실에는 대형 모니터를 대신하여 풀HD급 빔프로젝터와 120인치 스크린보드가 무료로 제공됩니다. (※스크린보드:프로젝터 투사 가능한 화이트보드)
				</td>
			</tr>
			<tr>
				<td class="type01">레이저 복합기(흑백/칼라 출력 및 복사)</td>
			</tr>
		</table>
	</div>

	<div class="way-div right">
		<button class="btn" onclick='location.href="roomListAction.mc";'>실시간 예약하기</button>
	</div>

</div>
</body>
</html>