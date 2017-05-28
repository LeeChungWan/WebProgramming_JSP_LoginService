<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	function show_login_page() {
		location.href="MainPage.jsp";
	}
</script>
</head>
<body>
<%
	String id = request.getParameter("id");

	File dirFile1 = new File(application.getRealPath("/data/not_activation/"));		//폴더

	String fileList1[] = dirFile1.list();	//폴더 리스트 뽑기
	//인증된 메일을 not_activation폴더에서 activation폴더로 옮긴다.
	try {
		for(int i = 0; i < fileList1.length; i++) {
			if(fileList1[i].equals(id + ".txt")) {
				File file = new File(dirFile1 + "/" + id + ".txt");
				file.renameTo(new File(application.getRealPath("/data/activation/" + id + ".txt")));
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
	<div>
		<span>메일 인증이 성공하여 회원가입이 완료되었습니다.</span><br>
		<span>로그인 후 이용하시길 바랍니다.</span><br>
		
		<button onclick="show_login_page()">로그인 페이지 이동</button>
	</div>

</body>
</html>