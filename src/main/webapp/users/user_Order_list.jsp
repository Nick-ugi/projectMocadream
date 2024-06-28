<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="vo.Mc_order"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
response.setHeader("Pragma","no-cache");
response.setHeader("Expires","0");
response.setHeader("Cache-Control","no-store, no-cache, must-revalidate");
%>
<%
Mc_order mc_order = (Mc_order) request.getAttribute("mc_order");
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MOCA DREAM 현재 예약 확인</title>
<style>

.d1 {
	overflow:hidden;
}

table {
    margin: 60px auto;

}

td {
	border: 1px solid #dee2e6;
}

/* 모바일 가로 & 테블릿 세로 (해상도 480px ~ 767px)*/
@media all and (min-width:480px) and (max-width:600px) {
div.body-wrapper {
    width: 100%; 
 
}
}


@media all and (max-width:479px) {
	div.body-wrapper {
	    width: 100%!important;
	}
		section.small {
	    width: 100%;
	    margin: 0 auto;
	}
}

</style>
</head>
<body>
<div class="body-wrapper">
	<div class="d1">
		<section id="ListArea" class="small">
			<table>
				<tr>
					<td class="td1">방 번호</td>
					<td><%=mc_order.getR_no()%>번</td>
				</tr>
				<tr>
					<td class="td1">방 이름</td>
					<td><%=mc_order.getR_name()%></td>
				</tr>
				<tr>
					<td class="td1">예약자 ID</td>
					<td><%=mc_order.getR_uname()%></td>
				</tr>
				<%
				SimpleDateFormat ddd = new SimpleDateFormat("yyyy-MM-dd");
				String orderD = ddd.format(mc_order.getR_cal());
				%>
				<tr>
					<td class="td1">예약 일자</td>
					<td><%=orderD%></td>
				</tr>
				<tr>
					<td class="td1">예약 시간</td>
					<td><%=mc_order.getR_time()%>시간</td>
				</tr>
				<tr>
					<td class="td1">시작 시간</td>
					<% if (mc_order.getR_statime() == 9) { 
						String statime = "09"; %>
						<td><%=statime %>:00</td>
					<% } else { %>
						<td><%=mc_order.getR_statime()%>:00</td>
					<% } %>
				</tr>
				<tr>
					<td class="td1">종료 시간</td>
					<td><%=mc_order.getR_endtime()%>:00</td>
				</tr>
			</table>
		</section>
		<br>
		<br> 
	</div>
</div>
</body>
</html>