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
    String noticeId = request.getParameter("notice_id"); // Get the notice_id from the URL

        try {
           
            Class.forName("oracle.jdbc.driver.OracleDriver");
            
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "sys");
            PreparedStatement ps = con.prepareStatement("DELETE FROM notice2 WHERE notice_id = ?");
            ps.setString(1, noticeId); // Set the notice_id in the query
            
            // Execute the delete operation
            int result = ps.executeUpdate();

            if (result > 0)
            {
                out.println("<h3>&#10004;Notice deleted successfully!</h3>");
            } 
            else
            {
                out.println("<h3>Notice not found!</h3>");
            }

            con.close();
        }
        catch (Exception e) 
        {
            out.println("Error: " + e.getMessage());
        }
     
%>

<a href="viewnotice.jsp">Back to Notices</a>

</body>
</html>