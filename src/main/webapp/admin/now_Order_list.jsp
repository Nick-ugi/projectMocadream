<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.Mc_order" %>
<%@ page import="vo.PageInfo" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setHeader("Pragma","no-cache");
response.setHeader("Expires","0");
response.setHeader("Cache-Control","no-store, no-cache, must-revalidate");
%>
<%
	ArrayList<Mc_order> nowOrderList = (ArrayList<Mc_order>) request.getAttribute("nowOrderList");
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
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
	padding-right: 3%;
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
</style>
</head>
<body>
<%@ include file="/common/cookies.jsp" %>
<div class="body-wrapper">
	<section class="title">실시간 예약 리스트</section>
	<br><br><br>
	<section id="ListArea">
	<table>
<% if (nowOrderList != null && listCount > 0) { %>
		<tr class="tr1">
			<td>예약일자</td>
			<td>방번호</td>
			<td>방이름</td>
			<td>예약자</td>
			<td>입실시간</td>
			<td>퇴실시간</td>
			<td>이용시간</td>
			<td>사용 여부</td>
			<td>취 소</td>
		</tr>
	<%for (int i = 0; i < nowOrderList.size(); i++) { %>
		<tr>
			<td><%=nowOrderList.get(i).getR_cal() %></td>
			<td><%=nowOrderList.get(i).getR_no()%></td>
			<td><%=nowOrderList.get(i).getR_name() %></td>
			<td><%=nowOrderList.get(i).getR_uname() %></td>
			<td><%=nowOrderList.get(i).getR_statime() %> : 00</td>
			<td><%=nowOrderList.get(i).getR_endtime() %> : 00</td>
			<td><%=nowOrderList.get(i).getR_time() %>시간</td>
			<td><%=nowOrderList.get(i).getR_used()%></td>
			<td>
				<% String orderD2 = "" + nowOrderList.get(i).getR_cal(); %>
				<button class="btn" onclick="location.href='orderDelete.mc?r_no=<%=nowOrderList.get(i).getR_no()%>&r_cal=<%=orderD2%>&r_statime=<%=nowOrderList.get(i).getR_statime()%>&r_uname=<%=nowOrderList.get(i).getR_uname()%>&r_used=<%=nowOrderList.get(i).getR_used()%>'">취소</button>
			</td>
		</tr>
	<%} %>
	</table>
	</section>

	<br>
	<section class="page-box">
		<%if (nowPage <= 1) { %>
			<button class="btn noactive">이전</button>
		<%} else { %>
			<button class="btn" onclick="location.href='nowcheck.mc?page=<%= nowPage-1 %>';">이전</button>
		<%} %>

		<%for (int a = startPage; a <= endPage; a++){
			if (a == nowPage) {%>
				<button class="btn active">
					<%=a%>
				</button>
			<%} else { %>
				<button class="btn" onclick="location.href='nowcheck.mc?page=<%= a %>';">
					<%=a%>
				</button>
			<%} %>
		<%} %>

		<%if (nowPage >= maxPage) { %>
			<button class="btn noactive">다음</button>
		<%} else { %>
			<button class="btn" onclick="location.href='nowcheck.mc?page=<%= nowPage + 1 %>';">다음</button>
		<%} %>
	</section>
<% } else { %>
	<section id="emptyArea">예약 된 룸이 없습니다.</section>
	<br>
<% } %>
<br>
</div>
</body>
</html>