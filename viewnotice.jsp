<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Notice</title>
</head>
<body>
<%@page import="java.sql.*" %>
<%

    String id = request.getParameter("n");

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "sys");

        // Prepare the SQL query
        PreparedStatement ps = con.prepareStatement("select title, data from notice2 where notice_id = ?");
        ps.setString(1, id);  // Set the notice_id value in the query

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            // If the notice is found, display its title and description
            String title = rs.getString("title");
            String description = rs.getString("data");

            out.println("<h2>" + title + "</h2>");
            out.println("<p>" + description + "</p>");
        } else {
            // If no notice is found with the given ID
            out.println("<p>Notice not found.</p>");
        }

        // Close the connection
        con.close();
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>
</body>
</html>
