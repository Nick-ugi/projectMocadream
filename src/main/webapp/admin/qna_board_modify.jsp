<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="vo.Mc_notice"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
Mc_notice article = (Mc_notice) request.getAttribute("article");
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css">
<link rel="stylesheet" href="./css/input.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
<style>
div.body-wrapper {
    width: 100%;
}

@media only screen and (max-width: 1279px) {  
	 #inputformArea {
	    max-width:100%;
	}
}

@media only screen and (max-width: 900px) {
	 #inputformArea {
	    max-width:100%;
	}
}

@media only screen and (max-width: 840px) {
    form table tr td textarea {
    	margin-left: 0;
	}
}

@media screen and (max-width: 479px) {
    table#mobile-tb {
    	width: 300px;
    }
    td#mobile-td1, td#mobile-td2, td#mobile-td3 {
    	width: 40%;
    }
    
    td#mobile-td1-con, td#mobile-td2-con, td#mobile-td3-con {
    	width: 60%;
    }

    form table tr td label.label {
        width: 60px;
    }
    
    form table tr td textarea {
    	margin-left: 0;
	}
   
}
</style>
<script type="text/javascript">
	function modifyboard() {
		modifyform.submit();
	}
</script>
</head>
<body>
<%@ include file="/common/cookies.jsp" %>
<div class="body-wrapper">
	<section id="inputformArea">
		<form action="boardModifyPro.mc" method="post" name="modifyform">
			<input type="hidden" name="nt_no" value="<%=article.getNt_no()%>">
			<input type="hidden" name="page" value="${page }">
			<table id="mobile-tb">
				<tr>
	        		<td colspan="2" style="padding-left: 10px;">
						<h1 class="h1-title">공지 글수정</h1>
					</td>
				</tr>
				<tr>
					<td id="mobile-td1" class="r_title r_title_top"><label class="label" for="nt_writer">글쓴이</label></td>
					<td id="mobile-td1-con" class="td_padding"><input type="text" name="nt_writer"
						id="nt_writer" value="<%=article.getNt_writer()%>" readonly>
					</td>
				</tr>

				<tr>
					<td id="mobile-td2" class="r_title"><label class="label" for="nt_title">제 목</label></td>
					<td id="mobile-td2-con" class="td_padding"><input name="nt_title" type="text"
						id="nt_title" value="<%=article.getNt_title()%>"></td>
				</tr>
				<tr>
					<td id="mobile-td3" class="r_title r_title_bottom"><label class="label" for="nt_content">내 용</label></td>
					<td id="mobile-td3-con" class="td_padding"><textarea id="nt_content" name="nt_content" cols="4s0"rows="15"><%=article.getNt_content()%></textarea></td>
				</tr>
				<tr>
	                <td colspan="2" style="padding-top: 10px;">
	                    <input type="button" value="수정" onClick="javascript:modifyboard()">
	                    <input type="reset" value="다시쓰기" >
	                    <input type="button" value="돌아가기" onClick="javascript:history.go(-1)">
	                </td>
	            </tr>
			</table>
		</form>
	</section>
	<br><br>
	</div>
</body>
</html>