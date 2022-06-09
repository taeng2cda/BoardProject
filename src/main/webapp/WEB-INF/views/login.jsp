<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인 페이지</h1>

<form method="post" action="${pageContext.request.contextPath}/login">
아이디
<input type="text" name="" >
비번
<input type="text" name="" >

<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
<input type="submit" name="" value="로그인">
</form>

<input type="button" name="" value="회원가입">
</body>
</html>