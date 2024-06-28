<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="vo.PageInfo"%>
<%@ page import="vo.Mc_rooms"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setHeader("Pragma","no-cache");
response.setHeader("Expires","0");
response.setHeader("Cache-Control","no-store, no-cache, must-revalidate");
%>
<%
	ArrayList<Mc_rooms> roomList = (ArrayList<Mc_rooms>) request.getAttribute("roomList");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
<link rel="stylesheet" href="./css/modal.css">
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MVC 게시판</title>
<style>
div.body-wrapper {
    width: 100%;
}

@media only screen and (max-width: 1279px) {  
}
@media only screen and (max-width: 767px) { 
	tr.tr2 {
		font-size: 15px;
	}
}
@media only screen and (max-width: 479px) {
	td:nth-child(3) {
	    display: none;
	}
	tr.tr2 {
		font-size: 14px;
	}
}
.modal {
   display: none;
   position: fixed;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   background: rgba(0,0,0,0.5);
   z-index: 9999;
   justify-content: center;
   align-items: center;
}
#ListArea {
	border-radius: 10px;
	overflow: auto;
}
#md-table {
	display: none;
}
</style>
</head>
<body>
<%@ include file="/common/cookies.jsp" %>
<div class="body-wrapper">
    <section class="title">방 목록</section><br>
	<div class="right">
	    <button class="button-link btn" onclick="window.location.href='addroom.mc'">방 추가</button><br>
	</div>
	<br>
    <section id="ListArea">
        <table>
            <% if (roomList != null && listCount > 0) { %>
                <tr class="tr1">
                    <td>방번호</td>
                    <td>방이름</td>
                    <td>이용가능인원</td>
                    <td>수정</td>
                    <td>삭제</td>
                </tr>
                <% for (int i = 0; i < roomList.size(); i++) { %>
                    <tr class="tr2">
                        <td><%=roomList.get(i).getR_no()%></td>
                        <td><%=roomList.get(i).getR_name()%></td>
                        <td><%=roomList.get(i).getR_max()%></td>
                        <td><%=roomList.get(i).getR_file()%></td>
                        <td><button class="btn" onclick="window.location.href='mocaModifyForm.mc?r_no=<%=roomList.get(i).getR_no()%>&page=<%=nowPage%>'">수정</button></td>
                        <td><button class="modal_btn" data-rno="<%=roomList.get(i).getR_no()%>" data-rfile="<%=roomList.get(i).getR_file()%>">삭제</button></td>
                    </tr>
                <% } %>
        </table>
    </section>
<% } else { %>
    <section id="emptyArea">
        등록된 방이 없습니다.
    </section>
<% } %>
<br><br><br>
<div class="modal" id="myModal">
    <div class="modal-content">
        <form action="mocaDeletePro.mc" method="POST" id="deleteForm">
            <input type="hidden" name="r_file" id="r_file">
            <fieldset style="text-align:center;">
                <table class="md-table" id="md-table">
                    <tr class="md-tr">
                        <td class="md-title md-td"><label for="id">삭제하시겠습니까?</label></td>
                    </tr>
                    <tr class="md-tr">
                        <td class="md-td" style="text-align: center;">
                            <button class="selectButton md-button" type="submit">네</button>
                            <button class="close_btn md-button" type="button">아니요</button>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </form>
    </div>
</div>
</div>

<script>
document.addEventListener("DOMContentLoaded", function() {
    const modal = document.getElementById('myModal');
    const modaltb = document.getElementById('md-table');
    const modalOpenButtons = document.querySelectorAll('.modal_btn');
    const modalCloseButton = document.querySelector('.close_btn');
    const deleteForm = document.getElementById('deleteForm');
    const rFileInput = document.getElementById('r_file');

    modalOpenButtons.forEach(button => {
        button.addEventListener('click', function() {
            const rNo = this.getAttribute('data-rno');
            const rFile = this.getAttribute('data-rfile');

            deleteForm.action = 'mocaDeletePro.mc?r_no=' + rNo;
            rFileInput.value = rFile;

            modal.style.display = 'flex';
            modaltb.style.display = 'inline';
        });
    });

    modalCloseButton.addEventListener('click', function() {
        modal.style.display = 'none';
    });
});
</script>
</body>
</html>
