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
		
		<div class="title">
			<h2>${vo.title }</h2>
		</div>
		
		<div class="content">
			${vo.content }
		</div>
		
		<div class="btn_box">
			<c:choose>
				<c:when test="${userid eq vo.userid }">
					<button id="BoardUpdated" onclick='updateboard()' >글수정</button>
					<button id="BoardDeleted" onclick='dropboard()' >글삭제</button>
					
					<button id="BoardList" onclick='location.href="${pageContext.request.contextPath}/board" ' >글목록</button>
					<button id="BoardCreated" onclick='location.href="${pageContext.request.contextPath}/board/CreatedBoard" ' >글쓰기</button> 
				</c:when>
				<c:otherwise>
					<button id="BoardList" onclick='location.href="${pageContext.request.contextPath}/board" ' >글목록</button>
					<button id="BoardCreated" onclick='location.href="${pageContext.request.contextPath}/board/CreatedBoard" ' >글쓰기</button> 
				</c:otherwise>
			</c:choose>
			
		</div>
	
	</div>
	
	<%-- 게시글 삭제 데이터  --%>
	<form id="frm1" method="post" action="${pageContext.request.contextPath}/board/DeletedBoard">
		<input type="hidden" name="bnum" value="${vo.bnum }">
	</form>
	<%-- 게시글 수정 데이터  --%>
	<form id="frm2" method="post" action="${pageContext.request.contextPath}/board/ViewUpdatedBoard">
		<input type="hidden" name="bnum" value="${vo.bnum }">
	</form>
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
</style>

<script type="text/javascript">
	
	function dropboard() {
		var res = confirm("삭제하시면 복구할수 없습니다 \n정말로 삭제하시겠습니까?");
		if(res){
			alert("해당 글은 삭제되었습니다.");
			document.getElementById('frm1').submit();
		}else{
			
		}
	}
	function updateboard() {
		document.getElementById('frm2').submit();
	}

</script>


</html>