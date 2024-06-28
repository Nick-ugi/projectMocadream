<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Josefin+Slab:ital,wght@0,100..700;1,100..700&family=Merienda:wght@300..900&family=Merriweather:ital,wght@0,300;0,400;0,700;0,900;1,300;1,400;1,700;1,900&family=Rowdies:wght@300;400;700&family=Sora:wght@100..800&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style>
body {
	margin: 0;
	padding: 0;
}

div.ddiv {
	display: none;
}

/*  nav-var style  */
.navbar__title {
	display: flex;
	justify-content: center;
	padding-bottom: 40px;
	background-color: rgb(7, 10, 60);
	color: rgba(255, 255, 255, 1);
}

.navbar__title>p {
	display: inline-block;
	margin: auto 20px;
	font-size: 40px;
	font-weight: bold;
}

.navbar__img {
 	background-image: url("./roompic/logo1.png");
	color: black;
	padding-left: 0;
	width: 100px;
	height: 80px;
	background-size: 100% 100%;
	display: inline-block;
}

a {
	text-decoration: none;
	color: rgb(7 10 60);
}

a:hover {
	font-weight: bolder;
}

/* navbar__menu 메뉴창 */
.navbar__menu {
	list-style: none;
	display: flex;
	margin: 0;
	justify-content: center;
	background-color: white;
	border-top: 1px solid #e1e1e1;
	border-bottom: 1px solid #e1e1e1;
	height: 80px;
	align-items: center;
}

.navbar__menu_mobile3 {
	list-style: none;
	display: none;
	margin: 0;
	justify-content: center;
	background-color: white;
	border-top: 1px solid #e1e1e1;
	border-bottom: 1px solid #e1e1e1;
	height: 111px;
	align-items: center;
}
.navbar__menu_mobile6 {
	list-style: none;
	display: none;
	margin: 0;
	justify-content: center;
	background-color: white;
	border-top: 1px solid #e1e1e1;
	border-bottom: 1px solid #e1e1e1;
	height: 222px;
	align-items: center;
}
.navbar__menu_mobile5 {
	list-style: none;
	display: none;
	margin: 0;
	justify-content: center;
	background-color: white;
	border-top: 1px solid #e1e1e1;
	border-bottom: 1px solid #e1e1e1;
	height: 185px;
	align-items: center;
}

.navbar__menu_mobile3 li, .navbar__menu_mobile5 li, .navbar__menu_mobile6 li {
	text-align: center;
	padding: 10px 40px;
	border-bottom: 1px solid #e1e1e1;
}

/* menu list */
.navbar__menu li {
	padding: 10px 40px;
	font-size: 18px;
	border-right: 1px solid #e1e1e1;
}

.navbar__menu li>p {
	height: 40%
}

.navbar__menu li a {
	color: #333;
}

.navbar__menu li a:hover {
	color: rgb(7 10 60);
	text-decoration: none;
}

/* navbar__sign 로그인 */
.navbar__sign {
	justify-content: end;
	list-style: none;
	display: flex;
	margin: 0;
	background-color: rgb(7, 10, 60);
}

/* sign list */
.navbar__sign li {
	padding: 8px 18px;
	text-align: center;
	color: rgba(255, 255, 255, 0.65);
}

.navbar__sign li a {
	color: rgba(255, 255, 255, 0.65);
	padding: 10px;
}

.menu {
	cursor: pointer;
}

.menu .hide {
	display: none;
}

.ad_li {
	font-size: 12px;
	padding: 8px 10px;
}

.navbar__title:hover {
	cursor: pointer;
}
a.logA {
	color: rgba(255, 255, 255, 0.65);
}
div.container-fluid {
	position: fixed;
}

#li-1 a:hover, 
#li-2 a:hover, 
#li-3 a:hover, 
#li-4 a:hover, 
#li-5 a:hover {
	background-color: transparent;
	color: rgb(7 10 60);
}

li#li-1, li#li-2, li#li-3, li#li-4, li#li-5 {
	background-color: transparent;
	color: rgb(7 10 60);
	margin: 10px 0;
}

div.mobile {
	display: none;
}

@media all and (min-width:768px) and (max-width:1023px) {
	ul.navbar__menu {
		overflow: hidden; /* 세로 배열 방지 */
		white-space: nowrap; /* 텍스트가 한 줄로 유지되도록 설정 */
	}
	li a {
		font-size: 0.9em;
		padding: 10px 20px;
	}
	.navbar__menu li {
		padding: 10px 0px;
	}
}

@media all and (min-width:600px) and (max-width:767px) {
	ul.navbar__menu {
		overflow: hidden; /* 세로 배열 방지 */
		white-space: nowrap; /* 텍스트가 한 줄로 유지되도록 설정 */
	}
	li a {
		font-size: 0.8em;
		padding: 10px 20px;
	}
	.navbar__menu li {
		padding: 10px 0px;
	}
}

@media all and (max-width:599px) {
   	.navbar__menu {
		display: none;
	}
	 
	div.mobile {
		text-align: center;
		padding: 10px 40px;
		border-bottom: 1px solid #e1e1e1;
		display: block;
		cursor: pointer;
	}

	/* introduce-container의 상단 마진을 높이 조정하여 간격을 줍니다. */
   .introduce-container {
      margin-top: 10px;
   }

	/* 예약하기 버튼 스타일 조정 */
   .booking_button {
      width: 200px;
      height: 40px;
      font-size: 16px;
   }

	/* 슬라이드 이미지 크기 조정 */
   .slide_item {
      height: 400px;
   }

	/* 슬라이드 페이지네이션 스타일 조정 */
   .slide_pagination>li {
      font-size: 20px;
   }

	/* 메뉴얼 박스 크기 조정 */
   .manual_box {
      height: 300px;
   }

	/* 스태프 프로필 이미지 크기 조정 */
   .staff_box img {
      width: 150px;
   }
   .navbar__sign {
	font-size: 14px;
   }
   
}
</style>
<script>
function on_off() {
   var div = document.getElementById("mobile");

    if (div.style.display === "none" || div.style.display === "") {
        div.style.display = "block";
    } else {
        div.style.display = "none";
    }
}

// 창 크기가 변경될 때 드롭다운 메뉴를 숨김
window.onresize = function() {
   var dropdownContent = document.getElementById("mobile");
   if (window.innerWidth >= 480) {
      dropdownContent.style.display = "none";
   }
};
</script>
</head>
<body>
	<nav class="navbar">
		<ul class="navbar__sign">
			<li>
			<c:choose>
				<c:when test="${id ne null }">
					<% if (session.getAttribute("id").equals("admin")) { %>
						[관리자계정]&nbsp; <a href="logout">로그아웃</a><a href="admin_Main.mc">관리자 페이지</a>	
					<% } else { %>
						${id }님, 환영합니다. <a href="logout">로그아웃</a><a href="loginMypage.mc">내 정보수정</a>
					<% } %>
				</c:when>
				<c:otherwise>
					<a href="loginForm.jsp">로그인</a>
					<a href="joinForm.jsp">회원가입</a>
				</c:otherwise>
			</c:choose>
			</li>
		</ul>

		<div class="navbar__title" onclick="location.href='./main.jsp';">
			<div class="navbar__img" onclick="location.href='./main.jsp';"></div>
			<p style="font-family: 'Merriweather', serif;">MocaDream</p>
		</div>

		<c:choose>
			<c:when test="${id ne null }">
				<%
				if (session.getAttribute("id").equals("admin")) {
				%>
				<ul class="navbar__menu">
					<li><a href="./way_moca.jsp">이용방법</a></li>
					<li><a href="mocaDetail.mc">방정보</a></li>
					<li><a href="./map.jsp">오시는길</a></li>
				</ul>
				<div class="mobile" onclick="on_off()">메뉴</div>
				<ul id="mobile" class="navbar__menu_mobile3">
					<li><a href="./way_moca.jsp">이용방법</a></li>
					<li><a href="mocaDetail.mc">방정보</a></li>
					<li><a href="./map.jsp">오시는길</a></li>
				</ul>
				
				<% 
				} else {
				%>
				<ul class="navbar__menu">
					<li><a href="boardList.mc">공지사항</a></li>
					<li><a href="./way_moca.jsp">이용방법</a></li>
					<li><a href="mocaDetail.mc">방정보</a></li>
					<li><a href="roomListAction.mc">예약하기</a></li>
					<li><a href="myOrderList.mc">예약 내역 확인</a></li>
					<li><a href="./map.jsp">오시는길</a></li>
				</ul>
				<div class="mobile" onclick="on_off()">메뉴</div>
				<ul id="mobile" class="navbar__menu_mobile6">
					<li><a href="boardList.mc">공지사항</a></li>
					<li><a href="./way_moca.jsp">이용방법</a></li>
					<li><a href="mocaDetail.mc">방정보</a></li>
					<li><a href="roomListAction.mc">예약하기</a></li>
					<li><a href="myOrderList.mc">예약 내역 확인</a></li>
					<li><a href="./map.jsp">오시는길</a></li>
				</ul>
				<%
				}
				%>
			</c:when>
			<c:otherwise>
				<ul class="navbar__menu">
					<li><a href="boardList.mc">공지사항</a></li>
					<li><a href="./way_moca.jsp">이용방법</a></li>
					<li><a href="mocaDetail.mc">방정보</a></li>
					<li><a href="roomListAction.mc">예약하기</a></li>
					<li><a href="./map.jsp">오시는길</a></li>
				</ul>
				<div class="mobile" onclick="on_off()">메뉴</div>
				<ul id="mobile" class="navbar__menu_mobile5">
					<li><a href="boardList.mc">공지사항</a></li>
					<li><a href="./way_moca.jsp">이용방법</a></li>
					<li><a href="mocaDetail.mc">방정보</a></li>
					<li><a href="roomListAction.mc">예약하기</a></li>
					<li><a href="./map.jsp">오시는길</a></li>
				</ul>
			</c:otherwise>
		</c:choose>
	</nav>
</body>
</html>