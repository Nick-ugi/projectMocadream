<%
String id = (String) session.getAttribute("id");
if(id == null || !(id.equals("admin"))) {
    response.sendRedirect("./main.jsp");
}
%>