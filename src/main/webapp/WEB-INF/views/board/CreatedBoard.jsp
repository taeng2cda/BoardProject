<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<input type="hidden" name="userid" value="${userid}" id="userid">
    <input type="text" name="title" id="title">
    <div id="smarteditor">
        <textarea name="content" id="editorTxt" 
                  rows="30" cols="20" style="width:650px; height:350px; "
                  placeholder="내용을 입력해주세요"
                  style="width: 500px"></textarea>
   	</div>
    <label><input type="file" name="upload" /></label>
    <label><input type="file" name="upload" /></label>

    <input type="button"  id="save" value="버튼"/>
    <input type="button" value="목록으로" id="btn1" onclick="location='${pageContext.request.contextPath}/board' " >
		
    
</body>

<script type="text/javascript">
sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
var ctx = getContextPath();
  function getContextPath() {
  return sessionStorage.getItem("contextpath");
}
  
  console.log(ctx);

var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "editorTxt", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: ctx+"/resources/static/smarteditor/SmartEditor2Skin.jsp",  
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
          
          var id = $("#userid").val();
          var t = $("#title").val();
          var c = $("#editorTxt").val();
         
          var boarddata = {
        		  'userid':id,
        		  'title':t,
        		  'content':c,
        		  'count':'0'
          };
          
          $.ajax({
      		type:"post",
    		url: ctx + "/board/CreatedBoard",
    		data : JSON.stringify(boarddata),
    		dataType:"json",
    		contentType: 'application/json',
    		success :function(data){
    			alert("정상등록 되었습니다.");
    			location.href = ctx+"/board";
    		},
    		error : function() {
    			alert("Error");
    		}
          });
          
          
          
     		 });    
		});
</script>
</html>