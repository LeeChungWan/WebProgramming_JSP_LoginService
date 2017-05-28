<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>login page</title>
<style>
.소개 {
	border: 1px solid;
	text-align: center;
	width: 80%;
	margin-left: 10%;
}

table {
	margin-left: 35%;
}

td {
	text-align: center;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</script>
<script
  src="https://code.jquery.com/jquery-3.2.1.js"
  integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
  crossorigin="anonymous">
 </script>
<script type="text/javascript">
	var reg_name = /^[a-zA-Z가-힣]+$/;
	var reg_tel = /^01([0|1|6|7|8]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	var reg_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	function check_value() {
		var form = document.login_form;
		
		// 약관동의 체크 확인.
		if (!form.login_checkbox.checked) {
			alert("약관에  동의해주세요.");
			return false;
		}
		// ID 입력여부 확인
		if (form.login_id.value == "") {
			alert("아이디를 입력하세요.");
			return false;
		}
		// 중복체크 여부 확인.
		if(form.login_check_duplicate.value =="uncheck"){
			alert("중복체크를 해주세요.");
			return false;
		}
		// 비밀번호 입력여부 확인
		if (form.login_pwd.value == "") {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		// 비밀번호 일치여부 확인
		if (form.login_pwd.value != form.login_pwd_check.value) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		// 이름 입력여부 확인
		if (form.login_name.value == "") {
			alert("이름을 입력하세요.");
			return false;
		} else {
			if (!reg_name.test(form.login_name.value)) {
				alert("이름은 문자열만 입력 가능합니다.")
				form.login_name.value = "";
				return false;
			}
		}
		// 전화번호 입력여부 확인
		if (form.login_tel.value == "") {
			alert("전화번호를 입력하세요.");
			return false;
		} else {
			if (!reg_tel.test(form.login_tel.value)) {
				alert("전화번호 형식을 지켜주세요.");
				form.login_tel.value = "";
				return false;
			}
		}
		// 이메일 입력여부 확인
		if (form.login_email.value == "") {
			alert("이메일을 입력하세요.");
			return false;
		} else {
			if (!reg_email.test(form.login_email.value)) {
				alert("이메일 형식을 지켜주세요.");
				form.login_email.value = "";
				return false;
			}
		}
		// 생년월일 입력여부 확인
		if (form.login_date.value == "") {
			alert("생년월일을 입력하세요.");
			return false;
		}
	}
	
	// 아이디 중북을 확인
	function check_duplicate() {
		var id = document.login_form.login_id.value;

		if (id == "") {
			alert("아이디를 입력하세요.");
		} else {
			$.ajax({
				type : 'post',
				url : 'CheckDuplicate.jsp',
				data : {
					id_info : id
				},
				success : function(data) {
					if (data == "true") {
						alert("이미 존재하는 ID입니다. 다른 ID를 입력해주세요.");
						id = "";
					} else {
						alert("사용 가능한 ID입니다.");
						document.login_form.login_check_duplicate.value = "check";
						document.login_form.login_pwd.focus();
					}

				}
			});
		}
	}
	// jquery를 이용해서 id입력창을 벗어났을때 
	$(document).ready(function() {
	      
	      $('input[name=login_id]').blur(function() {
	    	  if(document.login_form.login_id.value != ""){
	    	  $.ajax({
					type : 'post',
					url : 'CheckIdAvailable.jsp',
					data : {
						id_info : document.login_form.login_id.value
					},
					success : function(data) {
						if (data != "true") {
							alert("아이디 형식을 맞춰주세요.");
							form.login_id.value = "";
						}
					}
				});  
	    	  }
	      });

	      
	      $('input[name=login_pwd]').blur(function() {
	    	  if(document.login_form.login_pwd.value != ""){
	    	  $.ajax({
					type : 'post',
					url : 'CheckPwdAvailable.jsp',
					data : {
						pwd_info : document.login_form.login_pwd.value
					},
					success : function(data) {
						if (data != "true") {
							alert("비밀번호 형식을 맞춰주세요.");
							form.login_pwd.value = "";
							
						}
					}
				});		  
	    	  }
	      });
	   });
	
</script>

</head>
<body>
	<div class="container_소개">
		<div class="소개">
			2017 웹 프로그래밍 HW1<br> 본 약관은 "HW-1회원가입"서비스를 이용하기 위해서는 회원등록을 완료
			해야합니다.
		</div>
	</div>

	<div class="container_table">
		<form action="SendEmailInfo.jsp" id="login_form" name="login_form"
			onsubmit="return check_value();">
			<table>
				<tr>
					<td colspan="3"><input type="checkbox" form="login_form"
						name="login_checkbox"> 약관에 동의합니다.</td>
				</tr>
				<tr>
					<td>ID</td>
					<td><input type="text" form="login_form" name="login_id"
						placeholder="문자 or 숫자" min="6" maxlength="10"></td>
					<td><input type="button" value="중복체크" onclick="check_duplicate()"></td>
					<td><input type="hidden" form="login_form" name = "login_check_duplicate" value="uncheck"></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" form="login_form" name="login_pwd"
						placeholder="문자+숫자, 8자리 이상" min="6" maxlength="20"></td>
				</tr>
				<tr>
					<td>Password <br> 확인
					</td>
					<td><input type="password" form="login_form"
						name="login_pwd_check"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" form="login_form" name="login_name"
						placeholder="문자열만 입력 가능"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="tel" form="login_form" name="login_tel"
						placeholder="ex)01(0)-000(0)-0000"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" form="login_form" name="login_email"></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="date" form="login_form" name="login_date"></td>
				</tr>
				<tr>
					<td colspan="3"><input type="submit" form="login_form"
						name="login_submit" value="회원가입"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
