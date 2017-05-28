<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 발송</title>
<!-- onload를 통해서 send_email()바로 실행시킨다. -->
<script>
	function send_email() {
		document.send_form.submit();
	}
</script>
</head>
<body onload="send_email()">
	<%
		// 파일에 저장할 값들을 받아와서 저장한다.
		String id = request.getParameter("login_id");
		String pwd = request.getParameter("login_pwd");
		String name = request.getParameter("login_name");
		String tel = request.getParameter("login_tel");
		String email = request.getParameter("login_email");
		String date = request.getParameter("login_date");

		// 메일 인증이 안된 폴더에 사용자 정보를 file로 만들어서 저장을 한다.
		try {
			
			String filePath = application.getRealPath("/data/not_activation/");
			
			File file = new File(filePath + "/" + id + ".txt");
			file.createNewFile();
			
			FileWriter writer = new FileWriter(file);
			writer.write(pwd + "\r\n" + name + "\r\n" + tel + "\r\n" + email + "\r\n" + date);
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	
<!-- 	이메일을 보내기 위한 정보를 hidden type으로 안보이게 설정하고 SendEmailPage.jsp로 이동한다. -->
	<div>
		<form method="POST" name="send_form" action="SendEmailPage.jsp">
			<input type="hidden" name="id" value="<%=id%>"></input>
			<input type="hidden" name="email" value="<%=email%>"></input>
		</form>
	</div>
</body>
</html>