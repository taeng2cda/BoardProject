<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/resources/css/InsertUserCss.css" rel="stylesheet" type="text/css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
<h1>회원 가입</h1>

<div id="box1">
	<form method="post" action="${pageContext.request.contextPath}/user/insert" id="userinsert">
	        <fieldset>
	            <ul>
	                <li>
	                    <p id="ptag1">아이디</p>
	                    <p>
	                        <input type="text" placeholder="아이디 입력하세요" name="userid" id="userid" >
	                    </p>
	                    <span id="check"></span>
	                </li>
	
	                <li>
	                    <p>비밀번호</p>
	                    <p>
	                        <input type="password" placeholder="비밀번호 입력하세요" name="pw" id="pw">
	                    </p>
	                    <span id="check"></span>
	                </li>
	
	                <li>
	                    <p>이름</p>
	                    <p>
	                        <input type="text" placeholder="이름을 입력하세요" name="name" id="name">
	                    </p>
	                </li>   
	                 
	                <li>
	                    <p>휴대폰번호</p>
	                    <p>
	                        <input type="text" placeholder="전화번호 입력하세요" name="phone" id="phone">
	                    </p>
	                    
	                </li>
	            </ul>
	        </fieldset>
	        <input type="button" value="회원 가입" id="btn">
	</form>
</div>
</body>

<script type="text/javascript">
$(function() {
    $("#btn").click(function() {

        var userid = $("#userid").val();
        var pw = $("#pw").val();
        var name = $("#name").val();
        var phone = $("#phone").val();

        if(userid == "") {
            alert("아이디를 입력하세요.");
            $('#userid').focus();
            return;
        }
        if(pw == ""){
            alert("비밀번호를 입력하세요.");
            $("#pw").focus();
            return;
        }
        if(name == ""){
            alert("이름을 입력하세요.");
            $("#name").focus();
            return;
        }
        if(phone == ""){
            alert("전화번호를 입력하세요.");
            $("#phone").focus();
            return;
        }


        $('#userinsert').submit();
    });
});

</script>
</html>