<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.regex.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>id check page</title>
</head>
<body>
<!-- Id의 유효성 검사를 하기 위한 코드이다.
	Pattern.maches함수를 이용해서 입력한 id가 pattern에 맞는지 검사한다.
 -->
	<%
		String reg_id = "^[a-zA-Z0-9_]{6,10}$";
		String input_id = request.getParameter("id_info");
		boolean check_id = Pattern.matches(reg_id, input_id);
		PrintWriter writer = response.getWriter();
		writer.print(check_id);
		writer.flush();
		writer.close();
	%> 
</body>
</html>