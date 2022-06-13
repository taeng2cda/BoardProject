<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<ul>
	<li><a href="${pageContext.request.contextPath}/user/insert">회원가입</a></li>
	<sec:authorize access="isAnonymous()">
		<li><a href="${pageContext.request.contextPath}/login/View">로그인</a></li>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<li>
		<sec:authentication property="principal.username"/>님 반갑습니다.
		<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
		</li>
	</sec:authorize>
	
	<li><a href="${pageContext.request.contextPath}/authority_admin/main">main(member)</a></li>
	<li><a href="${pageContext.request.contextPath}/authority_user/main">main(admin)</a></li>
	<li><a href="${pageContext.request.contextPath}/board">게시판</a></li>
</ul>

<br>
test<br>
${userid}

</body>
</html>