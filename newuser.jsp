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
      String name=request.getParameter("uname");
      String pass=request.getParameter("pass");
      String email=request.getParameter("email");
      String phno=request.getParameter("phno");
     
    
 try
 {
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","sys");
     PreparedStatement ps=con.prepareStatement("insert into notice values(?,?,?,?)");
     ps.setString(1,name);
     ps.setString(2,pass);
     ps.setString(3,email);
     ps.setString(4,phno);
    
    
     
     int r=ps.executeUpdate();
     
	// out.println(r>=1?"Congratulations your account has been successfully created.":"Not Inserted..");
	out.println(r >= 1 ? "<img src='register.jpg'  width='20' height='20'> Congratulations, your account has been successfully created." : "Not Inserted..");
 
	 con.close();
 }
 catch(Exception e)
 {
     out.println(e);	 
 }

 
 
    
%>
</body>
</html>