<%@page import="java.text.SimpleDateFormat"%>
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
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
%>
생성시간 :  <%=dateFormat.format(session.getCreationTime()) %><br/>
세션아이디 : <%=session.getId() %><br/>
클라이언트의 마지막 요청 시간 : <%=dateFormat.format(session.getLastAccessedTime()) %><br/>
세션의 유효시간 : <%=session.getMaxInactiveInterval() %>
</body>
</html>