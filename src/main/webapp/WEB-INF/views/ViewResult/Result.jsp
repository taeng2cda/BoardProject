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
	
	<c:if test="${UserInsert eq 'success' }">
		<script>
		    alert("${msg}");
		    location.href = "${pageContext.request.contextPath}/";
		</script>
	</c:if>
	<c:if test="${UserInsert eq 'fail' }">
		<script>
		    alert("${msg}");
		    location.href = "${pageContext.request.contextPath}/";
		</script>
	</c:if>
	
	
	<c:if test="${BoardInsert eq 'success' }">
		<script>
		    alert("${msg}");
		    location.href = "${pageContext.request.contextPath}/board";
		</script>
	</c:if>
	<c:if test="${BoardInsert eq 'fail' }">
		<script>
		    alert("${msg}");
		    location.href = "${pageContext.request.contextPath}/board";
		</script>
	</c:if>
	
	
	<c:if test="${BoardDetail eq 'fail' }">
		<script>
		    alert("${msg}");
		    location.href = "${pageContext.request.contextPath}/board";
		</script>
	</c:if>
	
	
	<c:if test="${BoardDelete eq 'success' }">
		<script>
		    location.href = "${pageContext.request.contextPath}/board";
		</script>
	</c:if>
	<c:if test="${BoardDelete eq 'fail' }">
		<script>
		    alert("${msg}");
		    location.href = "${pageContext.request.contextPath}/board";
		</script>
	</c:if>
	
	
	
	<c:if test="${BoardView eq 'fail' }">
		<script>
		    alert("${msg}");
		    location.href = "${pageContext.request.contextPath}/board";
		</script>
	</c:if>
	
	
	<c:if test="${BoardUpdated eq 'success' }">
		<script>
		    alert("${msg}");
		    location.href = "${pageContext.request.contextPath}/board";
		</script>
	</c:if>
	<c:if test="${BoardUpdated eq 'fail' }">
		<script>
		    alert("${msg}");
		    location.href = "${pageContext.request.contextPath}/board";
		</script>
	</c:if>
	
	

</body>
</html>