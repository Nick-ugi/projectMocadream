<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    
    td#mobile-td1-con, td#mobile-td2-con, td#mobile-td3-cons {
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
</head>
<body>
<%@ include file="/common/cookies.jsp" %>
<div class="body-wrapper">
    <section id="inputformArea">
        <form action="boardWritePro.mc" method="post" name="boardform">
            <table id="mobile-tb">
            	<tr>
					<td colspan="2" style="padding-left: 10px;">
						<h1 class="h1-title">공지사항 글등록</h1>
					</td>
				</tr>
                <tr>
                    <td id="mobile-td1" class="r_title r_title_top"><label for="BOARD_NAME">글쓴이</label></td>
                    <td id="mobile-td1-con" class="td_padding"><input type="text" name="nt_writer" id="nt_writer" value="관리자" required readonly></td>
                </tr>

                <tr>
                    <td id="mobile-td2" class="r_title"><label for="nt_title">제 목</label></td>
                    <td id="mobile-td2-con" class="td_padding"><input name="nt_title" type="text" id="nt_title" required></td>
                </tr>
                <tr>
                    <td id="mobile-td3" class="r_title r_title_bottom"><label for="nt_content">내 용</label></td>
                    <td id="mobile-td3-con" class="td_padding"><textarea id="nt_content" name="nt_content" cols="40" rows="15" required></textarea></td>
                </tr>
                <tr>
	                <td colspan="2" style="padding-top: 10px;">
	                    <input type="submit" value="등록">
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
