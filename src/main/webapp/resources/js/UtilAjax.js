	
	
	// 프로젝트명 불러와서 ctx 변수에 저장  url 입력시 ctx 변수 +"/board"  이런식으로 가면됨
	sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
	var ctx = getContextPath();
	  function getContextPath() {
	  return sessionStorage.getItem("contextpath");
	}
	
	
	
	
	// ajax 공통함수 만들기
	
	var commonAjax = function(type,url,data,errormsg,fn){
	
	console.log(url);
	console.log(data);	
	console.log(type);
	console.log(errormsg);
	console.log(ctx);
	
	var request = $.ajax({
	type: type,
	url :  url,
	contentType: "application/json",
	data : JSON.stringify(data),
	});
	
	
	request.done(fn);
	
	request.fial(function( jqXHR, textStatus){
		alert( errormsg + textStatus );
		});
	}