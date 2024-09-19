<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
    String action = request.getParameter("action");

    if ("ADD".equals(action)) {
        response.sendRedirect("newnotice.html");
    } else if ("VIEW".equals(action)) {
        response.sendRedirect("viewnotices.jsp");
    } else if ("DELETE".equals(action)) {
        response.sendRedirect("delete.jsp");
    }
 -->
 <%@ page import="java.sql.*" %>
<%
    String action = request.getParameter("action");

    

    if ("ADD".equals(action)) {
       
        response.sendRedirect("newnotice.html");

    } else if ("VIEW".equals(action)) {
        try {
            
             Class.forName("oracle.jdbc.driver.OracleDriver");
    	 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","sys");
         PreparedStatement ps=con.prepareStatement("select notice_id,title from notice2");
         ps=con.prepareStatement("select notice_id,title from notice2");
         
         
         ResultSet rs=ps.executeQuery();
           

            out.println("<h2>Notice Headlines</h2>");
            out.println("<ul>");
            
            while (rs.next()) {
                String title = rs.getString("title");
                String id=rs.getString("notice_id");
                //out.println("<li>" + title + "</li>");
                out.println("<li><a href='viewnotice.jsp?n=" + id + "'>" + title + "</a></li>");
            }
            
            out.println("</ul>");
            
        } catch(Exception e)
        
        {
       	 out.println(e);
        }
        
    } else if ("DELETE".equals(action)) {
        
    	try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "sys");
            PreparedStatement ps = con.prepareStatement("select notice_id, title from notice2");
            ResultSet rs = ps.executeQuery();

            out.println("<h2>Delete Notice</h2>");
            out.println("<ul>");
            
            while (rs.next()) {
                String id = rs.getString("notice_id");
                String title = rs.getString("title");
                // Displaying notices with update links
                out.println("<li>" + title + " <a href='deletenotice.jsp?notice_id=" + id + "'>Delete</a></li>");
            }
            
            out.println("</ul>");
            
            con.close();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    }
%>
 
</body>
</html>