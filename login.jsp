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
    
     String pass=request.getParameter("x");
     
     try
     {
    	 Class.forName("oracle.jdbc.driver.OracleDriver");
    	 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","sys");
         PreparedStatement ps=con.prepareStatement("select * from tevent where pass=?");
         ps=con.prepareStatement("select * from tevent where pass=?");
         ps.setString(1,pass);
                
                  ResultSet rs=ps.executeQuery();
                  if(rs.next())
                 	 /*out.println("Valid user");*/
                 	 response.sendRedirect("wel.jsp?x="+pass);
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