<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%
String uname = request.getParameter("n");
String pass = request.getParameter("p");
String role = request.getParameter("role");



if ("Admin".equals(uname) && "123admin".equals(pass) && "Admin" .equals(role) )
{
    response.sendRedirect("admin.html");
} 
else if("Department".equals(uname) && "123Dept".equals(pass) && "Department" .equals(role) ){
	response.sendRedirect("control2.html");
}
else 
{
    response.sendRedirect("login.jsp?x="+pass);
} 

%>