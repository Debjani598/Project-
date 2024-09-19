<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*" %>

<%
String pass=request.getParameter("p");
String name=request.getParameter("n");
String email=request.getParameter("e");
String event=request.getParameter("s");

try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","sys");
    PreparedStatement ps=con.prepareStatement("update tevent set name=?,email=?,event=? where pass=?");
ps.setString(1,name);
    ps.setString(2,email);
    ps.setString(3,event);
    ps.setString(4,pass);
    if(ps.executeUpdate()>=1)
  	  response.sendRedirect("welcome.jsp?n="+pass);
    con.close();
}
catch(Exception e)
{
	  out.println(e);
}


%>
</body>
</html>