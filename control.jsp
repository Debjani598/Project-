<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%
String rno = request.getParameter("n");
String pass = request.getParameter("p");
String role = request.getParameter("role");



if ("Admin".equals(rno) && "1234admin".equals(pass) && "Admin" .equals(role) )
{
    response.sendRedirect("admincontrol.html");
} 
else 
{
    response.sendRedirect("login.jsp?x="+pass);
} 

%>