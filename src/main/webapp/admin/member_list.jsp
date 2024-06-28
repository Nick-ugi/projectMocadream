<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.Mc_users, vo.PageInfo"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
%>
<%
response.setContentType("text/html;charset=UTF-8");
ArrayList<Mc_users> memberList = (ArrayList<Mc_users>) request.getAttribute("memberList");
PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
int listCount = pageInfo.getListCount();
int nowPage = pageInfo.getPage();
int maxPage = pageInfo.getMaxPage();
int startPage = pageInfo.getStartPage();
int endPage = pageInfo.getEndPage();
String search = (String) request.getAttribute("search");
%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
<meta charset="UTF-8">
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<meta>
<title>회원관리 시스템 관리자모드(회원 목록 보기)</title>
<style>
div.body-wrapper {
   width: 100%;
   padding-right: 3%;
}

@media only screen and (max-width: 1279px) {  
	 td:nth-child(2), td:nth-child(5) {
	    display: none;
	}
}

/* PC , 테블릿 (해상도 768px ~ 1023px)*/
@media all and (max-width:1023px) {
   td:nth-child(2), td:nth-child(5), td:nth-child(6) {
      display: none;
   }
}

/* 모바일 가로, 테블릿 세로 (해상도 480px ~ 767px)*/
@media all and (max-width:767px) {
   td:nth-child(7), td:nth-child(8), td:nth-child(10) {
      display: none;
   }
}

/* 모바일 가로, 테블릿 세로 (해상도 ~ 479px)*/
@media all and (max-width:479px) {
   td:nth-child(3), td:nth-child(11) {
      display: none;
   }
}
</style>
</head>
<body>
<%@ include file="/common/cookies.jsp" %>
	<div class="body-wrapper">
		<section class="title">회원 목록</section>
		<br>
		<div class="right">
			<form action="memberListAction.mc" method="POST">
				<input type="text" id="search" name="search" placeholder=" 검색어를 입력하세요">
				<button class="btn" type="submit">검색</button>&nbsp;
				<br>
			</form>
			<br>
			<small class="warning">*정지회원은 정지, 탈퇴회원은 탈퇴로 검색해주세요.*</small>
		</div>
		<br>

		<section id="ListArea">
			<%
			if (memberList != null && listCount > 0) {
			%>
			<table>
				<tr class="tr1">
					<td>아이디</td>
					<td>비밀번호</td>
					<td>이름</td>
					<td>연락처</td>
					<td>이메일</td>
					<td>주소</td>
					<td>경고횟수</td>
					<td>회원상태</td>
					<td>경고주기</td>
					<td>정지해제</td>
				</tr>
				<%
				for (int i = 0; i < memberList.size(); i++) {
					if (!memberList.get(i).getId().equals("admin")) {
				%>
				<tr>
					<td><%=memberList.get(i).getId()%></td>
					<td><%=memberList.get(i).getPw()%></td>
					<td><%=memberList.get(i).getName()%></td>
					<td><%=memberList.get(i).getTel()%></td>
					<td><%=memberList.get(i).getEmail()%></td>
					<td><%=memberList.get(i).getAddr()%></td>
					<td><%=memberList.get(i).getWar()%></td>

					<td>
						<%
						int state = memberList.get(i).getState();
						if (state == 1) {
							out.print("정상 회원");
						} else if (state == 2) {
							out.print("정지");
						} else if (state == 0) {
							out.print("탈퇴");
						} else {
							out.print("해당 없음");
						}
						%>
					</td>



					<%
					if (state == 1) {
					%>
					<td>
						<button class="btn warning" onclick="location.href='memberWarningAction.mc?id=<%=memberList.get(i).getId()%>'">경고주기</button>
					</td>
					<%
					} else {
					%>
					<td></td>
					<%
					}
					%>

					<%
					if (state == 2) {
					%>
					<td>
						<button class="btn release" onclick="location.href='memberReleaseAction.mc?id=<%=memberList.get(i).getId()%>'">정지해제</button>
					</td>
					<%
					} else {
					%>
					<td></td>
					<%
					}
					%>
				</tr>
				<%
				}

				}
				%>
			</table>
		</section>

		<br>
		<section class="page-box">
			<%
			if (nowPage <= 1) {
			%>
			<button class="btn noactive">이전</button>
			<%
			} else {
			%>
			<button class="btn" onclick="location.href = 'memberListAction.mc?page=<%=nowPage - 1%>&search=<%=search%>';">이전</button>
			<%
			}
			%>

			<%
			for (int a = startPage; a <= endPage; a++) {
				if (a == nowPage) {
			%>
			<button class="btn active">
				<%=a%>
			</button>
			<%
			} else {
			%>
			<button class="btn" onclick="location.href = 'memberListAction.mc?page=<%=a%>&search=<%=search%>';">
				<%=a%>
			</button>
			<%
			}
			%>
			<%
			}
			%>

			<%
			if (nowPage >= maxPage) {
			%>
			<button class="btn noactive">다음</button>
			<%
			} else {
			%>
			<button class="btn" onclick="location.href = 'memberListAction.mc?page=<%=nowPage + 1%>&search=<%=search%>';">다음</button>
			<%
			}
			%>

			<%
			} else {
			%>
			<section id="emptyArea">해당 회원이 없습니다.</section>
			<%
			}
			%>
		</section>
		<br>
	</div>
	<br>
	<br>
</body>
</html>