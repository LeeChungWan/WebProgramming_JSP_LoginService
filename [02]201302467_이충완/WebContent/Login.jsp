<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
	<%
		String id = request.getParameter("id"); // id의 값을 받아온다.
		String pwd = request.getParameter("pwd"); // pwd의 값을 받아온다.

		String check_pwd = null;
		String fileNameOfActivation = application.getRealPath("/data/activation/"); // 인증받은 Id의 경로를 설정한다.
		String fileNameOfNotActivation = application.getRealPath("/data/not_activation/"); // 인증받지 않은 Id의 경로를 설정한다. 
		
		
		File dirFile1 = new File(fileNameOfNotActivation); // not_activation폴더를 생성해준다.
		if (!dirFile1.exists()) {
			dirFile1.mkdirs();
		}
		String fileList1[] = dirFile1.list(); // 폴더의 list들을 저장한다.
		for(int i=0; i<fileList1.length; i++){ // 반복문을 돌려 폴더에 해당 id.txt가 있는지 확인한다.
			if(fileList1[i].equals(id+".txt")){
				%>
				<script>
					alert("메일 인증이 안된 ID입니다.");
					location.href="MainPage.jsp";
				</script>
				<%
				return;
			}
		}
		
		File dirFile2 = new File(fileNameOfActivation); // activation 폴더를 생성한다.
		if (!dirFile2.exists()) {
			dirFile2.mkdirs();
		}
		String fileList2[] = dirFile2.list(); // 반복문을 돌려 폴더에 해당 id.txt가 있는지 확인한다.
		for (int i = 0; i < fileList2.length; i++) {
			if (fileList2[i].equals(id + ".txt")) {
				fileNameOfActivation += "/" + id + ".txt";
				FileReader fr = new FileReader(fileNameOfActivation);
				BufferedReader br = new BufferedReader(fr);
				check_pwd = br.readLine();
				if (pwd.equals(check_pwd)) { // 인증된 id폴더에 id가 있으면 비밀번호가 맞는지 확인을 한다.
	%>
					<script>
						location.href = "TP1_HTML_SKELETON.html"; // 비밀번호가 맞으면 One-Page로 이동한다.
					</script>
	<%
				} else {
	%>
					<script>
						alert("아이디와 비밀번호가 일치하지 않습니다."); //비밀번호가 틀리면 경고창을 띄운다.
						location.href="MainPage.jsp";
					</script>
	<% 
					}
			}
	
		}
	%>
		<script>
			alert("일치하는 아이디가 없습니다.");
			location.href="MainPage.jsp";
		</script>
</body>
</html>