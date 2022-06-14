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
	
	<form:form action="${pageContext.request.contextPath}/authority_user/CreatedBoard" method="post">
		<input type="hidden" name="userid" value="${userid}"> 
		
		글제목<br>
		<input type="text" name="title" value=""> <br>
		
		글내용<br>
		<textarea rows="10" cols="50" name="content"></textarea><br>
		
		<input type="submit" value="등록하기">
		<input type="button" value="목록으로" id="btn1" onclick="location='${pageContext.request.contextPath}/board' " >
		
	</form:form>
	
</body>

<script type="text/javascript">
	#btn
</script>
</html>