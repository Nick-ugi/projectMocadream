<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.Mc_order" %>
<%@ page import="vo.PageInfo" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
ArrayList<Mc_order> dayOrderList = (ArrayList<Mc_order>) request.getAttribute("dayOrderList");
PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
String rcal = (String) request.getAttribute("r_cal");
int listCount=pageInfo.getListCount();
int nowPage=pageInfo.getPage();
int maxPage=pageInfo.getMaxPage();
int startPage=pageInfo.getStartPage();
int endPage=pageInfo.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style>
div.body-wrapper {
	width: 100%;
}

/* PC , 테블릿 (해상도 768px ~ 1023px)*/
@media all and (max-width:1023px) {
	td:nth-child(3), td:nth-child(7) {
		display: none;
	}
}

/* 모바일 가로, 테블릿 세로 (해상도 480px ~ 767px)*/
@media all and (max-width:767px) {
	td:nth-child(6), td:nth-child(8) {
		display: none;
	}
}

/* 모바일 가로, 테블릿 세로 (해상도 ~ 479px)*/
@media all and (max-width:479px) {
	td:nth-child(1) {
		display: none;
	}
}
</style>
</head>
<body>
<%@ include file="/common/cookies.jsp" %>
<div class="body-wrapper">
	<section class="title">예약내역 조회</section>
	<br>
	<div class="right">
		<form action="dayOrderList.mc" method="get">
			<input type="date" name="r_cal">
			<button class="btn" type="submit">조회</button>&nbsp;
		</form>
	</div>
	<br>
<% if (rcal == null) { %>
		<br>
		<section id="emptyArea">검색하실 날짜를 선택해 주세요.</section>
		<br><br><br>
<% } else { %>
	
		<section id="ListArea">
			<table>
	<% if (dayOrderList != null && listCount > 0) { %>
				<tr class="tr1">
					<td>예약일자</td>
					<td>방번호</td>
					<td>방이름</td>
					<td>예약자</td>
					<td>입실시간</td>
					<td>퇴실시간</td>
					<td>이용시간</td>
					<td>사용 여부</td>
					<td>입 실</td>
					<td>미사용</td>
					<td>취 소</td>
				</tr>
		<%for (int i = 0; i < dayOrderList.size(); i++) { %>
				<tr>
					<td><%=dayOrderList.get(i).getR_cal() %></td>
					<td><%=dayOrderList.get(i).getR_no()%></td>
					<td><%=dayOrderList.get(i).getR_name() %></td>
					<td><%=dayOrderList.get(i).getR_uname() %></td>
					<td><%=dayOrderList.get(i).getR_statime() %> : 00</td>
					<td><%=dayOrderList.get(i).getR_endtime() %> : 00</td>
					<td><%=dayOrderList.get(i).getR_time() %>시간</td>
					<td><%=dayOrderList.get(i).getR_used()%></td>

					<td>
						<button class="btn release" onclick="location.href='OrderUsedT.mc?r_cal=<%=dayOrderList.get(i).getR_cal()%>&r_no=<%=dayOrderList.get(i).getR_no()%>&r_statime=<%=dayOrderList.get(i).getR_statime()%>&r_used=<%=dayOrderList.get(i).getR_used()%>&r_uname=<%=dayOrderList.get(i).getR_uname()%>';">입 실</button>
					</td>
					<td>
						<button class="btn warning" onclick="location.href='OrderUsedF.mc?r_cal=<%=dayOrderList.get(i).getR_cal()%>&r_no=<%=dayOrderList.get(i).getR_no()%>&r_statime=<%=dayOrderList.get(i).getR_statime()%>&r_used=<%=dayOrderList.get(i).getR_used()%>&r_uname=<%=dayOrderList.get(i).getR_uname()%>';">미사용</button>
					</td>
					
					<%
					SimpleDateFormat ddd = new SimpleDateFormat("yyyy-MM-ddHH");
					Date now = new Date();
					String now1 = ddd.format(now);
					String orderD = "";
					
					if (dayOrderList.get(i).getR_statime() == 9) {
						orderD = "" + dayOrderList.get(i).getR_cal() + "0" + dayOrderList.get(i).getR_statime();
					} else {
						orderD = "" + dayOrderList.get(i).getR_cal() + dayOrderList.get(i).getR_statime();
					}
					
					orderD = orderD.replaceAll("-", "");
					now1 = now1.replaceAll("-", "");
					
					if (Integer.parseInt(now1) < Integer.parseInt(orderD)) {
						String orderD2 = "" + dayOrderList.get(i).getR_cal(); %>
						<td>
							<button class="btn warning" onclick="location.href='orderDelete.mc?r_uname=<%=dayOrderList.get(i).getR_uname()%>&r_no=<%=dayOrderList.get(i).getR_no()%>&r_cal=<%=orderD2%>&r_statime=<%=dayOrderList.get(i).getR_statime()%>&r_used=<%=dayOrderList.get(i).getR_used()%>';">취소</button>
						</td>
					<% } %>
					
				</tr>
		<%} %>
			</table>
		</section>
	
		<br>
		<section class="page-box">
			<%if (nowPage <= 1) { %>
				<button class="btn noactive">이전</button>
			<%} else { %>
				<button class="btn" onclick="location.href='dayOrderList.mc?page=<%= nowPage-1 %>&r_cal=<%=rcal %>';">이전</button>
			<%} %>
	
			<%for (int a = startPage; a <= endPage; a++){
					if (a == nowPage) {%>
						<button class="btn active">
							<%=a%>
						</button>
					<%} else { %>
						<button class="btn" onclick="location.href='dayOrderList.mc?page=<%= a %>&r_cal=<%=rcal %>';">
							<%=a%>
						</button>
					<%} %>
			<%} %>
	
			<%if (nowPage >= maxPage) { %>
				<button class="btn noactive">다음</button>
			<%} else { %>
				<button class="btn" onclick="location.href='dayOrderList.mc?page=<%= nowPage + 1 %>&r_cal=<%=rcal %>';">다음</button>
			<%} %>
		</section>
	<% } else { %>
		<br>
		<section id="emptyArea">예약 된 룸이 없습니다.</section>
		<br><br><br>
	<% } %>
<% } %>
<br>
</div>
</body>
</html>