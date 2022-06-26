<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
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
		
		<form method="post" action="${pageContext.request.contextPath}/board/UpdatedBoard" id="frm">
			<input type="hidden" name="bnum" value="${vo.bnum}" >
	        <input type="text" name="title" value="${vo.title}" id="title">
		 	<div id="smarteditor">
		        <textarea name="content" id="editorTxt" 
		                  rows="30" cols="20" style="width:650px; height:350px; "
		                  placeholder="내용을 입력해주세요"
		                  style="width: 500px">${vo.content }</textarea>
		    </div>
		</form>
		<div class="btn_box">
			<c:choose>
				<c:when test="${userid eq vo.userid }">
					<input type="button" id="Baord_Updated" value="수정하기" >
					<button id="BoardList" onclick='location.href="${pageContext.request.contextPath}/board" ' >글목록</button>
				</c:when>
				<c:otherwise>
					<button id="BoardList" onclick='location.href="${pageContext.request.contextPath}/board" ' >글목록</button>
				</c:otherwise>
			</c:choose>
		</div>
		
	</div>

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
          /*
          fOnAppLoad : function(){
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
              oEditors.getById["editorTxt"].exec("PASTE_HTML", ["첫번째 에디터! 기존 DB에 저장된 내용을 에디터에 적용할 문구"]);
          },
          */
          fCreator: "createSEditor2"
      });
      
      //저장버튼 클릭시 form 전송
      $("#Baord_Updated").click(function(){
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