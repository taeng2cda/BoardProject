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
<style>
    table,tr,th,td{
    border-collapse: collapse;
}
    th{background-color: black; color:white;  height: 40px; }
    td{ height: 40px; }
    #th1,#td1{
        text-align: center;
        width: 100px;
    }
    #th2,#td2{
        text-align: left;
        width: 600px;
    }
    #th3,#td3{
        text-align: left;
        width: 100px;
    }
    #th4,#td4{
        text-align: center;
        width: 100px;
    }
    #th5,#td5{
        text-align: center;
        width: 100px;
    }
    #searchbtn{
        cursor: pointer;
    }
    .table_box{
    	position: static;
    	background-color: gray;
    	width: 1000px; height: 462px;
    }
    .table_footer_box{
    	position: relative;
    	left: 380px; top: 20px;
    }
    #BoardCreated{
   		position: relative;
        background-color: black;
        color: white;
        width: 120px; height: 40px;
        border-radius: 3px;
        box-shadow: 1px 1px 1px 1px gray;
        left : 880px;
    }
    
</style>
<body>
<h1>게시판 리스트</h1>

	<div class="table_box">
		<table>
			<tr>
				<th id="th1">번호</th>
				<th id="th2">제목</th>
				<th id="th3">글쓴이</th>
		        <th id="th4">등록일</th>
		        <th id="th5">조회</th>
			</tr>
			<c:forEach var="vo" items="${boardlist }" >
				<tr>
					<td id="td1"> ${vo.bnum } </td>
			        <td id="td2"> <a href="${pageContext.request.contextPath}/board/boarddetail?bnum=${vo.bnum}">${vo.title }</a> </td>
			        <td id="td3"> ${vo.userid }</td>
			        <td id="td4"> ${vo.boarddate }</td>
			        <td id="td5"> ${vo.count }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<div class="table_footer_box">


	<c:choose>
		<c:when test="${ pu.pageNum != 1}">
			<a href="${pageContext.request.contextPath}/board?pageNum=${pu.pageNum-1}&field=${field}&keyword=${keyword}">이전</a>
		</c:when>
		<c:otherwise>
			<span>이전</span>
		</c:otherwise>
	</c:choose>
	
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }" >
			<c:choose>
				<c:when test="${i==param.pageNum }">
					<span style='color:red' id="pageNum">${i }</span>
				</c:when>
				
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/board?pageNum=${i}&field=${field}&keyword=${keyword}"><span style='color:black' id="pageNum">${i }</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	
	<c:choose>
		<c:when test="${ pu.pageNum < pu.totalPageCount}">
			<a href="${pageContext.request.contextPath}/board?pageNum=${pu.pageNum+1}&field=${field}&keyword=${keyword}">다음</a>
		</c:when>
		<c:otherwise>
			<span>다음</span>
		</c:otherwise>
	</c:choose>
		
		
	    <form action="${pageContext.request.contextPath}/board" method="get">
		    <select name ="field" id="field">
		        <option value="title" 	<c:if test="${field=='title' }">selected</c:if>>제목</option>
		        <option value="content" <c:if test="${field=='content' }">selected</c:if> >내용</option>
		        <option value="tc" <c:if test="${field=='tc' }">selected</c:if>>제목+내용</option>
		        <option value="userid"	 <c:if test="${field=='userid' }">selected</c:if> >글쓴이</option>
		    </select>
		    <input type="text" value="${keyword}" name="keyword" id="keyword">
		    <input type="submit" value="🔍" id="searchbtn" >
		</form>          
	</div>
	
	<button id="BoardCreated" onclick='location.href="${pageContext.request.contextPath}/board/CreatedBoard" ' >글쓰기</button>   
	        
</body>


<script type="text/javascript">
/*
sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
var ctx = getContextPath();
  function getContextPath() {
  return sessionStorage.getItem("contextpath");
}
	//test
	$(function() {
		$("#searchbtn").click(function() {
			var field = $("#field").val();
			var keyword = $("#keyword").val();
			var pageNum = $("#pageNum").val();
			
			console.log(field);
			console.log(keyword);
			console.log(pageNum);
			
			var searchData = { "field" : field, "keyword":keyword};
			console.log(searchData);
			
			$.ajax({
				type : "get",
				url : ctx+"/board",
				contentType: "application/json",
				data : JSON.stringify(searchData),
				success : function() {
					console.log("success");
				},
				error : function() {
					console.log("fail");
				}
			});
			
		});
	});
*/
</script>


</html>