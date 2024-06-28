<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="vo.PageInfo"%>
<%@ page import="vo.Mc_order"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setHeader("Pragma","no-cache");
response.setHeader("Expires","0");
response.setHeader("Cache-Control","no-store, no-cache, must-revalidate");
%>
<%
ArrayList<Mc_order> mc_OrderList = (ArrayList<Mc_order>) request.getAttribute("mc_OrderList");
PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
int listCount = pageInfo.getListCount();
int nowPage = pageInfo.getPage();
int maxPage = pageInfo.getMaxPage();
int startPage = pageInfo.getStartPage();
int endPage = pageInfo.getEndPage();
String userId = (String) request.getAttribute("userId");
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MOCA DREAM 나의 예약 리스트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<style>
/* PC , 테블릿 (해상도 768px ~ 1023px)*/
@media all and (max-width:1023px) {
	td:nth-child(4), td:nth-child(7) {
		display: none;
	}
}

/* 모바일 가로, 테블릿 세로 (해상도 480px ~ 767px)*/
@media all and (max-width:767px) {
	td:nth-child(3), td:nth-child(5) {
		display: none;
	}
}

/* 모바일 가로, 테블릿 세로 (해상도 ~ 479px)*/
@media all and (max-width:479px) {
	td:nth-child(8) {
		display: none;
	}
}
</style>
</head>
<body>
<div class="body-wrapper">
	<section class="title">예약 내역</section>
	<div class="right">
			<% if (!session.getAttribute("id").equals("admin")) { %>
			<button class="btn" onclick="location.href='roomListAction.mc';">예약하기</button>
			<% } %>
	</div>
	<br>
<% if (mc_OrderList != null && listCount > 0) { %>
	<form method="post">
		<section id="ListArea">
			<table>
				<tr class="tr1">
					<td>날짜</td>
					<td>방 번호</td>
					<td>방 이름</td>
					<td>예약자명</td>
					<td>이용 시간</td>
					<td>예약 시간</td>
					<td>종료 시간</td>
					<td>사용 여부</td>
					<td>취 소</td>
				</tr>

				<%
				for (int i = 0; i < mc_OrderList.size(); i++) {
					request.setAttribute("myorder", mc_OrderList.get(i));
				%>
				<tr>
					<td><%=mc_OrderList.get(i).getR_cal()%></td>
					<td><%=mc_OrderList.get(i).getR_no()%></td>
					<td><%=mc_OrderList.get(i).getR_name()%></td>
					<td><%=mc_OrderList.get(i).getR_uname()%></td>
					<td><%=mc_OrderList.get(i).getR_time()%>시간</td>
					<% if (mc_OrderList.get(i).getR_statime() == 9) { 
						String statime = "09"; %>
						<td><%=statime %>:00</td>
					<% } else { %>
						<td><%=mc_OrderList.get(i).getR_statime()%>:00</td>
					<% } %>
					<td><%=mc_OrderList.get(i).getR_endtime()%>:00</td>
					<td><%=mc_OrderList.get(i).getR_used()%></td>
					
					<%
					SimpleDateFormat ddd = new SimpleDateFormat("yyyy-MM-ddHH");
					Date now = new Date();
					String now1 = ddd.format(now);
					String orderD = "";
					
					if (mc_OrderList.get(i).getR_statime() == 9) {
						orderD = "" + mc_OrderList.get(i).getR_cal() + "0" + mc_OrderList.get(i).getR_statime();
					} else {
						orderD = "" + mc_OrderList.get(i).getR_cal() + mc_OrderList.get(i).getR_statime();
					}
					
					orderD = orderD.replaceAll("-", "");
					now1 = now1.replaceAll("-", "");
					
					if (Integer.parseInt(now1) < Integer.parseInt(orderD)) {
						String orderD2 = "" + mc_OrderList.get(i).getR_cal(); %>
						<td>
							<button class="btn" onclick="location.href='orderDelete.mc?r_uname=<%=mc_OrderList.get(i).getR_uname()%>&r_no=<%=mc_OrderList.get(i).getR_no()%>&r_cal=<%=orderD2%>&r_statime=<%=mc_OrderList.get(i).getR_statime()%>&r_used=<%=mc_OrderList.get(i).getR_used()%>';">취소</button>
						</td>
					<% } %>
				</tr>
				<% } %>
			</table>
		</section>
	</form>
	<br>
		<section class="page-box">
			<% if (nowPage <= 1) { %>
				<button class="btn noactive">이전</button>
			<% } else { %>
				<button class="btn" onclick="location.href='myOrderList.mc?page=<%=nowPage - 1%>&id=<%=userId%>';">이전</button>
			<% } %>

			<% for (int a = startPage; a <= endPage; a++) {
				if (a == nowPage) { %>
					<button class="btn active">
						<%=a%>
					</button>
				<% } else { %>
					<button class="btn" onclick="location.href='myOrderList.mc?page=<%=a%>&id=<%=userId%>';">
						<%=a%>
					</button>
				<% } %>
			<% } %>

			<% if (nowPage >= maxPage) { %>
				<button class="btn noactive">다음</button>
			<% } else { %>
				<button class="btn" onclick="location.href='myOrderList.mc?page=<%=nowPage + 1%>&id=<%=userId%>';">다음</button>
			<% } %>
		</section>
<% } else { %>
<br>
<section id="emptyArea">예약 내역이 없습니다.</section>
<br><br>
<% } %>
<br>
</div>
</body>
</html>