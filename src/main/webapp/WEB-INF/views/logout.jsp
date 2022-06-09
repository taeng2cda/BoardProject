<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그아웃</h1>

<form method="post" action="${pageContext.request.contextPath}/logout">
토큰값 히든으로 보내서 post 방식으로 서브밋
<input type="text" name="" >

<input type="submit" name="" value="로그인">
</form>
</body>
</html>