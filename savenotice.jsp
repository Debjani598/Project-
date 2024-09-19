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
      String title=request.getParameter("title");
      String data=request.getParameter("description");
      String id=request.getParameter("id");
     
    
 try
 {
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","sys");
     PreparedStatement ps=con.prepareStatement("insert into notice2 values(?,?,?)");
     ps.setString(1,title);
     ps.setString(2,data);
     ps.setString(3,id);
    
    
     
     int r=ps.executeUpdate();
	 out.println(r>=1?"1 record is inserted..":"Not Inserted..");
	 con.close();
 }
 catch(Exception e)
 {
     out.println(e);	 
 }

 
 
    
%>
</body>
</html>