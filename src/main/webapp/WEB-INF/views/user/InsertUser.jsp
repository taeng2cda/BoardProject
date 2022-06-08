<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/resources/css/InsertUserCss.css" rel="stylesheet" type="text/css">
</head>
<body>
<h1>회원 가입</h1>

<div id="box1">
	<form action="${pageContext.request.contextPath}/user/insert" method="post">
	        <fieldset>
	            <ul>
	                <li>
	                    <p id="ptag1">아이디</p>
	                    <p>
	                        <input type="text" placeholder="아이디 입력하세요" name="userid" >
	                    </p>
	                    <span id="check"></span>
	                </li>
	
	                <li>
	                    <p>비밀번호</p>
	                    <p>
	                        <input type="password" placeholder="비밀번호 입력하세요" name="pw">
	                    </p>
	                    <span id="check"></span>
	                </li>
	
	                <li>
	                    <p>이름</p>
	                    <p>
	                        <input type="text" placeholder="이름을 입력하세요" name="name">
	                    </p>
	                </li>   
	                 
	                <li>
	                    <p>휴대폰번호</p>
	                    <p>
	                        <input type="text" placeholder="전화번호 입력하세요" name="phone">
	                    </p>
	                    
	                </li>
	            </ul>
	        </fieldset>
	        <input type="submit" value="회원 가입" id="btn">
	</form> 
</div>
</body>
</html>