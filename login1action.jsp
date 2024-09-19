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
     String rno=request.getParameter("u");
     String pass=request.getParameter("p");
     try
     {
    	 Class.forName("oracle.jdbc.driver.OracleDriver");
    	 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","sys");
         PreparedStatement ps=con.prepareStatement("select * from tech where regno=? and pass=?");
         ps=con.prepareStatement("select * from tech where regno=? and pass=?");
         ps.setString(1,rno);
                  ps.setString(2,pass);
                  ResultSet rs=ps.executeQuery();
                  if(rs.next())
                 	 /*out.println("Valid user");*/
                 	 response.sendRedirect("welcome1.jsp?n="+rno);
                  else
                	  response.sendRedirect("error.jsp");
                 	/* out.println("Not valid");*/
                 con.close();    
              }
              catch(Exception e)
              
              {
             	 out.println(e);
              }

         %>
</body>
</html>