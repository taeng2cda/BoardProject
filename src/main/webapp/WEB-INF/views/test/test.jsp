<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- <script src="${pageContext.request.contextPath}/resources/js/UtilAjax.js"></script>  -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
	<h1>테스트페이지</h1>
	<input type="text" id="id" value="test">
	<input type="button" id="btn" value="버튼">
	
	
</body>
<script type="text/javascript">


$("#btn").click(function() {
	
	var id = $("#id").val();
	
	$.ajax({
		type:"post",
		url:"/datatree/test",
		data : {"userid":id},
		dataType:"json",
		
		success :function(data){
			alert(data.userid +"\n"+ data.authority );
			console.log(data.userid);
			console.log(data.authority);
		},
		error : function() {
			alert("Error");
		}
		
	});
	
	
});


</script>
</html>