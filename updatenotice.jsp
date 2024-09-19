<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Notice</title>
    <style>
     body {
           
            background-color: #f0f0f0;
        }
            input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #03346E;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
         input[type="submit"]:hover {
            background-color: #0253A2;
        }
        div{
            width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.7); /* Semi-transparent background */
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }
</style>
</head>
<body>
<%@ page import="java.sql.*" %>

<%
    String noticeId = request.getParameter("notice_id"); // Get the notice ID from the query parameter
    String title = "";
    String data = "";

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "sys");

        // Fetch the current details of the selected notice
        PreparedStatement ps = con.prepareStatement("SELECT title, data FROM notice2 WHERE notice_id = ?");
        ps.setString(1, noticeId);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            title = rs.getString("title");
            data = rs.getString("data");
        }

        con.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

<!-- Display a form to update the notice --><div>
 <h2 style=" color:#03346E;">Update Notice</h2><br>
<form action="updatenoticeprocess.jsp" method="POST">
    <input type="hidden" name="notice_id" value="<%= noticeId %>">
    <label for="title">Title:</label>
    <input type="text" name="title" value="<%= title %>" required><br><br>
    <label for="data">Content:</label>
    <textarea name="data" rows="5" cols="30" required><%= data %></textarea><br><br>
    <input type="submit" value="Update Notice">
</form>
</div>
</body>
</html>
