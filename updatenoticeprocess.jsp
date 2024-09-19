<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Notice Updated</title>
</head>
<body>
<%@ page import="java.sql.*" %>

<%
    String noticeId = request.getParameter("notice_id");
    String newTitle = request.getParameter("title");
    String newData = request.getParameter("data");

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "sys");

        // Update the notice with the new title and content
        PreparedStatement ps = con.prepareStatement("UPDATE notice2 SET title = ?, data = ? WHERE notice_id = ?");
        ps.setString(1, newTitle);
        ps.setString(2, newData);
        ps.setString(3, noticeId);

        int rowsUpdated = ps.executeUpdate();

        if (rowsUpdated >= 1) {
           // out.println("Notice updated successfully!");
        	out.println( "<h2><span style='color:green;'>&#10004;</span></h2>Notice successfully updated." );
        	
        } else {
            out.println("Error: Notice not found.");
        }

        con.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

</body>
</html>
