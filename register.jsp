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
      String name=request.getParameter("n");
String pass=request.getParameter("p");
      String email=request.getParameter("e");
      String eve[]=request.getParameterValues("s");
      String event="";
  for(String val:eve)
 	 event+=val+"_";
      
     
    
 try
 {
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","sys");
     PreparedStatement ps=con.prepareStatement("insert into tevent values(?,?,?,?)");
     ps.setString(1,name);
     ps.setString(2,pass);
     ps.setString(3,email);
     ps.setString(4,event);
  
     int r=ps.executeUpdate();
	 out.println(r>=1?"1 record is inserted..":"Not Inserted..");
	 con.close();
 }
 catch(Exception e)
 {
     out.println(e);	 
 }

 
 
    out.println(name+"  "+email+" "+pass+" "+event);
%>
</body>
</html>