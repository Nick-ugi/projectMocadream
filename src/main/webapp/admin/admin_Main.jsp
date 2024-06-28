<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Page</title>
<style>
    /* 전체 레이아웃 설정 */
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        overflow: hidden;
    }
	.logoutbtn {
	position:absolute;
	right:1%;
		
	}
	
	.logoutbtn a {
	color:rgba(6,10,60,0.5);
	text-decoration: none;
	font-weight:bold;
	}
    .navbar__title {
	display: flex;
	justify-content: center;
	background-color: white;
	    align-items: center;
        height: 10%;
        cursor: pointer;
	}
	
	.navbar__title>p {
		display: inline-block;
		margin: auto 20px;
		font-size: 40px;
		font-weight: bold;
		color:rgb(7, 10, 60)
	}
	
	.navbar__img {
	 	background-image: url("roompic/logo_alter.png");
		color: black;
		padding-left: 0;
		width: 80px;
		height: 60px;
		background-size: 100% 100%;
		display: inline-block;
	}
    .container {
        display: flex;
        height: 100vh; /* 뷰포트 높이에 맞추기 위해 100vh 사용 */
    }
    .admin_navbar {
    width:100%;
   
    }

    /* 왼쪽 사이드바 스타일 */
    .sidebar {
        flex: 0 0 200px; /* 왼쪽 사이드바의 너비를 200px로 고정 */
        background-color: rgb(7, 10, 60); /* 배경색 지정 */
        color: #fff!important; /* 글자색 지정 */
        padding: 20px; /* 내부 여백 지정 */
        text-align:center;
        justify-content:center;
    }

    
        .sidebar a{

        color: #fff!important; /* 글자색 지정 */
        text-decoration: none;
      
    }
    .sidebar ul {
        display:flex;
	    flex-direction:column;
	    justify-content:center;
        list-style-type: none; /* 목록 표시 스타일 없애기 */
        padding: 0;
        margin: 0;
    }
	.sidebar ul li {
	   padding: 20px 0; 
	}
	.li_bar {
	border-bottom: 1px solid #fefefe;
	
	}
    .sidebar ul li a {
        text-decoration: none; /* 링크 밑줄 제거 */
        color: #fff; /* 링크 글자색 지정 */
    }
    .sidebar ul li a:hover {
        color: #ccc; /* 마우스 호버시 글자색 변경 */
    }

    /* 오른쪽 컨텐츠 영역 스타일 */
    .content {
        flex: 1; /* 오른쪽 컨텐츠 영역이 남은 공간을 모두 차지하도록 설정 */
        /*padding: 20px;  내부 여백 지정 */
    }
    
    .iframe-container {
        height: calc(100vh - 40px); /* 오른쪽 프레임의 높이 계산 (40px는 padding 값의 합) */
    }
    .iframe-container iframe {
        width: 100%; /* iframe 너비 100% */
        height: 100%; /* iframe 높이 100% */
        border: none; /* 프레임 경계선 제거 */
    }
    
    /* 미디어 쿼리: 화면 너비가 768px 이하일 때 적용 */
    @media screen and (max-width: 768px) {
    	
    	 .navbar__title {
        height: 10%; /* 모바일 화면에서 로고 타이틀의 높이 조정 */
	    }
	    
	    .navbar__title > p {
	        font-size: 1.5em; /* 모바일 화면에서 로고 타이틀의 글자 크기 조정 */
	        
	    }
	    
	    .navbar__img {
	        width: 60px; /* 모바일 화면에서 로고 이미지의 너비 조정 */
	        height: 45px; /* 모바일 화면에서 로고 이미지의 높이 조정 */
	    }
	    	
        .admin_navbar {
            position: relative;
        }
        
        .dropdown-btn {
            background-color: rgb(7, 10, 60);
            color: #fff!important;
            padding: 20px;
            text-align: center;
            cursor: pointer;
            font-size: 18px;
            position: absolute;
            top: 0;
            right: 0;
            height:56%;
            display:flex;
            align-items:center;
        }
        
        .dropdown-content {
            display: none;
            background-color: #111;
            padding: 10px;
            color: #fff;
            position: absolute;
            top: 100%;
            right: 0;
            width: 200px; /* 드롭다운 메뉴 너비 조정 */
        }
        
        .dropdown-content a {
            display: block;
            padding: 10px 0;
            color: #fff;
            text-decoration: none;
        }
        
        .dropdown-content a:hover {
            background-color: #444;
        }
        
        .dropdown-btn.active + .dropdown-content {
            display: block;
        }
        
        .sidebar {
            display: none; /* 모바일 화면에서는 사이드바 숨김 */
        }
        
    }
    
    /* 미디어 쿼리: 화면 너비가 768px 이상일 때 적용 */
    @media screen and (min-width: 769px) {
        .dropdown-content {
            display: none; /* 화면 너비가 768px 이상이면 드롭다운 메뉴 숨김 */
        }
        
        .dropdown-btn {
            display: none; /* 화면 너비가 768px 이상이면 드롭다운 버튼 숨김 */
        }
    }
</style>
</head>
<script>
	// 페이지 로드 시 iframe에 memberListAction.mc 페이지 로드
	window.onload = function() {
	    document.getElementById('contentFrame').src='memberListAction.mc';
	    
	    // contentFrame이라는 ID를 가진 iframe의 내부 document에 접근
	    var iframeDocument = document.getElementById('contentFrame').contentDocument;
	   
	};


    // 드롭다운 버튼 클릭 시 드롭다운 메뉴 표시/숨김 함수
    function toggleDropdown() {
        var dropdownContent = document.getElementById("dropdownContent");
        dropdownContent.style.display === "block" ? dropdownContent.style.display = "none" : dropdownContent.style.display = "block";
    }
    
</script>
<body>
<%@ include file="/common/cookies.jsp" %>
	<div class="admin_navbar" >
			<div class="navbar__title" onclick="location.href='${pageContext.request.contextPath}/main.jsp';">
			<div class="navbar__img" onclick="location.href='${pageContext.request.contextPath}/main.jsp';"></div>
			<p style="font-family: 'Merriweather', serif;">MocaDream</p>
	
       		<div class="logoutbtn"><a href="logout">로그아웃</a></div>
                 
        
      </ul>   
		</div>
        <!-- 드롭다운 버튼 -->
        <div class="dropdown-btn" onclick="toggleDropdown()">메뉴</div>
        <!-- 드롭다운 메뉴 -->
        <div class="dropdown-content" id="dropdownContent">
            <a href="memberListAction.mc" target="contentFrame">회원리스트 조회</a>
            <a href="nowcheck.mc" target="contentFrame">실시간 예약 리스트</a>
            <a href="dayOrderList.mc" target="contentFrame">예약내역 조회</a>
            <a href="mocaList.mc" target="contentFrame">방 관리</a>
            <a href="boardList.mc" target="contentFrame">공지 관리</a>
        </div>
	
	</div>
    <div class="container">
        <!-- 왼쪽 사이드바 영역 -->
        <div class="sidebar">
            <ul>
                <!-- 필요한 만큼 메뉴 항목 추가 -->
                <a href="memberListAction.mc" target="contentFrame"><li>회원리스트 조회</li></a>
                <div class="li_bar"></div>
                <a href="nowcheck.mc" target="contentFrame"><li>실시간 예약 리스트</li></a>
                <div class="li_bar"></div>
                <a href="dayOrderList.mc" target="contentFrame"><li>예약내역 조회</li></a>
                <div class="li_bar"></div>
                <a href="mocaList.mc" target="contentFrame"><li>방 관리</li></a>
                <div class="li_bar"></div>
                <a href="boardList.mc" target="contentFrame"><li>공지 관리</li></a>
            </ul>
        </div>
        
        <!-- 오른쪽 컨텐츠 영역 -->
        <div class="content">
            <div class="iframe-container">
                <iframe id="contentFrame" name="contentFrame" frameborder="0"></iframe>
            </div>
        </div>
    </div>
</body>
</html>
