<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*, java.text.SimpleDateFormat"%>
<%@ page import="vo.Mc_rooms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setHeader("Pragma","no-cache");
response.setHeader("Expires","0");
response.setHeader("Cache-Control","no-store, no-cache, must-revalidate");
%>
<%
ArrayList<Mc_rooms> mc_rooms = (ArrayList<Mc_rooms>) request.getAttribute("mc_rooms");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MOCA DREAM 예약하기 페이지</title>
<link rel="stylesheet" href="./css/default.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Josefin+Slab:ital,wght@0,100..700;1,100..700&family=Merienda:wght@300..900&family=Merriweather:ital,wght@0,300;0,400;0,700;0,900;1,300;1,400;1,700;1,900&family=Rowdies:wght@300;400;700&family=Sora:wght@100..800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<style>
	button {
		border: 1px solid lightgray;
		margin-bottom: 20px;
		border-radius: 8px;
		background-color : #dee2e6;
		color: #343a40;
    }
	select {
	    border: 1px solid #868e96;
	    margin-bottom: 20px; 
	    border-radius: 8px;
    }
   h1 {
	   margin: 30px;
	   text-align: center;
	   font-size: 25px;
   }
   
    label { 
		margin-bottom: 20px; 
    }
   .input {
      width: 500px;
      height: 45px;
	}
   
   table {
      margin: auto;
      text-align: left;
      box-sizing: border-box;
   }
   
   #order, #reset {
      width: 30px border
   }
    
    select#selectT option {
       display: none;
    }
    
    select#selectUseT option {
       display: none;
    }
    
    option#none {
       display: none;
    }
 
    
  input[type='date'],input[type='text'] {
  box-sizing: border-box;
  border: 1px solid #868e96;
  position: relative;
  width: 100%;
  padding: 10px;
  border-radius: 8px;
  text-align: center;
  font-size: 100%;
  margin-bottom: 20px; 
}

// 실제 캘린더 아이콘을 클릭하는 영역을 의미하는 선택자
// 이 영역을 확장해서 input의 어떤 곳을 클릭해도 캘린더를 클릭한 것과 같은 효과를 만들자!
input[type='date']::-webkit-calendar-picker-indicator {
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background: transparent;
  color: transparent;
  cursor: pointer;
}

// type이 date인 input의 placeholder를 커스텀하기 위한 선택자
// 기본적으로 type date인 input은 placeholder가 먹히지 않기 때문이다!
// input 태그의 placeholder라는 속성값을 가져와서 content로 사용한다. 보통은 placeholder보다는 data-placeholder라는 커스텀 속성을 만들어서 사용하시는 것 같다.
input[type='date']::before {
  content: attr(placeholder);
  width: 100%;
  height: 100%;
}
// input에 어떠한 유효값이 입력된 상태인지 확인하는 선택자
// 날짜를 선택하면 유효값이 입력된다.
// 이 속성을 활용하고자 한다면 반드시 태그에 required 속성을 달아줘야한다.
 
 input[type='date']:valid::before { */
   display: none; // 유효값이 입력된 경우 before에 있는 것을 사라지게 한다. 즉, placeholder를 사라지게 한다. */
 } 
 
	input[type='date'] {
	  position: relative; 
	  padding: 10px;
	  border-radius: 8px;
	  text-align: center;
	  font-size: 100%;
	  margin-bottom: 20px;
	}
	
	input[type='date']::-webkit-calendar-picker-indicator {
	  position: absolute; 
	  left: 0;
	  top: 0;
	  width: 100%;
	  height: 100%;
	  background: transparent; 
	  color: transparent; 
	  cursor: pointer;
	}
	
	input[type='date']::before {
	  content: attr(placeholder); 
	  width: 100%;
	  height: 100%;
	}
	
	input[type='date']:valid::before {
		display: none; 
	}   
	
	label.r_label {
		font-size: 1.03rem;
	}
	td .input {
		text-align: left;
		font-size: 0.93rem;
		margin: 15px 0 30px 0;
		padding-left: 10px;
	}
	td .input.btnUp {
		margin-bottom: 10px;
	}
	button.input {
		text-align: center;
	}
	
	button.input:hover {
		border: 2px solid #495059;
	}
	.btn, .modal_btn {
	padding: 8px 12px;
	margin: 0 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #fff;
	cursor: pointer;
	}
	
	.btn:hover {
		background-color: #f0f0f0;
	}
	
@media only screen and (max-width: 767px) {
	table#maintb {
		width: 400px;
	}
	.input {
		width: 100%;
		height: 45px;
	}
}

@media only screen and (max-width: 600px) {
	div.body-wrapper {
		width: 100%;
	}
}

@media only screen and (max-width:479px) {
   form#orderform, section#orderformArea, table#maintb {
      width: 100%;
   }
   
   .input {
      width: 100%;
      height: 40px;
      outline: none;
   }
   
   .input:focus {
      border: 2px solid rgb(7 10 60);
   }
   
   	button.input {
	    border: 1px solid #868e96;
		text-align: center;
	}
   
   h1 {
      margin: 30px;
      text-align: center;
      font-size: 20px;
   }
   
   div.body-wrapper {
      width: 400px;
   }
   
   body {
      background-color: white;
   }
   td#td-btn {
      text-align: right;
   }
   
   
}
</style>
<script>
   window.onload = function(){
      if('${msg}' == 'ok') history.replaceState({}, null, location.pathname);
   };
   
   var actionCount = 0;
   
   function sYesTime() {
      let rname = document.getElementById("rname").value;
      let rcal = document.getElementById("r_cal").value;
      let runame = document.getElementById("r_uname").value;
      if (rname != "" && rcal != "") {
         location.href = "selectYesTime.mc?r_name=" + rname + "&r_cal=" + rcal + "&r_uname=" + runame;
      } else if (rname == "") {
         alert("방을 선택해 주세요");
      } else if (rcal == "") {
         alert("날짜를 선택해 주세요");
      } else {
         alert("방이나 날짜를 선택해 주세요");
      }
   }
   
   function optshow() {
      for (let i = 0; i < document.getElementById("selectT").children.length; i++) {
           let a = document.getElementById("selectT").children[i];
           a.style.display = 'inline-block';
       }
   }
   
   function optNoTimeHide(noTime) {
      for (let i = 0; i < document.getElementById("selectT").children.length; i++) {
           let a = document.getElementById("selectT").children[i];
           let a2 = a.value;
           if (a2.includes(noTime)) {
              a.style.display = 'none';
           }
       }
   }
   
   function setUserVal(rna, rca, runm) {
      document.getElementById("rname").value = rna;
      document.getElementById("r_cal").value = rca;
      document.getElementById("r_uname").value = runm;
      
   }
   
    function optUseTshow() {
        for (let i = 0; i < document.getElementById("selectUseT").children.length; i++) {
            let a = document.getElementById("selectUseT").children[i];
            a.style.display = 'inline-block';
        }
        optUseHide();
   }
    
    function optUseHide() {
        let z = document.getElementById("selectT");
        let z1 = z.options[z.selectedIndex].value; //선택한 시작시간
        let z2;
        let z3;
        
        if (parseInt(z1) == 20) {
           let a = document.getElementById("selectUseT").children[1];
           a.style.display = 'none';
           a = document.getElementById("selectUseT").children[2];
           a.style.display = 'none';
        } else {
           main:
           for (let i = z.selectedIndex + 1; i < z.children.length; i++) { 
               if (z.children[i].style.display == "inline-block") {
                  z2 = z.options[i].value;
                   if (parseInt(z2) == (parseInt(z1) + 1)) {
                      if (parseInt(z1) == 19 && parseInt(z2) == 20) {
                         let a = document.getElementById("selectUseT").children[2];
                         a.style.display = 'none';
                         break main;
                      } else {
                     for (let j = i + 1; j < z.children.length; j++) {
                        if (z.children[j].style.display == "inline-block") {
                           z3 = z.options[j].value;
                               if (parseInt(z3) == (parseInt(z2) + 1)) {
                                  //1,2,3시간 이용 보이게
                                  break main;
                               } else {
                                  //1,2시간 이용 보이게
                                  let a = document.getElementById("selectUseT").children[2];
                                  a.style.display = 'none';
                                  break main;
                               }
                        }
                     }
                      }
                   } else {
                      //1시간 이용만 보이게
                      let a = document.getElementById("selectUseT").children[1];
                      a.style.display = 'none';
                      a = document.getElementById("selectUseT").children[2];
                      a.style.display = 'none';
                      break;
                   }
               }
           }
        }
    }
        
</script>
</head>
<body>
<div class="body-wrapper">
<%
ArrayList<Integer> noTimeList = (ArrayList<Integer>) request.getAttribute("noTimeList");
%>
   
   <form name="orderform" action="userOrderAction.mc" method="post" id="orderform">
      <section id="orderformArea">
         <table id="maintb">
            <tr>
               <td colspan="2"><h1>예약신청</h1></td>
            </tr>

            <tr>
               <td><label for="r_name" class="r_label">예약하실 방</label></td>
            </tr>
            <tr>
            <td>
               <select name="r_name" id="rname" class="input">
                  <% for (int i = 0; i < mc_rooms.size(); i++) { %>
                     <option value="<%=mc_rooms.get(i).getR_name()%>"><%=mc_rooms.get(i).getR_name()%></option>
                  <% } %>
               </select>
               </td>
            </tr>
            <tr>
               <td><label for="r_uname" class="r_label">예약자</label></td>
            </tr>
            <tr>
               <td><input type="text" name="r_uname" class="input" id="r_uname" value="${id }" readonly></td>
            </tr>
            <%      
            SimpleDateFormat ddd = new SimpleDateFormat("yyyy-MM-dd");
            Date now = new Date();
            String now1 = ddd.format(now);
            %>
            <tr>
               <td><label for="r_cal" class="r_label">예약하실 날짜</label></td>
            </tr>
               <tr>
               <td><input type="date" name="r_cal" class="input btnUp" id="r_cal" min="<%= now1%>" required></td>
            </tr>
            <tr>
               <td><label for="yestime"></label></td>
            </tr>
            <tr>
               <td><button type="button" name="yestime" class="input" onclick="sYesTime()">예약가능 시간 검색</button></td>
            </tr>
            <tr>
               <td><label for="r_statime" class="r_label">예약 시간</label></td>
            </tr>
               <tr>
               <td>
               <select name="r_statime" class="input btnUp" id="selectT">
                  <option id="none">시간을 선택해주세요.</option>
                  <option>09:00</option>
                  <option>10:00</option>
                  <option>11:00</option>
                  <option>12:00</option>
                  <option>13:00</option>
                  <option>14:00</option>
                  <option>15:00</option>
                  <option>16:00</option>
                  <option>17:00</option>
                  <option>18:00</option>
                  <option>19:00</option>
                  <option>20:00</option>
               </select>
               </td>
            </tr>
               <%
                if (!(noTimeList != null)) {
                  out.println("<script>");
                  out.println("optshow();");
                  out.println("</script>");
               }
               if (noTimeList != null) {
                  String rna = (String) request.getAttribute("r_name");
                  String rca = (String) request.getAttribute("r_cal");
                  String runm = (String) request.getAttribute("r_uname");
                  out.println("<script>");
                  out.println("setUserVal('" + rna + "', '" + rca + "', '" + runm + "');");
                  out.println("optshow();");
                  out.println("</script>");
                  for (int i = 0; i < noTimeList.size(); i++) {
                     out.println("<script>");
                     out.println("optNoTimeHide(" + noTimeList.get(i) + ");");
                     out.println("</script>");
                  }
                  out.println("<script>");
                  out.println("actionCount++;");
                  out.println("</script>");
               }
               %>
            <tr>
               <td><label for="usetime"></label></td>
            </tr>
            <tr>
               <td><button type="button" name="usetime" class="input" onclick="optUseTshow()">이용가능 시간 검색</button></td>
            </tr>
            <tr>
               <td><label for="r_time" class="r_label">이용 시간</label></td>
            </tr>
            <tr>
               <td>
               <select name="r_time" class="input" id="selectUseT">
                  <option>1시간 이용</option>
                  <option>2시간 이용</option>
                  <option>3시간 이용</option>
               </select>
               </td>
            </tr>
            <tr>
               <td colspan="2" id="td-btn" style="text-align: right;">
	               <input class="btn" type="submit" id="order" value="예약 신청하기">&nbsp;&nbsp;
	               <input class="btn" type="reset" id="reset" value="다시 작성하기">
               </td>
            </tr>
         </table>
      </section>
   </form>
   <br><br>
<script>
   document.getElementById("order").addEventListener("click", function(e){
       if (orderform.selectT.value == '시간을 선택해주세요.') {
           e.preventDefault();
           alert("시간을 선택해주세요.");
       }
       
       if (actionCount < 1) {
           e.preventDefault();
           alert("예약가능 시간을 검색해주세요.");
       }
   });
</script>
</div>
</body>
</html>