<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%@ page import="java.sql.*" %>
<%
    String action = request.getParameter("action");

    

   if ("VIEW".equals(action)) 
     {
        try {
            
             Class.forName("oracle.jdbc.driver.OracleDriver");
    	 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","sys");
         PreparedStatement ps=con.prepareStatement("select notice_id,title from notice2");
         ps=con.prepareStatement("select notice_id,title from notice2");
         
         
         ResultSet rs=ps.executeQuery();
           

            out.println("<h2>Notice Headlines</h2>");
            out.println("<ul>");
            
            while (rs.next()) 
            {
                String title = rs.getString("title");
                String id=rs.getString("notice_id");
                //out.println("<li>" + title + "</li>");
                out.println("<li><a href='viewnotice.jsp?n=" + id + "'>" + title + "</a></li>");
            }
            
            out.println("</ul>");
            
        }
        catch(Exception e)
        
        {
       	 out.println(e);
        }
        
    } else out.println("error");
%>
 
</body>
</html>
</body>
</html>