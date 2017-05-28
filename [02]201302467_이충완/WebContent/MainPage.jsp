<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>
<style>
.dash {
	border-style: dashed;
}
</style>

<script>
	function click_signup() {
		location.href = "Signup.jsp";
	}
</script>
</head>
<body>
	<form id="login_form" action="Login.jsp"></form>
	<table>
		<tr>
			<td>ID</td>
			<td><input class="dash" form="login_form" type="text" name="id"></td>
		</tr>
		<tr>
			<td>Password</td>
			<td><input class="dash" form="login_form" type="password"
				name="pwd"></td>
		</tr>
		<tr>
			<td><input type="submit" form="login_form" value="로그인"></td>
			<td><button onclick="click_signup()">회원가입</button></td>
		</tr>
	</table>
</body>
</html>