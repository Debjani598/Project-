<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
       .b{background:green;color:white;width:150px;height:30px;}
   </style>
</head>
<body>
<%@page import="java.sql.*" %>
 <h1 align=center>Tech Registration<hr color=green size=10></h1>
     <br><br>
 <h2>Update Profile Data</h2>
<%
    String pass=request.getParameter("p");
    try
    {
    	Class.forName("oracle.jdbc.driver.OracleDriver");
    	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","sys");
        PreparedStatement ps=con.prepareStatement("select * from tevent where pass=?");
        ps.setString(1,pass);
        ResultSet rs=ps.executeQuery();
        while(rs.next())
        {
        	out.println("<form action='iupdateaction.jsp'><input type='hidden' value='"+rs.getString(1)+"' name='p'>"
        			+ rs.getString(1) + "<br>Name <input type='text' value='"+rs.getString(2)+"' name='n'><br>"
        			+ "Email <input type='text' value='"+rs.getString(3)+"' name='e'><br>"
        			+ "Event <input type='text' value='"+rs.getString(4)+"' name='s'><br><br>"
        			+ "<input type='submit' value='Update' class='b'></form>");

        }
        con.close();
    
    }
    catch(Exception e)
    {
    	out.println(e);
    }
    %>
</body>
</html>