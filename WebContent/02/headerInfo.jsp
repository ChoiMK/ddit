<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 요청 시 헤더 정보
	Enumeration<String> keyEnums = request.getHeaderNames();
	while(keyEnums.hasMoreElements()){
		String key = keyEnums.nextElement();
		String value = request.getHeader(key);
%>
요청 헤더 : <%=key %> - <%=value %> <br/>

<%		
	}
	// 데스크탑 브라우저, 모바일 브라우저 모두 전송되는 헤더의 키
	String machine = request.getHeader("user-agent");
%>
	당신의 브라우저는 ...... <br/>
<%
	if(machine.contains("MSIE")){
%>
	IE 10버전 인터넷 익스플로러 입니다. <br/>		
<%
	}
	if(machine.contains("rv:11.0")){
%>		
	IE 11버전 인터넷 익스플로러 입니다. <br/>
<% 
	}
	if(machine.contains("Chrome")){
%>
	Chrome 브라우저입니다<br/>
<% 		
	}
	String[] mobileKeywords = new String[]{"iPhone","Android","BlackBerry","SonyEricsson"};
	for(String value : mobileKeywords){
		if(machine.contains(value)){
			response.sendRedirect("/ddit/mobile/home.jsp");
		}
	}
%>
</body>
</html>