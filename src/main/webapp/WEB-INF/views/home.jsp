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

<h1>${userid }</h1>

	<c:choose>
		<c:when test="${not empty userid && not empty authority}">
			<a href="${pageContext.request.contextPath}/user/insert">회원가입</a>
			<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
			<a href="${pageContext.request.contextPath}/board">게시판</a>
		</c:when>
		<c:otherwise>
			<a href="${pageContext.request.contextPath}/user/insert">회원가입</a>
			<a href="${pageContext.request.contextPath}/login">로그인</a>
			<a href="${pageContext.request.contextPath}/board">게시판</a>
		</c:otherwise>
	</c:choose>
	
	<h1><a href="${pageContext.request.contextPath}/test">TEST</a></h1>
</body>
</html>