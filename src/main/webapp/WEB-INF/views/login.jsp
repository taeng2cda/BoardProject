<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</head>
<body>
<h1>로그인 페이지</h1>

	<form method="post" action="${pageContext.request.contextPath}/login" id="loginform">
			
		아이디 <br>
		<input type="text" name="userid" value="" id="id"><br>
		비밀번호 <br>
		<input type="password" name="pw" id="password"><br>
		<input type="button" value="로그인" id="btn_login">
	</form>
</body>

<script type="text/javascript">

	$(function() {
		$("#btn_login").click(function() {
			
			var id = $("#id").val();
			var passwd = $("#password").val();
			
			if(id == "") {
				alert("아이디를 입력하세요.");
				$('#id').focus();
				return;
			}
			
			if(passwd == ""){
				alert("비밀번호를 입력하세요.");
				$("#password").focus();
				return;
			}
			
			
			$('#loginform').submit();
		});
	});

</script>

</html>