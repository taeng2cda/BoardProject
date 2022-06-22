<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<style type="text/css">
	#title{
	    height: 20px;  width: 644px;
	    margin-bottom: 15px; font-size: 20px;
	}
</style>

</head>
<body>
<h1>Created Board</h1>

	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.username"/>님 반갑습니다.
	</sec:authorize>
	
	<form:form action="${pageContext.request.contextPath}/authority_user/CreatedBoard" method="post" id="frm">
	<input type="hidden" name="userid" value="${userid}">
    <input type="text" name="title" id="title">
      <div id="smarteditor">
        <textarea name="content" id="editorTxt" 
                  rows="30" cols="20" style="width:650px; height:350px; "
                  placeholder="내용을 입력해주세요"
                  style="width: 500px"></textarea>
      </div>
      <input type="button"  id="save" value="버튼"/>
      <input type="button" value="목록으로" id="btn1" onclick="location='${pageContext.request.contextPath}/board' " >
		
    </form:form>
    
</body>

<script type="text/javascript">

var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "editorTxt", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "/datatree/resources/static/smarteditor/SmartEditor2Skin.jsp",  
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
                   
              }
          }, 
          fCreator: "createSEditor2"
      });
      
      //저장버튼 클릭시 form 전송
      $("#save").click(function(){
          oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
          
          
          var Text = document.getElementById("editorTxt").value;
          Text = Text.replace(/&nbsp;/gi,"");
          Text = Text.replace(/<br>;/gi,"");
          Text = Text.replace(/ /gi,"");
          
          if(document.getElementById("title").value=="" ){
        	  alert("제목을 입력해주세요");
        	  return;
          }
          if(Text == "<p><\/p>" || Text == "" ){
        	  alert("내용을 입력해주세요");
        	  return;
          }
          
          $("#frm").submit();
     		 });    
		});
</script>
</html>