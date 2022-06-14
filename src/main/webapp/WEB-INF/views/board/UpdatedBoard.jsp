<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="main_content">
		<div class="hader">
			<div class="h_box_left">
				작성자 : ${vo.userid }
			</div>
			
			<div class="h_box_center">
				최근 수정일 : ${vo.updatedate_String }
			</div>
			
			<div class="h_box_right">
				조회수 : ${vo.count }
			</div>
		</div>
		
		<form:form method="post" action="${pageContext.request.contextPath}/authority_user/UpdatedBoard">
			<input type="hidden" name="bnum" value="${vo.bnum}" >
		
			<div class="title">
	            <input type="text" name="title" value="${vo.title}">
			</div>
			
			<div class="content">
	            <textarea rows="25" name="content" id="content_text">${vo.content }</textarea>
			</div>
		
			<input type="submit" value="수정하기" >
		</form:form>
		<div class="btn_box">
			<c:choose>
				<c:when test="${userid eq vo.userid }">
				
					<button id="BoardList" onclick='location.href="${pageContext.request.contextPath}/board" ' >글목록</button>
					<button id="BoardCreated" onclick='location.href="${pageContext.request.contextPath}/authority_user/CreatedBoard" ' >글쓰기</button> 
				</c:when>
				<c:otherwise>
					<button id="BoardList" onclick='location.href="${pageContext.request.contextPath}/board" ' >글목록</button>
					<button id="BoardCreated" onclick='location.href="${pageContext.request.contextPath}/authority_user/CreatedBoard" ' >글쓰기</button> 
				</c:otherwise>
			</c:choose>
		</div>
		
	</div>

</body>

<style>
	.hader{ display: flex; }
	.h_box_left{ flex:1; }
	.h_box_center{ flex:2; }
	.h_box_right{ flex:3; }
	.title{ 
		background-color: gray; 
		width: 61%; height: 40px;
		text-align: left; font-size: 100%;
		padding-left: 20px;
	}
	.content{ 
		background-color: teal;
		width: 61%; height: 400px;
		font-size: 100%;
		padding-left: 20px;
		padding-top: 10px;
	}

    #content_text{
        width: 95%;
    }
</style>

</html>