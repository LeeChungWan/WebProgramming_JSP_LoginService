<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.regex.Pattern"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>id check page</title>
</head>
<body>
<!-- pwd의 유효성 검사를 하기 위한 코드이다.
	Pattern.maches함수를 이용해서 입력한 pwd가 pattern에 맞는지 검사한다.
 -->
	<%
		String reg_pwd = "^(?=.*[a-zA-Z\\W])(?=.*\\d).{6,20}$";
		String input_pwd = request.getParameter("pwd_info");

		boolean check_pwd = Pattern.matches(reg_pwd, input_pwd);

		PrintWriter writer = response.getWriter();
		writer.print(check_pwd);
		writer.flush();
		writer.close();
	%> 
</body>
</html>