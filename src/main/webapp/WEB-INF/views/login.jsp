<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인 페이지</h1>

<form:form method="post" action="${pageContext.request.contextPath}/login">
	아이디 <br>
	<input type="text" name="username"><br>
	비밀번호 <br>
	<input type="password" name="password"><br>
	<input type="submit" value="로그인">
</form:form>

</body>
</html>