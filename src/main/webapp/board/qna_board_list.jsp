<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="vo.PageInfo"%>
<%@ page import="vo.Mc_notice"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
Mc_notice article = (Mc_notice) request.getAttribute("article");
%>
<%
ArrayList<Mc_notice> articleList = (ArrayList<Mc_notice>) request.getAttribute("articleList");
PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
int listCount = pageInfo.getListCount();
int nowPage = pageInfo.getPage();
int maxPage = pageInfo.getMaxPage();
int startPage = pageInfo.getStartPage();
int endPage = pageInfo.getEndPage();
String search = (String) request.getAttribute("search");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="./css/default.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
<style>
div.space{
	display:none;
}
.notice{
	margin: 0px 0px 20px 10px;
}

@media only screen and (max-width: 767px) {  
	div.space{
		display:block;
	}
	.page-box {
		text-align: center;
	}
}

@media only screen and (max-width: 600px) {
	nav {
		text-align: center;
	}
	table {
		font-size: 14px; 
 	} 
 	div.body-wrapper {
    	width: 100%;
	}
	.page-box {
		text-align: center;
	}
}


@media only screen and (max-width: 479px) {
	.search-input{
   		width:200px;
   		margin:3px;
	}

	.notice{
   		text-align:center;
	}
	div.body-wrapper {
    	width: 100%;
	}
	.page-box {
		text-align: center;
		width: 100%;
	}
}

td#td1 {
	width: 15%;
}
td#td2 {
	width: 45%;
}
td#td3 {
	width: 20%;
}
td#td4 {
	width: 20%;
}


input.search-input {
	height: 25px;
}
</style>
<script>
	window.addEventListener('load', function() {
		var container = document.getElementsByClassName('ellipsis');
		for (let i = 0; i < container.length; i++) {
			let tdTitle = container[i];
			if (tdTitle.textContent.length > 10) {
				tdTitle.innerText = tdTitle.textContent.substr(0, 10) + "...";
			}
		}
	});
</script>
</head>
<body>
	<div class="body-wrapper">
		<section class="title">공지 글 목록</section>
		<div class="right">
			<form action="boardList.mc">
				<input class="search-input" name="search" type="text" id="search" placeholder=" 제목을 입력해주세요">
				<div class="space"><br></div>
				<button class="btn" type="submit">검색</button><button onclick="location.href='boardList.mc';" class="btn" type="button">전체목록</button>&nbsp;
			</form>
		</div>
		<br><br>
		<section id="ListArea">
<%
if (articleList != null && listCount > 0) {
%>
			<table>
				<tr class="tr1">
					<td id="td1">번호</td>
					<td id="td2">제목</td>
					<td id="td3">작성자</td>
					<td id="td4">날짜</td>
				</tr>
				<%
				for (int i = 0; i < articleList.size(); i++) {
				%>
				<tr onclick="location.href='boardDetail.mc?nt_no=<%=articleList.get(i).getNt_no()%>&page=<%=nowPage%>'" style="cursor: pointer">
					<td><%=articleList.get(i).getNt_no()%></td>
					<td class="ellipsis"><%=articleList.get(i).getNt_title()%></td>
					<td><%=articleList.get(i).getNt_writer()%></td>
					<td><%=articleList.get(i).getNt_date()%></td>
				</tr>
				<%
				}
				%>
			</table>
		</section>
		
		<br>
		<section class="page-box">
			<%
			if (search != null) {
				if (nowPage <= 1) {
				%>
				<button class="btn noactive">이전</button>
				<%
				} else {
				%>
				<button class="btn" onclick="location.href = 'boardList.mc?page=<%=nowPage - 1%>&search=<%=search%>';">이전</button>
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
				<button class="btn" onclick="location.href = 'boardList.mc?page=<%=a%>&search=<%=search%>';">
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
				<button class="btn" onclick="location.href = 'boardList.mc?page=<%=nowPage + 1%>&search=<%=search%>';">다음</button>
				<%
				}
			} else {
				%>
				<%
				if (nowPage <= 1) {
				%>
				<button class="btn noactive">이전</button>
				<%
				} else {
				%>
				<button class='btn' onclick="location.href='boardList.mc?page=<%=nowPage - 1%>';">이전</button>
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
				<button class="btn" onclick="location.href='boardList.mc?page=<%=a%>';"><%=a%>
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
				<button class="btn" onclick="location.href='boardList.mc?page=<%=nowPage + 1%>';">다음</button>
				<%
				}
			}
			%>
			<%
			} else if (!(request.getParameter("search") == null) && request.getParameter("search").equals("nt_title")) {
			%>
			<%
			for (int i = 0; i < articleList.size(); i++) {
			%>
			<table>
				<tr onclick="location.href='boardDetail.mc?nt_no=<%=articleList.get(i).getNt_no()%>&page=<%=nowPage%>'" style="cursor: pointer">
					<td><%=articleList.get(i).getNt_no()%></td>
					<td id="td"><%=articleList.get(i).getNt_title()%></td>
					<td><%=articleList.get(i).getNt_writer()%></td>
					<td><%=articleList.get(i).getNt_date()%></td>
				</tr>
			</table>
			<%
			}
			%>
			<%
			} else {
			%>
			<section id="emptyArea">등록된 글이 없습니다.</section>
			<br><br>
			<%
			}
			%>
		</section>
		<br>
	</div>
</body>
</html>
