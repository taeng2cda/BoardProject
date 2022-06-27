<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
	<input type="text" id="userid" name="userid">
	<input type="text" id="pw" name="pw">
	<input type="text" id="name" name="name">
	<input type="text" id="phone" name="phone">
	<input type="button" id="button" value="확인">
</body>

<script type="text/javascript">

$("#button").click(function() {
	
	var a = $("#userid").val();
	var b = $("#pw").val();
	var c = $("#name").val();
	var d = $("#phone").val();
	
	var data = { 'userid' : a,
				 'pw' : b,
				 'name' : c,
				 'phone' : d};
	console.log(data);
	
	$.ajax({
		type:"post",
		url:"/datatree/test2",
		data : JSON.stringify(data),
		dataType:"json",
		contentType: 'application/json',
		
		success :function(sdata){
			console.log("userid :"+ sdata.userid);
			console.log("pw :"+ sdata.pw);
			console.log("name :"+ sdata.name);
			console.log("phone :"+ sdata.phone);
		},
		error : function() {
			alert("Error");
		}
		
	});
	
	
});

</script>
</html>