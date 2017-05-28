<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.File"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복체크</title>
</head>
<body>
<!-- 아이디 중복 체크를 위한 코드이다.
	request.getParameter로 id정로블 받아와서 not_activation폴더와 activation폴더의 list를 for loop로 돌아서
	같은 것이 있다면 check_id를 true로 하고  PrintWriter의 함수를 이용해서 reponse해준다.
 -->
	<%
		boolean check_id = false;

		String input_id = request.getParameter("id_info");

		File dirFile1 = new File(application.getRealPath("/data/not_activation/"));		//폴더
		if(!dirFile1.exists()){
			dirFile1.mkdirs();
		}
		String fileList1[] = dirFile1.list();	//폴더 리스트 뽑기
		
		for(int i = 0; i < fileList1.length; i++) {
			if(fileList1[i].equals(input_id + ".txt")) {
				check_id = true;
				break;
			}
		}
		
		File dirFile2 = new File(application.getRealPath("/data/activation/"));		//폴더
		if(!dirFile2.exists()){
			dirFile2.mkdirs();
		}
		String fileList2[] = dirFile2.list();	//폴더 리스트 뽑기
		
		for(int i = 0; i < fileList2.length; i++) {
			if(fileList2[i].equals(input_id + ".txt")) {
				check_id = true;
				break;
			}
		}
		
		
		PrintWriter writer = response.getWriter();

		writer.print(check_id);
		writer.flush();
		writer.close();
	%>
</body>
</html>