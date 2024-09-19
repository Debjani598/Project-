<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
       .b{background:green;color:white;width:150px;height:50px;}
   </style>
</head>
<body>
<h1 style=" color:blue;">Tech Event Registration</h1>
<br><br>
<h2>Welcome User</h2>

<form action=profile.jsp>
  <input type=submit value=Profile class=b><br><br>
   <input type=hidden value=<%=request.getParameter("p") %> name=p>
</form>
<form action=update.jsp>
  <input type=submit value=Update class=b><br><br>
  <input type=hidden value=<%=request.getParameter("p") %> name=p>
</form>
<form action=view.jsp>
  <input type=submit value=StudentList class=b><br><br>
</form>     
   
<form action=front.html>
  <input type=submit value=Logout class=b><br>
</form>
</body>
</html>
