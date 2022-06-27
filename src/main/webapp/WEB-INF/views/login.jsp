<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</head>
<body>
<h1>로그인 페이지</h1>

			
		아이디 <br>
		<input type="text" name="userid" value="" id="id"><br>
		비밀번호 <br>
		<input type="password" name="pw" id="pw"><br>
		<input type="button" value="로그인" id="btn_login">

</body>

<script type="text/javascript">

	sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
	var ctx = getContextPath();
	  function getContextPath() {
	  return sessionStorage.getItem("contextpath");
	}
	  
	  console.log(ctx);
	
$(function() {
	$("#btn_login").click(function() {
		var id = $("#id").val();
		var pw = $("#pw").val();
		if (id == "") {
			alert("아이디를 입력하세요.");
			$("#id").focus();
			return;
		}
		if (pw == "") {
			alert("비밀번호를 입력하세요.");
			$("#pw").focus();
			return;
		}
		
		var loginData = {"userid":id,"pw":pw};
		
		$.ajax({
			type:"POST",
			url : ctx+"/login",
			contentType: "application/json",
			data : JSON.stringify(loginData),
			success : function(result){
				
				if(result == 0){
					alert("아이디 또는 비밀번호가 잘못되었습니다.");
					
				}else if(result == 1){
					alert("로긴 성공");
					 location.href = ctx;
				}else if(result == 9){
					alert("아이디 또는 비밀번호가 잘못되었습니다.");
				}
				
			},
			error : function() {
				alert("에러입니다");
			}
		});
		
	});

});
</script>

</html>