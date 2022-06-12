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
<h1>test</h1>

<c:choose>
	<c:when test="${UserInsert == 'success'} ">
		<h1>회원 가입 성공!!</h1>
		<a href="${pageContext.request.contextPath}/">축하 축하</a>
	</c:when>
	<c:when test="${UserInsert == 'fail'} ">
		<h1>회원 가입 실패!!</h1>
		<a href="${pageContext.request.contextPath}/">축하 축하</a>
	</c:when>
</c:choose>

</body>
</html>