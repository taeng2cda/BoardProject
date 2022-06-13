<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그아웃</h1>

<form:form method="post" action="${pageContext.request.contextPath}/logout">
	<input type="submit" value="로그아웃">
</form:form>
</body>
</html>