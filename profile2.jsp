<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
Hi
<%@page import="java.sql.*" %>
<%
String pass = request.getParameter("x");

try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","sys");

    // Prepare the SQL statement
    PreparedStatement ps = con.prepareStatement("select * from notice where pass=?");

    // Set the password parameter
    ps.setString(1, pass);

    // Execute the query
    ResultSet rs = ps.executeQuery();

    // Process the result set
    while(rs.next()) {
        out.println(  rs.getString(1) + " " + rs.getString(3) + " " + rs.getString(4));
    }

    con.close();
} catch(Exception e) {
    out.println(e);
}
%>
</body>
</html>