<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies =  request.getCookies();
	
	for(Cookie cookie : cookies){
		if("mem_id".intern() == cookie.getName().intern()){
			Cookie idCookie = new Cookie("mem_id", "b001");
			idCookie.setPath("/");
			response.addCookie(idCookie);
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>