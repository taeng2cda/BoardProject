<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>게시판 리스트</h1>

<table>
	<tr>
		<th id="th1">번호</th>
		<th id="th2">제목</th>
		<th id="th3">글쓴이</th>
        <th id="th4">등록일</th>
        <th id="th5">조회</th>
	</tr>
	<tr>
		<td id="td1">1</td>
        <td id="td2">2</td>
        <td id="td3">3</td>
        <td id="td4">4</td>
        <td id="td5">5</td>
	</tr>
	
</table>

<button id="BoardCreated">글쓰기</button>
<div>
    
    페이징처리<br>
    
    
    <select name ="column">
        <option value="title">제목</option>
        <option value="content">내용</option>
        <option value="title-content">제목+내용</option>
        <option value="userid">글쓴이</option>
    </select>
    <input type="text" value="" name="search">
    <input type="submit" value="🔍" id="searchbtn">

</div>
</body>

<style>
    table,tr,th,td{
    border-collapse: collapse;
}
    th{background-color: aqua;  height: 40px; }
    td{background-color: brown;  height: 40px; }
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
    #BoardCreated{
        background-color: black;
        color: white;
        width: 120px; height: 40px;
        border-radius: 3px;
        box-shadow: 1px 1px 1px 1px gray;
    }
    #searchbtn{
        cursor: pointer;
    }


</style>
</html>