<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/commons.js"></script>
<script type="text/javascript">
function legacyAjaxCall(){
	var xmlHttp = createXMLHttpRequest();
	
	// readyState : 0 - XMLHttpRequest가 생성
	//				1 - open() 호출. 전송방식,서버요청 uri,동기식/비동기식
	//				2 - send() 호출. 서버요청시작
	//  			3 - 서버로부터 응답 수신 중
	//				4 - 응답 수신 완료(성공,에러)
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4){
			if(xmlHttp.status == 200){
				var xmlData = xmlHttp.responseXML;
				var xmlArray = xmlData.getElementsByTagName('member');
				for(var i=0; i<xmlArray.length; i++){
					window.console.log(xmlArray[i].getAttribute('id'));
 					for(var j=0; j<xmlArray[i].childNodes.length; j++){
						window.console.log(xmlArray[i].childNodes[j].nodeName);
						window.console.log(' : ');
						window.console.log(xmlArray[i].childNodes[j].textContent);
 					}
				}
			}
		}
	};
	var uri = '<%=request.getContextPath()%>/11/createXML.jsp';
	xmlHttp.open('get', uri, true);
	xmlHttp.send();

}

function jqueryAjaxCall(){
	$.ajax({
		type:'post',
		dataType : 'XML',
		url:'<%=request.getContextPath()%>/11/createXML.jsp',
		data:'',
		error:function(result){
			
		},
		success:function(result){
			$('member',result).each(function(){
				window.console.log($(this).attr('id') + ' | ' +
					 $('mem_pass',this).text());
			
			});
		},
		complete:function(){
			// ajax 요청 후 다른 uri로 ajax 재요청시 코드로 구성
		}
	});
}
</script>
</head>
<body>
<input type="button" value="legacyAjax" onclick="legacyAjaxCall();" /><br/>
<input type="button" value="jqueryAjax" onclick="jqueryAjaxCall();" /><br/>		
</body>
</html>