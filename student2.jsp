<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action=profile2.jsp>
  <input type=submit value=Profile class=b><br><br>
   <input type=hidden value=<%=request.getParameter("x") %> name=x>
</form>
 <form action="student.jsp" method="post">
        
        <input type="submit" name="action" value="VIEW">
       
    </form>
</body>
</html>