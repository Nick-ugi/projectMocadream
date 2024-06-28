<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/default.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Josefin+Slab:ital,wght@0,100..700;1,100..700&family=Merienda:wght@300..900&family=Merriweather:ital,wght@0,300;0,400;0,700;0,900;1,300;1,400;1,700;1,900&family=Rowdies:wght@300;400;700&family=Sora:wght@100..800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<style>
.slide {
	/* layout */
	display: flex;
	flex-wrap: nowrap;
	/* 컨테이너의 내용물이 컨테이너 크기(width, height)를 넘어설 때 보이지 않도록 하기 위해 hidden을 준다. */
	overflow: hidden;
	/* position */
	/* slide_button의 position absolute가 컨테이너 안쪽에서 top, left, right offset이 적용될 수 있도록 relative를 준다. (기본값이 static인데, static인 경우 그 상위 컨테이너로 나가면서 현재 코드에선 html을 기준으로 offset을 적용시키기 때문) */
	position: relative;
	/* size */
	width: 100%;
	/* slide drag를 위해 DOM요소가 드래그로 선택되는것을 방지 */
	user-select: none;
}

.slide_item {
	/* layout */
	display: flex;
	align-items: center;
	justify-content: center;
	opacity: 0.8;
	/* position - 버튼 클릭시 left offset값을 적용시키기 위해 */
	position: relative;
	left: 0px;
	/* size */
	width: 100%; /* 수정 */
	height: 600px;
	/* flex item의 flex-shrink는 기본값이 1이므로 컨테이너 크기에 맞게 줄어드는데, 슬라이드를 구현할 것이므로 줄어들지 않도록 0을 준다. */
	flex-shrink: 0;
	/* transition */
	transition: left 0.15s;
}

.booking_button {
	/* layout */
	display: flex;
	justify-content: center;
	align-items: center;
	/* position */
	position: absolute;
	/* button-size */
	width: 300px;
	height: 60px;
	/* button-style */
	/* 	border: 1px solid rgba(255,255,255,0.5); */
	border-radius: 10px;
	background-color: rgba(0, 0, 0, 40%);
	cursor: pointer;
	/* 버튼 가운데 정렬 */
	top: 50%;
	left: 50%;
	top: calc(85%);
	transform: translate(-50%, -50%);
	/* font */
	font-size: 20px;
	font-weight: border;
	color: white;
}

.slide_button {
	/* layout */
	display: flex;
	justify-content: center;
	align-items: center;
	/* position */
	position: absolute;
	/* 버튼이 중앙에 위치하게 하기위해 계산 */
	top: 0;
	/* size */
	width: 100px;
	height: 600px;
	/* style */
	cursor: pointer;
}

.slide_prev_button {
	left: 0;
}

.slide_next_button {
	right: 0;
}

/* 각 슬라이드가 변경되는 것을 시각적으로 확인하기 쉽도록 각 슬라이드별 색상 적용 */
.slide_item.item1 {
	background-image: url("./roompic/main2.jpg");
	background-size: 100% 100%; 
	background-size: cover;
}

.slide_item.item2 {
	background-image: url("./roompic/main1.jpg");
	background-size: 100% 100%; 
	background-size: cover;
}

.slide_item.item3 {
	background-image: url("./roompic/main3.jpg");
	background-size: 100% 100%; 
	background-size: cover;
}

.slide_item.item4 {
	background-image: url("./roompic/main4.jpg");
	background-size: 100% 100%; 
	background-size: cover;
}


/* 페이지네이션 스타일 */
ul, li {
	list-style-type: none;
	padding: 0;
	margin: 0;
}

.slide_pagination {
	/* layout */
	display: flex;
	gap: 5px;
	/* position */
	position: absolute;
	bottom: 0;
	/* left:50%, translateX(-50%)를 하면 가로 가운데로 위치시킬 수 있다. */
	left: 50%;
	transform: translateX(-50%);
}

.slide_pagination>li {
	/* 현재 슬라이드가 아닌 것은 투명도 부여 */
	color: rgba(0, 0, 0, 0.1);
	cursor: pointer;
	font-size: 25px;
}

.slide_pagination>li.active {
	/* 현재 슬라이드 색상은 투명도 없이 */
	color: rgba(0, 0, 0, 0.1);
}

.slide_item_duplicate {
	display: flex;
	align-items: center;
	justify-content: center;
	position: relative;
	left: 0px;
	width: 100%;
	height: 600px;
	flex-shrink: 0;
	transition: left 0.15s;
}

.text_1 {
	/* layout */
	display: flex;
	justify-content: center;
	align-items: center;
	/* position */
	position: absolute;
	/* button-style */
	/* border-radius: 10%;
    background-color: orange; */
	cursor: pointer;
	color: orange;
	/* 버튼 가운데 정렬 */
	top: 50%;
	left: 50%;
	top: calc(30%);
	transform: translate(-50%, -50%);
	/* font */
	font-weight: border;
}

.text_box {
	background-color: rgba(0, 0, 0, 0.8);
	width: 800px;
	height: 350px;
	border: 5px solid orange;
	border-radius: 5%;
}

.introduce-container {
	margin-top: 80px;
}

.introduce-content {
	padding-top: 20px;
	display: flex;
}

.introduce-title {
	display: flex;
	padding-left: 20px;
	font-size: 4em;
}

.introduce-title span {
	padding-left: 20px;
}

.introduce-title-bar {
	width: 2%;
	background-color: #070a3c
}

.introduce-maintext {
	padding-left: 20px;
	font-size: 2em;
	color: #000;
}

.introduce-subtext {
	text-align: end;
	margin-top: 80px;
	padding-bottom: 8px;
	font-size: 1.5em;
	font-weight: bold;
	border-bottom: 3px solid #070a3c;
	line-height: 1.5;
}

.introduce-subtext2 {
	text-align: right;
}

.introduce-subtext2 span {
	font-weight: bold;
	font-size: 1em;
	line-height: 2;
	color: #363877
}

.introduce-text {
	flex: 1; /* 자동으로 확장되도록 설정합니다. */
	padding-right: 20px;
}

.introduce-img {
	flex: 1; /* 자동으로 확장되도록 설정합니다. */
	text-align: center; /* 이미지를 가운데로 정렬합니다. */
	align-items: center; /* 수직 정렬을 위해 아이템들을 센터로 정렬합니다. */
	justify-content: center; /* 수평 정렬을 위해 아이템들을 가운데로 정렬합니다. */
}

.introduce-img img {
	width: 100%;
	height: auto;
}

.swiper-container {
	margin-top: 40px;
}

.vertical-bar {
	border-top: 4px solid rgb(7, 10, 60);
	margin: 4px 0;
}

.swiper-titlebox {
	flex-direction: column;
	display: flex;
	justify-content: center;
	margin-top: 80px;
	align-items: center;
	line-height: 0.5;
}

.minititle {
	text-align: center;
	font-size: 1em;
	font-weight: bold;
}

.maintitle p {
	font-size: 2.0em;
	font-weight: bold;
	padding: 40px;
}

.subtitle p {
	text-align: center;
	font-size: 1.2em;
	font-weight: 600;
	line-height: 1;
}

.swiper-slide {
	display: flex;
	position: relative;
	align-items: center;
	justify-content: center;
}

.swiper-slide img {
	box-shadow: 0 0 5px #555;
	height: 100%;
	width: 100%;
	max-width: 100%;
}

.swiper-slide-content {
	position: relative;
	width: 100%;
	height: 0;
	padding-bottom: 100%; /* 1:1 비율을 위해 높이를 너비의 100%로 설정 */
}
:root {
    --swiper-theme-color: #343434 !important;
}

.image-wrapper {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

.image-wrapper img {
	width: 100%;
	height: 100%;
	object-fit: cover; /* 이미지가 잘리지 않고 적절하게 보이도록 설정 */
}

.text-overlay {
	position: absolute;
	bottom: 0;
	left: 0;
	width: 100%;
	height: 100%;
	max-width: 100%;
	display: flex;
	background: rgba(0, 0, 0, 0.5);
	opacity: 0;
	transition: opacity 0.3s ease;
	line-height: 2;
}

.swiper-slide:hover .text-overlay {
	opacity: 1;
}

.text-overlay p {
	position: absolute;
	bottom: 10%;
	color: white;
	font-size: 1em;
	padding: 10px;
	margin-top: 20px;
}

.text-overlay span {
	color: orange;
	font-size: 1em;
	margin-bottom: 20px;
}

.manual {
	padding: 40px 100px;
	margin: 0 auto;
	text-align: center;
}

.manual_bigbox {
	display: flex;
	justify-content: space-around;
	height: auto;
}

.manual img {
	position: absolute;
	width: 80px;
	top: 20%;
}

.manual_box {
	position: relative;
	display: flex;
	flex-direction: column;
	justify-content: center;
	text-align: center;
	align-items: center;
	width: 33.3%;
	height: 400px;
	padding: 20px;
	padding-top: 40px;
	background-color: white;
	margin-top: 40px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
}

.manual_box_p {
	position: absolute;
	top: 45%;
	font-size: 1em;
	font-weight: bold;
	line-height: 2;
}

.manual_box p:first-child {
	font-size: 1.5em;
	font-wieght: bold;
}

.staff {
	background-color: white;
	margin: 0 auto;
	padding: 40px 100px;
	text-align: center;
}

.staff_box {
	display: flex;
	justify-content: space-around;
}

.staff_box img {
	width: 100%
}

.staff-profile {
	max-width: 25%;
	width: 25%
}

.staff-profile p:nth-of-type(1) {
	font-size: 1.5em;
}

.staff-profile p {
	margin: 30px 0;
	font-size: 1.2em
}


/* 테블릿 가로 (해상도 1024px ~ 1400px)*/
@media all and (min-width:1024px) and (max-width:1400px) {
	.introduce-content {
		padding-top: 20px;
		display: flex;
		flex-direction: column;
	}
	.manual {
		padding: 0;
		margin: 0 auto;
		text-align: center;
	}
}

/* 테블릿 가로 (해상도 768px ~ 1023px)*/
@media all and (min-width:768px) and (max-width:1023px) {
	.introduce-content {
		padding-top: 20px;
		display: flex;
		flex-direction: column;
	}
	/* introduce-container의 상단 마진을 더 조정하여 간격을 줍니다. */
	.introduce-container {
		margin-top: 40px;
	}
	.introduce-title {
		display: flex;
		padding-left: 20px;
		font-size: 2em;
	}
	.introduce-maintext {
		padding-left: 20px;
		font-size: 1em;
		color: #000;
	}
	.introduce-subtext {
		text-align: end;
		padding-bottom: 8px;
		font-size: 1em;
		font-weight: bold;
		border-bottom: 3px solid #070a3c;
		line-height: 1.5;
	}
	.introduce-subtext2 {
		text-align: right;
	}
	.introduce-subtext2 span {
		font-weight: bold;
		font-size: 0.8em;
		line-height: 2;
		color: #363877;
	}
	.manual {
		padding: 0;
		margin: 0 auto;
		text-align: center;
	}
	.manual_box_p {
		font-size: 0.8em;
		font-weight: bold;
		line-height: 2;
	}
	.subtitle p {
		font-size: 1.1em;
	}
	.slide_item {
    	height: 450px;
    }
}

/* 모바일 가로 & 테블릿 세로 (해상도 480px ~ 767px)*/
@media all and (min-width:480px) and (max-width:768px) {
	.introduce-container {
		margin-top: 20px;
	}
	.introduce-content {
		padding-top: 20px;
		display: flex;
		flex-direction: column;
	}
	.maintitle p {
		font-size: 1.2em;
		font-weight: bold;
		padding: 40px;
	}
	.introduce-title {
		display: flex;
		padding-left: 20px;
		font-size: 2em;
	}
	.introduce-maintext {
		padding-left: 20px;
		font-size: 1em;
		color: #000;
	}
	.subtitle p {
		font-size: 0.7em;
		font-weight: 600;
	}
	.introduce-subtext {
		text-align: end;
		padding-bottom: 8px;
		font-size: 1em;
		font-weight: bold;
		border-bottom: 3px solid #070a3c;
		line-height: 1.5;
	}
	.introduce-subtext2 {
		text-align: right;
	}
	.introduce-subtext2 span {
		font-weight: bold;
		font-size: 0.8em;
		line-height: 2;
		color: #363877;
	}
	.swiper-titlebox {
		flex-direction: column;
		display: flex;
		justify-content: center;
		margin-top: 80px;
		align-items: center;
		line-height: 0.5;
		font-size: 1em;
	}
	.swiper-container, .swiper-wrapper, .swiper-slide {
		width: 100% !important;
	}

	.manual {
		padding: 0;
		margin: 0 auto;
		text-align: center;
	}
	.manual_box {
		width: 100%;
		position: relative;
		display: flex;
		flex-direction: column;
		background-color: white;
		margin-top: 40px;
		box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
		padding: 0;
	}
	.manual_bigbox {
		display: flex;
		flex-direction: column;
		justify-content: space-around;
		height: auto;
		align-items: center;
	}
	.manual_box_p {
		font-size: 0.8em;
		font-weight: bold;
		line-height: 2;
	}
	.staff_box {
		display: flex;
		flex-wrap: wrap;
		justify-content: space-between;
	}
	.staff-profile {
		width: 48%; /* 두 개씩 나열되도록 박스 너비 조정 */
		max-width: 48%;
		margin-bottom: 20px; /* 아래쪽 여백 추가 */
	}
	    .slide_item {
    	height: 350px;
    }
}

/* 479px 이상의 해상도에서는 버튼을 숨깁니다. */
@media screen and (min-width: 479px) {
	.swiper-button-prev, .swiper-button-next {
		display: none !important; /* 버튼 감추기 */
	}
}

/* 모바일 세로 (해상도 ~ 479px)*/
@media all and (max-width:479px) {
	.introduce-container {
		margin-top: 20px;
	}
	.introduce-content {
		padding-top: 20px;
		display: flex;
		flex-direction: column;
	}
	.maintitle p {
		font-size: 1em;
		font-weight: bold;
		padding: 20px 10px;
	}
	.introduce-title {
		display: flex;
		padding-left: 20px;
		font-size: 2em;
	}
	.introduce-maintext {
		padding-left: 20px;
		font-size: 1em;
		color: #000;
	}
	.subtitle p {
		font-size: 0.4em;
		font-weight: 600;
		line-height:
	}
	.introduce-subtext {
		text-align: end;
		padding-bottom: 8px;
		font-size: 0.8em;
		font-weight: bold;
		border-bottom: 3px solid #070a3c;
		line-height: 1.5;
	}
	.introduce-subtext2 {
		text-align: right;
	}
	.introduce-subtext2 span {
		font-weight: bold;
		font-size: 0.6em;
		line-height: 2;
		color: #363877;
	}
	.swiper-titlebox {
		flex-direction: column;
		display: flex;
		justify-content: center;
		margin-top: 80px;
		align-items: center;
		line-height: 0.5;
		font-size: 1em;
	}
	.swiper-container, .swiper-wrapper, .swiper-slide {
		width: 100% !important;
	}
	.manual {
		padding: 0;
		margin: 0 auto;
		text-align: center;
	}
	.manual_box {
		width: 100%;
		position: relative;
		display: flex;
		flex-direction: column;
		background-color: white;
		margin-top: 40px;
		box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
		padding: 0;
	}
	.manual_bigbox {
		display: flex;
		flex-direction: column;
		justify-content: space-around;
		height: auto;
		align-items: center;
	}
	.manual_box_p {
		font-size: 0.8em;
		font-weight: bold;
		line-height: 2;
	}
	.staff_box {
		display: flex;
		flex-wrap: wrap;
		justify-content: space-between;
	}
	.staff-profile {
		width: 48%; /* 두 개씩 나열되도록 박스 너비 조정 */
		max-width: 48%;
		margin-bottom: 20px; /* 아래쪽 여백 추가 */
	}
	.staff-profile p:nth-of-type(1) {
		font-size: 0.8em;
	}
	.staff-profile p {
		margin: 10px 0;
		font-size: 0.6em;
	}
	.staff {
		background-color: white;
		margin: 0 auto;
		padding: 10px;
		text-align: center;
	}
	.text-overlay {
		position: absolute;
		bottom: 0;
		left: 0;
		width: 100%;
		height: 50%;
		max-width: 100%;
		display: flex;
		background: rgba(0, 0, 0, 0.5);
		background: linear-gradient(0deg, rgba(0, 0, 0, 0.9) 0%, rgba(103, 103, 103, 0.8) 72%, rgba(255, 255, 255, 0) 100%);
		opacity: 0;
		transition: opacity 0.3s ease;
		line-height: 2;
	}
	.swiper-slide:hover .text-overlay {
		opacity: 1;
	}
	.text-overlay p {
		position: absolute;
		bottom: 10%;
		color: white;
		font-size: 1em;
		padding: 10px;
		margin-top: 20px;
	}
	.text-overlay span {
		color: orange;
		font-size: 1em;
		margin-bottom: 20px;
	}
	.swiper-button-next {
     	background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M27%2C22L27%2C22L5%2C44l-2.1-2.1L22.8%2C22L2.9%2C2.1L5%2C0L27%2C22L27%2C22z'%20fill%3D'%23070A3C'%2F%3E%3C%2Fsvg%3E");
    	opacity: 0.5;
    }
    
   	.swiper-button-prev {
   		background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M0%2C22L22%2C0l2.1%2C2.1L4.2%2C22l19.9%2C19.9L22%2C44L0%2C22L0%2C22L0%2C22z'%20fill%3D'%23070A3C'%2F%3E%3C%2Fsvg%3E");
        opacity: 0.5;
    }
    
    .slide_item {
    	height: 250px;
    }

}
</style>
<script src="${pageContext.request.contextPath}/jquery/jquery-3.6.4.js"></script>
</head>
<body>
	<div class="body-wrapper">
		<!-- 슬라이드 -->
		<div class="slide slide_wrap">
			<!-- 슬라이드 아이템 -->
			<div class="slide_item item1"></div>
			<div class="slide_item item2"></div>
			<div class="slide_item item3"></div>
			<div class="slide_item item4"></div>
			<!-- 이전 버튼과 다음 버튼 -->
			<div class="slide_prev_button slide_button"></div>
			<div class="slide_next_button slide_button"></div>
			<!-- 페이지네이션 -->
			<ul class="slide_pagination"></ul>
			<!-- 예약하기 버튼 -->
			<div class="booking_button" onclick="location.href='roomListAction.mc';">예약하기</div>
		</div>

		<!-- 소개 컨테이너 -->
		<div class="introduce-container">
			<div>
				<!-- 소개 타이틀 -->
				<div class="introduce-title">
					<div class="introduce-title-bar"></div>
					<span>Special Study<br> Environment
					</span>
				</div>

				<div class="introduce-content">
					<div class="introduce-text">
						<div class="introduce-maintext">
							<span>특별한 학습 환경을 제공해드립니다.</span>
						</div>

						<div class="introduce-subtext">
							<span>STUDY / MEET / CO-Work <br>총 4개 단독룸으로 구성된 프리미엄
								모임공간
							</span>
						</div>
						<div class="introduce-subtext2">
							<span>홀 내부를 보다 넓게 구성하고 특별제작 된 넓은 책상을 제공함으로써<br> 이용자의
								학습공간이 여유롭습니다.
							</span>
						</div>
					</div>
					<div class="introduce-img">
						<img class="introduce-img-height" src="${pageContext.request.contextPath}/roompic/bigdesk2.jpg">
					</div>
				</div>
			</div>
		</div>

		<!-- 클래스명은 변경하면 안 됨 -->
		<div class="swiper-titlebox">
			<div class="minititle">
				<p>ANYONE CAN USE !</p>
			</div>
			<div class="maintitle">
				<p>언제나 사용하실 수 있는, 편의 시설</p>
			</div>
			<div class="subtitle">
				<%
				String ptxt = "MocaDream을 이용하시는 고객이라면 누구나! 언제든지! 사용해주세요";
				%>
				<p style="text-align: center;"><%=ptxt.substring(0, 23)%><br>
					<br><%=ptxt.substring(23)%></p>
			</div>
		</div>

		<div class="swiper-container">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<div class="swiper-slide-content">
						<div class="image-wrapper">
							<img src="${pageContext.request.contextPath}/roompic/cafe.jpeg">
							<div class="text-overlay">
								<p>
									<span>카페테리아</span> <br> 아메리카노와 에스프레스 제조가 가능한 커피머신 <br>
									시원한 음료를 제공하기 위한 냉장고

								</p>
							</div>
						</div>
					</div>
				</div>

				<div class="swiper-slide">
					<div class="swiper-slide-content">
						<div class="image-wrapper">
							<img src="${pageContext.request.contextPath}/roompic/lounge.jpg">
							<div class="text-overlay">
								<p>
									<span>라운지</span><br> 혼자만의 시간을 가지고 싶을때,<br> 지인을 기다릴때를
									위한 공간
								</p>
							</div>
						</div>
					</div>
				</div>

				<div class="swiper-slide">
					<div class="swiper-slide-content">
						<div class="image-wrapper">
							<img src="${pageContext.request.contextPath}/roompic/smartlocker.jpg">
							<div class="text-overlay">
								<p>
									<span>스마트 락커</span><br> <br> 귀중품을 잊어버리지 않도록 스마트 락커로
									보관하세요.
								</p>
							</div>
						</div>
					</div>
				</div>

				<div class="swiper-slide">
					<div class="swiper-slide-content">
						<div class="image-wrapper">
							<img src="${pageContext.request.contextPath}/roompic/print.png">
							<div class="text-overlay">
								<p>
									<span>프린트 서비스</span><br> <br>학습자료 프린트를 편하게 하시라고 프린트와
									PC를 구비해두었습니다.
								</p>
							</div>
						</div>
					</div>
				</div>

				<div class="swiper-slide">
					<div class="swiper-slide-content">
						<div class="image-wrapper">
							<img src="${pageContext.request.contextPath}/roompic/computers.jpg">
							<div class="text-overlay">
								<p>
									<span>다용도 PC배치</span><br> <br>PC사용이 필요한 이용자들을 위하여 PC를
									구비해두었습니다.
								</p>
							</div>
						</div>
					</div>
				</div>

			</div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
		</div>




		<div class="manual">

			<div class="maintitle">
				<p>이용 방법</p>
			</div>

			<div class="manual_bigbox">
				<div class="manual_box">
					<img
						src="${pageContext.request.contextPath}/manualpic/clock_black.png">
					<div class="manual_box_p">
						<p>이용시간</p>
						<p>AM 09:00 ~ PM 09:00</p>
						<p>연중무휴</p>
						<p></p>
					</div>
				</div>


				<div class="manual_box">
					<img
						src="${pageContext.request.contextPath}/manualpic/chair_black2.png">
					<div class="manual_box_p">
						<p>넉넉한 공간</p>
						<p>900~1,000mm 의 폭넓은 책상</p>
						<p>최대 12인실까지 구비된 스터디룸</p>
						<p></p>
					</div>
				</div>


				<div class="manual_box">
					<img
						src="${pageContext.request.contextPath}/manualpic/caution_notice.png">
					<div class="manual_box_p">
						<p>주의사항</p>
						<p>함께 사용하는 공간이에요! 정숙!</p>
						<p>타인의 소지품을 손대면 안돼요!</p>
						<p>전 구역 CCTV 작동중</p>
					</div>
				</div>
			</div>
			<div class="vertical-bar"></div>
		</div>


		<div class="staff">

			<div class="maintitle">
				<p>STAFF</p>
			</div>

			<div class="staff_box">
				<div class="staff-profile">
					<img
						src="${pageContext.request.contextPath}/profilepic/dongjun.png">
					<p>Team Leader</p>
					<p>김동준</p>
				</div>


				<div class="staff-profile">
					<img src="${pageContext.request.contextPath}/profilepic/yurim.png">
					<p>Sub Leader</p>
					<p>변유림</p>
				</div>

				<div class="staff-profile">
					<img
						src="${pageContext.request.contextPath}/profilepic/hwanseok.png">
					<p>Team Member</p>
					<p>이환석</p>
				</div>


				<div class="staff-profile">
					<img
						src="${pageContext.request.contextPath}/profilepic/hakyung.png">
					<p>Team Member</p>
					<p>정하경</p>
				</div>

			</div>

			<div class="staff_box">
				<div class="staff-profile">
					<img
						src="${pageContext.request.contextPath}/profilepic/dongwook.png">
					<p>Team Member</p>
					<p>김동욱</p>
				</div>


				<div class="staff-profile">
					<img src="${pageContext.request.contextPath}/profilepic/yisak.png">
					<p>Team Member</p>
					<p>방이삭</p>
				</div>

				<div class="staff-profile">
					<img
						src="${pageContext.request.contextPath}/profilepic/donghyeon.png">
					<p>Team Member</p>
					<p>제동현</p>
				</div>
			</div>
		</div>

	</div>

	<script src="${pageContext.request.contextPath}/slide.js"></script>
	<script src="${pageContext.request.contextPath}/slide2.js"></script>
</body>
</html>