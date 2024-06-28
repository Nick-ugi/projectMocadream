<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="vo.Mc_rooms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% Mc_rooms room = (Mc_rooms)request.getAttribute("room"); %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css">
<link rel="stylesheet" href="./css/input.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MVC 게시판</title>
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
    td#mobile-td1, td#mobile-td2, td#mobile-td3, td#mobile-td4, td#mobile-td5 {
    	width: 40%;
    }
    
    td#mobile-td1-con, td#mobile-td2-con, td#mobile-td3-con, td#mobile-td4-con, td#mobile-td5-con {
    	width: 60%;
    }

    form table tr td label.label {
        width: 60px;
    }
    
    form table tr td textarea {
    	margin-left: 0;
	}
	table {
		font-size: 14px; 
 	}
}

img#roompic {
	width: 350px;
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

.modal-content {
   background: #fff;
   padding: 20px;
   border-radius: 10px;
   width: 350px;
   position: absolute;
   top: 50%;
   margin: 0 auto;
   left: 50%;
   transform: translate(-50%, -50%);
   text-align: center;
}
        
table.md-table {
   width: 100%;
   height: 70px;
   margin: 0 auto;
   border: none;
   box-shadow: none;
}
    
td.md-td {
	padding-top: 10px;
}

button.md-button {
   padding: 4px 0;
   background-color: rgb(6 10 70);
   color: white;
   width: 58px;
   background-color: none;
   display: inline-block;
   text-align: center;
   white-space: nowrap;
   vertical-align: middle;
   user-select: none;
   border: 1px solid transparent;
   padding: 5px 0;
   font-size: 1em;
   border-radius: .25rem;
   transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
   cursor: pointer;
}
</style>
</head>
<body>
<%@ include file="/common/cookies.jsp" %>
<div class="body-wrapper">
	<section id="inputformArea">
	    <form name="insertRoom" action="mocaModifyPro.mc" method="post" enctype="multipart/form-data">
	        <input type = "hidden" name = "page" value = "${page }">
	        <table id="mobile-tb">
	        	<tr>
	        		<td colspan="2" style="padding-left: 10px;">
						<h1 class="h1-title">방 수정</h1>
					</td>
				</tr>	
	            <tr>
	                <td id="mobile-td1"  class="r_title r_title_top"><label class="label" for="R_NO">룸 번호</label></td>
	                <td id="mobile-td1-con" class="td_padding"><input type="text" name="R_NO" id="R_NO" value="<%= room.getR_no() %>" readonly/></td>
	            </tr>
	            <tr>
	                <td id="mobile-td2" class="r_title"><label class="label" for="R_NAME">룸 이름</label></td>
	                <td id="mobile-td2-con" class="td_padding"><input type="text" name="R_NAME" id="R_NAME" value="<%= room.getR_name() %>"/></td>
	            </tr>
	            <tr>
	                <td id="mobile-td3" class="r_title"><label class="label" for="R_MAX">수용인원</label></td>
	                <td id="mobile-td3-con" class="td_padding"><input type="text" name="R_MAX" id="R_MAX" value="<%= room.getR_max() %>"/></td>
	            </tr>
	            <tr>
	                <td id="mobile-td4" class="r_title"><label class="label" for="R_DESC">룸 설명</label></td>
	                <td id="mobile-td4-con" class="td_padding"><textarea name="R_DESC" id="R_DESC"><%= room.getR_desc() %></textarea></td>
	            </tr>
	            <tr>
	                <td id="mobile-td5" class="r_title r_title_bottom"><label class="label" for="R_FILE">룸 사진</label></td>
	                <td id="mobile-td5-con" class="td_padding"><input type="file" name="R_FILE" id = "R_FILE" value="<%= room.getR_file() %>"/></td>
	            </tr>
	            <tr>
	                <td colspan="2" style="padding-top: 10px;">
	                    <input type="submit" value="수정">
	                    <input type="reset" value="다시쓰기" >
	                    <input type="button" value="사진보기" class="btnview">
	                    <input type="button" value="돌아가기" onClick="location.href='mocaList.mc';">
	                </td>
	            </tr>
	        </table>
	    </form>
	</section>
	<br><br>
</div>
<div class="modal" id="myModal">
    <div class="modal-content">
        <fieldset>
            <table class="md-table">
                <tr class="md-tr">
                    <td class="md-title"><img id="roompic" src="./roomUpload/<%= room.getR_file() %>"></td>
                </tr>
                <tr class="md-tr">
                    <td class="md-td">
                        <button type="button" class="close_btn selectButton md-button">닫기</button>
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const modal = document.getElementById('myModal');
        const modalOpenButtons = document.querySelectorAll('.btnview');
        const modalCloseButton = document.querySelector('.close_btn');
        const cancelButton = document.querySelector('.modal .selectButton[type="button"]');

        modalCloseButton.addEventListener('click', function () {
            modal.style.display = 'none';
        });
        
        modalOpenButtons.forEach(button => {
            button.addEventListener('click', function () {
                modal.style.display = 'flex';
            });
        });

        cancelButton.addEventListener('click', function () {
            modal.style.display = 'none';
        });
    });
</script>
</body>
</html>