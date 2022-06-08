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
asdasdasf
${message }

<c:choose>
	<c:when test="${userid != null }">
		${userid }님 환영합니다<br>
		
		<a href="${pageContext.request.contextPath}/board/list" >게시글 보러가기</a>
		<a href="${pageContext.request.contextPath}/user/insert">회원가입</a>
		<a href="${pageContext.request.contextPath}/logout" >로그아웃</a>
	</c:when>
	<c:otherwise>
		<a href="${pageContext.request.contextPath}/login" >로그인</a>
		<a href="${pageContext.request.contextPath}/user/insert">회원가입</a>
	</c:otherwise>
</c:choose>


</body>
</html>