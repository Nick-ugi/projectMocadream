<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css">
<!-- <link rel="stylesheet" href="./css/table.css"> -->

<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    * {
        box-sizing: border-box;
    }
	
    .map {
        width: 100%;
        margin: 0 auto;
        background-color: white;
        text-align: center;
    }

    .map_cont {
        margin: 50px auto;
        width: 700px; /* 수정된 너비 */
        height: 450px; /* 수정된 높이 */
        max-width: 100%;o,
    }

    table.map-table {
        text-align: left;
        padding: 50px;
        border: 1px 0 solid black;
        box-sizing: border-box;
        text-indent: initial;
        border-collapse: collapse;
        border-spacing: 0;
        width: 100%;
        margin: 20px auto;
        background-color: #ffffff; /* 테이블 배경색 */
    }
    
    tr.map-tr {
    	border-bottom: 2px solid #dee2e6;
    }


    th.map-th {
    	text-align: center;
        vertical-align: middle;
        margin: 0;
        padding: 0;
        font-family: 'Nanum Gothic', dotum, sans-serif;
        unicode-bidi: isolate;
        font-weight: 600;
        color: #222222;
        padding: 8px 0;
        width: 30%;
    }

    td.map-td {
        font-weight: 100;
        color: #666666;
        padding: 8px 0;
    }

    .sub_container .sub_cont div.sub_map div.map_cont table tr:first-child td {
        border-top: 1px solid #d3d3d3;
    }
    
    
    section.title2 {
    	border-bottom: 1 solid gray;
    	margin: 20px auto;
    	width: 30%;
    	font-size: 18px;
    	padding-bottom: 8px;
    	padding-left: 10px;
    	text-align: center;
    }
    
    .title {
       font-size: 25px;
       text-align: left;
       padding: 20px;
       width: 60%;
       margin: 0 auto;
       text-align: center;
       padding: 35px 0;
       color: #222;
    }

  @media screen and (max-width: 1150px) {
    .map {
        width: 90%;
        padding: 20px auto;
    }

    #daumRoughmapContainer1711698072462 {
        width: 100% !important;
        height: 400px !important;
    }
    div.wrap_map {
       height: 365px !important;
    }
    
    .map-table {
        max-width: 90%;
        margin: 20px auto;
    }
    section.title2 {
    	padding-bottom: 8px;
    	padding-left: 0;
    }
    th.map-th {
    	font-size: 14px;
    	padding: 0 2px;
    }
    td.map-td {
    	font-size: 14px;
    }
}
</style>



</head>
<body>
<div class="body-wrapper">
<div class="map">
<section class="title">
  	오시는길
  </section>
<div id="daumRoughmapContainer1711698072462" class="root_daum_roughmap root_daum_roughmap_landing" style="display: inline-block;"></div>
</div>
<!--
    2. 설치 스크립트
    * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
-->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
    new daum.roughmap.Lander({
        "timestamp" : "1711698072462",
        "key" : "2iqdo",
        "mapWidth" : "900",
        "mapHeight" : "700"
    }).render();
</script>
            <div class="map_cont">
                        <section class="title2" style="border-bottom: 2px solid #dee2e6;">회사정보</section>
                        <table class="map-table">
                            <tr class="map-tr">
                                <th class="map-th">회사명</th>
                                <td class="map-td">MOCA 스터디룸</td>
                            </tr>
                            <tr class="map-tr">
                                <th class="map-th">주소</th>
                                <td class="map-td">경기도 안양시 안양역근처</td>
                            </tr>
                            <tr class="map-tr">
                                <th class="map-th">대표번호</th>
                                <td class="map-td">010-1111-XXXX</td>
                            </tr>
                            <tr class="map-tr">
                                <th class="map-th">팩스번호</th>
                                <td class="map-td">014-221-156</td>
                            </tr>
                        </table>
                        <section class="title2" style="border-bottom: 2px solid #dee2e6;">교통정보</section>
                        <table class="map-table">
                            <tr class="map-tr">
                                <th class="map-th">지하철 이용시</th>
                                <td class="map-td">안양역 1번출구로 나오신 후 도보 약 16분 소요</td>
                            </tr>
                            <tr class="map-tr">
                                <th class="map-th">자가용 이용시</th>
                                <td class="map-td">자가용 이용 시 편리한 주차 시설이 마련되어 있습니다.
                                <br>주소를 네비게이션에 입력하시면 쉽게 오실 수 있습니다.</td>
                            </tr>
                        </table>
        </div>

</div>



</body>
</html>
