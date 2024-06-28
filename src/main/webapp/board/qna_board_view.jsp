<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="vo.Mc_notice"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
Mc_notice article = (Mc_notice)request.getAttribute("article");
Mc_notice article2 = (Mc_notice)request.getAttribute("article2");
Mc_notice article3 = (Mc_notice)request.getAttribute("article3");
%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/modal.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
<style>
@media only screen and (max-width: 479px) {
   th:nth-child(3), td:nth-child(4) {
   	display:none;
   }
   div.body-wrapper {
	font-size: 12px;
   }
   
}
h1{
	width:300px;
	margin-left:300px;
}
.mdl{
	text-align: center;
}

h2 {
	text-align: center;
}

#basicInfoArea {
	position: relative;
	height: 40px;
	text-align: center;
}	 
    
table { 
	position: relative; 
  	width: 	95%;  
	border-collapse: collapse; 
	margin: 0 auto;
	margin-top: 50px;  

} 

.tb { 
 	margin-top: 250px;   

} 
    
table th:first-child,
table td:first-child {
	border-left: 0;
}
table th:last-child,
table td:last-child {
	border-right: 0;
}
    
td { 
	padding-left: 10px; 
	text-align: left; 
} 
   
th {
	background-color:#dee2e6;	
	width: 10%;
	vertical-align: middle;
}
    
button.btndel{
	margin: 0 5px 0 5px
}
section.title{
	margin-left:3%;
}
textarea{
	width:94.3%;
	height:fix-content;
	border:none;
	margin-left:3%;
	margin-top:1%;
	resize: none;
	font-size:16px;
}

textarea:disabled{
	background-color:#fff;
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

td.td-a a.bo-a {
	text-decoration: none;
}
td.td-a a.bo-a:active, td.td-a a.bo-a:hover {
	text-weight: bolder;
}
 
</style>
</head>
<body>
<br><br>
<div class="body-wrapper">
	<section>
	<section class="title">공지 내용</section>
		<table>
            <tr>
                <th>제목</th>
                <td colspan="5"><%=article.getNt_title()%></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td style="width:30%"><%=article.getNt_writer()%></td>
                <th>공지번호</th>
                <td style="width:20%"><%=article.getNt_no() %></td>
                <th>등록일</th>
                <td style="width:20%"><%=article.getNt_date()%></td>
            </tr>
        </table>
        
        	
		<textarea rows="25" disabled><%=article.getNt_content()%></textarea>
				        
           
<%
if (article2 == null && article3 == null) {%>
	<table class="tb">
	<tr>
	<th>이전글</th>
	<td></td>
	</tr>
	
	<tr>
	<th>다음글</th>
	<td></td>
	</tr>
	</table>
<%} else if (article3 == null) {%>
	<table class="tb">
	<tr>
	<th>이전글</th>
	<td class="td-a"><a class="bo-a" href="boardDetail.mc?nt_no=<%=article2.getNt_no() %>&page=${page }"><%=article2.getNt_title()%></a></td>
	</tr>
	
	<tr>
	<th>다음글</th>
	<td></td>
	</tr>
	</table>
<%} else if (article2 == null) {%>
	<table class="tb">
	<tr>
	<th>이전글</th>
	<td></td>
	</tr>
	
	<tr>
	<th>다음글</th>
	<td class="td-a"><a class="bo-a" href="boardDetail.mc?nt_no=<%=article3.getNt_no() %>&page=${page }"><%=article3.getNt_title()%></a></td>
	</tr>
	</table>
<%} else {%>
	<% if(article2.getNt_no() > 0 || article2.getNt_no() < article3.getNt_no()){%>
        <table class="tb">
        <tr>
        <th>이전글</th>
        <td class="td-a"><a class="bo-a" href="boardDetail.mc?nt_no=<%=article2.getNt_no() %>&page=${page }"><%=article2.getNt_title()%></a></td>
        </tr>
        <tr>
        <th>다음글</th>
        <td class="td-a"><a class="bo-a" href="boardDetail.mc?nt_no=<%=article3.getNt_no() %>&page=${page }"><%=article3.getNt_title()%></a></td>
        </tr>
        </table>
       <%  }%>
        
<% }%>
	</section>
	<br>
		<%if (session.getAttribute("id") == null) {%>
		
			<div class="mdl"><button class="btn" onclick="location.href='boardList.mc?page=${page }';">목록</button>&nbsp;</div>
			<%} else if(session.getAttribute("id").equals("admin")){%>
			<div class="mdl">
			<button class="btn" onclick="location.href='boardModifyForm.mc?nt_no=<%=article.getNt_no() %>&page=${page }';">수정</button>
			<button class="btndel btn" data-ntno="<%=article.getNt_no()%>">삭제</button>
			<button class="btn" onclick="location.href='boardList.mc?page=${page }';">목록</button>
			</div>
		<%} else {%>
			<div class="mdl">
			<button class="btn" onclick="location.href='boardList.mc?page=${page }';">목록</button>&nbsp;
			</div>
		<%} %>
		


	
	<br>
</div>
  <div class="modal" id="myModal">
    <div class="modal-content">
        <form action="boardDeleteForm.mc" method="POST" id="deleteForm">
            <fieldset>
                <table class="md-table">
                    <tr class="md-tr">
                        <td class="md-title md-td"><label for="id">삭제하시겠습니까?</label></td>
                    </tr>
                    <tr class="md-tr">
                        <td class="md-td">
                            <input type="hidden" name="page" value="<%= request.getParameter("page") %>">
                            <button type="submit" class="selectButton md-button">네</button>
                            <button type="button" class="close_btn selectButton md-button">아니요</button>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </form>
    </div>
</div>
		


	
	<br><br>


<script>
    document.addEventListener("DOMContentLoaded", function () {
        const modal = document.getElementById('myModal');
        const modalOpenButtons = document.querySelectorAll('.btndel');
        const modalCloseButton = document.querySelector('.close_btn');
        const deleteForm = document.getElementById('deleteForm');
        const deleteButton = document.querySelector('.modal .selectButton[type="submit"]');
        const cancelButton = document.querySelector('.modal .selectButton[type="button"]');
        
        modalOpenButtons.forEach(button => {
            button.addEventListener('click', function () {
                modal.style.display = 'flex';
                const ntNo = this.getAttribute('data-ntno');
                deleteForm.action = 'boardDeletePro.mc?nt_no=' + ntNo; // 주소를 동적으로 설정
            });
        });

        modalCloseButton.addEventListener('click', function () {
            modal.style.display = 'none';
        });

        cancelButton.addEventListener('click', function () {
            modal.style.display = 'none';
        });
    });
</script>
</body>
</html>