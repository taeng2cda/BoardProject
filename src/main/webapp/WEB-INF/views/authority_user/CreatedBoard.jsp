<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Created Board</h1>

	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.username"/>님 반갑습니다.
	</sec:authorize>
	${userid}
	<form action="${pageContext.request.contextPath}/authority_user/CreatedBoard" method="post">
		
		글제목<br>
		<input type="text" name="title" value=""> <br>
		
		글내용<br>
		<input type="text" name="content" value=""> <br>
		
		작성자<br>
		<input type="text" name="title" value="${principal.username }"> <br>
		
	</form>
	
</body>
</html>