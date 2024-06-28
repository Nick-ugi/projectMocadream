<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.Mc_rooms"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
	ArrayList<Mc_rooms> roomList=(ArrayList<Mc_rooms>)request.getAttribute("roomList");
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
%>
<%
	Mc_rooms room = (Mc_rooms)request.getAttribute("room");
%>


<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="./css/default.css">
<link rel="stylesheet" href="./css/table.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>모임공간 리스트</title>
<script src="${pageContext.request.contextPath }/jquery/jquery-3.6.4.js"></script>
<style type="text/css">

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

.facility {
    margin-bottom: 30px;
}

.facility h2 {
    font-size: 25px;
    color: #333;
    margin-bottom: 10px;
}

.facility-details {
/*     background-color: #dee2e6; */
/*     padding: 20px; */
/*     border-radius: 8px; */
/*     box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); */
	width: 30%;
	margin-left: 30px;
    border-bottom: 1px solid #dee2e6;
    padding-top: 1%;
}

.image-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center; 
    margin: 0 auto; 
}

.image-box {
    width: calc(27%);
    margin: 20px;
    position: relative;
}

.image-text {
    padding: 15px;
    color: white;
    bottom: 0;
    left: 0;
    margin: 15px;
    margin: 0 auto;
    color: rgb(7 10 60);
}

.image {
    width: 100%;
    height: 300px; 
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); 
	background-size: cover;
}
   	



.room h2 {
    font-size: 21px;
    color: black;
    margin: 0;
    padding-top: 10px;
}
.room small {
	font-size: 14px;
	color: gray;
}

.room p {
    font-size: 17px;
    color: black;
    margin: 10px 0;
}

/* 호버 효과 */
/* .room:hover { */
/*     background-color: rgb(222 211 200); */
/*     box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); */
/* } */
/* .image-box:hover { */
/*     background-color: rgb(222 211 200); */
/*     box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.5); */
/* } */

section.title {
	font-size: 25px;
}
div.room-list {
	margin-top: 20px;
}
section {
	padding-top: 3%;
}



.room {
   	width: 100%;
   	height: 100%;
   	margin: 0 auto;
/*     display: flex; /* 안에 내용들 일자정령 */ */
    margin-bottom: 20px;
    padding: 10px; 
    background-color: white;
    border-radius: 8px;
    border: 1px solid #dee2e6;
/*     box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1); /* 있어보이게 그림자 */ */
}
.room-back {
	padding: 2%;
	background-color: white;
	width: 100%;
	height: 100%;
}

/* 이미지 스타일 */
.room-image {
    height: 300px; 
    width: 300px;
    background-size: cover;
    background-position: center;
    margin-right: 20px;
    float: left;
}
/* 텍스트 스타일링 */
.room-info {
    float: left;
}
* {
	box-sizing: border-box;
}
.content {
	width: 100%;
	margin: 0 auto;
}

.room {
	display : flex;
 	align-items : center;
}
.room-name {
	padding-bottom: 10px;
}

</style>
<script>

window.onload = function(){
	refnc();
	
	window.addEventListener('resize', function(){
		refnc();
	});
};

function refnc(){
		let rw = $(".room").width() ;
		if(rw >= 600){
			$(".room").css("align-items", "center");
		}else{
			$(".room").css("align-items", "flex-start");
		}
		
		let rb = document.getElementsByClassName("room");
		let rbImg = document.querySelectorAll(".room div.room-image");
		let rtp = rb[1].getBoundingClientRect().top ;
		let rmtp = rbImg[1].getBoundingClientRect().top;
		$(".room").css("padding-left",rmtp - rtp+"px");
		console.log('rmtp값: ', rmtp+"px");
		console.log('rtp값: ', rtp+"px");
		console.log('paddingLeft값: ', rmtp - rtp+"px");
		
		let rl = (rmtp - rtp)*2;
		let rmw;
		let rtxw;
// 		console.log('rmw: ', rtxw);
		
		if(rw >= 600){
			$(".room div.room-image").width("300px");
			rmw = $(".room div.room-image").width();
			rtxw = rw - rl - rmw - 25;
			$(".room-info").width(rtxw);
		}
		else{
			$(".room-info").width("100%");
			rmw = $(".room div.room-image").width();
			rtxw = rw - rl - rmw - 25;
			$(".room div.room-image").width("100%");
		}
}
</script>
</head>
<body>
<div class="body-wrapper">


    <div class="facility">
        <section class="title">모임공간 리스트</section>
        <div class="facility-details">

        </div>
    </div>
    <div id="content" class='content'>
        <!-- 모임공간 리스트의 제목 -->
        <style>
        @media (max-width : 745px){
        	.room-list {
        	grid-template-columns : 100%!important;
        	grid-template-rows: auto!important;
        	}
        	
        	div.image-box {
        		width: 300px;
        		height: 70%;
        	}
        }
        </style>
        <!-- 모임공간 리스트 -->
        <div class="room-list" style="display: grid; grid-template-columns: 50% 50%; grid-template-rows: 50% 50%;  place-items: center; place-content: center;">
            <!-- 방들 for문으로 가져오기 -->
            <% if(roomList != null && listCount > 0){ %>
                <% for(int i=0; i<roomList.size(); i++){ %>
                <div class="room-back" style="width: 100%; height: 100%">
                    <div class="room" style="width: 100%; height:100%;">
                    <div class="roomMiddleDiv" style="width:100%;">
                        <!-- 모임공간 이미지 -->
                        <div class="room-image" style="background-image: url('./roomUpload/<%=roomList.get(i).getR_file()%>');background-size:cover; "></div>
                        <!-- 모임공간 정보 -->
                        <div class="room-info">
                            <h2 class="room-name"><%= roomList.get(i).getR_name()%></h2>
                            <small class="max"> 정원 : <%=roomList.get(i).getR_max()%>명</small>
                            <p class="room_text"><%= roomList.get(i).getR_desc()%></p>
                            <!-- 기타 모임공간 정보를 나타내는 요소 추가 -->
                        </div>
<!--                         <div style="clear:both;"></div> -->
                    </div>
                    </div>
                 </div>
                <% } %>
            <% } else { %>
                <!-- null or 방 없을때 -->
                <p>등록된 모임공간이 없습니다.</p>
            <% } %>
        </div>
    </div>
    
	<!-- 내부 기본시설(3장정도) -->
    <div class="facility">
        <section class="title">내부 기본시설(전룸 공통)</section>
        <div class="facility-details">

        </div>
    </div>
    
    <!-- 사진, 설명 -->
    <div class="image-container">
        <div class="image-box">
            <div class="image" style="background-image: url('./roompic/whiteboard.jpg');"></div>
            <div class="image-text">크고 편안한 색상의 유리 화이트 보드
(보드마카/지우개 제공)</div>
        </div>
         <!-- 사진들 3 -->
        <div class="image-box">
            <div class="image" style="background-image: url('./roompic/desk.jpg');"></div>
            <div class="image-text">넉넉한 테이블 공간을 위한
900~1,000mm 의 폭넓은 책상</div>
        </div>
		<!-- 사진들 3 -->
        <div class="image-box">
            <div class="image" style="background-image: url('./roompic/chiar.jpg');"></div>
            <div class="image-text">장시간 이용에도 불편함이 없는
최고급 가변형 등받이 메쉬의자</div>
        </div>
    </div>
    
    
    

    <!-- 뭔가 있어보이게 -->
    <div class="facility">
        <section class="title">기타시설</section>
        <div class="facility-details">
            <!-- 기타시설에 대한 설명을 추가하세요 -->
        </div>
    </div>

    <!-- ** -->
    <div class="image-container">
        <div class="image-box">
            <div class="image" style="background-image: url('./roompic/airconditioner.jpg');"></div>
            <div class="image-text">천장형 시스템 냉난방기(개별)</div>
        </div>
         <!-- sm -->
        <div class="image-box">
            <div class="image" style="background-image: url('./roompic/wifi-router.jpg');"></div>
            <div class="image-text">기가급 와이파이 (KT 광기가) 음영지대 없이
빵빵한 4채널(5G 2채널 포함) 와이파이</div>
        </div>
		<!-- sm -->
        <div class="image-box">
            <div class="image" style="background-image: url('./roompic/cctv.jpg');"></div>
            <div class="image-text">CCTV보안시설이 완비되어 있습니다</div>
        </div>
    </div>

</div>
</body>
</html>